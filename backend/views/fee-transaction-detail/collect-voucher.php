<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Collect Voucher</title>
</head>
<body>

<div class="container-fluid" style="margin-top: -50px;">
	<h1 class="well well-sm" align="center">Voucher Collection</h1>
    <form method="POST">
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
                    <input type="number" name="voucher_no" class="form-control" placeholder="Enter Voucher Number...">
                </div>    
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Collect Voucher</button>
                </div>    
            </div>   
        </div>
    </form>

    <?php
    	if(isset($_POST["submit"])){
		$voucher_no = $_POST["voucher_no"];

    	$transactionHead = Yii::$app->db->createCommand("SELECT * FROM fee_transaction_head WHERE fee_trans_id = '$voucher_no'")->queryAll();
    ?>
	
	<div class="row">
		<div class="col-md-12">
			<form>
			<table class="table table-bordered" width="100%">
				<tr>
					<th>Student</th>
					<th>Class</th>
					<th>Month</th>
					<th>Total Amount</th>
					<th>Discount Amount</th>
					<th>Paid Amount</th>
					<th>Remaing Amount</th>
					<th>Status</th>
				</tr>
				<tr>
					<td>Qasim</td>
					<td>10th</td>
					<td>December</td>
					<td><input type="text" name="total_amount" class="form-control" id="total_amount" readonly="" value="<?php echo $transactionHead[0]['total_amount'] ?>" /></td>
					<td><input type="text" class="form-control" readonly="" value="<?php echo $transactionHead[0]['total_discount'] ?>"/></td>
					<td><input type="text" name="paid_amount" class="form-control" id="paid_amount" onchange="setAmount()" /></td>
					<td><input type="text" name="remaing_amount" class="form-control" id="remaing_amount" readonly="" /></td>
					<td><input type="text" name="status" class="form-control" id="status" readonly="" /></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
<?php } ?>
</div>

<script type="text/javascript">
    // setPhoneBrand value in income_name of income table...
    function setAmount() {
        var totalAmount = parseInt(document.getElementById('total_amount').value);
        var paidAmount = parseInt(document.getElementById('paid_amount').value);
        var remaingAmount = parseInt(totalAmount - paidAmount);
        console.log(remaingAmount);
        var paid = "Paid";
        var unPaid = "Unpaid";
        document.getElementById('remaing_amount').value = remaingAmount;
        if (remaingAmount==0) {
        	document.getElementById('status').value = paid;
        }
        else{
        	document.getElementById('status').value = unPaid;
        }
    }
</script>
	
</body>
</html>

