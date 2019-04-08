<?php 

	// getting `exam_category_id` from `exams_criteria`
	$examCateogryId = $_GET['id'];
	// getting exam `category_name` from `exams_cateogry`
	$examCategoryName = Yii::$app->db->createCommand("
				SELECT category_name FROM exams_category WHERE exam_category_id = '$examCateogryId'
					")->queryAll();
	// getting class IDs `std_enroll_head_id` from `exams_criteria` against `exam_category_id`
	$classIds = Yii::$app->db->createCommand("
				SELECT DISTINCT (std_enroll_head_id) FROM exams_criteria WHERE exam_category_id = '$examCateogryId'
					")->queryAll();
	$countClassIds = count($classIds);
 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header" style="padding:0px;">
					<h2 style="text-align: center;font-family: georgia;font-size:30px;">
						<?php echo $examCategoryName[0]['category_name']; ?>
					</h2>
					<p style="font-weight:bold;text-align: center;"><u>Date Sheets</u></p>
				</div><hr>	
				<div class="box-body">
					<?php 
					if (empty($countClassIds)) {
					 	echo "No Schedule for classes is avaialble...!!!";
					}
					else { ?>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Sr.#</th>
								<th>Classes</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<?php
							for ($i=0; $i <$countClassIds ; $i++) { 		 
								$classID = $classIds[$i]['std_enroll_head_id'];
								// getting classes name `std_enroll_head_name` from `std_enrollment_head` against `std_enroll_head_id`
								$className = Yii::$app->db->createCommand("
											SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classID'
												")->queryAll();
							 ?>
							<tr  style="padding:0px;">
								<td>1</td>
								<td><?php echo $className[0]['std_enroll_head_name']; ?></td>
								<td>
									<a href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classID;?>" class="btn btn-warning btn-xs">View</a>
									<a href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classID;?>" class="btn btn-info btn-xs">
										Update
									</a>
								</td>
							</tr>
							<?php }  } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<?php 
	if(isset($_POST['update']))
	{
		// getting exam criteria fields
		$criteriaId 		= $_POST["criteriaId"];
		$exam_category 		= $_POST["exam_category"];
		$headId 			= $_POST["headId"];
		$exam_start_date 	= $_POST["exam_start_date"];
		$exam_end_date 		= $_POST["exam_end_date"];
		$exam_start_time 	= $_POST["exam_start_time"];
		$exam_end_time 		= $_POST["exam_end_time"];
		$room 				= $_POST["room"];
		$exam_status 		= $_POST["exam_status"];
		// getting exam schedule fields
		$subarray 		= $_POST["subarray"];
		$date 			= $_POST["date"];
		$Invagilator 	= $_POST["Invagilator"];
		// $fullmarks 		= $_POST["fullmarks"];
		// $passingmarks 	= $_POST["passingmarks"];
		$subjCount 		= $_POST["subjCount"];

	$transection = Yii::$app->db->beginTransaction();
	try{
		$examCriteriaUpdate = Yii::$app->db->createCommand()->update('exams_criteria', 				[
						'exam_category_id' 		=> $exam_category,
						'std_enroll_head_id' 	=> $headId ,
						'exam_start_date' 		=> $exam_start_date,
						'exam_end_date'			=> $exam_end_date ,
						'exam_start_time'		=> $exam_start_time,
						'exam_end_time'			=> $exam_end_time ,
						'exam_room' 			=> $room ,
						'exam_status'			=> $exam_status,
						'updated_at'			=> new \yii\db\Expression('NOW()'),
						'updated_by'			=> Yii::$app->user->identity->id,
                        ],
                        ['exam_criteria_id' => $criteriaId]
                    )->execute();
		if ($examCriteriaUpdate) {
			
		for ($i=0; $i <$subjCount ; $i++) {
			 $examScheduleUpdate = Yii::$app->db->createCommand()->update('exams_schedule',[
						'emp_id' 			=> $Invagilator[$i],
						'date'				=> $date[$i],
						'updated_at'		=> new \yii\db\Expression('NOW()'),
						'updated_by'		=> Yii::$app->user->identity->id,
                        ],
                        ['exam_criteria_id' => $criteriaId , 'subject_id' => $subarray[$i],]
                    )->execute();
				
			} // closing of for loop
			if($examScheduleUpdate){
				$transection->commit();
				Yii::$app->session->setFlash('success', "Exams schedule updated successfully...!");
			}
		} // closing of exam criteria
	//closing of try block
	} catch(Exception $e){
		$transection->rollback();
		echo $e;
		Yii::$app->session->setFlash('warning', "Exam Schedule not updated. Try again!");
	} // closing of transaction handling....
}
// closing of isset
?>
</body>
</html>