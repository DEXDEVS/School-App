<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "teacher_subject_assign_head".
 *
 * @property int $teacher_subject_assign_head_id
 * @property int $teacher_id
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property TeacherSubjectAssignDetail[] $teacherSubjectAssignDetails
 * @property TeacherPersonalInfo $teacher
 */
class TeacherSubjectAssignHead extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'teacher_subject_assign_head';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['teacher_id', 'created_by', 'updated_by'], 'required'],
            [['teacher_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['teacher_id'], 'exist', 'skipOnError' => true, 'targetClass' => TeacherPersonalInfo::className(), 'targetAttribute' => ['teacher_id' => 'teacher_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'teacher_subject_assign_head_id' => 'Teacher Subject Assign Head ID',
            'teacher_id' => 'Teacher ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacherSubjectAssignDetails()
    {
        return $this->hasMany(TeacherSubjectAssignDetail::className(), ['teacher_subject_assign_detail_head_id' => 'teacher_subject_assign_head_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacher()
    {
        return $this->hasOne(TeacherPersonalInfo::className(), ['teacher_id' => 'teacher_id']);
    }
}
