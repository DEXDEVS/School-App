<?php 

	$exam_category 	= $_GET['exam_category'];
	$class_id 		= $_GET['class_id'];
	$exam_type 	= $_GET['exam_type'];

	$ClassName = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$class_id'")->queryAll();

	$ClassSections = Yii::$app->db->createCommand("SELECT std_enroll_head_id,std_enroll_head_name FROM std_enrollment_head WHERE class_name_id = '$class_id'")->queryAll();
	$CountClassSections = count($ClassSections);

 ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<!-- back button start -->
	 <ol class="breadcrumb">
      <li><a class="btn btn-primary btn-xs" href="exam-lists?id=<?php echo $exam_category; ?>"><i class="fa fa-backward"></i> Back</a></li>
    </ol>
	<!-- back button close -->
	<div class="row">
		<div class="col-md-6">
			<div class="table table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="2">
								<?php echo $ClassName[0]['class_name']; ?>
							</th>
						</tr>
						<tr>
							<th>Sr.#</th>
							<th>Sections</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						for ($i=0; $i <$CountClassSections ; $i++) { 
						$headId = $ClassSections[$i]['std_enroll_head_id'];
						 ?>
						<tr>
							<td><?php echo $i+1; ?></td>
							<td>
								<a href="./view-marks-sheet?exam_category=<?php echo $exam_category;?>&class_head=<?php echo $headId;?>&exam_type=<?php echo $exam_type;?>">
									<?php echo $ClassSections[$i]['std_enroll_head_name']; ?>	
								</a>
							</td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>