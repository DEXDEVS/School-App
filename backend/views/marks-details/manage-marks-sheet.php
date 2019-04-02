<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
		<div class="box box-primary">
			<div class="box-header">
				<h3>Marks Sheet Criteria</h3>
			</div>
			<div class="box-body">
				<form method="POST">
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
							<button type="submit" name="submit" class="btn btn-success btn-xs">
								<i class="fa fa-sign-in"></i> Get Class</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<?php 

	if(isset($_POST['submit']))
	{
		$examCategory = $_POST['exam_category'];
		$classHead = $_POST['class_head'];

		$examCriteriaData = Yii::$app->db->createCommand("SELECT * FROM exams_criteria WHERE exam_category_id = '$examCategory' AND
		std_enroll_head_id = '$classHead ' AND exam_status = 'conducted'
					")->queryAll();
		$classId = $examCriteriaData[0]['std_enroll_head_id'];
		
		$students = Yii::$app->db->createCommand("SELECT std_roll_no,std_enroll_detail_std_id,std_enroll_detail_std_name
			FROM std_enrollment_detail
			WHERE std_enroll_detail_head_id = '$classHead'")->queryAll();
		$countStudents = count($students);

		
		// getting classes name `std_enroll_head_name` from `std_enrollment_head` against `std_enroll_head_id`
		$className = Yii::$app->db->createCommand("SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classId'
						")->queryAll();
		$countCriteria = count($examCriteriaData);
		// getting exam `category_name` from `exams_cateogry`
	$examCategoryName = Yii::$app->db->createCommand("SELECT category_name FROM exams_category WHERE exam_category_id = '$examCategory'
					")->queryAll();

		// $stdSubjects = Yii::$app->db->createCommand("SELECT s.subject_id,s.full_marks,s.passing_marks
		// 	FROM exams_schedule as s
		// 	INNER JOIN exams_criteria as c 
		// 	ON c.exam_criteria_id = s.exam_criteria_id
		// 	WHERE c.exam_category_id = '$examCategory' AND 
		// 	c.std_enroll_head_id = '$classHead'
		// 	")->queryAll();
		// $countSubjects = count($stdSubjects);
		// var_dump($stdSubjects);
	?>	
<div class="container-fluid">
	<div class="box bos-default">
		<div class="box-header">
			<h3>Add Marks</h3>
		</div>
		<form method="POST">
		<div class="box-body">
			<?php  

			for ($i=0; $i <$countCriteria ; $i++) { 
				
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
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Roll #</th>
						<th>Student Name</th>
						<?php 

						for ($j=0; $j <$countSubjects ; $j++) { 
							$subjectId = $examScheduleData[$j]['subject_id'];
							$subjectName = Yii::$app->db->createCommand("SELECT subject_name FROM subjects WHERE subject_id = '$subjectId'
										")->queryAll();
						 ?>
						<th><?php echo $subjectName[0]['subject_name'];?></th>
						<?php } ?>
					</tr>
				</thead>
				<tbody>
					<?php 

					for ($k=0; $k <$countStudents ; $k++) { 
					
					 ?>
					<tr>
						<td><?php echo $students[0]['std_roll_no']; ?></td>
						<td><?php echo $students[0]['std_enroll_detail_std_name']; ?></td>
						<?php 
						for ($m=0; $m <$countSubjects ; $m++) {?>
						<td>
							<input type="text" name="">
						</td>
						<?php } ?>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			<?php } ?>
		</div>
	</form>
	</div>
</div>
<?php	} // closing of isset
 ?>
</body>
</html>
