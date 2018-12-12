<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Fee Vocher</title>
	<style>
		.image img{
			float: left;
		}
		.h2{
			float: left;
			margin: 23px 15px;
			font-size: 24px;
		}
		.h4{
			float: left;
			margin: -20px 50px;
		}
		.span{
			float: left;
			margin-left: 100px;
		}
		.feeTable th{
			text-align: center;
		}
		.feeTable th td{
			border-spacing: 10px;
		}
	</style>
</head>
<body>
<div class="container">
    <form  action = "index.php?r=fee-transaction-detail/fee-voucher" method="POST">
    	<div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Class</label>
                    <select class="form-control" name="classid" id="classId">
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
            <!-- <div class="col-md-4">
                <div class="form-group">
                    <label>Select Student</label>
                    <select class="form-control" name="student" id="std">
							
					</select>        
                </div>    
            </div> -->
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Month</label>
                    <select class="form-control" name="month">
						<option value="1">January</option>
						<option value="2">Fabruary</option>
						<option value="3">March</option>
						<option value="4">April</option>
						<option value="5">May</option>
						<option value="6">June</option>
						<option value="7">July</option>
						<option value="8">August</option>
						<option value="9">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select>      
                </div>    
            </div>    
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-info">Submit</button>
                </div>    
            </div>
        </div>
    </form>    
</div>

<?php
	if(isset($_POST["submit"])){
		$classid = $_POST["classid"];
		$month = $_POST["month"];
		$months = Yii::$app->db->createCommand("SELECT * FROM month as m RIGHT JOIN fee_transaction_head as fth ON m.month_id = fth.month WHERE fth.month = '$month'")->queryAll();
		if(!empty($months)){
			$monthId = $months[0]["month_id"];
		}
		if(!empty($months) && $month == $monthId){

			$institue = Yii::$app->db->createCommand("SELECT * FROM institute ")->queryAll();
			$branch = Yii::$app->db->createCommand("SELECT * FROM branches WHERE branch_code = 002 ")->queryAll();
			$ids = Yii::$app->db->createCommand("SELECT class_name_id,session_id,section_id FROM std_class WHERE class_id = '$classid'")->queryAll();
			$stdIds = $ids[0];
			$className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$stdIds[class_name_id]'")->queryAll();
			$sessionName = Yii::$app->db->createCommand("SELECT session_name FROM std_sessions WHERE session_id = '$stdIds[session_id]'")->queryAll();
			$sectionName = Yii::$app->db->createCommand("SELECT section_name FROM std_sections WHERE section_id = '$stdIds[section_id]'")->queryAll();
			$student = Yii::$app->db->createCommand("SELECT sed.std_enroll_detail_id ,sed.std_enroll_detail_std_id FROM std_enrollment_detail as sed INNER JOIN std_enrollment_head as seh ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id WHERE seh.class_id = '$classid'")->queryAll();
			foreach ($student as $id =>$value) {
				$stdInfo = Yii::$app->db->createCommand("SELECT std_name , std_father_name  FROM std_personal_info WHERE std_id = '$value[std_enroll_detail_std_id]'")->queryAll();
				$feeDetail = Yii::$app->db->createCommand("SELECT *  FROM fee_transaction_detail as ftd INNER JOIN fee_transaction_head as fth ON fth.fee_trans_id = ftd.fee_trans_detail_head_id WHERE fth.std_id = '$value[std_enroll_detail_std_id]' AND fth.month = '$month'")->queryAll();
				// var_dump($feeDetail);
				// $stdMonth = $feeDetail['month'];
				// if(!empty($stdMonth) && $stdMonth == $month ){
				$feeType = Yii::$app->db->createCommand("SELECT fee_type_id,fee_type_name  FROM fee_type")->queryAll();
?>

<div id="print-content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 image">
				<img src="images/school_logo.jpg" class="image img-circle" width="90" height="90">
				<h2 class="h2"><?php echo $institue[0]['institute_name'] ?></h2>
				<h4 class="h4"><?php echo $branch[0]['branch_location'] ?> | Rahim Yar Khan</h4>
				<span class="span">Phone No: <?php echo $branch[0]['branch_contact_no'] ?></span>
			</div>
			<div class="col-md-6 image">
				<img src="images/school_logo.jpg" class="img-circle" width="90" height="90">
				<h2 class="h2"><?php echo $institue[0]['institute_name'] ?></h2>
				<h4 class="h4"><?php echo $branch[0]['branch_location'] ?> | Rahim Yar Khan</h4>
				<span class="span">Phone No: <?php echo $branch[0]['branch_contact_no'] ?></span>
			</div>
		</div><br>

		<div class="row">
			<div class="col-md-6">
				<div style="border: 1px solid; line-height: 2; height: 28px">
					<p align="center">
						<b><?php echo $months[0]["month_name"] ." - ". date('Y'); ?></b>
					</p>
				</div>
				<p style="background-color: black; color: white; padding: 5px"><b>Fee Receipt / Student Copy <span style="float: right;">Voucher # <?php echo $feeDetail[0]['fee_trans_detail_head_id'] ?></span></b></p>
				<div style="border: 1px solid; line-height: 2; height: 28px; margin-top: -10px">
					<p>
						<b>The Bank of Punjab, Abu Dhabi Road RYK.  &nbsp;|&nbsp;&nbsp;Account Number: 
							<?php echo $institue[0]['institute_account_no'] ?></b>
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div style="border: 1px solid; line-height: 2; height: 28px">
					<p align="center">
						<b><?php echo $months[0]["month_name"] ." - ". date('Y'); ?></b>
					</p>
				</div>
				<p style="background-color: black; color: white; padding: 5px"><b>Fee Receipt / Institue Copy <span style="float: right;">Voucher # <?php echo $feeDetail[0]['fee_trans_detail_head_id'] ?></span></b></p>
				<div style="border: 1px solid; line-height: 2; height: 28px; margin-top: -10px">
					<p>
						<b>The Bank of Punjab, Abu Dhabi Road RYK. &nbsp;|&nbsp;&nbsp;Account Number: <?php echo $institue[0]['institute_account_no'] ?></b>
					</p>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<table width="100%">
					<tr>
						<th>Student Name:</th>
						<td><?php echo $stdInfo[0]['std_name'] ?></td>
						<th>Father Name:</th>
						<td><?php echo $stdInfo[0]['std_father_name'] ?></td>
						<th>Roll #</th>
						<td><?php echo $student[$id]['std_enroll_detail_id'] ?></td>
					</tr>
					<tr>
						<th>Session:</th>
						<td><?php echo $sessionName[0]['session_name']?></td>
						<th>Class</th>
						<td><?php echo $className[0]['class_name']?></td>
						<th>Section</th>
						<td><?php echo $className[0]['class_name'] .'-'. $sectionName[0]['section_name']?></td>
					</tr>
					<tr>
						<th>Issue Date:</th>
						<td><?php echo date('d-m-Y') ?></td>
						<th>Due Date:</th>
						<td>10-11-2018</td>			
						<th>Valid Date:</th>
						<td>20-11-2018</td>		
					</tr>
				</table>
			</div>

			<div class="col-md-6">
				<table width="100%" style="border:1px">
					<tr>
						<th>Student Name:</th>
						<td><?php echo $stdInfo[0]['std_name'] ?></td>
						<th>Father Name:</th>
						<td><?php echo $stdInfo[0]['std_father_name'] ?></td>
						<th>Roll #</th>
						<td><?php echo $student[$id]['std_enroll_detail_id'] ?></td>
					</tr>
					<tr>
						<th>Session:</th>
						<td><?php echo $sessionName[0]['session_name']?></td>
						<th>Class</th>
						<td><?php echo $className[0]['class_name']?></td>
						<th>Section</th>
						<td><?php echo $className[0]['class_name'] .'-'. $sectionName[0]['section_name']?></td>
					</tr>
					<tr>
						<th>Issue Date:</th>
						<td><?php echo date('d-m-Y') ?></td>
						<th>Due Date:</th>
						<td>10-11-2018</td>			
						<th>Valid Date:</th>
						<td>20-11-2018</td>		
					</tr>
				</table>
			</div>
		</div><hr>

		<div class="row">
			<div class="col-md-6" >
				<table class="table table-danger feeTable" width="100%" border="1">
					<tr>
						<th>Sr #</th>
						<th colspan="2">Descrpition</th>
						<th>Amount</th>
					</tr>
					<?php foreach ($feeType as $index => $value) { ?>
					<tr>
						<td align="center"><?php echo ($index +1);?></td>
						<td colspan="2"><?php echo $feeType[$index]['fee_type_name'];?></td>
						<td align="center">
							<?php
								foreach ($feeDetail as $key => $value) { 
									if($feeDetail[$key]['fee_type_id'] == $feeType[$index]['fee_type_id'] ){
										echo $feeDetail[$key]['fee_amount'];
									}	
								} 
							?>
						</td>
					</tr>
					<?php } ?>	
				</table>
			</div>
			
			<div class="col-md-6" >
				<table class="table table-danger feeTable" width="100%" border="1">
					<tr>
						<th>Sr #</th>
						<th colspan="2">Descrpition</th>
						<th>Amount</th>
					</tr>
					<?php foreach ($feeType as $index => $value) { ?>
					<tr>
						<td align="center"><?php echo ($index +1);?></td>
						<td colspan="2"><?php echo $feeType[$index]['fee_type_name'];?></td>
						<td align="center">
							<?php
								foreach ($feeDetail as $key => $value) { 
									if($feeDetail[$key]['fee_type_id'] == $feeType[$index]['fee_type_id'] ){
										echo $feeDetail[$key]['fee_amount'];
									}	
								} 
							?>
						</td>
					</tr>
					<?php } ?>	
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 right">
				<table class="table">
					<tr>
						<th>Current Vocher Total:</th>
						<td> <?php echo $feeDetail[0]['total_amount'];?> </td>
					</tr>
					<tr>
						<th>Previous Dues:</th>
						<td> <?php echo $feeDetail[0]['remaining'];?> </td>
					</tr>
					<tr>
						<th>Receivable within due date:</th>
						<td> <b><?php echo $feeDetail[0]['total_amount'];?></b> </td>
					</tr>
				</table>
			</div>
			<div class="col-md-6 right">
				<table width="100%" class="table">
					<tr>
						<th>Current Vocher Total:</th>
						<td> <?php echo $feeDetail[0]['total_amount'];?> </td>
					</tr>
					<tr>
						<th>Previous Dues:</th>
						<td> <?php echo $feeDetail[0]['remaining'];?> </td>
					</tr>
					<tr>
						<th>Receivable within due date:</th>
						<td> <b><?php echo $feeDetail[0]['total_amount'];	?></b></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<table class="table table-condensed table-bordered" height="50px">
					<tr>
						<td align="center"><b>Bank Stamp + Sign</b></td>
						<td align="center"><b>Receiving Date</b></td>
						<td align="center"><b>Amount Received</b></td>
					</tr>
					<tr>
						<td align="center">.</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>

			<div class="col-md-6">
				<table class="table table-condensed table-bordered" height="50px">
					<tr>
						<td align="center"><b>Bank Stamp + Sign</b></td>
						<td align="center"><b>Receiving Date</b></td>
						<td align="center"><b>Amount Received</b></td>
					</tr>
					<tr>
						<td align="center">.</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<p>A fine of Rs. 100 will be charged after due date. This voucher is not valid after the date of validity and bank will not receive it. For unpaid fee voucher, a fine of Rs. 200 will be charged in the voucher of next month.</p>
			</div>
			<div class="col-md-6">
				<p>A fine of Rs. 100 will be charged after due date. This voucher is not valid after the date of validity and bank will not receive it. For unpaid fee voucher, a fine of Rs. 200 will be charged in the voucher of next month.</p>
			</div>
		</div><hr>
	</div>
	<!-- container-fluid close -->
	<?php 
		//ending of if statement
	// } else {
	// 	echo "blah blah";
	// }
		//enfing of foreach loop
		}
	 ?>
</div>
<!-- print-content close -->

<right style="float: right;">
    <button class="btn btn-warning hidden-print" id="btnprint" onclick="printDiv('print-content')"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print </button>
</right>

<script type="text/javascript">
	function printDiv(divName) {
	    //var ButtonControl = document.getElementById("btnprint");
	    // show html content...
	    var printContents = document.getElementById(divName).innerHTML;
	    w=window.open();
	    w.document.write(printContents);
	    w.print();
	    w.close();	
	}
</script>
<?php
	// ending of if statement
	} else {
		echo "Please Select a valid month";
	}
//ending of isset if
}
?> 
</body>
</html>