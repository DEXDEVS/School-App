<?php	 
$connection = mysqli_connect('localhost','root','','school_db');
	
		$class_Id      	  = $_POST['class_Id'];
		$std      		  = $_POST['std'];
		$month      	  = $_POST['month'];
		$date      		  = $_POST['date'];
		$total_amount     = $_POST['total_amount'];
		$total_discount   = $_POST['total_discount'];
		$fee_type         = $_POST['fee_type'];
        $fee_amount       = $_POST['fee_amount'];
        $fee_discount     = $_POST['fee_discount']; 
        $discounted_value = $_POST['discounted_value']; 

        $insert = "INSERT INTO fee_transaction_head VALUES(null,'$class_Id','$std','$month','$date',
		                        '$total_amount','$total_discount','2018-11-06 12:16:18','2018-11-06 12:16:18','1','0')";
		$query = mysqli_query($connection, $insert);
		if($query){
			
			$select = "SELECT * FROM fee_transaction_head WHERE std_class_id ='$class_Id' AND std_id ='$std'";
			$query_select = mysqli_query($connection,$select);
			$fetch = mysqli_fetch_assoc($query_select);
			$id = $fetch['fee_trans_id'];
			if($fetch){
				$length = count($fee_type);

				for($i=0; $i<$length; $i++)
				{
				$insert_detail = "INSERT INTO fee_transaction_detail VALUES(null,'$id','$fee_type[$i]','$fee_amount[$i]','$fee_discount[$i]','$discounted_value[$i]','2018-11-06 12:16:18','2018-11-06 12:16:18','1','0');";
				$detail_query = mysqli_query($connection,$insert_detail);
				}
				if($detail_query){
					echo true;
				} else {
					echo "fail";
				}
			}
		}				
?> 
