<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\StdPersonalInfo;
use common\models\StdClassName;

/* @var $this yii\web\View */
/* @var $model common\models\StdAcademicInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-academic-info-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'std_id')->dropDownList(
                    ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                    ['prompt'=>'']
                )?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'class_name_id')->dropDownList(
                    ArrayHelper::map(StdClassName::find()->all(),'class_name_id','class_name'),
                    ['prompt'=>'']
                )?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'previous_class')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-6">
                 <?= $form->field($model, 'passing_year')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'total_marks')->textInput() ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'obtained_marks')->textInput() ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'grades')->dropDownList([ 'A+' => 'A+', 'A' => 'A', 'B' => 'B', 'C' => 'C', 'D' => 'D', 'E' => 'E', 'F' => 'F', ], ['prompt' => '']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'percentage')->textInput() ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'Institute')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
       

       
<!-- 
    

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?> -->

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
