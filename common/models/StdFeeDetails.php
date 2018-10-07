<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_fee_details".
 *
 * @property integer $std_fee_id
 * @property integer $std_id
 * @property string $date
 * @property string $total_fee
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property StdPersonalInfo $std
 */
class StdFeeDetails extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'std_fee_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_id', 'date', 'total_fee', 'created_by', 'updated_by'], 'required'],
            [['std_id', 'created_by', 'updated_by'], 'integer'],
            [['date', 'created_at', 'updated_at'], 'safe'],
            [['total_fee'], 'string', 'max' => 50],
            [['std_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['std_id' => 'std_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'std_fee_id' => 'Std Fee ID',
            'std_id' => 'Std ID',
            'date' => 'Date',
            'total_fee' => 'Total Fee',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStd()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'std_id']);
    }
}
