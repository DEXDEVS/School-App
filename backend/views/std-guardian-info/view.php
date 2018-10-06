<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdGuardianInfo */
?>
<div class="std-guardian-info-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_guardian_info_d',
            'std_id',
            'father_name',
            'father_cnic',
            'father_email:email',
            'guardian_contact_no_1',
            'guardian_contact_no_2',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
