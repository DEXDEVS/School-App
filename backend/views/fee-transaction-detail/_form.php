<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FeeTransactionDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-transaction-detail-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'fee_trans_detail_head_id')->textInput() ?>

    <?= $form->field($model, 'fee_type_id')->textInput() ?>

    <?= $form->field($model, 'fee_amount')->textInput() ?>

    <?= $form->field($model, 'fee_discount')->textInput() ?>

    <?= $form->field($model, 'discounted_value')->textInput() ?>

    <?= $form->field($model, 'net_total')->textInput() ?>

    <?= $form->field($model, 'remaining')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList([ 'Paid' => 'Paid', 'Unpaid' => 'Unpaid', ], ['prompt' => '']) ?>

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
