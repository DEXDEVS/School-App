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

		$examSchedule = Yii::$app->db->createCommand("SELECT c.exam_criteria_id,s.subject_id, s.full_marks, s.passing_marks FROM exams_schedule as s
			INNER JOIN exams_criteria as c 
			ON s.exam_criteria_id = c.exam_criteria_id
			WHERE c.std_enroll_head_id = '$classHead'
			AND c.exam_category_id = '$examCategory'
			")->queryAll();
		if(empty($examSchedule)){
			Yii::$app->session->setFlash('warning',"Exams not conducted yet.");
		} else {
			$countSubjects = count($examSchedule);
			$examCriteriaID = $examSchedule[0]['exam_criteria_id'];
			$students = Yii::$app->db->createCommand("SELECT d.std_enroll_detail_std_id,d.std_roll_no, d.std_enroll_detail_std_name FROM std_enrollment_detail as d
				INNER JOIN std_enrollment_head as h 
				ON d.std_enroll_detail_head_id = h.std_enroll_head_id
				WHERE h.std_enroll_head_id = '$classHead';
				")->queryAll();
			$stdCount = count($students);

			$subjectId = array();
			$resultCounter=0;
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
							<th>Action</th>
							
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
									WHERE h.exam_criteria_id = '$examCriteriaID'
									AND h.std_id = '$stdId'
									AND d.subject_id = '$subId'")->queryAll();
								
								?>
								<td><?php 
									if(empty($marks)){
										echo "<span class='label label-danger'> N/A </span>";
										$resultCounter++;
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
								 <td>Pass</td>
								<td>
									<a href="./update-marks?examCatID=<?php echo $examCategory;?>&headID=<?php echo $classHead; ?>&stdID=<?php echo $stdId; ?>" class="btn btn-info btn-xs">
									update
									</a>
								</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
			<input type="hidden" name="resultCounter" value="<?php echo $resultCounter; ?>">
			<input type="hidden" name="grandTotal" value="<?php echo $grandTotal; ?>">
			<button type="submit" name="save" class="btn btn-success btn-xs">
				Save Mark Sheet
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
<?php 
	if(isset($_POST['save'])){
		$resultCounter = $_POST["resultCounter"];
		if($resultCounter != 0){
			Yii::$app->session->setFlash('warning',"Result not prepeard yet..!");
		} else {

		}
	}
 ?>
<?php if(isset($_POST['update'])){
		$countMarks 	= $_POST["countMarks"];
		$subjectArray 	= $_POST["subjectArray"];
		$marksDetailIdArray 	= $_POST["marksDetailIdArray"];

		for($j=0; $j<$countMarks; $j++){
			$a = $j+1;
			$marks = "marks_".$a;
			 $obt_marks[$j] = $_POST["$marks"];
		}

	$transection = Yii::$app->db->beginTransaction();
	try{
		for($k=0; $k<$countMarks; $k++){
			$marksdetailUpdate = Yii::$app->db->createCommand()->update('marks_details', 				[
							'subject_id' 		=> $subjectArray[$k],
							'obtained_marks' 	=> $obt_marks[$k] ,
							'updated_at'			=> new \yii\db\Expression('NOW()'),
							'updated_by'			=> Yii::$app->user->identity->id,
	                        ],
	                        ['marks_detail_id' => $marksDetailIdArray[$k]]
	                    )->execute();
		}
		if($marksdetailUpdate){
				$transection->commit();
				Yii::$app->session->setFlash('success', "Marks Updated sccessfully...!");
			}

		//closing of try block
	} catch(Exception $e){
		$transection->rollback();
		echo $e;
		Yii::$app->session->setFlash('warning', "Marks not Updated. Try again!");
	}
	//closing of catch

	} ?>