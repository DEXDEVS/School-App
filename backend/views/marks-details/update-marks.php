<?php

	if(isset($_GET['examCatID']))
	{
		$examCatID 	= $_GET['examCatID'];
		$headID 	= $_GET['headID'];
		$stdID 		= $_GET['stdID'];

		$CatName= Yii::$app->db->createCommand("SELECT category_name FROM exams_category WHERE exam_category_id = '$examCatID'")->queryAll();

		$ClassName = Yii::$app->db->createCommand("SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$headID'")->queryAll();

		$StdName = Yii::$app->db->createCommand("SELECT std_name FROM std_personal_info WHERE std_id = '$stdID'")->queryAll();?>

<div class="container-fluid">
	<div class="row" style="text-align: center;">
		<div class="box box-default">
			<div class="box-header">
				<p>Update Student Marks</p>
			</div><hr>
			<div class="box-body">
				<div class="col-md-4">
					<h3>Category Name</h3>
					<p><?php echo $CatName[0]['category_name']; ?></p>
				</div>
				<div class="col-md-4">
					<h3>Class Name</h3>
					<p><?php echo $ClassName[0]['std_enroll_head_name']; ?></p>
				</div>
				<div class="col-md-4">
					<h3>Student Name</h3>
					<p><?php echo $StdName[0]['std_name']; ?></p>
				</div>
			</div>
		</div>
	</div>
	<form method="POST">
		<div class="row">
			<?php 

			$examSchedule = Yii::$app->db->createCommand("SELECT c.exam_criteria_id,s.subject_id FROM exams_schedule as s
			INNER JOIN exams_criteria as c 
			ON s.exam_criteria_id = c.exam_criteria_id
			WHERE c.std_enroll_head_id = '$headID '
			AND c.exam_category_id = '$examCatID'
			")->queryAll();
			$countExamSchedule = count($examSchedule);
			 for ($i=0; $i <$countExamSchedule ; $i++) { 
			 	$subjectID = $examSchedule[$i]['subject_id'];
			 	$subName = Yii::$app->db->createCommand("SELECT subject_name FROM subjects WHERE subject_id = '$subjectID'")->queryAll();
			 ?>
			<div class="col-md-3">
				<div class="form-group">
					<label><?php echo $subName[0]['subject_name']; ?></label>
					<input type="number" name="" class="form-control">
				</div>
			</div>
			<?php } ?>
		</div>
	</form>
</div>
<?php } ?>
