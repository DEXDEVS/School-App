<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\EmpDesignation */
?>
<div class="emp-designation-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'emp_designation_id',
            'emp_id',
            'emp_designation',
            'emp_designation_type',
            'emp_salary',
        ],
    ]) ?>

</div>
