<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-info-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_branch_id')->textInput() ?>

    <?= $form->field($model, 'emp_reg_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_father_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_cnic')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_contact_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_perm_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_temp_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_marital_status')->dropDownList([ 'Single' => 'Single', 'Married' => 'Married', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'emp_gender')->dropDownList([ 'Male' => 'Male', 'Female' => 'Female', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'emp_photo')->fileInput() ?>

    <?= $form->field($model, 'emp_dept_id')->textInput() ?>

    <?= $form->field($model, 'emp_salary_type')->dropDownList([ 'Salaried' => 'Salaried', 'Per Lecture' => 'Per Lecture', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'emp_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_qualification')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_passing_year')->textInput() ?>

    <?= $form->field($model, 'emp_institute_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'degree_scan_copy')->fileInput() ?>

    <?= $form->field($model, 'emp_cv')->fileInput()?>

    <?= $form->field($model, 'emp_status')->dropDownList([ 'Active' => 'Active', 'Inactive' => 'Inactive', ], ['prompt' => '']) ?>


  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
