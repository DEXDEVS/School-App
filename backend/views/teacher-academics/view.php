<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\TeacherAcademics */
?>
<div class="teacher-academics-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'teacher_academic_id',
            'teacher_id',
            'qualification',
            'passing_year',
            'Institute',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
