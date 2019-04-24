<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpLeave */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-leave-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_id')->textInput() ?>

    <?= $form->field($model, 'leave_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'starting_date')->textInput() ?>

    <?= $form->field($model, 'ending_date')->textInput() ?>

    <?= $form->field($model, 'applying_date')->textInput() ?>

    <?= $form->field($model, 'no_of_days')->textInput() ?>

    <?= $form->field($model, 'leave_purpose')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->textInput(['maxlength' => true]) ?>

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
