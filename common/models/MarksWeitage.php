<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "marks_weitage".
 *
 * @property int $marks_weitage_id
 * @property int $exam_category_id
 * @property int $subject_id
 * @property int $presentation
 * @property int $assignment
 * @property int $attendance
 * @property int $dressing
 * @property int $theory
 * @property int $practical
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property Subjects $subject
 * @property ExamsCategory $examCategory
 */
class MarksWeitage extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'marks_weitage';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['exam_category_id', 'subject_id', 'presentation', 'assignment', 'attendance', 'dressing', 'theory'], 'required'],
            [['exam_category_id', 'subject_id', 'theory', 'practical', 'created_by', 'updated_by'], 'integer'],
            [['presentation', 'assignment', 'attendance', 'dressing'],'number'],
            [['created_at', 'updated_at', 'created_by', 'updated_by', 'practical'], 'safe'],
            [['subject_id'], 'exist', 'skipOnError' => true, 'targetClass' => Subjects::className(), 'targetAttribute' => ['subject_id' => 'subject_id']],
            [['exam_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ExamsCategory::className(), 'targetAttribute' => ['exam_category_id' => 'exam_category_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'marks_weitage_id' => 'Marks Weitage ID',
            'exam_category_id' => 'Exam Category',
            'subject_id' => 'Subject',
            'presentation' => 'Presentation',
            'assignment' => 'Assignment',
            'attendance' => 'Attendance',
            'dressing' => 'Dressing',
            'theory' => 'Theory',
            'practical' => 'Practical',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubject()
    {
        return $this->hasOne(Subjects::className(), ['subject_id' => 'subject_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExamCategory()
    {
        return $this->hasOne(ExamsCategory::className(), ['exam_category_id' => 'exam_category_id']);
    }
}
