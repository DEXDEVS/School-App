 $('#feeDiscount').on('change',function(){
        var netValue = $('#feeAmount').val();
        var total = parseInt(netValue);
        var discount = $('#feeDiscount').val();
        var feeDiscount = parseInt(discount);

        if(discount == feeDiscount + '%'){
            
            amount = parseInt((total * feeDiscount)/100);

            $('#discountValue').val(amount);
        
            netTotal +=total - amount;
            $('#netTotal').val(netTotal);
            $('#feeAmount').val(''); 
            $('#feeDiscount').val('');
        } else {
            amountt = parseInt(total - feeDiscount);
            $('#discountValue').val(feeDiscount);
        
            netTotal += amountt;
            $('#netTotal').val(netTotal);
            $('#feeAmount').val(''); 
            $('#feeDiscount').val('');
        }
    });  


   

        //discount area
         $('#check_discount').on('click',function(){
                var checkdiscount = document.getElementById('check_discount');
                
                if(checkdiscount.checked == true){
                        //display discount fields
                        $('#one').show();
                        $('#two').show();
                    }else{
                        //else original values set in nettotal fields
                        $('#one').hide();
                        $('#two').hide();
                    }
            
        });