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
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'std_class_id')->dropDownList(
                    ArrayHelper::map(StdClass::find()->all(),'class_id','class_name'),
                    ['prompt'=>'Select Class',
                    'id' => 'classId',
                ])?> 
            </div>
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'std_id')->dropDownList(
                    ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                    ['prompt'=>'Select Student','id' => 'studentId']
                )?>
            </div>
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'month')->dropDownList([ 'January' => 'January', 'Fabruary' => 'Fabruary', 'March' => 'March', 'April' => 'April', 'May' => 'May', 'June' => 'June', 'July' => 'July', 'August' => 'August', 'September' => 'September', 'October' => 'October', 'November' => 'November', 'December' => 'December', ], ['prompt' => 'Select Month']) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
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
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'total_amount')->textInput() ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'total_discount')->textInput() ?>
            </div>
        </div>
    <!-- Fee Transaction Detail-->
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'fee_type_id')->dropDownList(
                    ArrayHelper::map(FeeType::find()->all(),'fee_type_id','fee_type_name'),
                    ['prompt'=>'Select FeeType','id'=>'feeType']
            )?> 
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'fee_amount')->textInput(['id'=>'feeAmount','type' => 'number']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'fee_discount')->textInput(['id'=> 'feeDiscount']) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'discounted_value')->textInput(['id'=>'discountValue', 'readonly' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'net_total')->textInput(['id'=>'netTotal', 'readonly' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'paid_amount')->textInput(['id'=>'paidAmount','onchange'=>'remainingAmount();','type' => 'number']) ?>
        </div>
    </div>
    <div class="row">    
        <div class="col-md-3">
            <?= $form->field($model, 'remaining')->textInput(['id'=>'remaining','readonly'=> true]) ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'status')->dropDownList([ 'Paid' => 'Paid', 'Unpaid' => 'Unpaid', ], ['prompt' => 'Status...']) ?>
        </div>
    </div>
    <input type="button" name="" value ="Add" class="btn btn-success" id= "addInfo">
    

    <div id="mydata">
        <br/>
        <table  id="infoTable" class="table table-striped table-bordered dt-responsive nowrap" align ="center" width="70%" style="display: none;">
            <tr>
            <th> Fee Type ID         </th>
            <th> Fee Amount          </th>
            <th> Fee Discount        </th>
            <th> Discounted Value    </th>
            <th> Net Total           </th>
            </tr>
        </table>
        <br/>
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
            $('#studentId').empty();
            $('#studentId').append("<option>"+"Select Student"+"</option>");
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

//get student detail

var netTotal = 0;

$('#studentId').on('change',function(){
   var studentId = $('#studentId').val();
   
   $.ajax({
        type:'post',
        cache:false,
        data:{studentId:studentId},
        url: "$url",

        success: function(result){

            var jsonResult = JSON.parse(result.substring(result.indexOf('{'), result.indexOf('}')+1));
            console.log(jsonResult);
            var netAddmissionFee = jsonResult['net_addmission_fee'];
            var netMonthlyFee = jsonResult['net_monthly_fee'];
            $('#feeType').on('change',function(){
                var feeType = $('#feeType').val();
                
                if(feeType == 1){
                    $('#feeAmount').val(netAddmissionFee);
                    var netValue = $('#feeAmount').val();
                    netTotal += parseInt(netValue);
                    $('#netTotal').val(netTotal);
                }else if (feeType == 2){
                    $('#feeAmount').val(netMonthlyFee);
                    var netValue = $('#feeAmount').val();
                    netTotal += parseInt(netValue) ;
                    $('#netTotal').val(netTotal);
                }else {
                    $('#feeAmount').val('');
                }      
            });   
        }         
    });       
});
// $('#feeAmount').on('change',function(){
//     var netValue = $('#feeAmount').val();
//     var total = parseInt(netValue);
//     netTotal += total;
//     $('#netTotal').val(netTotal);
// });
    $('#feeDiscount').on('change',function(){
        var netValue = $('#feeAmount').val();
        var total = parseInt(netValue);
        var discount = $('#feeDiscount').val();
        var feeDiscount = parseInt(discount);

        if(discount == feeDiscount + '%'){
            
            amount = parseInt((total * feeDiscount)/100);

            $('#discountValue').val(amount);
        
            netTotal +=total - amount;
            $('#netTotal').val(netTotal);
            $('#feeAmount').val(''); 
            $('#feeDiscount').val('');
            $('#discountValue').val('');
        } else {
            amountt = parseInt(total - feeDiscount);
            $('#discountValue').val(amountt);
        
            netTotal += amountt;
            $('#netTotal').val(netTotal);
            $('#feeAmount').val(''); 
            $('#feeDiscount').val('');
            $('#discountValue').val('');
        }
    });  
   //arrays declaration
    let feeType = new Array();
    let feeAmount = new Array();
    let feeDiscount = new Array();
    let DiscountedValue = new Array();
  //this code apply on the add button
     $('#addInfo').on('click',function(){

            $('#infoTable').show();
            let fType = $('#feeType').val();
            let fAmount =$('#feeAmount').val();
            let fDiscount=$('#feeDiscount').val();
            let dValue =$('#discountValue').val();

            alert(fAmount);

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