<!DOCTYPE html>
<html>
<head>
	<title>Attendance</title>
</head>
<body>
	<form  action = "index.php?r=std-attendance/attendance" method="POST">
    	<div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
        <div class="row">
        	<div class="col-md-3">
                <div class="form-group">
                	<label>Current Date</label>
                    <input class="form-control" data-date-format="mm/dd/yyyy" type="date" name="date" required="">
                </div>    
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Select Class</label>
                    <select class="form-control" name="classid" id="classId" required="">
							<?php 
								$className = Yii::$app->db->createCommand("SELECT * FROM std_class")->queryAll();
								
								  	foreach ($className as  $value) { ?>	
									<option value="<?php echo $value["class_id"]; ?>">
										<?php echo $value["class_name"]; ?>	
									</option>
							<?php } ?>
					</select>      
                </div>    
            </div> 
            <div class="col-md-2">
                <div class="form-group">
                	<label></label>
                    <button type="submit" name="submit" class="btn btn-info form-control">Take Attendance</button>
                </div>    
            </div>    
        </div>
    </form>

<?php
	if(isset($_POST["submit"])){
		 
		$classid= $_POST["classid"];
		 $date = $_POST["date"];

		$student = Yii::$app->db->createCommand("SELECT sed.std_enroll_detail_id ,sed.std_enroll_detail_std_id FROM std_enrollment_detail as sed INNER JOIN std_enrollment_head as seh ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id WHERE seh.class_id = '$classid'")->queryAll();
		?>
	<div class="container-fluid">
		<hr>
		<form method="POST" action="index.php?r=std-attendance/attendance">
			<div class="row">
				<div class="col-md-6">
					<table width="100%">
						<tr>
							<th>Sr No</th>
							<th>RollNo</th>
							<th>Student Name</th>
							<th>Attendance</th>
						</tr>
						
						<?php $length = count($student);
						//$stdId = array(); 
						for( $i=0; $i<$length; $i++) { ?>
							<tr>
								<td><?php echo $i+1 ?></td>
								<td><?php echo $student[$i]['std_enroll_detail_std_id'] ?></td>
								<?php $stdId = $student[$i]['std_enroll_detail_std_id'];
									  $stdName = Yii::$app->db->createCommand("SELECT std_name FROM std_personal_info  WHERE std_id = '$stdId'")->queryAll();?>
								<td><?php echo $stdName[0]['std_name'] ?></td>
								<td>
									<input type="radio" name="std<?php echo $i+1?>" value="P" checked="checked" />Present
									<input type="radio" name="std<?php echo $i+1?>" value="A" />Absent
									<input type="radio" name="std<?php echo $i+1?>" value="L" />Leave
								</td>
							</tr>
					<?php
						$stdAttendId[$i] = $stdId;
						//closing for loop
						}
					?>
					</table>
				</div>

			</div><hr>
			<div class="col-md-2">
	                <div class="form-group">
	                	<?php foreach ($stdAttendId as $value) {
	                		echo '<input type="hidden" name="stdAttendance[]" value="'.$value.'">';
	                	}
	                	?>
	                	<input type="hidden" name="length" value="<?php echo $length; ?>">
	                	<input type="hidden" name="classid" value="<?php echo $classid; ?>">
	                	<input type="hidden" name="date" value="<?php echo $date; ?>">
	                    <button type="submit" name="save" class="btn btn-info form-control">Save Attendance</button>
	                </div>    
	        </div>
	    </form> 
		<?php 
		// closing of if isset
			} ?>	
	</div>
	<!-- container-fluid close -->	

	<?php 	
		if (isset($_POST["save"])) {
				$classid = $_POST["classid"];
				$date = $_POST["date"];
				$length = $_POST["length"];
				$stdAttendId = $_POST["stdAttendance"];
				for($i=0; $i<$length;$i++){
					$q=$i+1;
					$std = "std".$q;
					$status[$i] = $_POST["$std"];
				}
				$techerEmail = Yii::$app->user->identity->email;
				$teacherId = Yii::$app->db->createCommand("SELECT emp.emp_id FROM emp_info as emp WHERE emp.emp_email = '$techerEmail'")->queryAll();

				//var_dump($status);
				for($i=0; $i<$length; $i++){
					$attendance = Yii::$app->db->createCommand()->insert('std_attendance',[
						'teacher_id' => $teacherId[0]['emp_id'],
						'class_id' => $classid,
						'date' => $date,
						'student_id' => $stdAttendId[$i],
						'status' => $status[$i],
					])->execute();
				}
		}
	 ?>


</body>
</html>