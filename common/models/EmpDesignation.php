<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "emp_designation".
 *
 * @property integer $emp_designation_id
 * @property integer $emp_id
 * @property string $emp_name
 * @property string $emp_designation
 * @property string $emp_designation_type
 * @property double $emp_salary
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property EmpInfo $emp
 */
class EmpDesignation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'emp_designation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emp_id', 'emp_designation', 'emp_designation_type', 'emp_salary'], 'required'],
            [['emp_id', 'created_by', 'updated_by'], 'integer'],
            [['emp_designation_type'], 'string'],
            [['emp_salary'], 'number'],
            [['created_at', 'updated_at','created_by', 'updated_by'], 'safe'],
            [['emp_name'], 'string', 'max' => 200],
            [['emp_designation'], 'string', 'max' => 100],
            [['emp_id'], 'exist', 'skipOnError' => true, 'targetClass' => EmpInfo::className(), 'targetAttribute' => ['emp_id' => 'emp_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'emp_designation_id' => 'Emp Designation ID',
            'emp_id' => 'Emp ID',
            'emp_name' => 'Emp Name',
            'emp_designation' => 'Emp Designation',
            'emp_designation_type' => 'Emp Designation Type',
            'emp_salary' => 'Emp Salary',
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
