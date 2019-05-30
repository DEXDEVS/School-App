 <?php 
	if(isset($_POST['save']))
	{
		// getting exam criteria fields
		$exam_category 		= $_POST["exam_category"];
		$classId 			= $_POST["classId"];
		$exam_start_date 	= $_POST["exam_start_date"];
		$exam_end_date 		= $_POST["exam_end_date"];
		$exam_type			= $_POST["exam_type"];
		// getting exam schedule fields
		$subarray 			= $_POST["subarray"];
		$date 				= $_POST["date"];
		$Invagilator 		= $_POST["Invagilator"];
		$fullmarks 			= $_POST["fullmarks"];
		$passingmarks 		= $_POST["passingmarks"];
		$subjCount 			= $_POST["subjCount"];
		$exam_start_time 	= $_POST["exam_start_time"];
		$exam_end_time 		= $_POST["exam_end_time"]; 
		
	$transection = Yii::$app->db->beginTransaction();
	try{
		$inactive = "Inactive";
		$examCriteria = Yii::$app->db->createCommand()->insert('exams_criteria',[
    			'exam_category_id' 		=> $exam_category,
				'class_id' 				=> $classId ,
				'exam_start_date' 		=> $exam_start_date,
				'exam_end_date'			=> $exam_end_date ,
				'exam_status'			=> $inactive,
				'exam_type'				=> $exam_type,
				'created_at'			=> new \yii\db\Expression('NOW()'),
				'created_by'			=> Yii::$app->user->identity->id, 
			])->execute();
		if ($examCriteria) {
			$examCriteriaId = Yii::$app->db->createCommand("SELECT exam_criteria_id
			FROM  exams_criteria
			WHERE exam_category_id 		= '$exam_category' AND
				  class_id 				= '$classId' AND
				  exam_start_date 		= '$exam_start_date' AND
				  exam_end_date 		= '$exam_end_date'
			")->queryAll();

			$criteriaId = $examCriteriaId[0]['exam_criteria_id'];
			
		for ($i=0; $i <$subjCount ; $i++) { 
			$examSchedule = Yii::$app->db->createCommand()->insert('exams_schedule',[
            			'exam_criteria_id' 	=> $criteriaId,
						'subject_id' 		=> $subarray[$i],
						'emp_id' 			=> $Invagilator[$i],
						'date'				=> $date[$i],
						'exam_start_time'	=> $exam_start_time[$i],
						'exam_end_time'		=> $exam_end_time[$i],
						'full_marks'		=> $fullmarks[$i],
						'passing_marks'		=> $passingmarks[$i],
						'status'			=> "not",
						'created_at'		=> new \yii\db\Expression('NOW()'),
						'created_by'		=> Yii::$app->user->identity->id, 
					])->execute();
				
			} // closing of for loop

			if($examSchedule){
				$transection->commit();
				Yii::$app->session->setFlash('success', "Exams Schedule managed successfully...!");
			}
		} // closing of exam criteria
	//closing of try block
	} catch(Exception $e){
		$transection->rollback();
		echo $e;
		Yii::$app->session->setFlash('warning', "Exam Schedule not managed. Try again!");
	}
}
// closing of isset
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php 
		//fetch sections against class_name_id
		$class_sections = Yii::$app->db->createCommand("SELECT std_enroll_head_id, std_enroll_head_name
		FROM  std_enrollment_head
		WHERE class_name_id = '$classId'")->queryAll();
		$countSection = count($class_sections);

		for ($i=0; $i <$countSection ; $i++) { 
			$classHeadId[$i] = 
			?>
			
	<?php } ?>
</body>
</html>
