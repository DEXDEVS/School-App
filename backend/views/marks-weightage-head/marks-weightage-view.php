<?php 
echo "ghjgfhldgshjl";
	// $id = $_GET['id'];
	// $examCatId = Yii::$app->db->createCommand("SELECT mwh.exam_category_id 
	// FROM marks_weightage_head as mwh
	// WHERE mwh.marks_weightage_id = '$id'")->queryAll();
	// $catId = $examCatId[0]['exam_category_id'];
	
	// $examCatName = Yii::$app->db->createCommand("SELECT category_name 
	// FROM exams_category
	// WHERE exam_category_id = '$catId'")->queryAll();

	// $marksWeightageDetails = Yii::$app->db->createCommand("SELECT mwh.exam_category_id,mwh.class_id,mwh.subjects_id,mwd.weightage_type_id,mwd.marks
	// FROM marks_weightage_head as mwh
	// INNER join marks_weightage_details as mwd
	// ON mwh.marks_weightage_id = mwd.weightage_head_id 
	// WHERE mwh.exam_category_id = '$catId'")->queryAll();
	// $countWightageDetail = count($marksWeightageDetails);



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
				<div class="box-header" style="text-align: center;padding:50px;">
					<h2><?php //echo $examCatName[0]['category_name']; ?></h2><p>Marks Weightage View</p>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="box box-default">
				<div class="box-header"></div>
				<div class="box-body">
					<div class="col-md-12">
					<table class="table table-hover">
						<thead>
							<tr style="background-color:lightgray;">
								<th colspan="3"><?php //echo $marksWeightageDetails[0]['class_id']; ?></th>
							</tr>
							<tr style="background-color:#ECF0F5;">
								<th colspan="3">Subject</th>
							</tr>
							<tr>
								<th>Sr.#</th>
								<th>Marks Weightage Type</th>
								<th>Marks</th>
							</tr>
						</thead>
					</table>
					</div>
					
					<?php 

					//for ($i=0; $i <$countWightageDetail ; $i++) { 
						

					 ?>
					
					<?php// } ?>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>