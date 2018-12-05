<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FeeTransactionHead */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-transaction-head-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'std_class_id')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_id')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'month')->dropDownList([ 'January' => 'January', 'Fabruary' => 'Fabruary', 'March' => 'March', 'April' => 'April', 'May' => 'May', 'June' => 'June', 'July' => 'July', 'August' => 'August', 'September' => 'September', 'October' => 'October', 'November' => 'November', 'December' => 'December', ], ['prompt' => '']) ?>            
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'transaction_date')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'total_amount')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'total_discount')->textInput() ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'paid_amount')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'remaining')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'status')->dropDownList([ 'Paid' => 'Paid', 'Unpaid' => 'Unpaid', ], ['prompt' => '']) ?>
        </div>
    </div>

	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
