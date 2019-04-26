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
					<h2 style="text-align: center;">Employee Attendance</h2>
				</div><hr>
				<div class="box-body">
					<form method="POST">
						<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">
						<div class="form-group">
							<label>Date</label>
							<input type="date" name="date"   class="form-control" required >
						</div>
						<button class="btn btn-success btn-xs btn-block" type="submit" name="getEmp">View Report</button>
					</form>
				</div>
			</div>
		</div>
		<?php 

		if(isset($_POST['getEmp'])){

			$date = $_POST['date'];
			$empAttId = array();
			$empIds = Yii::$app->db->createCommand("SELECT emp_id FROM emp_attendance WHERE att_date = '$date'")->queryAll();
			foreach ($empIds as $key => $value) {
				$empAttId[$key] = $value['emp_id'];
			}

			$empInfoId = array();
			$empIds_2 = Yii::$app->db->createCommand("SELECT emp_id FROM emp_info")->queryAll();
			foreach ($empIds_2 as $key => $value) {
				$empInfoId[$key] = $value['emp_id'];
			}
			$result = array();
			$result=array_diff($empInfoId,$empAttId);
			$resultCount = count($result);


 		?>
		<div class="col-md-9">
			<div class="box box-default">
				<div class="box-header">
				 
				</div>
				<div class="box-body">
					<form method="POST" action="final-attendance">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Sr.#</th>
									<th>Name</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<?php 
									$sr = 0;
									foreach ($result as $key => $value) {
									 	$empName = Yii::$app->db->createCommand("SELECT emp_name FROM emp_info
									 	WHERE emp_id = '$value'")->queryAll();
								 ?>
								<tr>
									<td><?php echo $sr+1; 
										$sr++;
									?></td>
									<td><?php echo $empName[0]['emp_name']; ?></td>
									<td>Not Updated</td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
						<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">
						<input type="hidden" name="date" value="<?php echo $date; ?>">
						<?php 

						foreach ($result as $key => $valu) { ?>

							<input type="hidden" name="absent[]" value="<?php echo $valu; ?>">
						<?php } ?>
						<button name="absent_emp" type="submit" class="btn btn-danger btn-sm" style="float: right;">Mark Absent</button>
					</form>
				</div>
			</div>
		</div>
		<?php } ?>
		<?php 


		if(isset($_POST['absent_emp']))
		{
			$absentDate = $_POST['date'];
			$employee_id = $_POST['absent'];
			$countEmployee_id = count($employee_id);

			$transection = Yii::$app->db->beginTransaction();
			try
			{

				for ($i=0; $i <$countEmployee_id ; $i++) { 
				$emp_absent = Yii::$app->db->createCommand()->insert('emp_attendance',[
	            			'emp_id' 		=> $employee_id[$i],
							'att_date' 		=> $absentDate,
							'check_in' 		=> '00:00:00',
							'check_out'		=> '00:00:00' ,
							'attendance'	=> 'A',
							'created_at'	=> new \yii\db\Expression('NOW()'),
							'created_by'	=> Yii::$app->user->identity->id, 
						])->execute();
				}
			if($emp_absent){
				$transection->commit();
				Yii::$app->session->setFlash('success', "Absentees marked successfully...!!!");
				}
			} // closing of try
			catch(Exception $e){
				$transection->rollback();
				echo $e;
				Yii::$app->session->setFlash('danger', "Not marked...Try again...!!!");
			} // closing of catch

		}

		 ?>
	</div>
</div>
</body>
</html>