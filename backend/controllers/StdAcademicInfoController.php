<?php

namespace backend\controllers;

use Yii;
use common\models\StdAcademicInfo;
use common\models\StdAcademicInfoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use \yii\web\Response;
use yii\helpers\Html;

/**
 * StdAcademicInfoController implements the CRUD actions for StdAcademicInfo model.
 */
class StdAcademicInfoController extends Controller
{
    /**
     * @inheritdoc
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
                        'actions' => ['logout', 'index', 'create', 'view', 'update', 'delete', 'bulk-delete', 'bulk-sms'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                    'bulk-sms' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all StdAcademicInfo models.
     * @return mixed
     */
    public function actionIndex()
    {    
        $searchModel = new StdAcademicInfoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single StdAcademicInfo model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {   
        $request = Yii::$app->request;
        if($request->isAjax){
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                    'title'=> "<b>Stdudent Academic Info: </b>".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $this->findModel($id),
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-success','role'=>'modal-remote'])
                ];    
        }else{
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new StdAcademicInfo model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new StdAcademicInfo();  

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "<b>Create new Stdudent Academic Info</b>",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-success','type'=>"submit"])
        
                ];         
            }else if($model->load($request->post())){
                $model->std_enroll_status = 'unsign'; 
                $model->created_by = Yii::$app->user->identity->id; 
                $model->created_at = new \yii\db\Expression('NOW()');
                $model->updated_by = '0';
                $model->updated_at = '0'; 
                $model->save();
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "Create new Stduent Academic Info",
                    'content'=>'<span class="text-success">Create StdAcademicInfo success</span>',
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                            Html::a('Create More',['create'],['class'=>'btn btn-success','role'=>'modal-remote'])
        
                ];         
            }else{           
                return [
                    'title'=> "Create new Stduent Academic Info",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-success','type'=>"submit"])
        
                ];         
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->academic_id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
       
    }

    /**
     * Updates an existing StdAcademicInfo model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id,$ids)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($id);       

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "<b>Update Stduent Academic Info: </b>".$ids,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-success','type'=>"submit"])
                ];         
            }else if($model->load($request->post())){
                $model->std_enroll_status = $model->std_enroll_status; 
                $model->updated_by = Yii::$app->user->identity->id;
                $model->updated_at = new \yii\db\Expression('NOW()');
                $model->created_by = $model->created_by;
                $model->created_at = $model->created_at;
                $model->save();
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "StdAcademicInfo #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-success','role'=>'modal-remote'])
                ];    
            }else{
                 return [
                    'title'=> "Update StdAcademicInfo #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-danger pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-success','type'=>"submit"])
                ];        
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['std-personal-info/view', 'id' => $ids]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing StdAcademicInfo model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $request = Yii::$app->request;
        $this->findModel($id)->delete();

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }


    }

     /**
     * Delete multiple existing StdAcademicInfo model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete()
    {        
        $request = Yii::$app->request;
        $pks = explode(',', $request->post( 'pks' )); // Array or selected records primary keys
        foreach ( $pks as $pk ) {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
       
    }

    public function beforeAction($action) {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    public function actionBulkSms()
    {      
        $request = Yii::$app->request;
        $pks = explode(',', $request->post( 'pks' )); // Array or selected records primary keys
        $array = array();
        foreach ( $pks as $pk ) {
            $stdIDs = Yii::$app->db->createCommand("SELECT std_id FROM std_academic_info WHERE academic_id = '$pk'")->queryAll();
            $stdID = $stdIDs[0]['std_id'];
            $stdNumbers = Yii::$app->db->createCommand("SELECT std_contact_no FROM std_personal_info WHERE std_id = '$stdID'")->queryAll();
            $number = $stdNumbers[0]['std_contact_no'];
            $numb = str_replace('-', '', $number);
            $num = str_replace('+', '', $numb);

            $array[] = $num;
        }

        $to = implode(',', $array);

        if (isset($_POST['message'])) {
            $message = $_POST['message'];
        
            $type = "xml";
            $id = "Brookfieldclg";
            $pass = "college42";
            $lang = "English";
            $mask = "Brookfield";
            $message = urlencode($message);
            // Prepare data for POST request
            $data = "id=".$id."&pass=".$pass."&msg=".$message."&to=".$to."&lang=".$lang."&mask=".$mask."&type=".$type;
            // Send the POST request with cURL
            $ch = curl_init('http://www.sms4connect.com/api/sendsms.php/sendsms/url');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $result = curl_exec($ch); //This is the result from SMS4CONNECT
            curl_close($ch);     

            Yii::$app->session->setFlash('success', $result);

        }
        return $this->redirect(['./std-academic-info']);
    }

    /**
     * Finds the StdAcademicInfo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StdAcademicInfo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StdAcademicInfo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
