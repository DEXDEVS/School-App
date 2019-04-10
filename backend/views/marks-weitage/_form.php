<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\ExamsCategory;
use common\models\Subjects;
/* @var $this yii\web\View */
/* @var $model common\models\MarksWeitage */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="marks-weitage-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'exam_category_id')->dropDownList(
                    ArrayHelper::map(ExamsCategory::find()->all(),'exam_category_id','category_name'),
                    ['prompt'=>'Select Exam Category',]
                )?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'subject_id')->dropDownList(
                    ArrayHelper::map(Subjects::find()->all(),'subject_id','subject_name'),
                    ['prompt'=>'Select Subject']
                )?>
        </div>
    </div>
     <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'presentation')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'assignment')->textInput() ?>
        </div>
    </div>
     <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'attendance')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'dressing')->textInput() ?>
        </div>
    </div>
     <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'theory')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'practical')->textInput() ?>
        </div>
    </div>

    <?php if (!Yii::$app->request->isAjax){ ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
