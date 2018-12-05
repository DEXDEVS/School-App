<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\FeeTransactionHead */
?>
<div class="fee-transaction-head-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'fee_trans_id',
            'std_class_id',
            'std_id',
            'month',
            'transaction_date',
            'total_amount',
            'total_discount',
            'paid_amount',
            'remaining',
            'status',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
