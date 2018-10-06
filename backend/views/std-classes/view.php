<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdClasses */
?>
<div class="std-classes-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'class_id',
            'class_name_id',
            'session_id',
            'section_id',
            'timing_id',
            'class_description',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
