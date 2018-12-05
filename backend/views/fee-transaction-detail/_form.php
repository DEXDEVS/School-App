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
                    ['prompt'=>'Select Student',
                    'id' => 'std',
                ])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'month')->dropDownList([ 'January' => 'January', 'Fabruary' => 'Fabruary', 'March' => 'March', 'April' => 'April', 'May' => 'May', 'June' => 'June', 'July' => 'July', 'August' => 'August', 'September' => 'September', 'October' => 'October', 'November' => 'November', 'December' => 'December', ], ['prompt' => 'Select Month','id'=>'month']) ?>
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
                        'todayBtn' => true,
                        'id'=>'date'
                    ]
                ]);?>
            </div>
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'total_amount')->textInput(['id'=>'totalAmount']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($feeTransactionHead, 'total_discount')->textInput(['id'=>'totalDiscount']) ?>
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
            <?= $form->field($model, 'fee_amount')->textInput(['id'=>'feeAmount']) ?>
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
    </div>
    <input type="button" name="" value ="Add" class="btn btn-success" id= "addInfo">
    
    <div id="mydata">
        <br/>
        <table  id="infoTable" class="table table-striped table-bordered dt-responsive nowrap" align ="center" width="70%" style="display: none;">
            <tr>
            <th>Index No</th>
            <th> Fee Type ID         </th>
            <th> Total Amount        </th>
            <th> Fee Discount        </th>
            <th> Discounted Value    </th>
            <th> Fee Amount          </th>
            <th>Delete</th>
            </tr>
        </table>
        <br/>
    </div>
    <input type="button" name="btn" value="Confirm" id= "insert" >
    
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
            $('#std').empty();
            $('#std').append("<option>"+"Select Student.."+"</option>");
            for(var i=0; i<len; i++)
            {
            var stdId = jsonResult[0][i];
            var stdName = jsonResult[1][i];
            html += "<option value="+ stdId +">"+stdName+"</option>";
            }
            $(".field-std select").append(html);

        }         
    });       
});

//get student detail
var netTotal = 0;
$('#std').on('change',function(){
   var studentId = $('#std').val();
    $('#feeType').val('');
    $('#feeAmount').val('');
    $('#discountValue').val('');
    $('#feeDiscount').val('');
    $('#netTotal').val('');
    netTotal = 0;
   
   
   
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

                }else if (feeType == 2){
                    $('#feeAmount').val(netMonthlyFee);
                   
                }else {
                    $('#feeAmount').val('');
                    
                }      
            });   
        }         
    });       
});
let amountt =0;
let discountt = 0;
    $('#feeDiscount').on('change',function(){
        var netValue = $('#feeAmount').val();
        var total = parseInt(netValue);
        var discount = $('#feeDiscount').val();
        var feeDiscount = parseInt(discount);

        if(discount == feeDiscount + '%'){
            
            amount = parseInt((total * feeDiscount)/100);

            $('#discountValue').val(amount);
            
            amountt = total - amount;

            netTotal += amountt;
           // $('#netTotal').val(netTotal);
            
        } else {
            amountt = parseInt(total - feeDiscount);
            $('#discountValue').val(feeDiscount); 
            netTotal += amountt;
        }
    });  
   //arrays declaration
    let feeTypeArray = new Array();
    let feeAmountArray = new Array();
    let feeDiscountArray = new Array();
    let discountValueArray = new Array();
  //this code apply on the add button
     $('#addInfo').on('click',function(){

            $('#netTotal').val(netTotal);
            $('#totalAmount').val(netTotal);


            $('#infoTable').show();
            let fType = $('#feeType').val();
            let fDiscount=$('#feeDiscount').val();
            let totalFeeAmount = $('#feeAmount').val();
            let dValue =$('#discountValue').val();

           feeTypeArray.push(fType);
           feeAmountArray.push(amountt);
           feeDiscountArray.push(fDiscount);
           discountValueArray.push(dValue);

            var table = document.getElementById('infoTable');
            let rowCount = table.rows.length;

            let row = table.insertRow(rowCount);

            row.insertCell(0).innerHTML = rowCount;
            row.insertCell(1).innerHTML = fType;
            row.insertCell(2).innerHTML = totalFeeAmount;
            row.insertCell(3).innerHTML = fDiscount;
            row.insertCell(4).innerHTML = dValue;
            row.insertCell(5).innerHTML = amountt;

            row.insertCell(6).innerHTML = "<span class='glyphicon glyphicon-remove' style='color:red; font-size: 18px; padding-left: 20px;' onclick='deleteRecord(this);'></span>";

            discountt += parseInt(dValue);
            $('#totalDiscount').val(discountt);

            $('#feeAmount').val('');
            $('#discountValue').val(''); 
            $('#feeDiscount').val('');

        });

    //function for delete the record from array
        function deleteRecord(value){
            alert("Are you sure you want to delete it?");
            var i = value.parentNode.parentNode.rowIndex;
            document.getElementById("infoTable").deleteRow(i);
            var j=i-1;
            let sum = 0;
            feeTypeArray.splice(j,1);
            feeAmountArray.splice(j,1);
            feeDiscountArray.splice(j,1);
            discountValueArray.splice(j,1); 

            for(let x=0; x<feeAmountArray.length; x++){
                sum = sum + feeAmountArray[x];
            }
            $('#netTotal').val(sum);
            $('#totalAmount').val(sum);
        }
$('#insert').on('click',function(){ 
        alert("Are you sure you complete your transaction?");
        $('#netTotal').val(feeTypeArray);
        $('#feeAmount').val(feeAmountArray);
        $('#feeDiscount').val(feeDiscountArray);
        $('#discountValue').val(discountValueArray); 
    });
        
        
JS;
$this->registerJs($script);
?>
</script>