<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\TeacherAcademics;

/**
 * TeacherAcademicsSearch represents the model behind the search form about `common\models\TeacherAcademics`.
 */
class TeacherAcademicsSearch extends TeacherAcademics
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['teacher_academic_id', 'teacher_id', 'created_by', 'updated_by'], 'integer'],
            [['qualification', 'passing_year', 'Institute', 'created_at', 'updated_at'], 'safe'],
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
        $query = TeacherAcademics::find();

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
            'teacher_academic_id' => $this->teacher_academic_id,
            'teacher_id' => $this->teacher_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'qualification', $this->qualification])
            ->andFilterWhere(['like', 'passing_year', $this->passing_year])
            ->andFilterWhere(['like', 'Institute', $this->Institute]);

        return $dataProvider;
    }
}
