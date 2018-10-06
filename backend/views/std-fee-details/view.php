<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdFeeDetails */
?>
<div class="std-fee-details-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_fee_id',
            'std_id',
            'date',
            'total_fee',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
