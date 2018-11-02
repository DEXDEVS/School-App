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
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property FeeTransactionDetail[] $feeTransactionDetails
 * @property StdClass $stdClass
 * @property StdPersonalInfo $std
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
            [['std_class_id', 'std_id', 'month', 'transaction_date', 'total_amount', 'total_discount', 'created_by', 'updated_by'], 'required'],
            [['std_class_id', 'std_id', 'created_by', 'updated_by'], 'integer'],
            [['month'], 'string'],
            [['transaction_date', 'created_at', 'updated_at'], 'safe'],
            [['total_amount', 'total_discount'], 'number'],
            [['std_class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClass::className(), 'targetAttribute' => ['std_class_id' => 'class_id']],
            [['std_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['std_id' => 'std_id']],
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
    public function getStdClass()
    {
        return $this->hasOne(StdClass::className(), ['class_id' => 'std_class_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStd()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'std_id']);
    }
}
