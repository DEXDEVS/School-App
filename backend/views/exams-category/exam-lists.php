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
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<!-- container fluid div start -->
<div class="container-fluid">

	<!-- back button div start -->
	<div class="row">
		<div class="col-md-12">
			<a href="./" style="float: right;" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-backward"></i> Back</a>
		</div>
	</div><br>
	<!-- back button div close -->

	<!-- heading div start -->
	<div class="row">
			<div class="col-md-12">
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
	</div>
	<!-- heading div close -->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-default">
				<div class="box-body">
					<div class="nav-tabs-custom">
			            <ul class="nav nav-tabs">
			              <li class="active">
			              	<a href="#inactive" data-toggle="tab">Inactive
			              		<span class="badge" style="background-color:red;">
			              			<?php echo $countinactiveSchedules; ?>
			              		</span>
			              	</a>
			              </li>
			              <li>
			              	<a href="#announced" data-toggle="tab">Announced
			              		<span class="badge" style="background-color:green;">
			              			<?php echo $countannouncedSchedules; ?>
			              		</span>
			              	</a>
			              </li>
			              <li>
			              	<a href="#conducted" data-toggle="tab">Conducted
								<span class="badge" style="background-color:blue;">
			              			<?php echo $countconductedSchedules; ?>
			              		</span>
			              	</a>
			              </li>
			              <li>
			              	<a href="#prepare" data-toggle="tab">Prepared Results
									<span class="badge" style="background-color:purple;">
			              			<?php echo $countResultPrepareSchedules; ?>
			              		</span>
			              	</a>
			              </li>
			              <li>
			              	<a href="#result" data-toggle="tab">Announced Results
								<span class="badge" style="background-color:seagreen;">
			              			<?php echo $countResultAnnouncedSchedules; ?>
			              		</span>
			              	</a>
			              </li>
			            </ul>
			            <div class="tab-content">
			            	<!-- inactive pan start here -->
				            <div class="active tab-pane" id="inactive">
				                <div class="row">
				                	<div class="col-md-6">
				                		<p><i class="fa fa-info-circle"></i> Inactive Schedule Information</p>
				                	</div>
				                </div>
				                <div class="row">
				                	<div class="col-md-12">
				                		<?php 
				                      	if ($countinactiveSchedules == 0) {
				                          	  	?>

												<p style="text-align: center;font-weight:bold;">No Schedule available yet...!!!!</p>
				                          	  	<?php
				                          	  }else{
				                      	 ?>
				                        <table class="table table-striped table-hover table-responsive">
					                        <thead>
					                            <tr>
					                              <th>Sr.#</th>
					                              <th>Class</th>
					                              <th>Action</th>
					                          	</tr>
					                        </thead>
				                            <tbody>
				                          	<?php
				                          	for ($i=0; $i <$countinactiveSchedules ; $i++) { 
				                          		$classHeadId = $inactiveSchedules[$i]['std_enroll_head_id'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']; ?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a>
				                          		</td>
				                          	</tr>
				                          	<?php } } ?>
				                            </tbody>
				                        </table>
				                	</div>
				                </div>
				            </div>
				              <!-- inactive pan close here -->

				              <!-- announced pan start here -->
				            <div class="tab-pane" id="announced">
				              	<div class="row">
				                	<div class="col-md-6">
				                		<p><i class="fa fa-info-circle"></i> Announced Schedule Information</p>
				                	</div>
				                </div>
				                <div class="row">
				                	<div class="col-md-12">
				                		<?php 
				                      	if ($countannouncedSchedules == 0) {
				                          	  	?>

												<p style="text-align: center;font-weight:bold;">No Schedule available yet...!!!!</p>
				                          	  	<?php
				                          	  }else{
				                      	 ?>
				                        <table class="table table-striped table-hover table-responsive">
					                        <thead>
					                            <tr>
					                              <th>Sr.#</th>
					                              <th>Class</th>
					                              <th>Action</th>
					                          	</tr>
					                        </thead>
				                            <tbody>
				                          	<?php
				                          	for ($i=0; $i <$countannouncedSchedules ; $i++) { 
				                          		$classHeadId = $announcedSchedules[$i]['std_enroll_head_id'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']; ?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a>
				                          		</td>
				                          	</tr>
				                          	<?php } } ?>
				                            </tbody>
				                        </table>
				                	</div>
				                </div>
				            </div>
				            <!-- announced pan close here -->

				            <!-- conducted pan start here -->
				            <div class="tab-pane" id="conducted">
				              	<div class="row">
				                	<div class="col-md-6">
				                		<p><i class="fa fa-info-circle"></i> Conducted Schedule Information</p>
				                	</div>
				                </div>
				                <div class="row">
				                	<div class="col-md-12">
				                		<?php 
				                      	if ($countconductedSchedules == 0) {
				                          	  	?>

												<p style="text-align: center;font-weight:bold;">No Schedule available yet...!!!!</p>
				                          	  	<?php
				                          	  }else{
				                      	 ?>
				                        <table class="table table-striped table-hover table-responsive">
					                        <thead>
					                            <tr>
					                              <th>Sr.#</th>
					                              <th>Class</th>
					                              <th>Action</th>
					                          	</tr>
					                        </thead>
				                            <tbody>
				                          	<?php
				                          	for ($i=0; $i <$countconductedSchedules ; $i++) { 
				                          		$classHeadId = $conductedSchedules[$i]['std_enroll_head_id'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']; ?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a>
				                          		</td>
				                          	</tr>
				                          	<?php } } ?>
				                            </tbody>
				                        </table>
				                	</div>
				                </div>
				            </div>
				              <!-- conducted pan close here -->

				            <!-- prepare result pan start here -->
				            <div class="tab-pane" id="prepare">
				              	<div class="row">
				                	<div class="col-md-6">
				                		<p><i class="fa fa-info-circle"></i> Prepared Result Information</p>
				                	</div>
				                </div>
				                <div class="row">
				                	<div class="col-md-12">
				                		<?php 
				                      	if ($countResultPrepareSchedules == 0) {
				                          	  	?>

												<p style="text-align: center;font-weight:bold;">No Schedule available yet...!!!!</p>
				                          	  	<?php
				                          	  }else{
				                      	 ?>
				                        <table class="table table-striped table-hover table-responsive">
					                        <thead>
					                            <tr>
					                              <th>Sr.#</th>
					                              <th>Class</th>
					                              <th>Action</th>
					                          	</tr>
					                        </thead>
				                            <tbody>
				                          	<?php
				                          	for ($i=0; $i <$countResultPrepareSchedules ; $i++) { 
				                          		$classHeadId = $conductedSchedules[$i]['std_enroll_head_id'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']; ?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a>
				                          		</td>
				                          	</tr>
				                          	<?php } } ?>
				                            </tbody>
				                        </table>
				                	</div>
				                </div>
				            </div>
				              <!-- prepare result pan close here -->

				            <!-- result announce pan start here -->
				            <div class="tab-pane" id="result">
				              	<div class="row">
				                	<div class="col-md-6">
				                		<p><i class="fa fa-info-circle"></i> Announced Result Information</p>
				                	</div>
				                </div>
				                <div class="row">
				                	<div class="col-md-12">
				                		<?php 
				                      	if ($countResultAnnouncedSchedules == 0) {
				                          	  	?>

												<p style="text-align: center;font-weight:bold;">No Schedule available yet...!!!!</p>
				                          	  	<?php
				                          	  }else{
				                      	 ?>
				                        <table class="table table-striped table-hover table-responsive">
					                        <thead>
					                            <tr>
					                              <th>Sr.#</th>
					                              <th>Class</th>
					                              <th>Action</th>
					                          	</tr>
					                        </thead>
				                            <tbody>
				                          	<?php
				                          	for ($i=0; $i <$countResultAnnouncedSchedules ; $i++) { 
				                          		$classHeadId = $ResultAnnouncedSchedules[$i]['std_enroll_head_id'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']; ?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a>
				                          		</td>
				                          	</tr>
				                          	<?php } } ?>
				                            </tbody>
				                        </table>
				                	</div>
				                </div>
				            </div>
				              <!-- result announce pan close here -->
			            </div>
			            <!-- /.tab-content -->
          			</div>
          			<!-- /.nav-tabs-custom -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- container fluid div close -->	
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