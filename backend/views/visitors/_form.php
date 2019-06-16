<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Visitors */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="visitors-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'visitor_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'visitor_contact_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999']) ?>
        </div>
    </div>
    <div  class="row">
        <div class="col-md-6">
             <?= $form->field($model, 'visitor_photo')->fileInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'visitor_cnic')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '99999-9999999-9', ]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'visit_purpose')->textarea(['maxlength' => true, 'rows'=>6]) ?>
        </div>
    </div>
    
    <?php if (!Yii::$app->request->isAjax){ ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
