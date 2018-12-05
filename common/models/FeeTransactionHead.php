<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "fee_transaction_head".
 *
 * @property integer $fee_trans_id
 * @property integer $std_class_id
 * @property integer $std_id
 * @property string $month
 * @property string $transaction_date
 * @property double $total_amount
 * @property double $total_discount
 * @property double $paid_amount
 * @property double $remaining
 * @property string $status
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property FeeTransactionDetail[] $feeTransactionDetails
 * @property StdPersonalInfo $std
 * @property StdClass $stdClass
 */
class FeeTransactionHead extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'fee_transaction_head';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_class_id', 'std_id', 'month', 'transaction_date', 'total_amount', 'total_discount'], 'required'],
            [['std_class_id', 'std_id', 'created_by', 'updated_by'], 'integer'],
            [['month', 'status'], 'string'],
            [['transaction_date', 'created_at', 'updated_at', 'paid_amount', 'remaining', 'status', 'created_by', 'updated_by'], 'safe'],
            [['total_amount', 'total_discount', 'paid_amount', 'remaining'], 'number'],
            [['std_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['std_id' => 'std_id']],
            [['std_class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClass::className(), 'targetAttribute' => ['std_class_id' => 'class_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'fee_trans_id' => 'Fee Trans ID',
            'std_class_id' => 'Std Class ID',
            'std_id' => 'Std ID',
            'month' => 'Month',
            'transaction_date' => 'Transaction Date',
            'total_amount' => 'Total Amount',
            'total_discount' => 'Total Discount',
            'paid_amount' => 'Paid Amount',
            'remaining' => 'Remaining',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFeeTransactionDetails()
    {
        return $this->hasMany(FeeTransactionDetail::className(), ['fee_trans_detail_head_id' => 'fee_trans_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStd()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdClass()
    {
        return $this->hasOne(StdClass::className(), ['class_id' => 'std_class_id']);
    }
}
