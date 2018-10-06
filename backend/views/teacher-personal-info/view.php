<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\TeacherPersonalInfo */
?>
<div class="teacher-personal-info-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'teacher_id',
            'teacher_name',
            'father_name',
            'teacher_cnic',
            'teacher_contact_no',
            'teacher_address',
            'teacher_marital_status',
            'teacher_gender',
            'teacher_email:email',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
