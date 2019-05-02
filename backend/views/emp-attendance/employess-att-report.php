<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<form method="POST" action="employee-att-report">
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
	<?php 

	//if(isset($_POST['report'])) {

	 ?>
	<div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header label-success">
                <h3 class="box-title"><?php //echo $className[0]['class_name']; ?></h3>
                <h3 class="box-title" style="float: right;"><?php //echo "Attendance ( ".$currentMonth." )"; ?></h3>
            </div>
            <!-- /.box-header -->
            <!-- <?php //for ($row=0; $row <$rowCount ; $row++) {  ?> -->
            <div class="box-body table-responsive no-padding">
                <table class="table table-hover table-bordered table-striped">
            
                <tr>
                  	<th rowspan="2">Sr<br>#</th>
					<th rowspan="2">Roll<br>#</th>
					<th rowspan="2">Student<br>Name</th>
					<!-- <?php 
                    $subjectCount //=0;    
                        // print 7 dates in a row
                        //for ($date=0; $date < 7 ; $date++) { 
                          // if($dateCount < $lastDate){
                               //echo "<th colspan='6' style='text-align: center;'>$dateArray[$dateCount]  $dayArray[$dateCount]</th>";    
                              // $datesArray[$date] = $dateArray[$dateCount];  
                              //  $subjectCount++;
                           // }
                            //end of if
                           // $dateCount++;  
                       // }
                        //end of $date loop
					?> -->
                </tr>
                <tr>
                	<!-- <?php 
                    //for ($r=0; $r <$subjectCount ; $r++) { 
                        //loop to print subjects
                		//for ($s=0; $s <$subjectlength ; $s++) { ?>
						//<th style='padding: 1px 1px'><?php //echo $subjectAlias[$s]; ?></th>
					<?php	
                     //   }
                   // } 
                	?> -->
                </tr>

                <?php   //print students
                        //for( $std=0; $std<$studentLength; $std++) {  ?>
                            <tr>
                                <td><?php //echo $std+1; ?></td>
                                <td><?php //echo $student[$std]['std_roll_no']; ?></td>
                            
                                <td><?php// echo $stdName[0]['std_name']; ?></td>

                                <?php 
                                //loop for 1 to 7 dates
                                // for ($r=0; $r <$subjectCount ; $r++) {
                                //     $date = $datesArray[$r];
                                //     for ($s=0; $s <$subjectlength ; $s++) {
                                //         $subId = $subjectId[$s]; 
                                //         $attendance = Yii::$app->db->createCommand("SELECT CAST(date AS DATE),subject_id,status,student_id FROM std_attendance WHERE class_name_id = '$classid' AND session_id = '$sessionid' AND section_id = '$sectionid' AND CAST(date AS DATE) = '$date' AND subject_id = '$subId' AND teacher_id = '$teacher_id' AND branch_id = '$branch_id'")->queryAll();
                                //         $attendanceArr[$s] = $attendance; 
                                        ?> 
                                    <td><?php
                                   // if(!empty($attendanceArr[$s][$std]['status'])){
                                      //  echo $attendanceArr[$s][$std]['status']; 
                                   // } else {
                                      //  echo "";
                                  //  }
                                    ?>
                                    </td>
                                <?php 
                                          
                                  //  } //end of $s loop
                               // } //end of $r loop ?>   
                        </tr>
                    <?php// }//end of $std loop 
                         ?> 
                
              </table>
                    
              
            <?php 
                    //}//end of $row loop ?>
            <!-- /.box-body -->
          </div>
          <hr>
        <div class="row">
            <div class="col-md-5">
                <table class="table-bordered table table-condensed">
                    <tr class="label-success">
                        <th colspan="3" class="text-center">Lectures</th>
                    </tr>
                    <tr>
                        <th>Previous Lectures</th>
                        <th>Current Lectures</th>
                        <th>Total Lectures</th>
                    </tr>
                    <tr align="center">
                        <td>24</td>
                        <td>24</td>
                        <td>48</td>
                    </tr>       
                </table>
            </div>
            <div class="col-md-6 col-md-offset-1">
              <table class="table-bordered table table-condensed">
                <tr class="label-success">
                    <th colspan="4" class="text-center">Attendance</th>
                </tr>
                <tr>
                    <th>Previous Percentage</th>
                    <th>Month Attendance</th>
                    <th>Total</th>
                    <th>% Percentage</th>
                </tr>
                <tr align="center">
                    <td>90%</td>
                    <td>- - -</td>
                    <td>- - -</td>
                    <td>- - -</td>
                </tr>       
              </table>
            </div>
        </div>
        <hr>

            </div>
          <!-- /.box -->
        </div>
    </div>
	<?php//} ?>
</div>
</body>
</html>