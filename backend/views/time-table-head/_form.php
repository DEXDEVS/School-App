<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use common\models\StdEnrollmentHead;
use common\models\Subjects;
use wbraganca\dynamicform\DynamicFormWidget;

$branch_id = Yii::$app->user->identity->branch_id;
/* @var $this yii\web\View */
/* @var $model common\models\TimeTableHead */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="time-table-head-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'class_id')->dropDownList(
                    ArrayHelper::map(StdEnrollmentHead::find()->where(['delete_status'=>1,'branch_id'=> $branch_id])->all(),'std_enroll_head_id','std_enroll_head_name'),
                    ['prompt'=>'','id'=>'classId']
                )?>
        </div>
        <div class="col-md-6"> 
            <?php $data = [ 'Monday' => 'Monday', 'Tuesday' => 'Tuesday', 'Wednesday' => 'Wednesday', 'Thursday' => 'Thursday', 'Friday' => 'Friday', 'Saturday' => 'Saturday', ]; ?>
            <?= $form->field($model, 'days')->widget(Select2::classname(), [
                'data' => $data,
                'language' => 'en',
                'options' => ['placeholder' => 'Select'],
                'showToggleAll' => true,
                'pluginOptions' => [
                    'allowClear' => true,
                    'multiple' => true,
                    //'maximumSelectionLength'=> 2,
                ],
            ]);
            ?>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading"><h4><i class="glyphicon glyphicon-envelope"></i> Time Table</h4></div>
            <div class="panel-body">
            <?php DynamicFormWidget::begin([
                'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                'widgetBody' => '.container-items', // required: css class selector
                'widgetItem' => '.item', // required: css class
                'limit' => 10, // the maximum times, an element can be cloned (default 999)
                'min' => 1, // 0 or 1 (default 1)
                'insertButton' => '.add-item', // css class
                'deleteButton' => '.remove-item', // css class
                'model' => $timeTableDetails[0],
                'formId' => 'dynamic-form',
                'formFields' => [
                    'subject_id',  
                    'marks',
                ],
            ]); ?>

            <div class="container-items"><!-- widgetContainer -->
            <?php foreach ($timeTableDetails as $i => $timeTableDetail): ?>
                <div class="item panel panel-default"><!-- widgetBody -->
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left">Subject <?php echo $i+1; ?></h3>
                        <div class="pull-right">
                            <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <?php
                            // necessary for update action.
                            
                        ?>
                        <div class="row">
                            <div class="col-sm-6">
                                 <?= $form->field($timeTableDetail, "[{$i}]subject_id")->dropDownList(
                                    ArrayHelper::map(Subjects::find()->all(),'subject_id','subject_name'),
                                        ['prompt'=>'Select Subject']
                                )?>
                            </div>
                            <div class="col-sm-6">
                                 <?= $form->field($timeTableDetail, "[{$i}]start_time")->textInput(); ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                 <?= $form->field($timeTableDetail, "[{$i}]end_time")->textInput(); ?>
                            </div>
                            <div class="col-sm-6">
                                 <?= $form->field($timeTableDetail, "[{$i}]room")->textInput(); ?>
                            </div>
                        </div><!-- .row -->
                    </div>
                </div>
            <?php endforeach; ?>
            </div>
            <?php DynamicFormWidget::end(); ?>
            </div>
        </div>  
    </div>

            

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>

<?php
//$url = \yii\helpers\Url::to("std-personal-info/fetch-fee");

$script = <<< JS
$('#classId').on('change',function(){
    var class_id = $('#classId').val();
    
    $.ajax({
        type:'post',
        data:{class_id:class_id},
        url: "$url",
        success: function(result){
            console.log(result);
           // var jsonResult = JSON.parse(result.substring(result.indexOf('{'), result.indexOf('}')+1));
            // $('#std_name').val(jsonResult['std_name']);
            // $('#std_father_name').val(jsonResult['std_father_name']);
            // $('#std_contact_no').val(jsonResult['std_contact_no']);
            // $('#std_father_contact_no').val(jsonResult['std_father_contact_no']);
            // $('#previous_class').val(jsonResult['std_previous_class']);
            // $('#previous_class_rollno').val(jsonResult['std_roll_no']);
            // $('#obtainedMarks').val(jsonResult['std_obtained_marks']);
            // $('#totalMarks').val(jsonResult['std_total_marks']);
            // $('#percentage').val(jsonResult['std_percentage']);
            // $('#std_permanent_address').val(jsonResult['std_address']);
            // $('#std_temporary_address').val(jsonResult['std_address']);
        }         
    }); 
   
});

JS;
$this->registerJs($script);
?>
</script> 