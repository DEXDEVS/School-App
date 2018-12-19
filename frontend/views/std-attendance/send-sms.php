<!DOCTYPE html>
<html>
<head>
	<title>Sending SMS</title>
</head>
<body>
<hr>
<div class="conatiner-fluid">
	<form method="POST">
	 	<div class="row">
	 		<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
			    	<div class="panel-heading"><h2>Message Panel</h2>
			    	</div>
			    	<div class="panel-body"> 	
			 			<input type="number" class="form-control" name="url_no" placeholder=" Enter IP No. like 102" maxlength="3"><br>
			    	 	<textarea type='message' name='message' class="form-control" rows="7" placeholder="Type Your Alert Message Here ..."></textarea>
			    	</div>
			    	<div class="panel-footer panel-primary">
			    		<input type='submit' name="submit" value='Send SMS' class="btn btn-block btn-success"  />
			    	</div>
			  </div>
			</div>
		</div>
	</form>
</div>	
</body>
</html>

<?php
	if (isset($_POST['submit'])) {
	$url_no = $_POST['url_no'];
	$message = $_POST['message'];
		
	$data = Yii::$app->db->createCommand("SELECT guardian_contact_no_1 FROM  std_guardian_info")->queryAll();
	$number = $data[0]['guardian_contact_no_1'];
		try{
		//$message = isset($_GET['message']) ? $_GET['message'] : null;

		$phoneNumber = $number;

		var_dump($number);
		 
		//$url_no = isset($_GET['url_no']) ? $_GET['url_no'] : null;
		
		$u="http://192.168.0.".$url_no.":8090/index.php?r=std-attendance/send-sms?username=Sadiq&password=1234&phone=";

		if($message !=null && $phoneNumber !=null){
			$url = $u.$phoneNumber."&message=".urlencode($message);

			echo $url;
			
			$curl = curl_init($url);
			curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
			$curl_response = curl_exec($curl);

			if($curl_response === false){
				$info = curl_getinfo($curl);
				curl_close($curl);
				die('Error occurred'.var_export($info));
			}

			curl_close($curl);

			$response  = json_decode($curl_response);
			if($response->status == 200)
			{
				echo "";
			}
			else
			{
				'Technical Problem';
			}
		}
	}
	catch(Exception $ex)
	{
		echo "Exception: ".$ex;
	}
}
?>