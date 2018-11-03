<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\StdClass;
use common\models\StdPersonalInfo;

/* @var $this yii\web\View */
/* @var $model common\models\FeeTransactionDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-transaction-detail-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'std_class_id')->dropDownList(
                    ArrayHelper::map(StdClass::find()->all(),'class_id','class_name'),
                    ['prompt'=>'Select Class',
                    'onchange'=>
                        '$.post("index.php?r=std-enrollment-detail/lists&id='.'"+$(this).val(), function( data ){
                            $("select#feetransactionhead-std_id").html(data);
                        });'
                ])?> 
            </div>
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'std_id')->dropDownList(
                    ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                    ['prompt'=>'']
                )?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'month')->dropDownList([ 'January' => 'January', 'Fabruary' => 'Fabruary', 'March' => 'March', 'April' => 'April', 'May' => 'May', 'June' => 'June', 'July' => 'July', 'August' => 'August', 'September' => 'September', 'October' => 'October', 'November' => 'November', 'December' => 'December', ], ['prompt' => '']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'transaction_date')->textInput() ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'total_amount')->textInput() ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'total_discount')->textInput() ?>
            </div>
        </div>

    <!-- Fee Transaction Detail-->
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'fee_type_id')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'fee_amount')->textInput() ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'fee_discount')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'discounted_value')->textInput() ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'net_total')->textInput() ?>
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
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
