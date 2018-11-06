<?php

	$classId = $_POST['classId'];
	$studentName = Yii::$app->db->createCommand("SELECT sed.std_enroll_detail_std_id , sed.std_enroll_detail_std_name  FROM std_enrollment_detail as sed INNER JOIN std_enrollment_head as seh ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id WHERE seh.class_id = '$classId'")->queryAll();

	$stdId = array();
 	$stdName = array();
 	$count = count($studentName);
 	for ($i=0; $i <$count; $i++) { 
 		$stdId[$i] = $studentName[$i]['std_enroll_detail_std_id'];
 		$stdName[$i] = $studentName[$i]['std_enroll_detail_std_name'];
 	}

 	$obj = (object) array($stdId,$stdName);
 	echo json_encode($obj);	
?>
<?php
	//get student fee

 	$studentId = $_POST['studentId'];
 	$studentFeeDetail = Yii::$app->db->createCommand("SELECT net_addmission_fee , net_monthly_fee  FROM fee WHERE std_id = '$stdId'")->queryAll();
 	echo json_encode($studentFeeDetail);
?>