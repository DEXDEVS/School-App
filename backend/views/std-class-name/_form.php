<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\StdClassName */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-class-name-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'class_name')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'class_name_description')->textInput(['maxlength' => true]) ?>
            </div>
        </div>



   <!--  
    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?> -->

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
