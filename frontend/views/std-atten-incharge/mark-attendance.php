
<?php 

if(isset($_POST["take-attendance"])){
    $class_head_id = $_POST['class_head_id'];
    $branch_id = $_POST['branch_id'];
    $teacherHeadId = $_POST['teacherHeadId'];
?>
<div class="container-fluid">
   <div class="row">
    <div class="col-md-3 col-md-offset-9">
        <a href="./attendance-by-incharge" style="float: right;background-color:#008d4c;color: white;padding:3px;border-radius:5px;"><i class="glyphicon glyphicon-backward"></i> Back</a>
    </div>
</div><br><!-- .row -->
    <div class="row">
        <div class="col-md-12">
            <div class="box box-success">
                <div class="box-header" style="padding:0px;background-color:#9cd1a6;">
                     <h2 class="text-center text-success">Class Attendance</h2>
                </div>
                <div class="box-body">
                    <form  action = "mark-attendance" method="POST">
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
                                    <label>Select Date</label>
                                    <input type="date" name="date" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <button type="submit" name="submit" class="btn btn-success form-control" style="margin-top: 25px;">
                                    <i class="fa fa-sign-in" aria-hidden="true"></i>    
                                    <b>Take Attendance</b></button>
                                </div> 
                            </div>
                        </div> <!-- .row  -->
                        <input type="hidden" name="branch_id" value="<?php echo $branch_id; ?>">
                        <input type="hidden" name="class_head_id" value="<?php echo $class_head_id; ?>">
                        <input type="hidden" name="teacherHeadId" value="<?php echo $teacherHeadId; ?>">
                    </form>
                </div> <!-- .box-body  -->
            </div> <!-- .box-danger  -->
        </div> <!-- .col-md-12 -->
    </div> <!-- .row -->
</div> <!-- .container-fluid -->
<?php
}

if(isset($_POST["submit"])){
    $class_head_id = $_POST['class_head_id'];
    $branch_id = $_POST['branch_id'];
    $date = $_POST['date'];
    $teacherHeadId = $_POST['teacherHeadId'];

    $classDetail = Yii::$app->db->createCommand("SELECT DISTINCT seh.class_name_id, seh.session_id, seh.section_id FROM std_enrollment_head as seh WHERE seh.std_enroll_head_id = '$class_head_id' AND seh.branch_id = '$branch_id'")->queryAll();

    $classnameid = $classDetail[0]['class_name_id'];
    $sessionid = $classDetail[0]['session_id'];
    $sectionid = $classDetail[0]['section_id'];

    $checkAttendance = Yii::$app->db->createCommand("SELECT * FROM std_atten_incharge as att WHERE att.teacher_id = '$teacherHeadId' AND att.class_name_id = '$classnameid' AND att.session_id = '$sessionid' AND att.section_id = '$sectionid' AND CAST(date AS DATE) = '$date' AND att.branch_id = '$branch_id'")->queryAll();
    if(!empty($checkAttendance)){
        Yii::$app->session->setFlash('warning', "You've already taken attendance for this class");
    } else {
        $students = Yii::$app->db->createCommand("SELECT seh.std_enroll_head_name,sed.std_enroll_detail_std_id,sed.std_enroll_detail_std_name, sed.std_roll_no
            FROM std_enrollment_detail as sed
            INNER JOIN std_enrollment_head as seh
            ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id
            WHERE sed.std_enroll_detail_head_id = '$class_head_id' AND seh.branch_id = '$branch_id'")->queryAll();

        $countstd = count($students);

?>
<div class="row container-fluid">
    <div class="col-md-12">
        <div class="box box-success">
            <div class="box-header" style="padding:3px;">
                <h2 class="text-center text-danger" style="font-family: georgia;">Take Attendance</h2><hr style="border-color:#9cd1a6;">
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <form method="POST" action="monthly-class-atten-view">
                            <table class="table">
                                <thead >
                                    <tr style="background-color:#9cd1a6;">
                                        <th style="">Sr #.</th>
                                        <th style="">Roll #.</th>
                                        <th style="">Name</th>
                                        <th style="">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    for ($i=0; $i <$countstd ; $i++) { 
                                     ?>
                                    <tr style="border-bottom:1px solid #9cd1a6 ;">
                                        <td><?php echo $i+1;?></td>
                                        <td><?php echo $students[$i]['std_roll_no']; ?></td>
                                        <td><?php echo $students[$i]['std_enroll_detail_std_name'];?></td>
                                        <td align="left">
                                            <input type="radio" name="std<?php echo $i+1?>" value="P" checked="checked"/> <b  style="color: green">P </b>
                                            <input type="radio" name="std<?php echo $i+1?>" value="A" /> <b style="color: red">A </b>
                                            <input type="radio" name="std<?php echo $i+1?>" value="L" /><b style="color: #F7C564;"> L</b>
                                        </td>
                                    </tr>
                                    <?php 
                                    $stdId = $students[$i]['std_enroll_detail_std_id'];
                                    $stdAttendId[$i] = $stdId;
                                    //closing for loop
                                    } 
                                    ?>
                                </tbody>
                            </table>
                            
                            <?php foreach ($stdAttendId as $value) {
                                    echo '<input type="hidden" name="stdAttendance[]" value="'.$value.'" style="width: 30px">';
                            } ?>
                                
                                <input class="form-control" type="hidden" name="countstd" value="<?php echo $countstd; ?>"> 
                                <input type="hidden" name="branch_id" value="<?php echo $branch_id; ?>" style="width: 30px">
                                <input type="hidden" name="teacherHeadId" value="<?php echo $teacherHeadId; ?>" style="width: 30px">
                                <input type="hidden" name="classnameid" value="<?php echo $classnameid; ?>" style="width: 30px">
                                <input type="hidden" name="sessionid" value="<?php echo $sessionid; ?>" style="width: 30px">
                                <input type="hidden" name="sectionid" value="<?php echo $sectionid; ?>" style="width: 30px">
                                <input type="hidden" name="date" value="<?php echo $date; ?>" style="width: 30px">
                            <br>
                            <button style="float: right;" type="submit" name="save" class="btn btn-success btn-flat btn-xs">
                                <i class="fa fa-sign-in"></i> <b>Take Attendance</b>
                            </button>       
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php        
    } // else of (!empty($checkAttendance))
} // if(isset($_POST['submit']))
?>

