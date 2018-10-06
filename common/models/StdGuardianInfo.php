<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_guardian_info".
 *
 * @property int $std_guardian_info_d
 * @property int $std_id
 * @property string $father_name
 * @property string $father_cnic
 * @property string $father_email
 * @property string $guardian_contact_no_1
 * @property string $guardian_contact_no_2
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property StdPersonalInfo $std
 */
class StdGuardianInfo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_guardian_info';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['std_id', 'father_name', 'father_cnic', 'father_email', 'guardian_contact_no_1', 'guardian_contact_no_2', 'created_by', 'updated_by'], 'required'],
            [['std_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['father_name'], 'string', 'max' => 50],
            [['father_cnic', 'guardian_contact_no_1', 'guardian_contact_no_2'], 'string', 'max' => 15],
            [['father_email'], 'string', 'max' => 84],
            [['std_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['std_id' => 'std_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_guardian_info_d' => 'Std Guardian Info D',
            'std_id' => 'Std ID',
            'father_name' => 'Father Name',
            'father_cnic' => 'Father Cnic',
            'father_email' => 'Father Email',
            'guardian_contact_no_1' => 'Guardian Contact No 1',
            'guardian_contact_no_2' => 'Guardian Contact No 2',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStd()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'std_id']);
    }
}
