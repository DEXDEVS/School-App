<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-info-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'emp_name')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'emp_father_name')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                 <?= $form->field($model, 'emp_cnic')->widget(yii\widgets\MaskedInput::class, [
        'mask' => '99999-9999999-9',
        ]) ?>
            </div>
            <div class="col-md-6">
                    <?= $form->field($model, 'emp_contact_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>

            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'emp_address')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'emp_marital_status')->dropDownList([ 'Single' => 'Single', 'Married' => 'Married', ], ['prompt' => '']) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'emp_gender')->dropDownList([ 'Male' => 'Male', 'Female' => 'Female', ], ['prompt' => '']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'emp_email')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'emp_qualification')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'emp_passing_year')->textInput() ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'emp_institute_name')->textInput(['maxlength' => true]) ?>
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
