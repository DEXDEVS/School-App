<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Sections */
?>
<div class="sections-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'section_id',
            'session_id',
            'section_description',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
