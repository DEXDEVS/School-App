<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "emp_leave".
 *
 * @property int $app_id
 * @property int $emp_id
 * @property string $leave_type
 * @property string $starting_date
 * @property string $ending_date
 * @property string $applying_date
 * @property int $no_of_days
 * @property string $leave_purpose
 * @property string $status
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property EmpInfo $emp
 */
class EmpLeave extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'emp_leave';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['emp_id', 'leave_type', 'starting_date', 'ending_date', 'applying_date', 'no_of_days', 'leave_purpose', 'status', 'created_by', 'updated_by'], 'required'],
            [['emp_id', 'no_of_days', 'created_by', 'updated_by'], 'integer'],
            [['starting_date', 'ending_date', 'applying_date', 'created_at', 'updated_at'], 'safe'],
            [['leave_type'], 'string', 'max' => 50],
            [['leave_purpose'], 'string', 'max' => 100],
            [['status'], 'string', 'max' => 20],
            [['emp_id'], 'exist', 'skipOnError' => true, 'targetClass' => EmpInfo::className(), 'targetAttribute' => ['emp_id' => 'emp_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'app_id' => 'App ID',
            'emp_id' => 'Emp ID',
            'leave_type' => 'Leave Type',
            'starting_date' => 'Starting Date',
            'ending_date' => 'Ending Date',
            'applying_date' => 'Applying Date',
            'no_of_days' => 'No Of Days',
            'leave_purpose' => 'Leave Purpose',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmp()
    {
        return $this->hasOne(EmpInfo::className(), ['emp_id' => 'emp_id']);
    }
}
