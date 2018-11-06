<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\StdClass;
use common\models\FeeType;
use common\models\StdPersonalInfo;
use dosamigos\datetimepicker\DateTimePicker;

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
                    'id' => 'classId',
                ])?> 
            </div>
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'std_id')->dropDownList(
                    ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                    ['prompt'=>'Select Student','id' => 'studentId']
                )?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($feeTransactionHead, 'month')->dropDownList([ 'January' => 'January', 'Fabruary' => 'Fabruary', 'March' => 'March', 'April' => 'April', 'May' => 'May', 'June' => 'June', 'July' => 'July', 'August' => 'August', 'September' => 'September', 'October' => 'October', 'November' => 'November', 'December' => 'December', ], ['prompt' => 'Select Month']) ?>
            </div>
            <div class="col-md-6">
                <label>Transaction Date</label>
                <?= DateTimePicker::widget([
                    'model' => $feeTransactionHead,
                    'attribute' => 'transaction_date',
                    'language' => 'en',
                    'size' => 'ms',
                    'clientOptions' => [
                        'autoclose' => true,
                        'format' => 'yyyy-mm-dd HH:ii:ss',
                        'todayBtn' => true
                    ]
                ]);?>
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
            <?= $form->field($model, 'fee_type_id')->dropDownList(
                    ArrayHelper::map(FeeType::find()->all(),'fee_type_id','fee_type_name'),
                    ['prompt'=>'Select FeeType']
            )?> 
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'fee_amount')->textInput(['id'=>'feeAmount','onchange'=>'netAmount();']) ?>
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
        <div class="col-md-3">
            <?= $form->field($model, 'net_total')->textInput(['id'=>'netTotal', 'readonly' => true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'paid_amount')->textInput(['id'=>'paidAmount','onchange'=>'remainingAmount();']) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'remaining')->textInput(['id'=>'remaining','readonly'=> true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'status')->dropDownList([ 'Paid' => 'Paid', 'Unpaid' => 'Unpaid', ], ['prompt' => 'Status...']) ?>
        </div>
    </div>
    
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>

<?php
$url = \yii\helpers\Url::to("index.php?r=fee-transaction-detail/fetch-students");

$script = <<< JS

$('#classId').on('change',function(){
   var classId = $('#classId').val();
   
   $.ajax({
        type:'post',
        cache:false,
        data:{classId:classId},
        url: "$url",

        success: function(result){

            var jsonResult = JSON.parse(result.substring(result.indexOf('{'), result.indexOf('}')+1));
            
            var len =jsonResult[0].length;
            var html = "";
            for(var i=0; i<len; i++)
            {
            var stdId = jsonResult[0][i];
            var stdName = jsonResult[1][i];
            html += "<option value="+ stdId +">"+stdName+"</option>";
            }
            $(".field-studentId select").html(html);
        }         
    });       
});


JS;
$this->registerJs($script);
?> 

<script type="text/javascript">
    function netAmount(){
        var netValue = document.getElementById('feeAmount').value;
        document.getElementById('netTotal').value = netValue;    
    }
    function remainingAmount(){
        var netTotal = document.getElementById('netTotal').value;
        var paidAmount = document.getElementById('paidAmount').value;
        var remainingBal = netTotal - paidAmount;
        document.getElementById('remaining').value = remainingBal;    
    }
</script>