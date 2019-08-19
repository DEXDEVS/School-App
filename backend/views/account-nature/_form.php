<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\AccountNature */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="account-nature-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'account_nature_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'account_nature_status')->dropDownList([ 'Debit' => 'Debit', 'Credit' => 'Credit', ], ['prompt' => '']) ?>
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
