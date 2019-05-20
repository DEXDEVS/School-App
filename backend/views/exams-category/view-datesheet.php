<?php 

	// getting `exam_category_id` from `exams_criteria`
	$examCateogryId = $_GET['examcatID'];
	// getting `class_id`
	$classId = $_GET['classID'];
	//getting `examType`
	$examType = $_GET['examType'];
	// geeting all info from `exams_criteria` table and `exams_schedule` table
	$examCriteriaData = Yii::$app->db->createCommand("SELECT * FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND class_id = '$classId' AND exam_type = '$examType'
					")->queryAll();
	$classId = $examCriteriaData[0]['class_id'];
	// getting classes name `std_enroll_head_name` from `std_enrollment_head` against `std_enroll_head_id`
	$className = Yii::$app->db->createCommand("SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classId'
					")->queryAll();
	$count = count($examCriteriaData);
	// getting exam `category_name` from `exams_cateogry`
	$examCategoryName = Yii::$app->db->createCommand("SELECT category_name FROM exams_category WHERE exam_category_id = '$examCateogryId'
					")->queryAll();

 ?>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a href="./exams-category-view?id=<?php echo $examCateogryId;?>" style="float: right;" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-backward"></i> Back</a>
		</div>
	</div><br>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<h2 style="text-align: center;font-family: georgia;box-shadow: 1px 1px 1px 1px;">
							<?php echo $examCategoryName[0]['category_name']; ?> (<?php echo date('Y'); ?>)
							</h2>
							<br>
							<p style="text-align: center;font-weight: bold;font-size: 20px;">Date Sheet</p><br>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" style="border-right:1px solid;text-align: center;">
							<table class="table">
									<tr>
										<b>Exam Time</b><br>
										<center>
											<?php 
											echo date('h:i:A',strtotime($examCriteriaData[0]['exam_start_time']));
											?>
											<b>TO</b>&nbsp;<?php 
											echo date('h:i:A',strtotime($examCriteriaData[0]['exam_end_time']));
											?>
										</center>
									</tr>
							</table>
						</div>
						<div class="col-md-4" style="border-right:1px solid;text-align: center;">
							<table class="table">
									<tr>
										<b>Exam Room</b><br>
										<center>
											<?php echo $examCriteriaData[0]['exam_room']; ?>
										</center>
									</tr>
							</table>
						</div>
						<div class="col-md-4" style="text-align: center;">
							<table class="table">
									<tr>
										<b>Class Name</b>
										<center>
											<?php echo $className[0]['std_enroll_head_name']; ?>
										</center>
									</tr>
							</table>
						</div>
					</div><hr>
					<?php 	

						for ($i=0; $i <$count ; $i++) {
						$criteriaID = $examCriteriaData[$i]['exam_criteria_id'];		
						$examScheduleData = Yii::$app->db->createCommand("SELECT * FROM exams_schedule WHERE exam_criteria_id = '$criteriaID'
							")->queryAll();
						$countSubjects = count($examScheduleData);

						?>
						<div class="row">
							<div class="col-md-6">
								<p style="font-weight: bold;"><?php echo $examCategoryName[0]['category_name']." Schedule ".($i+1); ?>  
							</p>
							</div>
							<div class="col-md-6">
							<p style="float: right;font-weight: bold;">
								<?php 	

							echo date('d-M-Y',strtotime($examCriteriaData[$i]['exam_start_date']))." To ".
							date('d-M-Y',strtotime($examCriteriaData[$i]['exam_end_date']));?>
							</p>
							</div>
						</div>
						<div class="row">
						<div class="col-md-12">
							<table class="table table-hover">
								<thead>
									<tr style="background-color: #337AB7;color: white;">
										<th class="text-center">Date</th>
										<th class="text-center">Day</th>
										<th class="text-center">Subject</th>
									</tr>
								</thead>
								<tbody>
									<?php 
									
										for ($j=0; $j <$countSubjects ; $j++) { 
											$subjectId = $examScheduleData[$j]['subject_id'];
											$subjectName = Yii::$app->db->createCommand("SELECT subject_name FROM subjects WHERE subject_id = '$subjectId'
										")->queryAll();
										
									 ?>
									<tr align="center">
										<td>
											<?php
											echo 
											date('F d, Y',strtotime($examScheduleData[$j]['date']));
											?>	
										</td>
										<td>
											<?php 
											//Our YYYY-MM-DD date string.
											$date = $examScheduleData[$j]['date'];

											//Get the day of the week using PHP's date function.
											$dayOfWeek = date("l", strtotime($date));

											//Print out the day that our date fell on.
											echo $dayOfWeek;
											?>	
											</td>
										<td>
											<?php echo $subjectName[0]['subject_name']; ?>	
										</td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
						</div>
					</div> <hr>
					 <?php }?>

				</div>
			</div>
		</div>
	</div>
</div>

