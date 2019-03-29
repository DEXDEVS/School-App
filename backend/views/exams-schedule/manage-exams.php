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
							<button type="submit" name="submit" class="btn btn-success btn-xs">
								<i class="fa fa-sign-in"></i> Get Subjects</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<form method="post">
	<table class="table table-stripped">
	<?php 
		if(isset($_POST['submit']))
		{
			$exam_category 		= $_POST["exam_category"];
			$headId 			= $_POST["class_head"];
			$exam_start_date 	= $_POST["exam_start_date"];
			$exam_end_date 		= $_POST["exam_end_date"];
			$exam_start_time 	= $_POST["exam_start_time"];
			$exam_end_time 		= $_POST["exam_end_time"];

			$subjects = Yii::$app->db->createCommand("SELECT s.std_subject_name,h.class_name_id
			FROM std_subjects as s
			INNER JOIN std_enrollment_head as h
			ON s.class_id = h.class_name_id
			WHERE h.std_enroll_head_id = '$headId'")->queryAll();
			$subject = $subjects[0]['std_subject_name'];
			$subjectarray = explode(',', $subject);
			$subjCount = count($subjectarray);
			for ($i=0; $i <$subjCount ; $i++) {
				$subject = $subjectarray[$i];

				$subjectId = Yii::$app->db->createCommand("
				SELECT subject_id FROM subjects WHERE subject_name = '$subject'
					")->queryAll();
				$subarray[$i] = $subjectId[0]['subject_id'];

				$marks = Yii::$app->db->createCommand("
				SELECT * FROM marks_weitage WHERE subject_id = '$subarray[$i]'
					")->queryAll();
				?>
			
			
				<tr>
					<td>
						
							<div class="row">
								<div class="col-md-2" style="border:1px solid;height:133px;box-shadow: 1px 10px 10px 1px;">
									<h3>
									<i class="fa fa-book"></i>
									<?php echo $subject;?>
									</h3>
								</div>
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<div class="form-group">
											<label>Date</label>
											<input type="date" name="date[]" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Presentation</label>
											<input type="text" name="presentation" class="form-control" value="<?php echo $marks[0]['presentation'];?>" readonly="">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Assignment</label>
											<input type="text" name="assignment" class="form-control" value="<?php echo $marks[0]['assignment'];?>" readonly="">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Attendance</label>
											<input type="text" name="attendance" class="form-control" value="<?php echo $marks[0]['attendance'];?>" readonly="">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Dressing</label>
											<input type="text" name="dressing" class="form-control" value="<?php echo $marks[0]['dressing'];?>" readonly="">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-2">
											<div class="form-group">
											<label>Theory</label>
											<input type="text" name="theory" class="form-control" value="<?php echo $marks[0]['theory'];?>" readonly="">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Practical</label>
											<input type="text" name="practical" class="form-control" value="<?php echo $marks[0]['practical'];?>" readonly="">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Full Marks</label>
											<input type="text" name="fullmarks[]" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
											<label>Passing Marks</label>
											<input type="text" name="passingmarks[]" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
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
									</div>
								</div>
								
							</div>
						
					</td>
				</tr>
			

		<?php	} ?>
	<input type="hidden" name="exam_category" value="<?php echo $exam_category;?>">
	<input type="hidden" name="headId" value="<?php echo $headId;?>">
	<input type="hidden" name="exam_start_date" value="<?php echo $exam_start_date;?>">
	<input type="hidden" name="exam_end_date" value="<?php echo $exam_end_date;?>">
	<input type="hidden" name="exam_start_time" value="<?php echo $exam_start_time;?>">
	<input type="hidden" name="exam_end_time" value="<?php echo $exam_end_time;?>">
	<input type="hidden" name="">
		<?php	}
	 ?>
	 </table>
	 <div class="row">
	 	<div class="col-md-4">
	 		<button type="submit" name="save" class="btn btn-success" style="float: right;">Submit</button>
	 	</div>
	 </div>

	 </form>
	 <?php 
	if(isset($_POST['save']))
	{

	}

	  ?>
	</body>
	</html>