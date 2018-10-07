<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpDesignation */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-designation-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'emp_id')->textInput() ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'emp_designation')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'emp_designation_type')->dropDownList([ 'Permanent' => 'Permanent', 'Visitor' => 'Visitor', ], ['prompt' => '']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'emp_salary')->textInput() ?>
            </div>
        </div>
    

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
