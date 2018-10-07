<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "emp_designation".
 *
 * @property integer $emp_designation_id
 * @property integer $emp_id
 * @property string $emp_designation
 * @property string $emp_designation_type
 * @property double $emp_salary
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
            [['emp_id'], 'integer'],
            [['emp_designation_type'], 'string'],
            [['emp_salary'], 'number'],
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
            'emp_designation' => 'Emp Designation',
            'emp_designation_type' => 'Emp Designation Type',
            'emp_salary' => 'Emp Salary',
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
