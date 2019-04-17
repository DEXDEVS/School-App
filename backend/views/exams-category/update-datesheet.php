<?php 

	// getting `exam_category_id` from `exams_criteria`
	$examCateogryId = $_GET['examcatID'];
	// getting `class_id`
	$classId = $_GET['classID'];
	//getting `examType`
	$examType = $_GET['examType'];
	// geeting all info from `exams_criteria` table and `exams_schedule` table
	$examCriteriaData = Yii::$app->db->createCommand("SELECT * FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND std_enroll_head_id = '$classId' AND exam_type = '$examType' AND exam_status = 'Inactive' OR exam_status = 'announced'
					")->queryAll();
	$criteriaId = $examCriteriaData[0]['exam_criteria_id'];

	$examScheduleData = Yii::$app->db->createCommand("SELECT * FROM exams_schedule WHERE exam_criteria_id = '$criteriaId'
					")->queryAll();
	$count = count($examScheduleData);
	// getting classes name `std_enroll_head_name` from `std_enrollment_head` against `std_enroll_head_id`
	$className = Yii::$app->db->createCommand("SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classId'
					")->queryAll();
	
	// getting exam `category_name` from `exams_cateogry`
	$examCategoryName = Yii::$app->db->createCommand("SELECT category_name FROM exams_category WHERE exam_category_id = '$examCateogryId'
					")->queryAll();
 ?>
 	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>Datesheet Update</title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<a href="./view?id=<?php echo $examCateogryId;?>" style="float: right;" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-backward"></i> Back</a>
			</div>
			</div><br>
		<div class="box box-primary">
			<div class="box-header" style="text-align: center;">
				<h3 style="box-shadow:1px 1px 1px 1px;">Exams Criteria</h3>
			</div>
			<div class="box-body">
				<form method="POST" action="view?id=<?php echo $examCateogryId ?>">
					<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>"> 
					<div class="row">
						<div class="col-md-4">	
							<div class="form-group">
								<label>Select Exam Category</label>
								<select name="exam_category" class="form-control">
									<?php 

									 $ExamCategories = Yii::$app->db->createCommand("SELECT * FROM exams_category WHERE exam_category_id != '$examCateogryId'")->queryAll();
									 $examName = Yii::$app->db->createCommand("SELECT category_name,exam_category_id FROM exams_category WHERE exam_category_id = '$examCateogryId'")->queryAll();					 	
									 ?>
									 <option value="<?php echo $examName[0]['exam_category_id']; ?>">
									 	<?php echo $examName[0]['category_name']; ?>
									 </option>
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
								<label>Class Name</label>
								<input class="form-control" type="text" name="classId" value="<?php echo $className[0]['std_enroll_head_name']; ?>" readonly="">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam Start Date</label>
								<input type="date" name="exam_start_date" class="form-control" value="<?php echo $examCriteriaData[0]['exam_start_date'];?>">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">	
							<div class="form-group">
								<label>Exam End Date</label>
								<input type="date" name="exam_end_date" class="form-control" value="<?php echo $examCriteriaData[0]['exam_end_date'];?>">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam Start Time</label>
								<input type="time" name="exam_start_time" class="form-control" value="<?php echo $examCriteriaData[0]['exam_start_time'];?>">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam End Time</label>
								<input type="time" name="exam_end_time" class="form-control" value="<?php echo $examCriteriaData[0]['exam_end_time'];?>">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Room</label>
								<input type="text" name="room" class="form-control" value="<?php echo $examCriteriaData[0]['exam_room'];?>">
							</div>
						</div>
						<div class="col-md-4">	
							<div class="form-group">
								<label>Select Status</label>
								<select name="exam_status" class="form-control">
									 <option value="<?php echo $examCriteriaData[0]['exam_status'];?>">
									 	<?php echo $examCriteriaData[0]['exam_status'];?>
									 </option>
								<?php if($examCriteriaData[0]['exam_status'] != "Inactive"){?>
										<option value="Inactive">Inactive</option>
								<?php }
								if($examCriteriaData[0]['exam_status'] != "announced"){?>
									 <option value="announced">Announce</option>
								<?php } 
								if($examCriteriaData[0]['exam_status'] != "conducted"){?>?>
									 <option value="conducted">Conducted</option>
									<?php 	} ?>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Exam Type</label>
								<input class="form-control" type="text" name="examType" value="<?php echo $examCriteriaData[0]['exam_type']; ?>" readonly="">
							</div>
						</div>
					</div>
					<table class="table table-stripped"> 
						<div class="box-header" style="text-align: center;">
							<h3 style="box-shadow:1px 1px 1px 1px;">Exams Schedule</h3>
						</div>
		<?php
			 for ($i=0; $i <$count ; $i++) {
			 	$subjectId = $examScheduleData[$i]['subject_id'];

				$subjectName = Yii::$app->db->createCommand("
				SELECT subject_name FROM subjects WHERE subject_id = '$subjectId'
					")->queryAll();
			 	$subarray[$i] = $subjectId;

				?>

				<tr>
					<td>
							<div class="row">
								<div class="col-md-12" style="border:1px solid;">
									<p>
									<i class="fa fa-book"></i>
									<?php echo $subjectName[0]['subject_name'];?>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
											<label>Date</label>
											<input type="date" name="date[]" class="form-control" value="<?php echo $examScheduleData[$i]['date']; ?>">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
											<label>Invagilator</label>
											<select name="Invagilator[]" class="form-control">
												<?php 
												$empId = $examScheduleData[$i]['emp_id'];
												$emp_name = Yii::$app->db->createCommand("
												SELECT emp_id,emp_name
												FROM emp_info WHERE group_by ='Faculty' AND emp_id = '$empId'
												")->queryAll();
												$teacher = Yii::$app->db->createCommand("
												SELECT emp_id,emp_name
												FROM emp_info WHERE group_by ='Faculty'
												AND emp_id != '$empId'
												")->queryAll();
												$countteacher = count($teacher);
												 ?>
												<option value="<?php echo $emp_name[0]['emp_id'];?>">
													<?php echo $emp_name[0]['emp_name'];?>
												</option>
												<?php 
												for ($j=0; $j <$countteacher ; $j++) { ?>
												<option value="<?php
														echo $teacher[$j]['emp_id'];
												?>">
												<?php
														echo $teacher[$j]['emp_name'];
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
				</table>
				<?php
			//end of for loop
			} ?>
				<input type="hidden" name="headId" value="<?php echo $classId;?>">
				<input type="hidden" name="subjCount" value="<?php echo $count;?>">
				<input type="hidden" name="criteriaId" value="<?php echo $criteriaId;?>">
				<?php 

				foreach ($subarray as $key => $value) {
					echo '<input type="hidden" name="subarray[]" value="'.$value.'">';
				}

				 ?>
				<div class="row">
				 	<div class="col-md-12">
				 		<button type="submit" name="update" class="btn btn-info" style="float: right;">Update</button>
				 	</div>
				 </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

