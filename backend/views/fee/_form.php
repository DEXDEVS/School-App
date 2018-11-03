<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\StdPersonalInfo;

/* @var $this yii\web\View */
/* @var $model common\models\Fee */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'std_id')->dropDownList(
                    ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                    ['prompt'=>'']
                )?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'admission_fee')->textInput(['type' => 'number','id' => 'admissionFee']) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'addmission_fee_discount')->textInput(['type' => 'number','id' => 'admissionFeeDiscount']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'net_addmission_fee')->textInput(['type' => 'number', 'id' => 'netAdmissionFee', 'readonly'=> true, 'onfocus' => 'showNetAdmissionFee();' ]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'monthly_fee')->textInput(['type' => 'number','id' => 'monthlyFee']) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'monthly_fee_discount')->textInput(['type' => 'number','id' => 'monthlyFeeDiscount']) ?>
             </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'net_monthly_fee')->textInput(['type' => 'number', 'id' => 'netMonthlyFee', 'readonly'=> true, 'onfocus' => 'showNetMonthlyFee();' ]) ?>
            </div>
        </div>

        <script type="text/javascript">
            // showNetMonthlyFee function...!
            function showNetAdmissionFee() {
                var value1 = document.getElementById('admissionFee').value;
                var value2 = document.getElementById('admissionFeeDiscount').value;
                document.getElementById('netAdmissionFee').value = value1 - value2 ;
            }
            // showNetMonthlyFee function...!
            function showNetMonthlyFee() {
                var value1 = document.getElementById('monthlyFee').value;
                var value2 = document.getElementById('monthlyFeeDiscount').value;
                document.getElementById('netMonthlyFee').value = value1 - value2;
            }
        </script>
                
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
