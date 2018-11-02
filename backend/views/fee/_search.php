<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FeeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fee-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'fee_id') ?>

    <?= $form->field($model, 'std_id') ?>

    <?= $form->field($model, 'admission_fee') ?>

    <?= $form->field($model, 'addmission_fee_discount') ?>

    <?= $form->field($model, 'net_addmission_fee') ?>

    <?php // echo $form->field($model, 'monthly_fee') ?>

    <?php // echo $form->field($model, 'monthly_fee_discount') ?>

    <?php // echo $form->field($model, 'net_monthly_fee') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
