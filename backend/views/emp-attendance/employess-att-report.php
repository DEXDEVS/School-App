<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<form method="POST" action="employess-att-report">
			<input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">
			
				<div class="col-md-3">
						<div class="form-group">
							<label><i class="glyphicon glyphicon-calendar"></i> Select Month</label>
							<input type="month" name="att_month" class="form-control">
						</div>
				</div>
				<div class="col-md-3">
					<button type="submit" name="report" class="btn btn-success" style="margin-top:25px;"><i class="glyphicon glyphicon-eye-open"></i> View Report</button>
				</div>
		</form>
	</div>
    <?php if(isset($_POST['report'])){ ?>
    <div class="row">
    <div class="col-md-10">
<table class="table table-hover table-bordered">
    <thead>
        <tr style="background-color:#008D4C;color:white;">
        <th>Sr.#</th>
        <th>Name</th>
<?php 
    for ($i=1; $i <=30 ; $i++) { ?>
            <th style="padding:1px 1px;"><?php echo $i; ?><br><?php echo date('D'); ?></th>
<?php } ?>
        <th>P</th>
        <th>A</th>
        <th>L</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td style="padding:0px ;width: 5px;">Kinza Mustafa</td>
            <?php 
            for ($i=0; $i <=30 ; $i++) { ?>
            <td style="padding:1px 1px;">P</td>
<?php } ?>
        <td>23</td>
        <td>5</td>
        <td>2</td>
        </tr>
    </tbody>
</table>
    </div>
</div>
    <?php } ?>
</div>
</body>
</html>