<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ClassName */
?>
<div class="class-name-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'class_name_id',
            'class_name',
            'class_name_description',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
