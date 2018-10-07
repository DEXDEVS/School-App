<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "emp_info".
 *
 * @property integer $emp_id
 * @property string $emp_name
 * @property string $emp_father_name
 * @property string $emp_cnic
 * @property string $emp_contact_no
 * @property string $emp_address
 * @property string $emp_marital_status
 * @property string $emp_gender
 * @property string $emp_email
 * @property string $emp_qualification
 * @property integer $emp_passing_year
 * @property string $emp_institute_name
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property EmpDesignation[] $empDesignations
 * @property TeacherSubjectAssignHead[] $teacherSubjectAssignHeads
 */
class EmpInfo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'emp_info';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emp_name', 'emp_father_name', 'emp_cnic', 'emp_contact_no', 'emp_address', 'emp_marital_status', 'emp_gender', 'emp_email', 'emp_qualification', 'emp_passing_year', 'emp_institute_name'], 'required'],
            [['emp_gender'], 'string'],
            [['emp_passing_year', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at', 'created_by', 'updated_by'], 'safe'],
            [['emp_name', 'emp_father_name', 'emp_marital_status', 'emp_qualification', 'emp_institute_name'], 'string', 'max' => 50],
            [['emp_cnic', 'emp_contact_no'], 'string', 'max' => 15],
            [['emp_address'], 'string', 'max' => 64],
            [['emp_email'], 'string', 'max' => 84],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'emp_id' => 'Emp ID',
            'emp_name' => 'Emp Name',
            'emp_father_name' => 'Emp Father Name',
            'emp_cnic' => 'Emp Cnic',
            'emp_contact_no' => 'Emp Contact No',
            'emp_address' => 'Emp Address',
            'emp_marital_status' => 'Emp Marital Status',
            'emp_gender' => 'Emp Gender',
            'emp_email' => 'Emp Email',
            'emp_qualification' => 'Emp Qualification',
            'emp_passing_year' => 'Emp Passing Year',
            'emp_institute_name' => 'Emp Institute Name',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmpDesignations()
    {
        return $this->hasMany(EmpDesignation::className(), ['emp_id' => 'emp_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeacherSubjectAssignHeads()
    {
        return $this->hasMany(TeacherSubjectAssignHead::className(), ['teacher_id' => 'emp_id']);
    }
}
