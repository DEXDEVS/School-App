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

									 $examCategories = Yii::$app->db->createCommand("SELECT * FROM exams_category")->queryAll();					 	
									 ?>
									 <?php foreach ($examCategories as $key => $value) { ?>
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
								<i class="fa fa-search"></i> Search</button>
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

		$examSchedule = Yii::$app->db->createCommand("SELECT s.subject_id, s.full_marks, s.passing_marks FROM exams_schedule as s
			INNER JOIN exams_criteria as c 
			ON s.exam_criteria_id = c.exam_criteria_id
			WHERE c.std_enroll_head_id = '$classHead'
			AND c.exam_category_id = '$examCategory'
			")->queryAll();
		if(empty($examSchedule)){
			Yii::$app->session->setFlash('warning',"Exams not conducted yet.");
		} else {
			$countSubjects = count($examSchedule);

			$students = Yii::$app->db->createCommand("SELECT d.std_enroll_detail_std_id,d.std_roll_no, d.std_enroll_detail_std_name FROM std_enrollment_detail as d
				INNER JOIN std_enrollment_head as h 
				ON d.std_enroll_detail_head_id = h.std_enroll_head_id
				WHERE h.std_enroll_head_id = '$classHead';
				")->queryAll();
			$stdCount = count($students);

			$subjectId = array();
	?>	
<div class="container-fluid">
	<div class="box bos-default">
		<div class="box-header">
			<h3>Marks Register</h3>
		</div>
		<form method="POST">
			<div class="box-body">
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Roll #</th>
							<th>Student Name</th>
							<?php $total=0;
							for ($i=0; $i <$countSubjects ; $i++) {
								$subId = $examSchedule[$i]['subject_id'];
								$total += $examSchedule[$i]['full_marks'];
								$subjectId[$i] = $subId;
								$subject = Yii::$app->db->createCommand("SELECT subject_name FROM subjects WHERE subject_id = '$subId'")->queryAll();
							?>
								<th><?php echo $subject[0]['subject_name']; ?></th>
							<?php
							} ?>
							<th>Grand Total</th>
							<th>Percent(%)</th>
							<th>Result</th>
							
						</tr>
					</thead>
					<tbody>
						<?php for ($std=0; $std < $stdCount; $std++) { 
							$grandTotal = 0;
							$stdId = $students[$std]['std_enroll_detail_std_id'];
						?>
						<tr>
							<td><?php echo $students[$std]['std_roll_no']; ?></td>
							<td><?php echo $students[$std]['std_enroll_detail_std_name']; ?>
							</td>
							<?php for ($s=0; $s < $countSubjects; $s++) { 
								$subId = $subjectId[$s];
								$marks = Yii::$app->db->createCommand("SELECT d.obtained_marks FROM marks_details as d 
									INNER JOIN marks_head as h
									ON d.marks_head_id = h.marks_head_id
									WHERE h.exam_category_id = '$examCategory'
									AND h.class_head_id = '$classHead'
									AND h.std_id = '$stdId'
									AND d.subject_id = '$subId'")->queryAll();
								?>
								<td><?php 
									if(empty($marks)){
										echo "N/A";
									} else {
										echo $marks[0]['obtained_marks'];
										if($marks[0]['obtained_marks'] == 'A'){
											$grandTotal += 0;
										} else {
											$grandTotal += $marks[0]['obtained_marks'];
										}
									}
									?>
								</td>
							<?php } ?>
								<td><?php echo $grandTotal."/".$total; ?></td>
								<td><?php 
									$percent = ($grandTotal/$total)*100;
									echo round($percent,2);
								 ?></td>
								<td></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
			<button class="btn btn-success btn-xs">
				Result announced
			</button>
		</form>
	</div>
</div>
<?php	
} //closing of else
} // closing of isset
 ?>
</body>
</html>