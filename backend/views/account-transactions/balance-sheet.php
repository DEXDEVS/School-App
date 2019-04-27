<!DOCTYPE html>
<html>
<head>
	<title>Balance Sheet</title>
</head>
<body>
<div class="container-fluid" style="margin-top: -30px;">  
  <div class="row">
    <div class="col-md-12">
      <h2 class="well well-sm" align="center" style="font-family: serif;"><b><i>Balance Sheet</i></b></h2>
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
      // getting income...
      $income = Yii::$app->db->createCommand("SELECT description, total_amount, date FROM account_transactions WHERE branch_id = '$branch_id' AND account_nature = 'Income' AND CAST(date AS DATE) >= '$start_date' AND CAST(date AS DATE) <= '$end_date'")->queryAll();
      // getting expense...
      $expense = Yii::$app->db->createCommand("SELECT description, total_amount, date FROM account_transactions WHERE branch_id = '$branch_id' AND account_nature = 'Expense' AND CAST(date AS DATE) >= '$start_date' AND CAST(date AS DATE) <= '$end_date'")->queryAll();
  ?><hr>
  <!-- Income -->
  <div class="row">
    <div class="col-md-6">
      <table class="table table-responsive table-bordered table-striped table-hover">
        <thead>
          <tr class="info">
            <th colspan="4" class="text-center">
              <b><i>Income Statments</i></b>
            </th>
          </tr>
          <tr class="bg-navy">
            <th><i>Sr. #</i></th>
            <th><i>Income Description</i></th>
            <th><i>Amount</i></th>
            <th><i>Date</i></th>
          </tr>
        </thead>
        <tbody>
          <?php $totalIncome = $totalExpense = 0; ?>
          <?php foreach ($income as $key => $value) { ?>
          <tr>
            <td width="55px" class="text-center">
              <b><i><?php echo $key+1; ?></i></b>
            </td>
            <td><?php echo $value['description']; ?></td>
            <td><?php echo number_format($value['total_amount'], 0); ?></td>
            <td><?php echo date("d-M-Y", strtotime($value['date'])); ?></td>
          </tr>
          <?php
            $totalIncome += $value['total_amount'];
          } ?>
        </tbody>
      </table>
    </div>
    <!-- Expense -->
    <div class="col-md-6">
      <table class="table table-responsive table-bordered table-striped table-hover">
        <thead>
          <tr class="info">
            <th colspan="4" class="text-center">
              <b><i>Expense Statments</i></b>
            </th>
          </tr>
          <tr class="bg-navy">
            <th><i>Sr. #</i></th>
            <th><i>Expense Description</i></th>
            <th><i>Amount</i></th>
            <th><i>Date</i></th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($expense as $key => $value) { ?>
          <tr>
            <td width="55px" class="text-center">
              <b><i><?php echo $key+1; ?></i></b>
            </td>
            <td><?php echo $value['description']; ?></td>
            <td><?php echo number_format($value['total_amount'], 0); ?></td>
            <td><?php echo date("d-M-Y", strtotime($value['date'])); ?></td>
          </tr>
          <?php
            $totalExpense += $value['total_amount'];
          } ?>
        </tbody>
      </table>
    </div>
    <!-- Balance -->
    <div class="row">
      <div class="col-md-6">
        <table class="table table-responsive table-striped table-bordered table-hover">
          <tbody>
            <tr class="success">
              <th class="text-center"><i>Total Income</i></th>
              <th class="text-center"><i><?php echo number_format($totalIncome, 0); ?></i></th>
            </tr>
            <tr class="danger">
              <th class="text-center"><i>Total Expense</i></th>
              <th class="text-center"><i><?php echo number_format($totalExpense, 0); ?></i></th>
            </tr>
            <tr class="info">
              <th class="text-center"><i>Remaining Balance</i></th>
              <th class="text-center"><i><?php echo number_format($totalIncome - $totalExpense, 0); ?></i></th>
            </tr>
          </tbody>
        </table>
      </div>
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