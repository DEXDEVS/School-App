<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\EmpAttendance;

/**
 * EmpAttendanceSearch represents the model behind the search form about `common\models\EmpAttendance`.
 */
class EmpAttendanceSearch extends EmpAttendance
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['att_id', 'emp_id', 'created_by', 'updated_by'], 'integer'],
            [['att_date', 'check_in', 'check_out', 'attendance', 'created_at', 'updated_at'], 'safe'],
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
        $query = EmpAttendance::find();

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
            'att_id' => $this->att_id,
            'emp_id' => $this->emp_id,
            'att_date' => $this->att_date,
            'check_in' => $this->check_in,
            'check_out' => $this->check_out,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'attendance', $this->attendance]);

        return $dataProvider;
    }
}
