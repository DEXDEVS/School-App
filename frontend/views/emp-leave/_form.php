<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datetimepicker\DateTimePicker;

/* @var $this yii\web\View */
/* @var $model common\models\EmpLeave */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-leave-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
           <?= $form->field($model, 'leave_type')->dropDownList([ 'Casual Leave' => 'Casual Leave', 'Medical Leave' => 'Medical Leave'], ['prompt' => 'Select Leave Type']) ?>
        </div>
        <div class="col-md-6">
            <label>Starting Date</label>
            <?= DateTimePicker::widget([
                'model' => $model,
                'attribute' => 'starting_date',
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
            <label>Ending Date</label>
            <?= DateTimePicker::widget([
                'model' => $model,
                'attribute' => 'ending_date',
                'language' => 'en',
                'size' => 'ms',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'yyyy-mm-dd HH:ii:ss',
                    'todayBtn' => true
                ]
            ]);?>
        </div>
        <div class="col-md-6">
             <?= $form->field($model, 'no_of_days')->textInput() ?>
        </div>
    </div>
     <div class="row">
        <div class="col-md-12">
             <?= $form->field($model, 'leave_purpose')->textArea(['maxlength' => true]) ?>
        </div>
    </div>   

    <?php if (!Yii::$app->request->isAjax){ ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
