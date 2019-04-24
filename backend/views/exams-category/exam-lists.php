<?php 

	// getting `exam_category_id` from `exams_criteria`
	$examCateogryId = $_GET['id'];

	$inactiveSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id, exam_type FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'inactive'
					")->queryAll();
	$countinactiveSchedules = count($inactiveSchedules);
	$announcedSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id, exam_type FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'announced'
					")->queryAll();
	$countannouncedSchedules = count($announcedSchedules);
	$conductedSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id, exam_type FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'conducted'
					")->queryAll();
	$countconductedSchedules = count($conductedSchedules);
	$ResultPrepareSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id, exam_type FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'Result Prepared'
					")->queryAll();
	$countResultPrepareSchedules = count($ResultPrepareSchedules);
	$ResultAnnouncedSchedules = Yii::$app->db->createCommand("
				SELECT std_enroll_head_id, exam_type FROM exams_criteria WHERE exam_category_id = '$examCateogryId' AND exam_status = 'Result Announced'
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
			<a href="./exams-category" style="float: right;" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-backward"></i> Back</a>
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
				                          		//getting class names
				                          		$classHeadId = $inactiveSchedules[$i]['std_enroll_head_id'];
				                          		$examType = $inactiveSchedules[$i]['exam_type'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']." ";
				                          			if($examType == "Supply"){
				                          				echo "<span class='label label-primary'>".$examType."</span>";
				                          			} else {
				                          				echo "<span class='label label-success'>".$examType."</span>";
				                          			}
				                          		?>
				                          		</td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-edit"></i> 
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
				                          		$examType = $announcedSchedules[$i]['exam_type'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']." ";
				                          		if($examType == "Supply"){
			                          				echo "<span class='label label-primary'>".$examType."</span>";
			                          			} else {
			                          				echo "<span class='label label-success'>".$examType."</span>";
			                          			}
				                          		 ?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>""><i class="fa fa-edit"></i> 
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
				                          		$examType = $conductedSchedules[$i]['exam_type'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']." "; 
				                          		if($examType == "Supply"){
			                          				echo "<span class='label label-primary'>".$examType."</span>";
			                          			} else {
			                          				echo "<span class='label label-success'>".$examType."</span>";
			                          			}
				                          		?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-edit"></i> 
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
				                      	 <form method="POST">
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
				                          		$classHeadId = $ResultPrepareSchedules[$i]['std_enroll_head_id'];
				                          		$examType = $ResultPrepareSchedules[$i]['exam_type'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']." "; 
				                          		if($examType == "Supply"){
			                          				echo "<span class='label label-primary'>".$examType."</span>";
			                          			} else {
			                          				echo "<span class='label label-success'>".$examType."</span>";
			                          			}?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

				                          			<a class="btn btn-info btn-xs" href="./view-result-cards?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Result Card</a>

				                          			<button class="btn btn-success btn-xs" name="result_announced"><i class="fa fa-eye"></i> Announce Result</button>

													<!-- <a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php //echo $examCateogryId;?>&classID=<?php //echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a> -->
													 <input type="hidden" name="_csrf" value="<?php Yii::$app->request->getCsrfToken() ?>">
							                        <input type="hidden" name="cat_id" value="<?php echo $examCateogryId; ?>">
							                        <input type="hidden" name="class_id" value="<?php echo $classHeadId; ?>">
							                        <input type="hidden" name="examType" value="<?php echo $examType; ?>">
				                          		</td>
				                          	</tr>
				                          	<?php } } ?>
				                            </tbody>
				                        </table>
				                    	</form>
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
				                          		$examType = $ResultAnnouncedSchedules[$i]['exam_type'];
				                          		$className = Yii::$app->db->createCommand("
												SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classHeadId'
													")->queryAll();
				                          	?>
				                          	<tr>
				                          		<td><?php echo $i+1; ?></td>
				                          		<td><?php echo $className[0]['std_enroll_head_name']." "; 
				                          		if($examType == "Supply"){
			                          				echo "<span class='label label-primary'>".$examType."</span>";
			                          			} else {
			                          				echo "<span class='label label-success'>".$examType."</span>";
			                          			}?></td>
				                          		<td>
				                          			<a class="btn btn-warning btn-xs" href="./view-datesheet?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Date Sheet</a>

													<!-- <a class="btn btn-info btn-xs" href="./update-datesheet?examcatID=<?php //echo $examCateogryId;?>&classID=<?php //echo $classHeadId;?>""><i class="fa fa-edit"></i> 
															Update Date Sheet
															</a> -->
													<a class="btn btn-info btn-xs" href="./view-result-cards?examcatID=<?php echo $examCateogryId;?>&classID=<?php echo $classHeadId;?>&examType=<?php echo $examType;?>"><i class="fa fa-eye"></i> View Result Card</a>
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
	<!-- invagilator section start -->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header" style="padding: 0px;text-align: center;">
					<h3 style="text-align: center;font-family: georgia;font-size:30px;">
						Invigilators Attendance
					</h3>
					<!-- <p style="font-weight:bold;text-align: center;"><u>Date Sheets</u></p> -->
				</div><hr>	
				<div class="box-body">					
					<div class="row">
				        <div class="col-md-12">
	                		<form method="POST" action="view?id=<?php echo $examCateogryId; ?>">
	                			<div class="row">
	                				<div class="col-md-4">
	                					<div class="form-group">
			                				<label>Select Date</label>
			                				<input type="date" name="date" class="form-control">
	                					</div>
	                				</div>

	                				<input type="hidden" name="examCatId" value="<?php echo $examCateogryId;?>">

	                				<div class="col-md-4" style="margin-top: 24px;">
		                				<button class="btn btn-info" type="submit" name="search" > Search </button>
		                			</div>
	                			</div>	
	                		</form>
				        </div>
				    </div><hr>
            		<?php 
            		if(isset($_POST["search"]))
            		{
            			$date = $_POST['date'];
						$examCatId = $_POST['examCatId'];
						//get all invegilators against selected date
						$invigilator = Yii::$app->db->createCommand("SELECT c.exam_criteria_id,c.std_enroll_head_id,s.subject_id,s.emp_id
							        FROM exams_criteria as c
									INNER JOIN exams_schedule as s
									ON c.exam_criteria_id = s.exam_criteria_id
							        WHERE c.exam_category_id = '$examCatId'
							        AND c.exam_status = 'announced'
							        AND s.date = '$date'")->queryAll();
						var_dump($invigilator);
						if (empty($invigilator)) {
							echo "No schedule announced yet..!";
						}else{
							$invigilatorAtt = Yii::$app->db->createCommand("SELECT s.emp_attendance
							        FROM exams_criteria as c
									INNER JOIN exams_schedule as s
									ON c.exam_criteria_id = s.exam_criteria_id
							        WHERE c.exam_category_id = '$examCatId'
							        AND c.exam_status = 'announced'
							        AND s.date = '$date'")->queryAll();
							
							if(empty($invigilatorAtt[0]['emp_attendance'])){
						$countinvigilator = count($invigilator);

            	 	?>
            	 	<div class="row">
            	 		<div class="col-md-12">
							<form method="POST">
            	 			<table class="table">
            	 				<thead>
            	 					<tr>
            	 						<th>Sr.#</th>
            	 						<th>Class</th>
            	 						<th>Subject</th>
            	 						<th>Invagilator</th>
            	 						<th>Attendance</th>
            	 					</tr>
            	 				</thead>
            	 				<tbody>
            	 					<?php 
            	 					$criteriaArray = array();
            	 					$classArray = array();
            	 					$subjectArray = array();
            	 					$empArray = array();
            	 					for ($i=0; $i <$countinvigilator ; $i++) {
            	 						//get criteria id
            	 						$criteriaId = $invigilator[$i]['exam_criteria_id']; 
            	 						$criteriaArray[$i] = $criteriaId;
            	 						//get class name
            	 						$classId = $invigilator[$i]['std_enroll_head_id'];
            	 						$classArray[$i] = $classId;
            	 						$classesName = Yii::$app->db->createCommand("
										SELECT std_enroll_head_name FROM std_enrollment_head WHERE std_enroll_head_id = '$classId'
											")->queryAll();
            	 						//get subject name
            	 						$subId = $invigilator[$i]['subject_id'];
            	 						$subjectArray[$i] = $subId;
            	 						$subName = Yii::$app->db->createCommand("
										SELECT subject_name FROM subjects WHERE subject_id = '$subId'
											")->queryAll();
            	 						//get invagilator name
            	 						$empId = $invigilator[$i]['emp_id'];
            	 						$empArray[$i] = $empId;
            	 						$empName = Yii::$app->db->createCommand("
										SELECT emp_name FROM emp_info WHERE emp_id = '$empId'
											")->queryAll();
            	 					 ?>
            	 					<tr>
            	 						<td><?php echo $i+1; ?></td>
            	 						<td><?php echo $classesName[0]['std_enroll_head_name'];  ?></td>
            	 						<td>
            	 							<?php echo $subName[0]['subject_name']; ?>
            	 						</td>
            	 						<td>
            	 							<?php echo $empName[0]['emp_name']; ?>
            	 						</td>
            	 						<td>
            	 							<input type="radio" name="emp<?php echo $i+1?>" value="P"/> <b  style="color:green">P </b>
											<input type="radio" name="emp<?php echo $i+1?>" value="A"  checked="checked"/> <b style="color: red">A </b>
											<input type="radio" name="emp<?php echo $i+1?>" value="L" /><b style="color: #F7C564;"> L</b>
            	 						</td>
            	 					</tr>
            	 					<?php } ?>
            	 				</tbody>
            	 			</table>
            	 			<input type="hidden" name="date" value="<?php echo $date; ?>">
            	 			 <?php foreach ($criteriaArray as $value) {
				                		echo '<input type="hidden" name="criteriaArray[]" value="'.$value.'" style="width: 30px">';
				                	}
				                  foreach ($classArray as $value) {
				                		echo '<input type="hidden" name="classArray[]" value="'.$value.'" style="width: 30px">';
				                	}
				                  foreach ($subjectArray as $value) {
				                		echo '<input type="hidden" name="subjectArray[]" value="'.$value.'" style="width: 30px">';
				                	}
				                  foreach ($empArray as $value) {
				                		echo '<input type="hidden" name="empArray[]" value="'.$value.'" style="width: 30px">';
				                	} ?>
            	 			<input type="hidden" name="countinvigilator" value="<?php echo $countinvigilator; ?>"> 
            	 			
            	 			<button type="submit" name="save_attendance" class="btn btn-success btn-xs" style="float: right;">Save Attendance</button>
            	 		</form>
            	 		</div>
            	 	</div>
            	 	<?php } else {
            	 		echo "Attendance already marked";
            	 	} //end of else attendance
            	 	 } //end of else 
            	 	  } //end of if isset ?>
				</div>
			</div>
		</div>
	</div>
	<!-- invagilator section close -->
</div>
<!-- container fluid div close -->	
<?php 

	if(isset($_POST['save_attendance'])){
		$date = $_POST['date'];
		$criteriaArray = $_POST['criteriaArray'];
		$classArray = $_POST['classArray'];
		$subjectArray = $_POST['subjectArray'];
		$empArray = $_POST['empArray'];
		$countinvigilator = $_POST['countinvigilator'];

		for($i=0; $i<$countinvigilator;$i++){
			$q=$i+1;
			$emp = "emp".$q;
			$emp_attendance[$i] = $_POST["$emp"];
		}

		$transection = Yii::$app->db->beginTransaction();
			try{
				for($i=0; $i<$countinvigilator; $i++){
					$invigilator = Yii::$app->db->createCommand()->update('exams_schedule', [
							'emp_attendance'=> $emp_attendance[$i],
							'updated_at'	=> new \yii\db\Expression('NOW()'),
							'updated_by'	=> Yii::$app->user->identity->id,
	                        ],
	                        ['exam_criteria_id' => $criteriaArray[$i], 'subject_id' => $subjectArray[$i], 'emp_id' => $empArray[$i], 'date' => $date]
	                    )->execute();
				}
				if($invigilator){
				$transection->commit();
					Yii::$app->session->setFlash('success', "Attendance for Invigilator marked successfully...!");
				}
			} catch(Exception $e){
				$transection->rollback();
				Yii::$app->session->setFlash('warning', "Attendance not marked. Try again!");
			}
	}// save_attendance clossing

	// result announce isset
	if(isset($_POST['result_announced']))
	{
		$cat_id = $_POST['cat_id'];
		$class_id = $_POST['class_id'];
		$examType = $_POST['examType'];

		$resultAnnounced = Yii::$app->db->createCommand("
		SELECT exam_criteria_id FROM exams_criteria WHERE exam_category_id = '$cat_id' AND std_enroll_head_id = '$class_id' AND exam_status = 'Result Prepared' AND exam_type = '$examType'
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
	                        ['exam_criteria_id' => $criteriaId, 'exam_category_id' => $cat_id, 'std_enroll_head_id' => $class_id, 'exam_status' => "Result Prepared",'exam_type' => $examType]
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
	} //if isset close

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
		$exam_type 			= $_POST["examType"];
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
						'exam_type'				=> $exam_type,
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