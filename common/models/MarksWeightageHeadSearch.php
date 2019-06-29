<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\MarksWeightageHead;

/**
 * MarksWeightageHeadSearch represents the model behind the search form about `common\models\MarksWeightageHead`.
 */
class MarksWeightageHeadSearch extends MarksWeightageHead
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['marks_weightage_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'exam_category_id', 'class_id', 'subjects_id', 'updated_at'], 'safe'],
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
        $query = MarksWeightageHead::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        $query->joinWith('examCategory');
        $query->joinWith('class');
        $query->joinWith('subjects');
        $query->andFilterWhere([
            'marks_weightage_id' => $this->marks_weightage_id,
            // 'exam_category_id' => $this->exam_category_id,
            // 'class_id' => $this->class_id,
            // 'subjects_id' => $this->subjects_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'exams_category.category_name', $this->exam_category_id])
            ->andFilterWhere(['like', 'std_class_name.class_name', $this->class_id])
            ->andFilterWhere(['like', 'subjects.subject_name', $this->subjects_id]);

        return $dataProvider;
    }
}
