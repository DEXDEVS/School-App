<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdPersonalInfo */
?>
<div class="std-personal-info-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_id',
            'std_name',
            'std_contact_no',
            'std_DOB',
            'std_gender',
            'std_permanent_address',
            'std_temporary_address',
            'std_email:email',
            'std_b_form',
            'std_district',
            'std_religion',
            'std_nationality',
            'std_tehseel',
            'std_serious_disease',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>

</div>
