<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\web\UploadedFile;
use dosamigos\datetimepicker\DateTimePicker;
use kartik\select2\Select2;
use common\models\StdClassName;

/* @var $this yii\web\View */
/* @var $model common\models\StdPersonalInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-personal-info-form">

    <?php $form = ActiveForm::begin(); ?>
    <h3> Personal Info </h3>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'std_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_contact_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>
        </div>  
        <div class="col-md-4">
            <?= $form->field($model, 'std_father_name')->textInput(['maxlength' => true]) ?>
        </div>     
    </div>
    <div class="row"> 
        <div class="col-md-4">
            <label>Stdudent DOB</label>
            <?= DateTimePicker::widget([
                'model' => $model,
                'attribute' => 'std_DOB',
                'language' => 'en',
                'size' => 'ms',
                'clientOptions' => [
                    'autoclose' => true,
                    'format' => 'yyyy-mm-dd HH:ii:ss',
                    'todayBtn' => true
                ]
            ]);?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_gender')->dropDownList
            ([ 'Male' => 'Male', 'Female' => 'Female', ], ['prompt' => '']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_email')->textInput(['maxlength' => true]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'std_photo')->fileInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_b_form')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '99999-9999999-9', ]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_district')->textInput(['maxlength' => true]) ?>
        </div>
    </div> 

    <div class="row">  
        <div class="col-md-4">
            <?= $form->field($model, 'std_tehseel')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'std_nationality')->textInput(['maxlength' => true]) ?>
        </div>  
        <div class="col-md-4">
            <?= $form->field($model, 'std_religion')->textInput(['maxlength' => true]) ?>
        </div>   
    </div>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'std_permanent_address')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'std_temporary_address')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <!-- Guardian Info-->
    <h3> Guardian Info </h3>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($stdGuardianInfo, 'father_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($stdGuardianInfo, 'father_cnic')->widget(yii\widgets\MaskedInput::class, [
                'mask' => '99999-9999999-9',
            ]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($stdGuardianInfo, 'father_email')->textInput(['maxlength' => true]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($stdGuardianInfo, 'guardian_contact_no_1')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>
        </div>
        <div class="col-md-4">
             <?= $form->field($stdGuardianInfo, 'guardian_contact_no_2')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999', ]) ?>
        </div>
    </div>
        <!-- Guardian Info end -->

        <!-- Academic Info -->
        <h3> Academic Info </h3>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($stdAcademicInfo, 'class_name_id')->dropDownList(
                    ArrayHelper::map(StdClassName::find()->all(),'class_name_id','class_name'),
                    ['prompt'=>'']
                )?>
            </div>
            <div class="col-md-4">
                <?= $form->field($stdAcademicInfo, 'previous_class')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-4">
                 <?= $form->field($stdAcademicInfo, 'passing_year')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($stdAcademicInfo, 'total_marks')->textInput() ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($stdAcademicInfo, 'obtained_marks')->textInput() ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($stdAcademicInfo, 'grades')->dropDownList([ 'A+' => 'A+', 'A' => 'A', 'B' => 'B', 'C' => 'C', 'D' => 'D', 'E' => 'E', 'F' => 'F', ], ['prompt' => '']) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($stdAcademicInfo, 'percentage')->textInput() ?>
            </div>
            <div class="col-md-6">
                <?= $form->field($stdAcademicInfo, 'Institute')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
        <!-- Academic Info end -->

        <!-- Fee detail start -->
        <h3> Fee Detail </h3>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($fee, 'admission_fee')->textInput(['type'=> 'number']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($fee, 'addmission_fee_discount')->textInput(['type'=> 'number']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($fee, 'net_addmission_fee')->textInput(['type'=> 'number']) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($fee, 'monthly_fee')->textInput(['type'=> 'number']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($fee, 'monthly_fee_discount')->textInput(['type'=> 'number']) ?>
             </div>
              <div class="col-md-4">
                <?= $form->field($fee, 'net_monthly_fee')->textInput(['type'=> 'number']) ?>
            </div>
        </div>        
        <!-- Fee detail end -->
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
