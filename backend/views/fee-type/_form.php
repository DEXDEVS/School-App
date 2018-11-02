<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FeeType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-type-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'fee_type_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fee_type_description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fee_amount')->textInput() ?>

    <?= $form->field($model, 'starting_date')->textInput() ?>

    <?= $form->field($model, 'ending_date')->textInput() ?>

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
