$length = count($fee_type_id);

				for($i=0; $i<$length; $i++)
				{
				$insert_detail =Yii::$app->db->createCommand("INSERT INTO fee_transaction_detail VALUES(null,'$id','$fee_type[$i]','$fee_amount[$i]','$fee_discount[$i]','$discounted_value[$i]');");
				$detail_query = mysqli_query($connection,$insert_detail);
				}
				if($detail_query){
					echo "Success";
				} else {
					echo "fail";
				}

$(document).ready(function(){
                    $('#insert').click(function(){
                            var classId = $('#classId').val();
                            var std = $('#std').val();
                            var month = $('#month').val();
                            var date = $('#date').val();
                            var totalAmount = $('#totalAmount').val();
                            var totalDiscount = $('#totalDiscount').val();
                            $.ajax({
                            url:"ajax-request.php",
                            method: "POST",
                            data:{class_Id:classId, std:std, month:month, date:date, total_amount:totalAmount, total_discount:totalDiscount, fee_type:feeTypeArray, fee_amount:feeAmountArray, fee_discount:feeDiscountArray, discounted_value:discountValueArray},
                            
                            success:function(message)
                            {
                                alert(success);
                                //fee-transaction-detail/index.php                            
                            }
                            });                         
                        }); // click event
                });// ready     
