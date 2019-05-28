<?php 

	// getting `exam_category_id` from `exams_criteria`
	$examCateogryId = $_GET['examcatID'];
	// getting `class_id`
	$classId = $_GET['classID'];
	//getting `examType`
	$examType = $_GET['examType'];
	$startYear = $_GET['startYear'];
	$endYear = $_GET['endYear'];
	// geeting all info from `exams_criteria` table
	$examCriteriaData = Yii::$app->db->createCommand("SELECT * FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND class_id = '$classId' AND exam_type = '$examType' AND YEAR(exam_start_date) = '$startYear' AND YEAR(exam_end_date) = '$endYear' 
					")->queryAll();
	
	$criteriaId = $examCriteriaData[0]['exam_criteria_id'];

	$examScheduleData = Yii::$app->db->createCommand("SELECT * FROM exams_schedule WHERE exam_criteria_id = '$criteriaId'
					")->queryAll();
	$count = count($examScheduleData);
	// getting classes name `class_name` from `std_class_name` against `class_name_id`
	$className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$classId'
					")->queryAll();
	
	// getting exam `category_name` from `exams_cateogry`
	$examCategoryName = Yii::$app->db->createCommand("SELECT category_name FROM exams_category WHERE exam_category_id = '$examCateogryId'
					")->queryAll();

	// getting all info from `exams_room` table
	$examRoom = Yii::$app->db->createCommand("SELECT * FROM exams_room WHERE exam_criteria_id = '$criteriaId'")->queryAll();
	$countRooms = count($examRoom);

 ?>
	<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Datesheet Update</title>
	<style type="text/css">
		#hover-effect:hover{
			background-color:#001F3F;
			color:white;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<!-- back button start -->
	 	<ol class="breadcrumb">
      		<li><a class="btn btn-primary btn-xs" href="./exam-lists?id=<?php echo $examCateogryId;?>"><i class="fa fa-backward"></i> Back</a></li>
    	</ol>
		<!-- back button close -->
		<div class="box box-primary">
			<div class="box-header">
				<div class="well well-sm" style="border-left:2px solid;margin-top:10px;font-size:20px;font-weight:bolder;">
					<h4><i class="glyphicon glyphicon-hand-right"></i> Update Date Sheet</h4>
				</div>
				<h3 class="well well-sm" style="text-align:center; border-left:1px solid;border-right:2px solid; font-family:georgia;background-color:#001F3F;color:white;">Exams Criteria</h3>
			</div>
			<div class="box-body">
				<form method="POST" action="exam-lists?id=<?php echo $examCateogryId ?>">
					<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>"> 
					<div class="row">
						<div class="col-md-4">	
							<div class="form-group">
								<label><i class="glyphicon glyphicon-th-list" style="color:#4997e5;"></i> Select Exam Category</label>
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
								<label><i class="fa fa-university" style="color:#4997e5;"></i> Class Name</label>
								<input class="form-control" type="text" value="<?php echo $className[0]['class_name']; ?>" readonly="">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label><i class="glyphicon glyphicon-calendar" style="color:#4997e5;"></i> Exam Start Date</label>
								<input type="date" name="exam_start_date" class="form-control" value="<?php echo $examCriteriaData[0]['exam_start_date'];?>">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">	
							<div class="form-group">
								<label><i class="glyphicon glyphicon-calendar" style="color:#4997e5;"></i> Exam End Date</label>
								<input type="date" name="exam_end_date" class="form-control" value="<?php echo $examCriteriaData[0]['exam_end_date'];?>">
							</div>
						</div>
						<div class="col-md-4">	
							<div class="form-group">
								<label><i class="glyphicon glyphicon-stats" style="color:#4997e5;"></i> Select Status</label>
								<select name="exam_status" class="form-control">
									 <option value="<?php echo $examCriteriaData[0]['exam_status'];?>">
									 	<?php echo $examCriteriaData[0]['exam_status'];?>
									 </option>
								<?php if($examCriteriaData[0]['exam_status'] != "Inactive"){?>
										<option value="Inactive">Inactive</option>
								<?php }
								if($examCriteriaData[0]['exam_status'] != "Announced"){?>
									 <option value="Announced">Announced</option>
								<?php } 
								if($examCriteriaData[0]['exam_status'] != "Conducted"){?>?>
									 <option value="Conducted">Conducted</option>
									<?php 	} ?>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label><i class="glyphicon glyphicon-th-list" style="color:#4997e5;"></i> Exam Type</label>
								<input class="form-control" type="text" name="examType" value="<?php echo $examCriteriaData[0]['exam_type']; ?>" readonly="">
							</div>
						</div>
					</div>
					<div class="box-header" style="text-align: center;">
						<h3 class="well well-sm" style="border-left:2px solid;border-right:2px solid; font-family:georgia;background-color:#001F3F;color:white;">Exams Schedule</h3>
					</div>
					<div class="row">
						<?php for ($i=0; $i <$countRooms ; $i++) { 
							$class_id = $examRoom[$i]['class_head_id'];
							$classHeadName = Yii::$app->db->createCommand("SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$class_id'")->queryAll();
							$room=$examRoom[$i]['exam_room'];

							$classHeadId[$i] = $class_id;
						?>
						<div class="col-md-6">
							<div class="form-group">
								<label>Section</label>
								<input type="text" value="<?php echo $classHeadName[0]['std_enroll_head_name']; ?>" class="form-control" readonly="" >
							</div>
						</div>
						<div class="col-md-6">	
							<div class="form-group">
								<label><i class="glyphicon glyphicon-th-list" style="color:#4997e5;"></i> Room </label>

								<select name="exam_room[]" class="form-control">
									<?php 
									 $ExamRoom = Yii::$app->db->createCommand("SELECT room_name FROM rooms WHERE room_id = '$room'")->queryAll();
									 $ExpectRoom = Yii::$app->db->createCommand("SELECT room_id, room_name FROM rooms WHERE room_id != '$room'")->queryAll();

														 	
									?>
										<option value="<?php echo $room; ?>">
											<?php echo $ExamRoom[0]['room_name']; ?>
										</option>
									<?php foreach ($ExpectRoom as $key => $value) { ?>
										<option value="<?php echo $value['room_id']; ?>">
											<?php echo $value['room_name']; ?>
										</option>
									<?php } ?>
								</select>
							</div>
						</div>
					<?php } ?>
					</div>
					<?php for ($i=0; $i <$count ; $i++) {
					 	$subjectId = $examScheduleData[$i]['subject_id'];

						$subjectName = Yii::$app->db->createCommand("
						SELECT subject_name FROM subjects WHERE subject_id = '$subjectId'
							")->queryAll();
					 	$subarray[$i] = $subjectId;
						?>
					<table class="table table-stripped well well-sm"> 
						<tr>
							<td>
								<div class="row container-fluid">
									<div class="col-md-12">
										<p id="hover-effect" style="text-align: center;border-bottom:1px solid;padding:10px;border-radius:20px;font-size:20px;">
										<i class="fa fa-book" style="color:#4997e5;"></i>
										<?php echo $subjectName[0]['subject_name'];?>
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-3">
												<div class="form-group">
													<label><i class="glyphicon glyphicon-calendar" style="color:#4997e5;"></i> Date</label>
													<input type="date" name="date[]" class="form-control" value="<?php echo $examScheduleData[$i]['date']; ?>">
												</div>
												<div class="form-group">
													<label><i class="glyphicon glyphicon-user" style="color:#4997e5;"></i> Invagilator</label>
													<select name="Invagilator[]" class="form-control">
													<?php $empId = $examScheduleData[$i]['emp_id'];
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
															<option value="<?php echo $teacher[$j]['emp_id']; ?>">
															<?php echo $teacher[$j]['emp_name']; ?>
															</option>
														<?php } ?>
													</select>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label><i class="glyphicon glyphicon-time" style="color:#4997e5;"></i> Exam Start Time</label>
													<input type="time" name="exam_start_time[]" class="form-control" value="<?php echo $examScheduleData[$i]['exam_start_time']; ?>">
												</div>
												<div class="form-group">
													<label><i class="glyphicon glyphicon-time" style="color:#4997e5;"></i> Exam End Time</label>
													<input type="time" name="exam_end_time[]" class="form-control" value="<?php echo $examScheduleData[$i]['exam_end_time']; ?>">
												</div>
											</div>
											<div class="col-md-6">
												
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<?php } //end of for loop?>
					<input type="hidden" name="headId" value="<?php echo $classId;?>">
					<input type="hidden" name="subjCount" value="<?php echo $count;?>">
					<input type="hidden" name="criteriaId" value="<?php echo $criteriaId;?>">
					<input type="hidden" name="countRooms" value="<?php echo $countRooms;?>">
					<?php 
					foreach ($subarray as $key => $value) {
						echo '<input type="hidden" name="subarray[]" value="'.$value.'">';
					}
					foreach ($classHeadId as $key => $value) {
						echo '<input type="hidden" name="classHeadId[]" value="'.$value.'">';
					}
					?>
					<div class="row">
					 	<div class="col-md-12">
					 		<button type="submit" name="update" class="btn btn-info btn-xs" style="float: right;"><i class="glyphicon glyphicon-edit"></i> Update</button>
					 	</div>
					 </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

