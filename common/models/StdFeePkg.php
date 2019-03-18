<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_fee_pkg".
 *
 * @property int $std_fee_id
 * @property string $session_name
 * @property int $class_id
 * @property double $admission_fee
 * @property double $tutuion_fee
 * @property string $created_at
 * @property int $created_by
 * @property string $updated_at
 * @property int $updated_by
 * @property int $delete_status
 *
 * @property StdClassName $class
 */
class StdFeePkg extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_fee_pkg';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['session_name', 'class_id', 'admission_fee', 'created_by', 'updated_by'], 'required'],
            [['class_id', 'created_by', 'updated_by', 'delete_status'], 'integer'],
            [['admission_fee', 'tutuion_fee'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['session_name'], 'string', 'max' => 20],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClassName::className(), 'targetAttribute' => ['class_id' => 'class_name_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_fee_id' => 'Std Fee ID',
            'session_name' => 'Session Name',
            'class_id' => 'Class ID',
            'admission_fee' => 'Admission Fee',
            'tutuion_fee' => 'Tutuion Fee',
            'created_at' => 'Created At',
            'created_by' => 'Created By',
            'updated_at' => 'Updated At',
            'updated_by' => 'Updated By',
            'delete_status' => 'Delete Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdClassName::className(), ['class_name_id' => 'class_id']);
    }
}
