<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_attendance".
 *
 * @property integer $std_attend_id
 * @property integer $teacher_id
 * @property integer $class_id
 * @property string $date
 * @property integer $student_id
 * @property string $status
 *
 * @property EmpInfo $teacher
 * @property StdClass $class
 * @property StdPersonalInfo $student
 */
class StdAttendance extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'std_attendance';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['teacher_id', 'class_id', 'date', 'student_id', 'status'], 'required'],
            [['teacher_id', 'class_id', 'student_id'], 'integer'],
            [['date'], 'safe'],
            [['status'], 'string', 'max' => 1],
            [['teacher_id'], 'exist', 'skipOnError' => true, 'targetClass' => EmpInfo::className(), 'targetAttribute' => ['teacher_id' => 'emp_id']],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClass::className(), 'targetAttribute' => ['class_id' => 'class_id']],
            [['student_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['student_id' => 'std_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'std_attend_id' => 'Std Attend ID',
            'teacher_id' => 'Teacher ID',
            'class_id' => 'Class ID',
            'date' => 'Date',
            'student_id' => 'Student ID',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacher()
    {
        return $this->hasOne(EmpInfo::className(), ['emp_id' => 'teacher_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdClass::className(), ['class_id' => 'class_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudent()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'student_id']);
    }
}
