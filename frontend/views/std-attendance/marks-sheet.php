<?php 

	// get class_id
if(isset($_GET['class_id']))
{
	$classID = $_GET['class_id'];
	$subID = $_GET['sub_id'];
	$empID = $_GET['emp_id'];

	$examDataCond = Yii::$app->db->createCommand("SELECT c.exam_criteria_id,c.exam_category_id,s.full_marks,s.passing_marks
	FROM exams_criteria as c
	INNER JOIN exams_schedule as s 
	ON c.exam_criteria_id = s.exam_criteria_id
	WHERE c.std_enroll_head_id = '$classID' AND 
	s.subject_id = '$subID' AND c.exam_status = 'conducted'
				")->queryAll();
	if (empty($examDataCond)){
		Yii::$app->session->setFlash('warning', "No Exam counducted yet.!");
	} else {
		$examDataResult = Yii::$app->db->createCommand("SELECT c.exam_criteria_id,c.exam_category_id,s.full_marks,s.passing_marks
		FROM exams_criteria as c
		INNER JOIN exams_schedule as s 
		ON c.exam_criteria_id = s.exam_criteria_id
		WHERE c.std_enroll_head_id = '$classID' AND 
		s.subject_id = '$subID' AND s.status = 'result prepared'
					")->queryAll();
		if(!empty($examDataResult)){
			Yii::$app->session->setFlash('warning', "You have already submitted mark sheet..!");
		} else {
		$examCatId = $examDataCond[0]['exam_category_id'];
		$examCriteriaId = $examDataCond[0]['exam_criteria_id'];
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
							<form method="POST" action="./activity-view?sub_id=<?php echo $subID; ?>&class_id=<?php echo $classID; ?>&emp_id=<?php echo $empID; ?>">
							<table class="table table-hover">
								<thead>
									<tr style="background-color: #337AB7;color: white;">
										<th class="text-center">Sr#</th>
										<th class="text-center">Roll no.</th>
										<th class="text-center">Student</th>
										<th class="text-center">Marks <?php echo $examDataCond[0]['full_marks']."/".$examDataCond[0]['passing_marks'] ?></th>
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
											<input type="checkbox" name="marks<?php echo $j+1;?>" onclick="remove(<?php echo $j; ?>)" value="A" id="radio">Abs <br>
											<input type="text" name="marks<?php echo $j+1;?>" onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13 || event.charCode == 65 || event.charCode == 46) ? null : event.charCode >= 48 && event.charCode <= 57" id="marks<?php echo $j+1;?>">
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
				             <input class="form-control" type="hidden" name="examCriteriaId" value="<?php echo $examCriteriaId; ?>">
				             <input class="form-control" type="hidden" name="classHeadId" value="<?php echo $classID; ?>">
				             <input class="form-control" type="hidden" name="subId" value="<?php echo $subID; ?>">
				             <input class="form-control" type="hidden" name="subId" value="<?php echo $subID; ?>">

							<button style="float: right;s" type="submit" name="saveMarks" class="btn btn-success btn-flat btn-xs" onclick="return confirm('are you sure')">
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
<?php //end of (result) else
		}
//end of (conducted) else
	}
//end of if isset
} 

?>
<script type="text/javascript">
	function remove(i)
	{
		var value = i+1;		
		var marks = parseInt($('#marks'+value).val());
        $('#marks'+value).val('');
        $('#marks'+value).prop("disabled", true);
	}
</script>
