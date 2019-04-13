<?php 

	// getting `exam_category_id` from `exams_criteria`
	$examCateogryId = $_GET['id'];

	$inactiveSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'inactive'
					")->queryAll();
	$countinactiveSchedules = count($inactiveSchedules);
	$announcedSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'announced'
					")->queryAll();
	$countannouncedSchedules = count($announcedSchedules);
	$conductedSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'conducted'
					")->queryAll();
	$countconductedSchedules = count($conductedSchedules);
	$ResultPrepareSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'Result Prepared'
					")->queryAll();
	$countResultPrepareSchedules = count($ResultPrepareSchedules);
	$ResultAnnouncedSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'Result Announced'
					")->queryAll();
	$countResultAnnouncedSchedules = count($ResultAnnouncedSchedules);
	// getting exam `category_name` from `exams_cateogry`
	$examCategoryName = Yii::$app->db->createCommand("
				SELECT category_name FROM exams_category WHERE exam_category_id = '$examCateogryId'
					")->queryAll();
	// getting class IDs `std_enroll_head_id` from `exams_criteria` against `exam_category_id`
	$classIds = Yii::$app->db->createCommand("
				SELECT DISTINCT (std_enroll_head_id) FROM exams_criteria WHERE exam_category_id = '$examCateogryId'
					")->queryAll();
	$countClassIds = count($classIds);
	$examCriteria = Yii::$app->db->createCommand("
				SELECT * FROM exams_criteria WHERE exam_category_id = '$examCateogryId'
					")->queryAll();
 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
	#tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

#tooltip #tooltiptext {
  visibility: hidden;
  width:400px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 15px;
  
  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 105%;
}

#tooltip:hover #tooltiptext {
  visibility: visible;
}
	</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a href="./" style="float: right;" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-backward"></i> Back</a>
		</div>
	</div><br>
	<div class="row">
		<div class="col-md-3">
			<div class="box box-primary">
				<div class="box-header" style="padding: 0px;text-align: center;">
					<h3 style="text-align: center;font-family: georgia;font-size:30px;">
						<?php echo $examCategoryName[0]['category_name']."<br>"; ?>(<?php echo date('Y'); ?>)
					</h3>
					<p style="font-weight:bold;text-align: center;"><u>Date Sheets</u></p>
				</div>
				<div class="box-body">					
						

				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="box box-primary">
				<div class="box-header" style="padding:0px;">
					<h2 style="text-align: center;font-family: georgia;font-size:30px;">
						<?php echo $examCategoryName[0]['category_name']; ?>(<?php echo date('Y'); ?>)
					</h2>
					<p style="font-weight:bold;text-align: center;"><u>Date Sheets</u></p>
				</div><hr>	
				<div class="box-body">
					<?php 
					if (empty($countClassIds)) {
					 	echo "<h4 class='text-center'>No Schedule for classes are avaialble...!!!</h4>";
					}
					else { ?>
						<form method="POST" action="">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Sr.#</th>
								<th>Classes</th>
								<th>Operations</th>
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
								$examCriteria = Yii::$app->db->createCommand("
								SELECT * 
								FROM 	exams_criteria 
								WHERE 	std_enroll_head_id = '$classID' AND
									  	exam_category_id = '$examCateogryId'
												")->queryAll();

							 ?>
							<tr  style="padding:0px;">
								<td>1</td>
								<td>
									<?php echo $className[0]['std_enroll_head_name'];?>
									<?php 
										if ($examCriteria[0]['exam_status'] == 'Inactive') {
											echo "<span class='badge' style='background-color:red;'>".$examCriteria[0]['exam_status']."</span>";
										}
										if ($examCriteria[0]['exam_status'] == 'conducted') {
											echo "<span class='badge' style='background-color:#367FA9;'>".$examCriteria[0]['exam_status']."</span>";
										}
										if ($examCriteria[0]['exam_status'] == 'announced') {
											echo "<span class='badge' style='background-color:green;'>".$examCriteria[0]['exam_status']."</span>";
										}
										if ($examCriteria[0]['exam_status'] == 'Result Prepared') {
											echo "<span class='badge' style='background-color:purple;'>".$examCriteria[0]['exam_status']."</span>";
										}
										if ($examCriteria[0]['exam_status'] == 'Result Announced') {
											echo "<span class='badge' style='background-color:seagreen;'>".$examCriteria[0]['exam_status']."</span>";
										}
									?>
								</td>
								<td>
									<div class="dropdown">
									    <button class="btn btn-primary btn-xs dropdown-toggle" type="button" data-toggle="dropdown">Action
									    <span class="caret"></span></button>
									    <ul class="dropdown-menu dropdown-menu-right">
									      <li style="background-color:#E4CDAC;border-bottom-right-radius:25px;">
									      	<a href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classID;?>"><i class="fa fa-eye"></i> View Date Sheet</a>
									      </li>
									      <li class="divider"></li>
									      <li style="background-color:#E4CDAC;border-bottom-right-radius:25px;">
									      	<a href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classID;?>""><i class="fa fa-edit"></i> 
											Update Date Sheet
											</a>
									      </li>
									      <li class="divider"></li>
									      <li style="background-color:#E4CDAC;border-bottom-right-radius:25px;">
											<a href="./view-result-cards?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classID;?>">
												<i class="fa fa-eye"></i> View Result Card
											</a>
									      </li>
									      <li class="divider"></li>
									   
									      	<button style="border-bottom-right-radius:25px;" type="submit" name="result_announced" class="btn btn-success btn-block">
											Announce Result
											</button>
									      
									    </ul>
									  </div>
									</div>
										<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>"> 
										<input type="hidden" name="cat_id" value="<?php echo $examCateogryId; ?>">
										<input type="hidden" name="class_id" value="<?php echo $classID; ?>">
								</td>
							</tr>
							<?php }  } ?>
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<?php 

	// result announce isset

	if(isset($_POST['result_announced']))
	{
		$cat_id = $_POST['cat_id'];
		$class_id = $_POST['class_id'];

		$resultAnnounced = Yii::$app->db->createCommand("
		SELECT exam_criteria_id FROM exams_criteria WHERE exam_category_id = '$cat_id' AND std_enroll_head_id = '$class_id' AND exam_status = 'Result Prepared'
			")->queryAll();
		if (empty($resultAnnounced)) {
			Yii::$app->session->setFlash('warning', "You can not announce result before result prepared...!");
		} else {
			$transection = Yii::$app->db->beginTransaction();
			try{
				$criteriaId = $resultAnnounced[0]['exam_criteria_id'];
				$statusUpdate = Yii::$app->db->createCommand()->update('exams_criteria', 				[
							'exam_status'			=> 'Result Announced',
							'updated_at'			=> new \yii\db\Expression('NOW()'),
							'updated_by'			=> Yii::$app->user->identity->id,
	                        ],
	                        ['exam_criteria_id' => $criteriaId, 'exam_category_id' => $cat_id, 'std_enroll_head_id' => $class_id, 'exam_status' => "Result Prepared"]
	                    )->execute();
				if($statusUpdate){
					$transection->commit();
					Yii::$app->session->setFlash('success', "Result announced successfully...!");
				}//closing of try block
			} catch(Exception $e){
				$transection->rollback();
				echo $e;
				Yii::$app->session->setFlash('warning', "Result not announced. Try again!");
			} // closing of transaction handling....
		} //closing of else
	} //if isset
 ?>
<?php 

	// date sheet update isset
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