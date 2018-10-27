<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\EmpDesignation;

/* @var $this yii\web\View */
/* @var $model common\models\TeacherSubjectAssignDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="teacher-subject-assign-detail-form">

    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($teacherSubjectAssignHead, 'teacher_id')->dropDownList(
                    ArrayHelper::map(EmpDesignation::find()->where(['emp_designation'=>'Teacher'])->all(),'emp_id','emp_name'),
                    ['prompt'=>'']
                )?>
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

        
  

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
