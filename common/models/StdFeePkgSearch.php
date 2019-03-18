<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StdFeePkg;

/**
 * StdFeePkgSearch represents the model behind the search form about `common\models\StdFeePkg`.
 */
class StdFeePkgSearch extends StdFeePkg
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_fee_id', 'class_id', 'created_by', 'updated_by'], 'integer'],
            [['session_name', 'created_at', 'updated_at', 'delete_status'], 'safe'],
            [['admission_fee', 'tutuion_fee'], 'number'],
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
        $query = StdFeePkg::find();

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
            'std_fee_id' => $this->std_fee_id,
            'class_id' => $this->class_id,
            'admission_fee' => $this->admission_fee,
            'tutuion_fee' => $this->tutuion_fee,
            'created_at' => $this->created_at,
            'created_by' => $this->created_by,
            'updated_at' => $this->updated_at,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'session_name', $this->session_name])
            ->andFilterWhere(['like', 'delete_status', $this->delete_status]);

        return $dataProvider;
    }
}
