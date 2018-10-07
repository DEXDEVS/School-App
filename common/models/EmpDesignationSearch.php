<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\EmpDesignation;

/**
 * EmpDesignationSearch represents the model behind the search form about `common\models\EmpDesignation`.
 */
class EmpDesignationSearch extends EmpDesignation
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['emp_designation_id', 'emp_id'], 'integer'],
            [['emp_designation', 'emp_designation_type'], 'safe'],
            [['emp_salary'], 'number'],
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
        $query = EmpDesignation::find();

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
            'emp_designation_id' => $this->emp_designation_id,
            'emp_id' => $this->emp_id,
            'emp_salary' => $this->emp_salary,
        ]);

        $query->andFilterWhere(['like', 'emp_designation', $this->emp_designation])
            ->andFilterWhere(['like', 'emp_designation_type', $this->emp_designation_type]);

        return $dataProvider;
    }
}
