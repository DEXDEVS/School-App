<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "teacher_academics".
 *
 * @property int $teacher_academic_id
 * @property int $teacher_id
 * @property string $qualification
 * @property string $passing_year
 * @property string $Institute
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property TeacherPersonalInfo $teacher
 */
class TeacherAcademics extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'teacher_academics';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['teacher_id', 'qualification', 'passing_year', 'Institute'], 'required'],
            [['teacher_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at', 'created_by', 'updated_by'], 'safe'],
            [['qualification', 'passing_year'], 'string', 'max' => 32],
            [['Institute'], 'string', 'max' => 50],
            [['teacher_id'], 'exist', 'skipOnError' => true, 'targetClass' => TeacherPersonalInfo::className(), 'targetAttribute' => ['teacher_id' => 'teacher_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'teacher_academic_id' => 'Teacher Academic ID',
            'teacher_id' => 'Teacher ID',
            'qualification' => 'Qualification',
            'passing_year' => 'Passing Year',
            'Institute' => 'Institute',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacher()
    {
        return $this->hasOne(TeacherPersonalInfo::className(), ['teacher_id' => 'teacher_id']);
    }
}
