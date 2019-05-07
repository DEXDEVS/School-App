<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "time_table_head".
 *
 * @property int $time_table_h_id
 * @property int $class_id
 * @property string $days
 * @property int $created_by
 * @property int $updated_by
 * @property string $created_at
 * @property string $updated_at
 *
 * @property TimeTableDetail[] $timeTableDetails
 * @property StdClassName $class
 */
class TimeTableHead extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'time_table_head';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['class_id', 'days'], 'required'],
            [['class_id', 'created_by', 'updated_by'], 'integer'],
            [['days'], 'string', 'max' => 200],
            [['created_at', 'updated_at', 'created_by', 'updated_by'], 'safe'],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClassName::className(), 'targetAttribute' => ['class_id' => 'class_name_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'time_table_h_id' => 'Time Table H ID',
            'class_id' => 'Class Name',
            'days' => 'Days',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTimeTableDetails()
    {
        return $this->hasMany(TimeTableDetail::className(), ['time_table_h_id' => 'time_table_h_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdClassName::className(), ['class_name_id' => 'class_id']);
    }
}
