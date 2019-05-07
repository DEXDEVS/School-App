<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use common\models\StdClassName;

$branch_id = Yii::$app->user->identity->branch_id;
/* @var $this yii\web\View */
/* @var $model common\models\TimeTableHead */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="time-table-head-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'class_id')->dropDownList(
                    ArrayHelper::map(StdClassName::find()->where(['delete_status'=>1,'branch_id'=> $branch_id])->all(),'class_name_id','class_name'),
                    ['prompt'=>'','id'=>'classId']
                )?>
        </div>
        <div class="col-md-6"> 
                <?php 

                    $data = [ 'Monday' => 'Monday', 'Tuesday' => 'Tuesday', 'Wednesday' => 'Wednesday', 'Thursday' => 'Thursday', 'Friday' => 'Friday', 'Saturday' => 'Saturday', ]; ?>
                <?= $form->field($model, 'days')->widget(Select2::classname(), [
                    'data' => $data,
                    'language' => 'en',
                    'options' => ['placeholder' => 'Select'],
                    'showToggleAll' => true,
                    'pluginOptions' => [
                        'allowClear' => true,
                        'multiple' => true,
                        //'maximumSelectionLength'=> 2,
                    ],
                ]);
                ?>
            </div>
    </div>

            

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
