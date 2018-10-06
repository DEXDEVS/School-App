<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StdGuardianInfo;

/**
 * StdGuardianInfoSearch represents the model behind the search form about `common\models\StdGuardianInfo`.
 */
class StdGuardianInfoSearch extends StdGuardianInfo
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_guardian_info_d', 'std_id', 'created_by', 'updated_by'], 'integer'],
            [['father_name', 'father_cnic', 'father_email', 'guardian_contact_no_1', 'guardian_contact_no_2', 'created_at', 'updated_at'], 'safe'],
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
        $query = StdGuardianInfo::find();

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
            'std_guardian_info_d' => $this->std_guardian_info_d,
            'std_id' => $this->std_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'father_name', $this->father_name])
            ->andFilterWhere(['like', 'father_cnic', $this->father_cnic])
            ->andFilterWhere(['like', 'father_email', $this->father_email])
            ->andFilterWhere(['like', 'guardian_contact_no_1', $this->guardian_contact_no_1])
            ->andFilterWhere(['like', 'guardian_contact_no_2', $this->guardian_contact_no_2]);

        return $dataProvider;
    }
}
