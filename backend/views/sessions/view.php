<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Sessions */
?>
<div class="sessions-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'session_id',
            'session_name',
            'session_description',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
