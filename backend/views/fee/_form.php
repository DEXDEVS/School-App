<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Fee */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'std_id')->textInput() ?>

    <?= $form->field($model, 'admission_fee')->textInput() ?>

    <?= $form->field($model, 'addmission_fee_discount')->textInput() ?>

    <?= $form->field($model, 'net_addmission_fee')->textInput() ?>

    <?= $form->field($model, 'monthly_fee')->textInput() ?>

    <?= $form->field($model, 'monthly_fee_discount')->textInput() ?>

    <?= $form->field($model, 'net_monthly_fee')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>