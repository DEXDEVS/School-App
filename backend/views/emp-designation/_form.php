<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\EmpInfo;

/* @var $this yii\web\View */
/* @var $model common\models\EmpDesignation */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-designation-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'emp_id')->dropDownList(
                    ArrayHelper::map(EmpInfo::find()->all(),'emp_id','emp_name')
                )?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'emp_designation')->textInput(['maxlength' => true]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'emp_designation_type')->dropDownList([ 'Permanent' => 'Permanent', 'Visitor' => 'Visitor', ], ['prompt' => '']) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'emp_salary')->textInput() ?>
        </div>
    </div>
<!--   <?= $form->field($model, 'created_at')->textInput() ?>

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
