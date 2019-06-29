<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StdClassName;

/**
 * StdClassNameSearch represents the model behind the search form about `common\models\StdClassName`.
 */
class StdClassNameSearch extends StdClassName
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['class_name_id', 'created_by', 'updated_by'], 'integer'],
            [['class_name', 'branch_id', 'class_name_description', 'status', 'class_type', 'created_at', 'updated_at'], 'safe'],
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
        if(Yii::$app->user->identity->user_type == 'Superadmin'){
            $query = StdClassName::find();

            $dataProvider = new ActiveDataProvider([
                'query' => $query,
            ]);

            $this->load($params);

            if (!$this->validate()) {
                // uncomment the following line if you do not want to return any records when validation fails
                // $query->where('0=1');
                return $dataProvider;
            }
            $query->joinWith('branch');
            $query->andFilterWhere([
                'class_name_id' => $this->class_name_id,
                //'branch_id' => $this->branch_id,
                'created_at' => $this->created_at,
                'updated_at' => $this->updated_at,
                'created_by' => $this->created_by,
                'updated_by' => $this->updated_by,
            ]);

            $query->andFilterWhere(['like', 'class_name', $this->class_name])
                ->andFilterWhere(['like', 'class_name_description', $this->class_name_description])
                ->andFilterWhere(['like', 'std_class_name.status', $this->status])
                ->andFilterWhere(['like', 'class_type', $this->class_type])
                ->andFilterWhere(['like', 'branches.branch_name', $this->branch_id]);

            return $dataProvider;
        } else {
            $branch_id = Yii::$app->user->identity->branch_id;
            $query = StdClassName::find()->innerJoinWith('branch')->where(['branches.branch_id'=> $branch_id]);

            $dataProvider = new ActiveDataProvider([
                'query' => $query,
            ]);

            $this->load($params);

            if (!$this->validate()) {
                // uncomment the following line if you do not want to return any records when validation fails
                // $query->where('0=1');
                return $dataProvider;
            }
            // $query->joinWith('branch');
            $query->andFilterWhere([
                'class_name_id' => $this->class_name_id,
                //'branch_id' => $this->branch_id,
                'created_at' => $this->created_at,
                'updated_at' => $this->updated_at,
                'created_by' => $this->created_by,
                'updated_by' => $this->updated_by,
            ]);

            $query->andFilterWhere(['like', 'class_name', $this->class_name])
                ->andFilterWhere(['like', 'class_name_description', $this->class_name_description])
                ->andFilterWhere(['like', 'std_class_name.status', $this->status])
                ->andFilterWhere(['like', 'class_type', $this->class_type])
                ->andFilterWhere(['like', 'branches.branch_name', $this->branch_id]);

            return $dataProvider;
        }
    }
}
