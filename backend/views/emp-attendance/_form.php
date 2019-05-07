<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpAttendance */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-attendance-form">

    <?php $form = ActiveForm::begin(['id'=>$model->formName()]); ?>
    
    <?= $form->field($model, 'emp_cnic')->widget(yii\widgets\MaskedInput::class, ['options' => ['id' => 'empCnic'], 'mask' => '99999-9999999-9']); ?>

    <?= $form->field($model, 'check_in')->radio(['label'=>'Check In', 'value' => 0, 'checked' => true]) ?>

    <?= $form->field($model, 'check_in')->radio(['label'=>'Check Out','value' => 1]) ?>

	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
<?php
$url = \yii\helpers\Url::to("./fetch-cnic");

$script = <<< JS
$('#empCnic').on('change',function(){
    var cnic = $('#empCnic').val();

    $.ajax({
        type:'post',
        data:{cnic:cnic},
        url: "$url",

        success: function(result){
            var jsonResult = JSON.parse(result.substring(result.indexOf('['), result.indexOf(']')+1));
            if(jsonResult[0] == 0){
                alert("Invalid Cnic");
            }
            if(jsonResult[0] == 1){
                
            }
        }         
    });
    
});

JS;
$this->registerJs($script);
?>
</script>  