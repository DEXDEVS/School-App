<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\StdSessions */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-sessions-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'session_branch_id')->textInput() ?>

    <?= $form->field($model, 'session_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'session_start_date')->textInput() ?>

    <?= $form->field($model, 'session_end_date')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList([ 'Active' => 'Active', 'Inactive' => 'Inactive', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>