<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-info-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_father_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_cnic')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_contact_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_marital_status')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_gender')->dropDownList([ 'Male' => 'Male', 'Female' => 'Female', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'emp_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_qualification')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_passing_year')->textInput() ?>

    <?= $form->field($model, 'emp_institute_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
