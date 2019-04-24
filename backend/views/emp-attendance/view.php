<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\EmpAttendance */
?>
<div class="emp-attendance-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'att_id',
            'emp_id',
            'att_date',
            'check_in',
            'check_out',
            'attendance',
            'created_by',
            'updated_by',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
