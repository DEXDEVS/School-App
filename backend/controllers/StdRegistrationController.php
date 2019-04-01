<?php

namespace backend\controllers;

use Yii;
use yii\helpers\Html;
use common\models\StdRegistration;
use common\models\StdRegistrationSearch;
use common\models\StdGuardianInfo;
use common\models\StdIceInfo;
use common\models\StdAcademicInfo;
use common\models\StdFeeDetails;
use common\models\User;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\web\UploadedFile;
use yii\filters\AccessControl;
use yii\db\Connection;


/**
 * StdRegistrationController implements the CRUD actions for StdRegistration model.
 */
class StdRegistrationController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'create', 'view', 'update', 'delete', 'bulk-delete','fetch-fee','student-details','std-photo','form'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all StdRegistration models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new StdRegistrationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single StdRegistration model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new StdRegistration model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new StdRegistration();
        $stdGuardianInfo = new StdGuardianInfo();
        $stdIceInfo = new StdIceInfo();
        $stdAcademicInfo = new StdAcademicInfo();
        $stdFeeDetails = new StdFeeDetails();
        $conn = \Yii::$app->db;

    
        if ($model->load($request->post()) && $stdGuardianInfo->load($request->post()) && $stdIceInfo->load($request->post()) && $stdAcademicInfo->load($request->post()) && $stdFeeDetails->load($request->post())) {
                $transection = $conn->beginTransaction();
                try{
                    $branch_id = Yii::$app->user->identity->branch_id;
                    $password = rand();
                    $model->branch_id = $branch_id;
                    $model->std_photo = UploadedFile::getInstance($model,'std_photo');
                    if(!empty($model->std_photo)){
                        $imageName = $model->std_name.'_photo'; 
                        $model->std_photo->saveAs('uploads/'.$imageName.'.'.$model->std_photo->extension);
                        //save the path in the db column
                        $model->std_photo = 'uploads/'.$imageName.'.'.$model->std_photo->extension;
                    } else {
                       $model->std_photo = 'uploads/'.'std_default.jpg'; 
                    }
                    $model->status     = "Active";
                    $model->academic_status = "Active";
                    $model->created_by = Yii::$app->user->identity->id; 
                    $model->created_at = new \yii\db\Expression('NOW()');
                    $model->updated_by = '0'; 
                    $model->updated_at = '0';
                    $model->save();

                    $user = new User();
                    $user->branch_id = $branch_id;
                    $user->username = $model->std_b_form;
                    $user->email = $model->std_email;
                    $user->user_photo = $model->std_photo;
                    $user->user_type = 'Student';
                    $user->setPassword($password);
                    $user->generateAuthKey();
                    $user->save();

                    // stdGuardianInfo...
                    $stdGuardianInfo->std_id = $model->std_id;
                    $stdGuardianInfo->created_by = Yii::$app->user->identity->id; 
                    $stdGuardianInfo->created_at = new \yii\db\Expression('NOW()');
                    $stdGuardianInfo->updated_by = '0'; 
                    $stdGuardianInfo->updated_at = '0';
                    $stdGuardianInfo->save();

                    $user = new User();
                    $user->branch_id = $branch_id;
                    $user->username = $stdGuardianInfo->guardian_cnic;
                    $user->email = $stdGuardianInfo->guardian_email;
                    $user->user_photo = $model->std_photo;
                    $user->user_type = 'Parent';
                    $user->setPassword($password);
                    $user->generateAuthKey();
                    $user->save();
                    // stdIceInfo...
                    $stdIceInfo->std_id = $model->std_id;
                    $stdIceInfo->created_by = Yii::$app->user->identity->id; 
                    $stdIceInfo->created_at = new \yii\db\Expression('NOW()');
                    $stdIceInfo->updated_by = '0'; 
                    $stdIceInfo->updated_at = '0';
                    $stdIceInfo->save();
                    // stdAcademicInfo...
                    $stdAcademicInfo->std_id = $model->std_id;
                    $stdAcademicInfo->std_enroll_status = 'unsign'; 
                    $stdAcademicInfo->created_by = Yii::$app->user->identity->id; 
                    $stdAcademicInfo->created_at = new \yii\db\Expression('NOW()');
                    $stdAcademicInfo->updated_by = '0'; 
                    $stdAcademicInfo->updated_at = '0';
                    $stdAcademicInfo->save(); 
                    // stdFeeDetails...
                    //$count = $stdFeeDetails->no_of_installment;
                    $stdFeeDetails->std_id = $model->std_id;
                    $stdFeeDetails->created_by = Yii::$app->user->identity->id; 
                    $stdFeeDetails->created_at = new \yii\db\Expression('NOW()');
                    $stdFeeDetails->updated_by = '0'; 
                    $stdFeeDetails->updated_at = '0';
                    $stdFeeDetails->save();
                    
                    $transection->commit();
                    return $this->redirect(['std-personal-info/index']);

                } catch(Exception $e) {
                    $transection->rollback();
                }
        }
        return $this->render('create', [
            'model' => $model,
            'stdGuardianInfo' => $stdGuardianInfo,
            'stdIceInfo' => $stdIceInfo,
            'stdAcademicInfo' => $stdAcademicInfo,
            'stdFeeDetails' => $stdFeeDetails,
        ]);
    }

    /**
     * Updates an existing StdRegistration model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->std_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing StdRegistration model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionFetchFee()
    {   
        return $this->render('fetch-fee');
    }

    /**
     * Finds the StdRegistration model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StdRegistration the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StdRegistration::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
