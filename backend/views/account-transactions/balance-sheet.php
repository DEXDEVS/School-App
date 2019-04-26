<!DOCTYPE html>
<html>
<head>
	<title>Balance Sheet</title>
</head>
<body>
<div class="container-fluid" style="margin-top: -30px;">  
  <div class="row">
    <div class="col-md-12">
      <h2 class="well well-sm" align="center" style="font-family: serif;">Balance Sheet</h2>
    </div>
  </div>
  <div class="row">
    <form method="post" action="">
      <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
      <div class="col-md-3">
       <label>Start Date:</label>
        <div class="input-group">
          <div class="input-group-addon">
            <i class="fa fa-calendar" style="color: #3C8DBC"></i>
          </div>
          <input type="date" class="form-control" name="start_date" required="">
        </div>
      </div>
      <div class="col-md-3">
       <label>End Date:</label>
        <div class="input-group">
          <div class="input-group-addon">
            <i class="fa fa-calendar" style="color: #3C8DBC"></i>
          </div>
          <input type="date" class="form-control" name="end_date" required="">
        </div>
      </div>
      <div class="col-md-3" style="margin-top: 25px">
        <button type="submit" name="submit" class="btn btn-success btn-flat">
          <i class="fa fa-sign-in"></i><b> Get Report</b>
        </button>
      </div>
    </form>    
  </div>
  <?php  
    if (isset($_POST['submit'])) {
      $start_date = $_POST['start_date'];
      $end_date = $_POST['end_date'];
      // getting user branch_id....
      $branch_id = Yii::$app->user->identity->branch_id;

    $income = Yii::$app->db->createCommand("SELECT description, total_amount, date FROM account_transactions WHERE branch_id = '$branch_id' AND account_nature = 'Income' AND CAST(date AS DATE) >= '$start_date' AND CAST(date AS DATE) <= '$end_date'")->queryAll();

    $expense = Yii::$app->db->createCommand("SELECT description, total_amount, date FROM account_transactions WHERE branch_id = '$branch_id' AND account_nature = 'Expense' AND CAST(date AS DATE) >= '$start_date' AND CAST(date AS DATE) <= '$end_date'")->queryAll();
    $count = count($income);

  ?><hr>
  <!-- table start-->
  <div class="row">
    <div class="col-md-6">
      <table class="table table-responsive table-bordered table-striped table-hover">
        <thead>
          <tr class="bg-navy">
            <th>Sr. #</th>
            <th>Income</th>
            <th>Amount</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($income as $key => $value) { ?>
          <tr>
            <td><?php echo $key+1; ?></td>
            <td><?php echo $value['description']; ?></td>
            <td><?php echo $value['total_amount']; ?></td>
            <td><?php echo $value['date']; ?></td>
          </tr>
          <?php
          } ?>
        </tbody>
      </table>
    </div>
    <!-- expense -->
    <div class="col-md-6">
      <table class="table table-responsive table-bordered table-striped table-hover">
        <thead>
          <tr class="bg-navy">
            <th>Sr. #</th>
            <th>Expense</th>
            <th>Amount</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($expense as $key => $value) { ?>
          <tr>
            <td><?php echo $key+1; ?></td>
            <td><?php echo $value['description']; ?></td>
            <td><?php echo $value['total_amount']; ?></td>
            <td><?php echo $value['date']; ?></td>
          </tr>
          <?php
          } ?>
        </tbody>
      </table>
    </div>
  </div>
  <?php 
    } 
    // ending of isset...
  ?>
  <!-- table close -->
</div>
</body>
</html>