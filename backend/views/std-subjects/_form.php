<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Subjects;
use common\models\StdClassName;


/* @var $this yii\web\View */
/* @var $model common\models\StdSubjects */
/* @var $form yii\widgets\ActiveForm */
//$branch_id = Yii::$app->user->identity->branch_id;
?>

<div class="std-subjects-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'class_id')->dropDownList(ArrayHelper::map(StdClassName::find()->all(),'class_name_id','class_name'),
    	['prompt'=>'Select Class']
	)?>

    <?= $form->field($model, 'std_subject_name')->textInput(['maxlength' => true]) ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
