<?php 
	//if(isset($_POST['class_id'])){
		//$class_id = $_POST['class_id'];
		$class_id = 1;
		$classNameId = Yii::$app->db->createCommand("SELECT class_name_id FROM std_enrollment_head WHERE std_enroll_head_id = '$class_id'")->queryAll();
		$class_name_id = $classNameId[0]['class_name_id'];

		$subjectsComb = Yii::$app->db->createCommand("SELECT std_subject_name FROM std_subjects WHERE class_id = '$class_name_id'")->queryAll();
		$subjectsArray = explode(',', $subjectsComb[0]['std_subject_name']);
		$subjectIdArray[]
		foreach ($subjectsArray as $key => $value) {
			$subjectId = Yii::$app->db->createCommand("SELECT subject_id FROM subjects WHERE subject_name = '$value'")->queryAll();
			$subjectIdArray = $subjectId;
		}
		print_r($subjectIdArray);

//} 
?>