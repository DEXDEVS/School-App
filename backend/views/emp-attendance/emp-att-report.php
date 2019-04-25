<?php 

	$empInfo = Yii::$app->db->createCommand("SELECT * FROM emp_info")->queryAll();
	$countEmp = count($empInfo);

 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
			<div class="box box-default">
				<div class="box-header">
					<h2 style="text-align: center;">Attendance Report</h2>
					<p style="text-align: center;background-color:lightgray;">Monthly</p>
				</div><hr>
				<div class="box-body">
					<form method="POST" action="emp-att-report">
						<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">
						<div class="form-group">
							<label>Select Employee</label>
							<select name="emp_id" class="form-control">
								<option value="">-- Select Employee --</option>
								<?php  

								for ($i=0; $i <$countEmp ; $i++) { 
									$empName = $empInfo[$i]['emp_name'];
								?>
								<option value="<?php echo $empInfo[0]['emp_id']; ?>">
									<?php echo $empName; ?>
								</option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<label>Select Month</label>
							<input type="month" name="month_report" class="form-control">
						</div>
						<button class="btn btn-success btn-xs btn-block" type="submit" name="report">View Report</button>
					</form>
				</div>
			</div>
		</div>
		<?php 

		if(isset($_POST['report'])){

			$emp_id = $_POST['emp_id'];
			$month_report = $_POST['month_report'];

			$year = date('Y',strtotime($month_report));
			$month = date('m',strtotime($month_report));

			$dateObj   = DateTime::createFromFormat('!m', $month);
			$month_name = $dateObj->format('F');
			$days = cal_days_in_month(CAL_GREGORIAN, $month,$year);
			

 		?>
		<div class="col-md-9">
			<div class="box box-default">
				<div class="box-header">
					<h2>Report For the Month <?php 
						
						echo $month_name;

						?>
					</h2>
					<p>
						<?php
						$empName = Yii::$app->db->createCommand("SELECT emp_name FROM emp_info WHERE emp_id = '$emp_id'")->queryAll();
						echo $empName[0]['emp_name'];

					 	?>
					 </p>
				</div>
				<div class="box-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Sr.#</th>
								<th>Attendance Date</th>
								<th>Attendance</th>
								<th>Check In</th>
								<th>Check Out</th>
								
							</tr>
						</thead>
						<tbody>
							<?php 

							for($i = 1; $i<= $days; $i++){
								$var = $year."-".$month."-".$i;
							   	$day  = date('Y-m-d',strtotime($var));

							   	$attReport = Yii::$app->db->createCommand("SELECT * FROM emp_attendance WHERE emp_id = '$emp_id' AND att_date = '$day'")->queryAll();
							   	
							   	print_r($attReport);
							   	$result = date("l", strtotime($day));
							
							 ?>
							<tr>
								<td><?php echo $i; ?></td>
								<td><?php echo date('d-m-Y',strtotime($day)); ?></td>
								<td>
									<?php 
									if(empty($attReport)){
										echo "-";
									} else {
										echo $attReport[0]['attendance'];
									}

								 	?>
								 </td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
</div>
</body>
</html>