<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdEnrollmentHead */
?>
<div class="std-enrollment-head-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_enroll_head_id',
            'class_id',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
