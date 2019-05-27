<body onload="window.print();" onafterprint="returnBack()">
<!-- onload="window.print();" -->
<?php  
  // Get `emp_id` from `emp_info` table
  $id = $_GET['id'];
  // Employee Personal Info..... 
  $empInfo = Yii::$app->db->createCommand("SELECT * FROM emp_info WHERE emp_id = '$id'")->queryAll();
  // Get `emp_designation_id` from `emp_info` table
  $empDesignationId = $empInfo[0]['emp_designation_id'];
  // Employee `desigantion_name` from `emp_designation` table against `$empDesignationId`
  $emp_designation = Yii::$app->db->createCommand("SELECT * FROM emp_designation WHERE emp_designation_id = '$empDesignationId'")->queryAll();
  $empDesignationName = $emp_designation[0]['emp_designation'];
?>

<!-- ID Card Modal start -->
<?php 
$empID    = $empInfo[0]['emp_reg_no'];
$empName  = $empInfo[0]['emp_name'];
$empfName = $empInfo[0]['emp_father_name'];
$empCnic  = $empInfo[0]['emp_cnic'];
$empPhone = $empInfo[0]['emp_contact_no'];
$empPhoto = $empInfo[0]['emp_photo'];
$empEmail = $empInfo[0]['emp_email'];
$empBarcode = $empInfo[0]['barcode'];
$empBlood = "A +ve";
?>
<div class="modal-body employee_card">  
<div class="row">
  <div class="col-md-12">
  <div id="id-card">  
    <img src="images/employee_card.png" width="100%" class="img-responsive" style="position: relative; top: 0; left: 0;">
    <!-- employee photo -->
    <img src="<?php echo $empPhoto; ?>" width="163px" height="163px" style="position: absolute; top: 183px; left: 197px; border-radius: 100px;">
    <!-- employee name -->
	<h3 style="font-family: verdana; position: absolute; top: 335px; left: 180px; color: #110037">
      <?php echo $empName; ?>
    </h3>
    <!-- employee father name -->
    <h5 style="font-family: verdana; position: absolute; top: 300px; right: 420px; color: #110037">
      <?php echo $empfName; ?>
    </h5>
    <!-- employee ID -->
    <h5 style="font-family: verdana; position: absolute; top: 418px; left: 250px; color: #110037">
      <b><?php echo $empID; ?></b>
    </h5>
    <!-- employee designation -->
    <h5 style="font-family: verdana; position: absolute; top: 445px; left: 250px; color: #110037">
      <b><?php echo $empDesignationName; ?></b>
    </h5>
    <!-- employee cnic -->
    <h5 style="font-family: verdana; position: absolute; top: 477px; left: 250px; color: #110037">
      <b><?php echo $empCnic; ?></b>
    </h5>
    <!-- employee phone -->
    <h5 style="font-family: verdana; position: absolute; top: 507px; left: 250px; color: #110037">
      <b><?php echo $empPhone; ?></b>
    </h5>
    <!-- employee phone -->
    <h5 style="font-family: verdana; position: absolute; top: 533px; left: 250px; color: #110037">
      <b><?php echo $empBlood; ?></b>
    </h5>

	<img src="<?php echo $empBarcode; ?>" style="position: absolute; top: 445px; right: 230px;">
  
  </div>
  </div>
</div>
</div>
</body>
<script>
function returnBack() {
  window.location='emp-info-view?id=<?php echo $id; ?>';
}
</script>