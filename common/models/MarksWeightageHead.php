<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "marks_weightage_head".
 *
 * @property int $marks_weightage_id
 * @property int $exam_category_id
 * @property int $class_id
 * @property int $subjects_id
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property MarksWeightageDetails[] $marksWeightageDetails
 * @property ExamsCategory $examCategory
 * @property StdEnrollmentHead $class
 * @property Subjects $subjects
 */
class MarksWeightageHead extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'marks_weightage_head';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['exam_category_id', 'class_id', 'subjects_id', 'created_by', 'updated_by'], 'required'],
            [['exam_category_id', 'class_id', 'subjects_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['exam_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ExamsCategory::className(), 'targetAttribute' => ['exam_category_id' => 'exam_category_id']],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdEnrollmentHead::className(), 'targetAttribute' => ['class_id' => 'std_enroll_head_id']],
            [['subjects_id'], 'exist', 'skipOnError' => true, 'targetClass' => Subjects::className(), 'targetAttribute' => ['subjects_id' => 'subject_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'marks_weightage_id' => 'Marks Weightage ID',
            'exam_category_id' => 'Exam Category',
            'class_id' => 'Class Name',
            'subjects_id' => 'Subjects Name',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMarksWeightageDetails()
    {
        return $this->hasMany(MarksWeightageDetails::className(), ['weightage_head_id' => 'marks_weightage_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExamCategory()
    {
        return $this->hasOne(ExamsCategory::className(), ['exam_category_id' => 'exam_category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdEnrollmentHead::className(), ['std_enroll_head_id' => 'class_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubjects()
    {
        return $this->hasOne(Subjects::className(), ['subject_id' => 'subjects_id']);
    }
}
