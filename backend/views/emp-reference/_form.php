<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpReference */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-reference-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_id')->textInput() ?>

    <?= $form->field($model, 'ref_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ref_contact_no')->textInput() ?>

    <?= $form->field($model, 'ref_cnic')->textInput() ?>

    <?= $form->field($model, 'ref_designation')->textInput(['maxlength' => true]) ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
