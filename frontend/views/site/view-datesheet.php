<?php 
    use yii\db\Connection;
    $conn = \Yii::$app->db; 
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
<?php 

	$branch_id = Yii::$app->user->identity->branch_id;
    $empCnic = Yii::$app->user->identity->username;
    $empId = Yii::$app->db->createCommand("SELECT emp.emp_id FROM emp_info as emp WHERE emp.emp_cnic = '$empCnic'")->queryAll();
    $empId = $empId[0]['emp_id'];
            $teacherId = Yii::$app->db->createCommand("SELECT teacher_subject_assign_head_id FROM teacher_subject_assign_head WHERE teacher_id = '$empId'")->queryAll();
            $teacherHeadId = $teacherId[0]['teacher_subject_assign_head_id'];

            $classId = Yii::$app->db->createCommand("SELECT DISTINCT d.class_id
            	FROM teacher_subject_assign_detail as d
            	INNER JOIN teacher_subject_assign_head as h
            	ON d.teacher_subject_assign_detail_head_id = h.teacher_subject_assign_head_id WHERE h.teacher_id = '$empId'")->queryAll();
            $countClassIds = count($classId);
            
            $Invagilation = Yii::$app->db->createCommand("SELECT c.exam_category_id,c.exam_room,c.class_id,s.exam_start_time,s.exam_end_time,s.date
                FROM exams_criteria as c
                INNER JOIN exams_schedule as s
                ON c.exam_criteria_id = s.exam_criteria_id
                WHERE c.exam_status = 'announced' AND s.emp_id = '$empId' ")->queryAll();
            
            if(empty($Invagilation)){
            	Yii::$app->session->setFlash('warning',"No Exams announced yet..!");
            } else {
            	$countInvagilation = count($Invagilation);
 ?>
<div class="row">
	<div class="col-md-4">
		<div class="box box-success">
			<div class="box-header">
				<h3 style="text-align: center;font-family: georgia;font-size:30px;">Invigilation<br><small>Schedule</small>
				</h3>
			</div><hr>
			<div class="box-body">
				<?php 
				for ($i=0; $i <$countInvagilation ; $i++) { 
					$catIDD = $Invagilation[$i]['exam_category_id'];
					$catName = Yii::$app->db->createCommand("SELECT category_name
             		FROM exams_category WHERE exam_category_id = '$catIDD' ")->queryAll();
             		$classIDD = $Invagilation[$i]['class_id'];
             		$className = Yii::$app->db->createCommand("SELECT class_name
             		FROM std_class_name WHERE class_name_id = '$classIDD' ")->queryAll();

				 ?>
				<table class="table table-hover">
					<tr style="background-color:#00A65A;color:white;">
						<th colspan="2" ><?php echo $catName[0]['category_name']; ?></th>
					</tr>
					<tr style="background-color: #D0F0C0;">
						<th>Class</th>
						<td><?php echo $className[0]['class_name']; ?></td>
					</tr>
					<tr>
						<th>Date</th>
						<td>
						<?php 
						$date = $Invagilation[$i]['date'];
						$dateformat = date("d-m-Y", strtotime($date));

						//Print out the day that our date fell on.
						echo $dateformat;
						?>
							
						</td>
					</tr>
					<tr>
						<th>Day</th>
						<td>
							<?php 
								$date = $Invagilation[$i]['date'];
								//Get the day of the week using PHP's date function.
								$dayOfWeek = date("l", strtotime($date));

								//Print out the day that our date fell on.
								echo $dayOfWeek;
							?>
						</td>
					</tr>
					<tr>
						<th>Start Time</th>
						<td>
						<?php 
						$starttime = $Invagilation[$i]['exam_start_time'];
						$startTime = date("h:i A", strtotime($starttime));
						echo $startTime;
						?>
						</td>
					</tr>
					<tr>
						<th>End Time</th>
						<td>
						<?php 
						$endtime = $Invagilation[$i]['exam_end_time'];
						$endTime = date("h:i A", strtotime($endtime));
						echo $endTime;
						?>
						</td>
					</tr>
					<tr>
						<th>Room</th>
						<td><?php echo $Invagilation[$i]['exam_room']; ?></td>
					</tr>
				</table>
				<?php } ?>
				<hr>
			</div>
		</div>
	</div>
	<div class="col-md-8">
		<div class="box box-success">
			<div class="box-header">
				<h3 style="text-align: center;font-family: georgia;font-size:30px;">Date Sheet<br><small>Schedule</small>
				</h3>
			</div><hr>
			<div class="box-body">
				<?php 

				for ($i=0; $i <$countClassIds ; $i++) {
            $headId = $classId[$i]['class_id'];
            
            $CLASSName = Yii::$app->db->createCommand("SELECT seh.std_enroll_head_name
                FROM std_enrollment_head as seh
                INNER JOIN teacher_subject_assign_detail as tsad
                ON seh.std_enroll_head_id = tsad.class_id WHERE seh.std_enroll_head_id = '$headId' AND seh.branch_id = '$branch_id' ")->queryAll();
            $subjectsIDs = Yii::$app->db->createCommand("SELECT tsad.subject_id
            FROM teacher_subject_assign_detail as tsad
            WHERE tsad.class_id = '$headId' AND tsad.teacher_subject_assign_detail_head_id = '$teacherHeadId'")->queryAll();
            $ClassNameID = Yii::$app->db->createCommand("SELECT class_name_id
            FROM std_enrollment_head
            WHERE std_enroll_head_id = '$headId'")->queryAll();
            $classNameId = $ClassNameID[0]['class_name_id'];
            $dateSheetCheck = Yii::$app->db->createCommand("SELECT c.exam_category_id,c.exam_room,s.date
                FROM exams_criteria as c
                INNER JOIN exams_schedule as s
                ON c.exam_criteria_id = s.exam_criteria_id
                WHERE c.exam_status = 'announced' AND c.class_id = '$classNameId' ")->queryAll();
             if (!empty($dateSheetCheck)) {
             	$catId = $dateSheetCheck[0]['exam_category_id'];
             	$catName = Yii::$app->db->createCommand("SELECT category_name
             	FROM exams_category WHERE exam_category_id = '$catId' ")->queryAll();
				 ?>
				<table class="table table-hover">
					<thead>
						<tr style="background-color:#00A65A;color:white;">
							<td colspan="3" align="center">
								<?php echo $CLASSName[0]['std_enroll_head_name'] ;?>
							</td>
							<td align="center">
								<?php echo $catName[0]['category_name'] ;?>
							</td>
						</tr>
						<tr style="background-color: #D0F0C0;">
							<th>Date</th>
							<th>Day</th>
							<th>Subject</th>
							<th>Room</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						foreach ($subjectsIDs as $key => $subIds) {
							$subID = $subIds['subject_id'];
						 $subjectsName = Yii::$app->db->createCommand("SELECT subject_name FROM subjects WHERE subject_id = '$subID'")->queryAll();
						 $dateSheet = Yii::$app->db->createCommand("SELECT c.exam_category_id,c.exam_room,s.date
			                FROM exams_criteria as c
			                INNER JOIN exams_schedule as s
			                ON c.exam_criteria_id = s.exam_criteria_id
			                WHERE c.exam_status = 'announced' AND c.class_id = '$classNameId' AND s.subject_id = '$subID' ")->queryAll();
						 
						 ?>
						<tr>
							<td>
								<?php 
								$date = $dateSheet[0]['date'];
								$dateformat = date("d-m-Y", strtotime($date));

								//Print out the day that our date fell on.
								echo $dateformat;

								?>	
							</td>
							<td>
								<?php  
								$date = $dateSheet[0]['date'];
								 //Get the day of the week using PHP's date function.
								 $dayOfWeek = date("l", strtotime($date));

								 //Print out the day that our date fell on.
								 echo $dayOfWeek;

								?>
							</td>
							<td><?php echo  $subjectsName[0]['subject_name']; ?></td>
							<td><?php echo  $dateSheet[0]['exam_room']; ?></td>
						</tr>
						<?php } //closing of foreach ?>
					</tbody>
				</table>
				<?php 
					}// closing of if
				}// close for loop
				 ?>
			</div>
		</div>
	</div>
</div>
</div>
<?php } ?>
</body>
</html>