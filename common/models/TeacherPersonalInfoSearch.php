<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\TeacherPersonalInfo;

/**
 * TeacherPersonalInfoSearch represents the model behind the search form about `common\models\TeacherPersonalInfo`.
 */
class TeacherPersonalInfoSearch extends TeacherPersonalInfo
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['teacher_id', 'created_by', 'updated_by'], 'integer'],
            [['teacher_name', 'father_name', 'teacher_cnic', 'teacher_contact_no', 'teacher_address', 'teacher_marital_status', 'teacher_gender', 'teacher_email', 'created_at', 'updated_at'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = TeacherPersonalInfo::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'teacher_id' => $this->teacher_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'teacher_name', $this->teacher_name])
            ->andFilterWhere(['like', 'father_name', $this->father_name])
            ->andFilterWhere(['like', 'teacher_cnic', $this->teacher_cnic])
            ->andFilterWhere(['like', 'teacher_contact_no', $this->teacher_contact_no])
            ->andFilterWhere(['like', 'teacher_address', $this->teacher_address])
            ->andFilterWhere(['like', 'teacher_marital_status', $this->teacher_marital_status])
            ->andFilterWhere(['like', 'teacher_gender', $this->teacher_gender])
            ->andFilterWhere(['like', 'teacher_email', $this->teacher_email]);

        return $dataProvider;
    }
}
