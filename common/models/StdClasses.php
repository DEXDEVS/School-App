<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_classes".
 *
 * @property int $class_id
 * @property int $class_name_id
 * @property int $session_id
 * @property int $section_id
 * @property int $timing_id
 * @property string $class_description
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property ClassName $className
 * @property Sections $section
 * @property Sessions $session
 * @property Timings $timing
 * @property StdEnrollmentHead[] $stdEnrollmentHeads
 * @property TeacherSubjectAssignDetail[] $teacherSubjectAssignDetails
 */
class StdClasses extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_classes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['class_name_id', 'session_id', 'section_id', 'timing_id', 'class_description', 'created_by', 'updated_by'], 'required'],
            [['class_name_id', 'session_id', 'section_id', 'timing_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['class_description'], 'string', 'max' => 255],
            [['class_name_id'], 'exist', 'skipOnError' => true, 'targetClass' => ClassName::className(), 'targetAttribute' => ['class_name_id' => 'class_name_id']],
            [['section_id'], 'exist', 'skipOnError' => true, 'targetClass' => Sections::className(), 'targetAttribute' => ['section_id' => 'section_id']],
            [['session_id'], 'exist', 'skipOnError' => true, 'targetClass' => Sessions::className(), 'targetAttribute' => ['session_id' => 'session_id']],
            [['timing_id'], 'exist', 'skipOnError' => true, 'targetClass' => Timings::className(), 'targetAttribute' => ['timing_id' => 'timing_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'class_id' => 'Class ID',
            'class_name_id' => 'Class Name ID',
            'session_id' => 'Session ID',
            'section_id' => 'Section ID',
            'timing_id' => 'Timing ID',
            'class_description' => 'Class Description',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClassName()
    {
        return $this->hasOne(ClassName::className(), ['class_name_id' => 'class_name_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSection()
    {
        return $this->hasOne(Sections::className(), ['section_id' => 'section_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSession()
    {
        return $this->hasOne(Sessions::className(), ['session_id' => 'session_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTiming()
    {
        return $this->hasOne(Timings::className(), ['timing_id' => 'timing_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdEnrollmentHeads()
    {
        return $this->hasMany(StdEnrollmentHead::className(), ['class_id' => 'class_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacherSubjectAssignDetails()
    {
        return $this->hasMany(TeacherSubjectAssignDetail::className(), ['class_id' => 'class_id']);
    }
}
