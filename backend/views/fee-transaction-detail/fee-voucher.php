<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Fee Vocher</title>
	<link rel="stylesheet" href="print.css" type="text/css" media="print"/>
	<style>
		.image img{
			float: left;
		}
		.h2{
			float: left;
			margin: 15px 4px;
			font-weight: bold;
			font-size: 16px;
		}
		.h4{
			float: left;
			margin: -32px 80px;
			font-size: 14px;
		}
		.span{
			float: left;
			margin: -18px 100px;
			font-size: 14px;
		}
		.feeTable th{
			text-align: center;
		}
	</style>
	
</head>
<body>
<div class="container" style="margin-top: -60px;">
	<h1 class="well well-sm" align="center">Generate Voucher</h1>
    <form  action = "index.php?r=fee-transaction-detail/generate-voucher" method="POST">
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
</body>
</html>