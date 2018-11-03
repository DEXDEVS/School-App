<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\StdPersonalInfo;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model common\models\StdGuardianInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-guardian-info-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'std_id')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(StdPersonalInfo::find()->all(),'std_id','std_name'),
                    'language' => 'en',
                    'options' => [
                        'placeholder' => 'Select Student',
                        //'multiple' => true,
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ])?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'father_name')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'father_cnic')->widget(yii\widgets\MaskedInput::class, [
        'mask' => '99999-9999999-9',
        ]) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'father_email')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                    <?= $form->field($model, 'guardian_contact_no_1')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>

            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'guardian_contact_no_2')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>
            </div>
        </div>
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
