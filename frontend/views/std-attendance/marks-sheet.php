<?php 

	// get class_id
if(isset($_GET['class_id']))
{
	$classID = $_GET['class_id'];
	$subID = $_GET['sub_id'];
	$empID = $_GET['emp_id'];

	$examData = Yii::$app->db->createCommand("SELECT c.exam_category_id,s.full_marks,s.passing_marks
	FROM exams_criteria as c
	INNER JOIN exams_schedule as s 
	ON c.exam_criteria_id = s.exam_criteria_id
	WHERE c.std_enroll_head_id = '$classID' AND 
	s.subject_id = '$subID' AND c.exam_status = 'conducted'
				")->queryAll();
	if (empty($examData)){
		Yii::$app->session->setFlash('warning', "No Exam counducted yet.!");
	} else {
		$examCatId = $examData[0]['exam_category_id'];
		$examCatName = Yii::$app->db->createCommand("SELECT category_name
		FROM exams_category
		WHERE exam_category_id = '$examCatId' 
					")->queryAll();
		$className = Yii::$app->db->createCommand("SELECT std_enroll_head_name
		FROM std_enrollment_head
		WHERE std_enroll_head_id = '$classID' 
					")->queryAll();
		$subjectName = Yii::$app->db->createCommand("SELECT subject_name
		FROM subjects
		WHERE subject_id = '$subID' 
					")->queryAll();
		$empName = Yii::$app->db->createCommand("SELECT emp_name
		FROM emp_info
		WHERE emp_id = '$empID' 
					")->queryAll();
		$students = Yii::$app->db->createCommand("SELECT std_roll_no, std_enroll_detail_std_id, std_enroll_detail_std_name
		FROM std_enrollment_detail
		WHERE std_enroll_detail_head_id = '$classID'")->queryAll();
		$countStudents = count($students);

 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<h2 style="text-align: center;font-family: georgia;box-shadow: 1px 1px 1px 1px;">
							<?php echo $examCatName[0]['category_name']; ?> (<?php echo date('Y'); ?>)
							</h2>
							<br>
							<p style="text-align: center;font-weight: bold;font-size: 20px;">Marks Sheet</p><br>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" style="border-right:1px solid;text-align: center;">
							<table class="table">
									<tr>
										<b>Class Name</b>
										<center>
											<?php echo $className[0]['std_enroll_head_name']; ?>
										</center>
									</tr>
							</table>
						</div>
						<div class="col-md-4" style="border-right:1px solid;text-align: center;">
							<table class="table">
									<tr>
										<b>Subject</b><br>
										<center>
											<?php echo $subjectName[0]['subject_name']; ?>
										</center>
									</tr>
							</table>
						</div>
						<div class="col-md-4" style="text-align: center;">
							<table class="table">
									<tr>
										<b>Teacher Name</b>
										<center>
											<?php echo $empName[0]['emp_name']; ?>
										</center>
									</tr>
							</table>
						</div>
					</div><hr>
					<div class="row">
						<div class="col-md-12">
							<form method="POST">
							<table class="table table-hover">
								<thead>
									<tr style="background-color: #337AB7;color: white;">
										<th class="text-center">Sr#</th>
										<th class="text-center">Roll no.</th>
										<th class="text-center">Student</th>
										<th class="text-center">Marks</th>
									</tr>
								</thead>								<tbody>
									<?php 
									for ($j=0; $j <$countStudents ; $j++) { 			
									?>
									<tr align="center">
										<td>
											<?php echo $j+1; ?>	
										</td>
										<td>
											<?php echo $students[$j]['std_roll_no']; ?>	
										</td>
										<td>
											<?php echo $students[$j]['std_enroll_detail_std_name']; ?>
										</td>
										<td>
											<input type="checkbox" name="marks<?php echo $j+1; ?>" value="A">Abs <br>
											<input type="number" name="marks<?php echo $j+1;?>">
										</td>
										<?php 
										$stdID = $students[$j]['std_enroll_detail_std_id'];
										$studentId[$j] = $stdID;
										?>
									</tr>
									<?php }
									//closing of for loop j ?>
								</tbody>
							</table>
							<?php foreach ($studentId as $value) {
				                		echo '<input type="hidden" name="stdId[]" value="'.$value.'" style="width: 30px">';
				                	}
				                	?>
				             <input class="form-control" type="hidden" name="countStudents" value="<?php echo $countStudents; ?>">
				             <input class="form-control" type="hidden" name="categoryId" value="<?php echo $examCatId; ?>">
				             <input class="form-control" type="hidden" name="classHeadId" value="<?php echo $classID; ?>">
				             <input class="form-control" type="hidden" name="subId" value="<?php echo $subID; ?>">

							<button style="float: right;s" type="submit" name="save" class="btn btn-success btn-flat btn-xs">
									<i class="fa fa-sign-in"></i> <b>Submit Marks</b>
								</button>
							</form>
						</div>
					</div> <hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<?php //end of else
	}
//end of if isset
} 

if(isset($_POST['save'])){
	$countStudents 	= $_POST['countStudents'];
	$categoryId 	= $_POST['categoryId'];
	$classHeadId 	= $_POST['classHeadId'];
	$subjectId 			= $_POST['subId'];
	$stdId 			= $_POST['stdId'];

	for($i=0; $i<$countStudents;$i++){
		$q=$i+1;
		$marks = "marks".$q;

		if(empty($_POST["$marks"])){
			$obtMarks[$i] = 'A';
		} else {
			$obtMarks[$i] = $_POST["$marks"];
		}
	}
	
	$transection = Yii::$app->db->beginTransaction();
	try{
		for ($j=0; $j < $countStudents; $j++) { 
			$marksHead = Yii::$app->db->createCommand()->insert('marks_head',[
	            			'exam_category_id' 		=> $categoryId,
							'class_head_id' 		=> $classHeadId ,
							'std_id' 				=> $stdId[$j],
							'created_at'		    => new \yii\db\Expression('NOW()'),
							'created_by'			=> Yii::$app->user->identity->id, 
						])->execute();
			if ($marksHead) {
				$marksHeadId = Yii::$app->db->createCommand("SELECT marks_head_id 
					FROM marks_head WHERE exam_category_id = '$categoryId' AND class_head_id = $classHeadId AND std_id = '$stdId[$j]'")->queryAll();

				$marksHeadid = $marksHeadId[0]['marks_head_id'];
	 
				$marksDetails = Yii::$app->db->createCommand()->insert('marks_details',[
	            			'marks_head_id' 	=> $marksHeadid,
							'subject_id' 		=> $subjectId,
							'obtained_marks'	=> $obtMarks[$j],
							'created_at'		=> new \yii\db\Expression('NOW()'),
							'created_by'		=> Yii::$app->user->identity->id, 
						])->execute();
			}
			if($marksDetails){
				$examScheduleId = Yii::$app->db->createCommand("SELECT s.exam_schedule_id FROM exams_schedule as s
				INNER JOIN exams_criteria as c 
				ON s.exam_criteria_id = c.exam_criteria_id
				WHERE c.std_enroll_head_id = '$classHeadId'
				AND c.exam_category_id = '$categoryId'
				AND s.subject_id = '$subjectId'
				AND c.exam_status = 'conducted'
				")->queryAll();
				$scheduleId = $examScheduleId[0]['exam_schedule_id'];
				$examSchedule = Yii::$app->db->createCommand()->update('exams_schedule',[
                            'status' => 'result prepared'],
                            ['exam_schedule_id' => $scheduleId] 
                            )->execute();
			}
		//closing of if
			
		} // closing of for loop countStudent
		if($marksDetails){
				$transection->commit();
				Yii::$app->session->setFlash('success', "Mark Sheet managed sccessfully...!");
			}
	//closing of try block
	} catch(Exception $e){
		$transection->rollback();
		Yii::$app->session->setFlash('warning', "Mark Sheet not managed. Try again!");
	}
	//closing of catch

}
//closing of if isset
?>