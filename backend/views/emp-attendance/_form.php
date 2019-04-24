<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpAttendance */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-attendance-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_cnic')->widget(yii\widgets\MaskedInput::class, [
        'mask' => '99999-9999999-9',
        ]) ?>

    <?= $form->field($model, 'check_in')->radio(['label'=>'Check In', 'value' => 0, 'checked' => true]) ?>

    <?= $form->field($model, 'check_in')->radio(['label'=>'Check Out','value' => 1]) ?>


  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
