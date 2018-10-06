<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_enrollment_head".
 *
 * @property int $std_enroll_head_id
 * @property int $class_id
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property StdEnrollmentDetail[] $stdEnrollmentDetails
 * @property StdClasses $class
 */
class StdEnrollmentHead extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_enrollment_head';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['class_id', 'created_by', 'updated_by'], 'required'],
            [['class_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClasses::className(), 'targetAttribute' => ['class_id' => 'class_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_enroll_head_id' => 'Std Enroll Head ID',
            'class_id' => 'Class ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdEnrollmentDetails()
    {
        return $this->hasMany(StdEnrollmentDetail::className(), ['std_enroll_detail_head_id' => 'std_enroll_head_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdClasses::className(), ['class_id' => 'class_id']);
    }
}
