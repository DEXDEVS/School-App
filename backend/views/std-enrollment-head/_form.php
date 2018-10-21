<?php
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use common\models\StdClass;

/* @var $this yii\web\View */
/* @var $model common\models\StdEnrollmentHead */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-enrollment-head-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="=row">
        <div class="col-md-12">
            <?= $form->field($model, 'class_id')->dropDownList(
                    ArrayHelper::map(StdClass::find()->all(),'class_id','class_name'),
                    ['prompt'=>'']
                )?>
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
