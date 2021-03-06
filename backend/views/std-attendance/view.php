<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdAttendance */
?>
<div class="std-attendance-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_attend_id',
            'branch_id',
            'teacher_id',
            'class_name_id',
            'session_id',
            'section_id',
            'subject_id',
            'date',
            'student_id',
            'status',
        ],
    ]) ?>

</div>
