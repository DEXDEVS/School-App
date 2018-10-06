<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StdFeeDetails;

/**
 * StdFeeDetailsSearch represents the model behind the search form about `common\models\StdFeeDetails`.
 */
class StdFeeDetailsSearch extends StdFeeDetails
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_fee_id', 'std_id', 'created_by', 'updated_by'], 'integer'],
            [['date', 'total_fee', 'created_at', 'updated_at'], 'safe'],
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
        $query = StdFeeDetails::find();

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
            'std_id' => $this->std_id,
            'date' => $this->date,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'total_fee', $this->total_fee]);

        return $dataProvider;
    }
}
