	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>Manage Exams</title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="box box-primary">
			<div class="box-header">
				<h3>Exams Criteria</h3>
			</div>
			<div class="box-body">
				<form method="POST" action="manage-exams">
					 <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>"> 
					<div class="row">
						<div class="col-md-4">	
							<div class="form-group">
								<label>Select Exam Category</label>
								<select name="exam_category" class="form-control">
									<option>Select Exam Category</option>
									<?php 

									 $ExamCategories = Yii::$app->db->createCommand("SELECT * FROM exams_category")->queryAll();					 	
									 ?>
									 <?php foreach ($ExamCategories as $key => $value) { ?>
									 <option value="<?php echo $value['exam_category_id']; ?>">
									 	<?php echo $value['category_name']; ?>
									 </option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Select Class</label>
								<select name="class_head" class="form-control">
									<option>Select Class</option>
									<?php 

									 $Classes = Yii::$app->db->createCommand("SELECT std_enroll_head_id,std_enroll_head_name FROM std_enrollment_head")->queryAll();					 	
									 ?>
									 <?php foreach ($Classes as $key => $value) { ?>
									 <option value="<?php echo $value['std_enroll_head_id']; ?>">
									 	<?php echo $value['std_enroll_head_name']; ?>
									 </option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam Start Date</label>
								<input type="date" name="exam_start_date" class="form-control">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">	
							<div class="form-group">
								<label>Exam End Date</label>
								<input type="date" name="exam_end_date" class="form-control">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam Start Time</label>
								<input type="time" name="exam_start_time" class="form-control">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam End Time</label>
								<input type="time" name="exam_end_time" class="form-control">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Room</label>
								<input type="text" name="room" class="form-control">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<button type="submit" name="submit" class="btn btn-success btn-xs">
								<i class="fa fa-sign-in"></i> Get Subjects</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<?php 
		if(isset($_POST['submit']))
		{
			$exam_category 		= $_POST["exam_category"];
			$headId 			= $_POST["class_head"];
			$exam_start_date 	= $_POST["exam_start_date"];
			$exam_end_date 		= $_POST["exam_end_date"];
			$exam_start_time 	= $_POST["exam_start_time"];
			$exam_end_time 		= $_POST["exam_end_time"];
			$room 				= $_POST["room"];

		$marks = Yii::$app->db->createCommand("SELECT * FROM marks_weitage WHERE exam_category_id = '$exam_category'")->queryAll();

		if(empty($marks)){
			Yii::$app->session->setFlash('warning',"Marks waitage for this category is not set.");
		} else {
			$subjects = Yii::$app->db->createCommand("SELECT s.section_subjects,h.section_id
			FROM std_sections as s
			INNER JOIN std_enrollment_head as h
			ON s.section_id = h.section_id
			WHERE h.std_enroll_head_id = '$headId'")->queryAll();
			$combinationId = $subjects[0]['section_subjects'];
			$combinations = Yii::$app->db->createCommand("
				SELECT std_subject_name FROM std_subjects WHERE std_subject_id = '$combinationId'
					")->queryAll();
			$subject = $combinations[0]['std_subject_name'];
			$subjectarray = explode(',', $subject);
			$subjCount = count($subjectarray); ?>

<div class="box box-default container-fluid">
	<div class="box-header">
		<h2>Exam Schedule</h2>
	</div>		
<div class="box-body" style="background-color:#fafafa;">
	<form method="post">
	<table class="table table-stripped"> 
		<?php
			for ($i=0; $i <$subjCount ; $i++) {
				$subject = $subjectarray[$i];

				$subjectId = Yii::$app->db->createCommand("
				SELECT subject_id FROM subjects WHERE subject_name = '$subject'
					")->queryAll();
				$subarray[$i] = $subjectId[0]['subject_id'];

				$marks = Yii::$app->db->createCommand("
				SELECT * FROM marks_weitage WHERE exam_category_id = '$exam_category' AND subject_id = '$subarray[$i]'
					")->queryAll();

					$totalMarks = $marks[0]['presentation']+$marks[0]['assignment']+$marks[0]['attendance']+$marks[0]['dressing']+$marks[0]['theory']+$marks[0]['practical'];

					if ($totalMarks == 100) {
						$passmarks = 33;
					}
					elseif ($totalMarks == 75) {
						$passmarks = 25;
					}
					elseif ($totalMarks == 50) {
						$passmarks = 17;
					} else {
						$passmarks = 0;
					}

				?>

				<tr>
					<td>
						
							<div class="row" style="border-bottom:3px solid #ebd6e7; ">
								<div class="col-md-2" style="border:1px solid;height:133px;box-shadow: 1px 10px 10px 1px;background-color: #ebd6e7;color:#AA5397;border-radius: 8px;">
									<h3 style="line-height:2.5;text-align: center;">
									<i class="fa fa-book"></i>
									<?php echo $subject;?>
									</h3>
								</div>
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
											<label>Date</label>
											<input type="date" name="date[]" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Presentation</label>
											<input type="text" name="presentation[]" class="form-control" value="<?php echo $marks[0]['presentation'];?>" readonly="" id="pr_<?php echo $i; ?>">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Assignment</label>
											<input type="text" name="assignment[]" class="form-control" value="<?php echo $marks[0]['assignment'];?>" readonly="" id="assign_<?php echo $i; ?>">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Attendance</label>
											<input type="text" name="attendance[]" class="form-control" value="<?php echo $marks[0]['attendance'];?>" readonly="" id="att_<?php echo $i; ?>">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Dressing</label>
											<input type="text" name="dressing[]" class="form-control" value="<?php echo $marks[0]['dressing'];?>" readonly="" id="dr_<?php echo $i; ?>">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
											<label>Invagilator</label>
											<select name="Invagilator[]" class="form-control">
												<?php 

												$teacher = Yii::$app->db->createCommand("
												SELECT teacher_id,teacher_subject_assign_head_name
												FROM  teacher_subject_assign_head
												")->queryAll();
												$countteacher = count($teacher);
												 ?>
												<option>Select invagilator</option>
												<?php 
												for ($j=0; $j <$countteacher ; $j++) { ?>
												<option value="<?php
														echo $teacher[$j]['teacher_id'];
												?>">
												<?php
														echo $teacher[$j]['teacher_subject_assign_head_name'];
												?>
												</option>
												<?php } ?>
											</select>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Theory</label>
											<input type="text" name="theory" class="form-control" value="<?php echo $marks[0]['theory'];?>" readonly=""  id="th_<?php echo $i; ?>">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Practical</label>
											<input type="text" name="practical[]" class="form-control" value="<?php echo $marks[0]['practical'];?>" readonly="" id="prac_<?php echo $i; ?>">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Full Marks</label>
											<input type="text" name="fullmarks[]" class="form-control" value="<?php echo $totalMarks;?>">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Passing Marks</label>
											<input type="text" name="passingmarks[]" class="form-control" value="<?php echo $passmarks; ?>">
											</div>
										</div>
									</div>
								</div>
								
							</div>
						
					</td>
				</tr>
			

		<?php
			//end of for loop
			} ?>
	

	<?php 

	foreach ($subarray as $key => $value) {
		echo '<input type="hidden" name="subarray[]" value="'.$value.'">';
	}

	 ?>
	
	</table>
	 <div class="row">
	 	<div class="col-md-12">
	 		<button type="submit" name="save" class="btn btn-success" style="float: right;">Submit</button>
	 	</div>
	 </div>
	<input type="hidden" name="exam_category" value="<?php echo $exam_category;?>">
	<input type="hidden" name="headId" value="<?php echo $headId;?>">
	<input type="hidden" name="exam_start_date" value="<?php echo $exam_start_date;?>">
	<input type="hidden" name="exam_end_date" value="<?php echo $exam_end_date;?>">
	<input type="hidden" name="exam_start_time" value="<?php echo $exam_start_time;?>">
	<input type="hidden" name="exam_end_time" value="<?php echo $exam_end_time;?>">
	<input type="hidden" name="room" value="<?php echo $room;?>">
	<input type="hidden" name="subjCount" value="<?php echo $subjCount;?>">
	 </form>
	</div>
		<?php	
		}
		//closing of else
	}
	// closing of isset
	 ?>
	 
</div>
	 <?php 
	if(isset($_POST['save']))
	{
		// getting exam criteria fields
		$exam_category 		= $_POST["exam_category"];
		$headId 			= $_POST["headId"];
		$exam_start_date 	= $_POST["exam_start_date"];
		$exam_end_date 		= $_POST["exam_end_date"];
		$exam_start_time 	= $_POST["exam_start_time"];
		$exam_end_time 		= $_POST["exam_end_time"];
		$room 				= $_POST["room"];
		// getting exam schedule fields
		$subarray 		= $_POST["subarray"];
		$date 			= $_POST["date"];
		$Invagilator 	= $_POST["Invagilator"];
		$fullmarks 		= $_POST["fullmarks"];
		$passingmarks 	= $_POST["passingmarks"];
		$subjCount 		= $_POST["subjCount"];

	$transection = Yii::$app->db->beginTransaction();
	try{

		$examCriteria = Yii::$app->db->createCommand()->insert('exams_criteria',[
            			'exam_category_id' 		=> $exam_category,
						'std_enroll_head_id' 	=> $headId ,
						'exam_start_date' 		=> $exam_start_date,
						'exam_end_date'			=> $exam_end_date ,
						'exam_start_time'		=> $exam_start_time,
						'exam_end_time'			=> $exam_end_time ,
						'exam_room' 			=> $room ,
						'created_by'			=> Yii::$app->user->identity->id, 
					])->execute();
		if ($examCriteria) {
			$examCriteriaId = Yii::$app->db->createCommand("SELECT exam_criteria_id
			FROM  exams_criteria
			WHERE exam_category_id 		= '$exam_category' AND
				  std_enroll_head_id 	= '$headId' AND
				  exam_start_date 		= '$exam_start_date' AND
				  exam_end_date 		= '$exam_end_date' AND
				  exam_start_time 		= '$exam_start_time' AND
				  exam_end_time 		= '$exam_end_time' AND
				  exam_room 			= '$room'
			")->queryAll();
			$criteriaId = $examCriteriaId[0]['exam_criteria_id'];
			
		for ($i=0; $i <$subjCount ; $i++) { 
			$examSchedule = Yii::$app->db->createCommand()->insert('exams_schedule',[
            			'exam_criteria_id' 	=> $criteriaId,
						'subject_id' 		=> $subarray[$i],
						'emp_id' 			=> $Invagilator[$i],
						'date'				=> $date[$i] ,
						'full_marks'		=> $fullmarks[$i],
						'passing_marks'		=> $passingmarks[$i],
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
		Yii::$app->session->setFlash('warning', "Exam Schedule not managed. Try again!");
	}
}
// closing of isset
?>
</body>
</html>

