<?php

namespace backend\controllers;

use Yii;
use common\models\StdPersonalInfo;
use common\models\StdGuardianInfo;
use common\models\StdAcademicInfo;
use common\models\StdPersonalInfoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\helpers\Html;
use yii\web\UploadedFile;

/**
 * StdPersonalInfoController implements the CRUD actions for StdPersonalInfo model.
 */
class StdPersonalInfoController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all StdPersonalInfo models.
     * @return mixed
     */
    public function actionIndex()
    {    
        $searchModel = new StdPersonalInfoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single StdPersonalInfo model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {   
        $request = Yii::$app->request;
        if($request->isAjax){
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                    'title'=> "StdPersonalInfo #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $this->findModel($id),
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
        }else{
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new StdPersonalInfo model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new StdPersonalInfo();  
        $stdGuardianInfo = new StdGuardianInfo ;
        $stdAcademicInfo = new StdAcademicInfo;

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Create new StdPersonalInfo",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                        'stdGuardianInfo' => $stdGuardianInfo,
                        'stdAcademicInfo' => $stdAcademicInfo,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }else if($model->load($request->post()) && $stdGuardianInfo->load($request->post()) && $stdAcademicInfo->load($request->post())){
                        $model->std_photo = UploadedFile::getInstance($model,'std_photo');
                        if(!empty($model->std_photo)){
                            $imageName = $model->std_name.'_photo'; 
                            $model->std_photo->saveAs('uploads/'.$imageName.'.'.$model->std_photo->extension);
                            //save the path in the db column
                            $model->std_photo = 'uploads/'.$imageName.'.'.$model->std_photo->extension;
                        } else {
                           $model->std_photo = '0'; 
                        }
                        $model->created_by = Yii::$app->user->identity->id; 
                        $model->created_at = new \yii\db\Expression('NOW()');
                        $model->updated_by = '0'; 
                        $model->updated_at = '0';
                        $model->save();

                        $stdGuardianInfo->std_id = $model->std_id;
                        $stdGuardianInfo->created_by = Yii::$app->user->identity->id; 
                        $stdGuardianInfo->created_at = new \yii\db\Expression('NOW()');
                        $stdGuardianInfo->updated_by = '0'; 
                        $stdGuardianInfo->updated_at = '0';
                        $stdGuardianInfo->save();

                        $stdAcademicInfo->std_id = $model->std_id;
                        $stdAcademicInfo->created_by = Yii::$app->user->identity->id; 
                        $stdAcademicInfo->created_at = new \yii\db\Expression('NOW()');
                        $stdAcademicInfo->updated_by = '0'; 
                        $stdAcademicInfo->updated_at = '0';
                        $stdAcademicInfo->save();

                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "Create new StdPersonalInfo",
                    'content'=>'<span class="text-success">Create StdPersonalInfo success</span>',
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Create More',['create'],['class'=>'btn btn-primary','role'=>'modal-remote'])
        
                ];         
            }else{           
                return [
                    'title'=> "Create new StdPersonalInfo",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->std_id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
       
    }

    /**
     * Updates an existing StdPersonalInfo model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
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
                    'title'=> "Update StdPersonalInfo #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];         
            }else if($model->load($request->post())){
                $stdPersonalInfo = Yii::$app->db->createCommand("SELECT * FROM std_personal_info where std_id = $id")->queryAll();
                $model->std_photo = UploadedFile::getInstance($model,'std_photo');
                if(!empty($model->std_photo)){
                    $imageName = $model->std_name.'_photo'; 
                    $model->std_photo->saveAs('uploads/'.$imageName.'.'.$model->std_photo->extension);
                    //save the path in the db column
                    $model->std_photo = 'uploads/'.$imageName.'.'.$model->std_photo->extension;
                } else {
                   $model->std_photo = $stdPersonalInfo[0]['std_photo']; 
                }
                $model->updated_by = Yii::$app->user->identity->id;
                $model->updated_at = new \yii\db\Expression('NOW()');
                $model->created_by = $model->created_by;
                $model->created_at = $model->created_at;
                $model->save();
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "StdPersonalInfo #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
            }else{
                 return [
                    'title'=> "Update StdPersonalInfo #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];        
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->std_id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing StdPersonalInfo model.
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
     * Delete multiple existing StdPersonalInfo model.
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

    /**
     * Finds the StdPersonalInfo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StdPersonalInfo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StdPersonalInfo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
