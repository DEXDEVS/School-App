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
<table class="table table-hover">
<?php 
	if(isset($_POST['submit']))
	{
		$exam_category 		= $_POST["exam_category"];
		$headId 			= $_POST["class_head"];
		$exam_start_date 	= $_POST["exam_start_date"];
		$exam_end_date 		= $_POST["exam_end_date"];
		$exam_start_time 	= $_POST["exam_start_time"];
		$exam_end_time 		= $_POST["exam_end_time"];

		 // echo $exam_category."<br>";
		 // echo $headId."<br>" ;
		 // echo $exam_start_date."<br>";
		 // echo $exam_end_date."<br>";
		 // echo $exam_start_time."<br>";
		 // echo $exam_end_time."<br>";
		// die()
		$subjects = Yii::$app->db->createCommand("SELECT s.std_subject_name,h.class_name_id
		FROM std_subjects as s
		INNER JOIN std_enrollment_head as h
		ON s.class_id = h.class_name_id
		WHERE h.std_enroll_head_id = '$headId'")->queryAll();
		$subject = $subjects[0]['std_subject_name'];
		$subjectarray = explode(',', $subject);

		var_dump($subjectarray);
		$subjCount = count($subjectarray);
		for ($i=0; $i <$subjCount ; $i++) {
			$subject = $subjectarray[$i];

			$subjectId = Yii::$app->db->createCommand("
			SELECT subject_id FROM subjects WHERE subject_name = '$subject'
				")->queryAll();
			
			$subarray[$i] = $subjectId[0]['subject_id'];
			var_dump($subarray);
			?>
		
		
			<tr>
				<td>
					<form method="post">
						<div class="form-group">
							<label>Subject</label>
							<input type="text" name="subject_id" value="<?php echo $subject;?>" readonly="">
						</div>
					</form>
				</td>
			</tr>
		

	<?php	} }
 ?>
 </table>
</body>
</html>