<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "teacher_personal_info".
 *
 * @property int $teacher_id
 * @property string $teacher_name
 * @property string $father_name
 * @property string $teacher_cnic
 * @property string $teacher_contact_no
 * @property string $teacher_address
 * @property string $teacher_marital_status
 * @property string $teacher_gender
 * @property string $teacher_email
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property TeacherAcademics[] $teacherAcademics
 * @property TeacherSubjectAssignHead[] $teacherSubjectAssignHeads
 */
class TeacherPersonalInfo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'teacher_personal_info';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['teacher_name', 'father_name', 'teacher_cnic', 'teacher_contact_no', 'teacher_address', 'teacher_marital_status', 'teacher_gender', 'teacher_email', 'created_by', 'updated_by'], 'required'],
            [['teacher_gender'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['created_by', 'updated_by'], 'integer'],
            [['teacher_name', 'father_name', 'teacher_marital_status'], 'string', 'max' => 50],
            [['teacher_cnic', 'teacher_contact_no'], 'string', 'max' => 15],
            [['teacher_address'], 'string', 'max' => 64],
            [['teacher_email'], 'string', 'max' => 84],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'teacher_id' => 'Teacher ID',
            'teacher_name' => 'Teacher Name',
            'father_name' => 'Father Name',
            'teacher_cnic' => 'Teacher Cnic',
            'teacher_contact_no' => 'Teacher Contact No',
            'teacher_address' => 'Teacher Address',
            'teacher_marital_status' => 'Teacher Marital Status',
            'teacher_gender' => 'Teacher Gender',
            'teacher_email' => 'Teacher Email',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacherAcademics()
    {
        return $this->hasMany(TeacherAcademics::className(), ['teacher_id' => 'teacher_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacherSubjectAssignHeads()
    {
        return $this->hasMany(TeacherSubjectAssignHead::className(), ['teacher_id' => 'teacher_id']);
    }
}
