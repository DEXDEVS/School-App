<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\EmpDesignation;
use common\models\Branches;

/* @var $this yii\web\View */
/* @var $model common\models\EmpInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-info-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'emp_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_father_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_cnic')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '99999-9999999-9', ]) ?>
        </div>
    </div>

    <div class="row">
         <div class="col-md-4">
            <?= $form->field($model, 'emp_contact_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_gender')->dropDownList([ 'Male' => 'Male', 'Female' => 'Female', ], ['prompt' => 'Select Gender']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_designation_id')->dropDownList(
                ArrayHelper::map(EmpDesignation::find()->all(),'emp_designation_id','emp_designation'),
                ['prompt'=>'Select Designation']
            )?>
        </div>
    </div>

    <div class="row">
       <div class="col-md-4">
            <?= $form->field($model, 'emp_branch_id')->dropDownList(
                ArrayHelper::map(Branches::find()->all(),'branch_id','branch_name'),
                ['prompt'=>'Select Branch']
            )?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_marital_status')->dropDownList([ 'Single' => 'Single', 'Married' => 'Married', ], ['prompt' => '']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_email')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'emp_qualification')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_passing_year')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_institute_name')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'emp_salary')->textInput(['type' => 'number']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'emp_address')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <?php if (!Yii::$app->request->isAjax){ ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
