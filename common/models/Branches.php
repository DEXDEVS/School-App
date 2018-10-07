<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "branches".
 *
 * @property integer $branch_id
 * @property string $branch_code
 * @property string $branch_name
 * @property string $branch_location
 * @property string $branch_contact_no
 * @property string $branch_email
 * @property string $status
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 *
 * @property StdSessions[] $stdSessions
 */
class Branches extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'branches';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['branch_code', 'branch_name', 'branch_location', 'branch_contact_no', 'branch_email', 'status', 'created_by', 'updated_by'], 'required'],
            [['status'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['created_by', 'updated_by'], 'integer'],
            [['branch_code', 'branch_name', 'branch_contact_no'], 'string', 'max' => 32],
            [['branch_location'], 'string', 'max' => 50],
            [['branch_email'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'branch_id' => 'Branch ID',
            'branch_code' => 'Branch Code',
            'branch_name' => 'Branch Name',
            'branch_location' => 'Branch Location',
            'branch_contact_no' => 'Branch Contact No',
            'branch_email' => 'Branch Email',
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
    public function getStdSessions()
    {
        return $this->hasMany(StdSessions::className(), ['session_branch_id' => 'branch_id']);
    }
}
