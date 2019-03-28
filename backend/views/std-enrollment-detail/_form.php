<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\StdClassName;
use common\models\StdSessions;
use common\models\StdSections;
use common\models\StdPersonalInfo;
use kartik\select2\Select2;
$branch_id = Yii::$app->user->identity->branch_id;

/* @var $this yii\web\View */
/* @var $model common\models\StdEnrollmentDetail */
/* @var $form yii\widgets\ActiveForm */
$in = 1;
?>

<div class="std-enrollment-detail-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($stdEnrollmentHead, 'class_name_id')->dropDownList(
                    ArrayHelper::map(StdClassName::find()->where(['delete_status'=>1,'branch_id'=> $branch_id])->all(),'class_name_id','class_name'),
                    ['prompt'=>'','id'=>'classId']
                )?>
            </div>
            <div class="col-md-6">
                <?= $form->field($stdEnrollmentHead, 'session_id')->dropDownList(
                    ArrayHelper::map(StdSessions::find()->where(['delete_status'=>1,'session_branch_id'=> $branch_id])->all(),'session_id','session_name'),
                    [
                        'prompt'=>'Select Session',
                        'id' => 'sessionId',
                    ]);?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($stdEnrollmentHead, 'section_id')->dropDownList(
                    ArrayHelper::map(StdSections::find()->where(['delete_status'=>1])->all(),'section_id','section_name'),
                    ['prompt'=>'Select Section','id'=>'sectionId']
                )?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'std_enroll_detail_std_id')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(StdPersonalInfo::find()->where(['branch_id'=> $branch_id])->all(),'std_id','std_name'),
                    'language' => 'en',
                    'options' => ['placeholder' => 'Select'],
                    'showToggleAll' => true,
                    'pluginOptions' => [
                        'allowClear' => true,
                        'multiple' => true,
                        'maximumSelectionLength'=> 2,
                    ],
                ]);
                ?>
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
$url = \yii\helpers\Url::to("std-enrollment-detail/fetch-students");

$script = <<< JS
var intake;
//here you write all your javascript stuff
$('#sessionId').change(function(){
    var sessionId = $(this).val();
    $.get('std-sections/get-section',{sessionId : sessionId},function(data){
        var data =  $.parseJSON(data)
        $('#sectionId').empty();
        $('#sectionId').append("<option>"+"Select Section"+"</option>");
        var options = '';
            for(var i=0; i<data.length; i++) { 
                options += '<option value="'+data[i].section_id+'">'+data[i].section_name+'</option>';
            }
        // Append to the html
        $('#sectionId').append(options);
    });
});
$('#sectionId').change(function(){
    var sectionId = $(this).val();
    $.get('std-sections/get-section-intake',{sectionId : sectionId},function(data){
        var data =  $.parseJSON(data)
        intake = data[0].section_intake;
        alert(intake);
    });
});
$('#classId').change(function(){
    var classId = $(this).val();
    $.get('std-personal-info/get-student',{classId : classId},function(data){
        var data =  $.parseJSON(data)
        $('#stdent').empty();
        $('#stdent').append("<option>"+"Select Student"+"</option>");
        var options = '';
            for(var i=0; i<data.length; i++) { 
                options += '<option value="'+data[i].section_id+'">'+data[i].section_name+'</option>';
            }
        // Append to the html
        $('#stdent').append(options);
    });
});
// $('#classId').on('change',function(){
//    var classId = $('#classId').val();
   
//    $.ajax({
//         type:'post',
//         data:{class_Id:classId},
//         url: "$url",

//         success: function(result){
//             console.log(result);
//             var jsonResult = JSON.parse(result.substring(result.indexOf('{'), result.indexOf('}')+1));
            
//             var len =jsonResult[0].length;
//             var html = "";
//             $('#stdent').empty();
//             $('#stdent').append("<option>"+"Select Student.."+"</option>");
//             for(var i=0; i<len; i++)
//             {
//             var stdId = jsonResult[0][i];
//             var stdName = jsonResult[1][i];
//             html += "<option value="+ stdId +">"+stdName+"</option>";
//             }
//             $(".field-stdent select").append(html);

//         }         
//     });       
// });
JS;
$this->registerJs($script);
?>
</script>

