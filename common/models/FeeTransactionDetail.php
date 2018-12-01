<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "fee_transaction_detail".
 *
 * @property integer $fee_trans_detail_id
 * @property integer $fee_trans_detail_head_id
 * @property integer $fee_type_id
 * @property double $fee_amount
 * @property string $fee_discount
 * @property double $discounted_value
 * @property double $net_total
 * @property double $paid_amount
 * @property double $remaining
 * @property string $status
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property FeeTransactionHead $feeTransDetailHead
 * @property FeeType $feeType
 */
class FeeTransactionDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'fee_transaction_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fee_trans_detail_head_id'], 'required'],
            [['fee_trans_detail_head_id', 'fee_type_id', 'created_by', 'updated_by'], 'integer'],
            [['fee_amount', 'discounted_value', 'net_total','paid_amount', 'remaining'], 'number'],
            [['status'], 'string'],
            [['fee_type_id', 'fee_amount', 'net_total', 'paid_amount', 'remaining', 'status','created_at', 'updated_at', 'created_by', 'updated_by','fee_discount', 'discounted_value'], 'safe'],
            [['fee_trans_detail_head_id'], 'exist', 'skipOnError' => true, 'targetClass' => FeeTransactionHead::className(), 'targetAttribute' => ['fee_trans_detail_head_id' => 'fee_trans_id']],
            [['fee_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => FeeType::className(), 'targetAttribute' => ['fee_type_id' => 'fee_type_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'fee_trans_detail_id' => 'Fee Trans Detail ID',
            'fee_trans_detail_head_id' => 'Fee Trans Detail Head ID',
            'fee_type_id' => 'Fee Type ID',
            'fee_amount' => 'Fee Amount',
            'fee_discount' => 'Fee Discount',
            'discounted_value' => 'Discounted Value',
            'net_total' => 'Net Total',
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
    public function getFeeTransDetailHead()
    {
        return $this->hasOne(FeeTransactionHead::className(), ['fee_trans_id' => 'fee_trans_detail_head_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFeeType()
    {
        return $this->hasOne(FeeType::className(), ['fee_type_id' => 'fee_type_id']);
    }
}
