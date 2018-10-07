<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TeacherSubjectAssignDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="teacher-subject-assign-detail-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'teacher_subject_assign_detail_head_id')->textInput() ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($model, 'class_id')->textInput() ?>
            </div>
        </div>
         <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'subject_id')->textInput() ?>
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
