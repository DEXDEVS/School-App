<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\StdAcademicInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-academic-info-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'std_id')->textInput() ?>

    <?= $form->field($model, 'class_name_id')->textInput() ?>

    <?= $form->field($model, 'passing_year')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'total_marks')->textInput() ?>

    <?= $form->field($model, 'obtained_marks')->textInput() ?>

    <?= $form->field($model, 'grades')->dropDownList([ 'A+' => 'A+', 'A' => 'A', 'B' => 'B', 'C' => 'C', 'D' => 'D', 'E' => 'E', 'F' => 'F', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'percentage')->textInput() ?>

    <?= $form->field($model, 'Institute')->textInput(['maxlength' => true]) ?>

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
