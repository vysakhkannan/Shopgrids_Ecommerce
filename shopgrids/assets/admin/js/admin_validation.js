// edit category validation
$(function(){

    $("#category_error_message").hide();
    $("#description_error_message").hide();


    var error_category = false;
    var error_description = false;




    $("#basicpill-firstname-input").focusout(function(){
        check_category();
     });
     $("#basicpill-address-input").focusout(function(){
        check_description();
     });



     function check_category() {
        var category = $("#basicpill-firstname-input").val();
        if ( category.length = 0 || category.length < 3 ) {

           $("#category_error_message").html("Should atleast contain 3 Characters").css("color","#F90A0A");
           $("#category_error_message").show();
           $("#basicpill-firstname-input").css("border-bottom","2px solid #F90A0A");
           error_category = true;
        } else {
           $("#category_error_message").hide();
           $("#basicpill-firstname-input").css("border-bottom","2px solid #34F458");

        }
        
        
     }
     function check_description() {
        var description = $("#basicpill-address-input").val();
        if ( description.length = 0 || description.length < 10 ) {

           $("#description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");
           $("#description_error_message").show();
           $("#basicpill-address-input").css("border-bottom","2px solid #F90A0A");
           error_description = true;
        } else {
           $("#description_error_message").hide();
           $("#basicpill-address-input").css("border-bottom","2px solid #34F458");

        }
        
        
     }

     $("#category_edit_id").submit(function() {
        error_category = false;
        error_description = false;

        check_category();
        check_description();


        if (error_category == false && error_description == false ) {
           return true;
        } else {
         Swal.fire('Fill the fields correctly')
           return false;
        }


     });

})


// add category validation
$(function(){

    $("#category_error_message").hide();
    $("#description_error_message").hide();


    var error_category = false;
    var error_description = false;




    $("#basicpill-firstname-input").focusout(function(){
        check_category();
     });
     $("#basicpill-address-input").focusout(function(){
        check_description();
     });



     function check_category() {
        var category = $("#basicpill-firstname-input").val();
        if ( category.length = 0 || category.length < 3 ) {

           $("#category_error_message").html("Should atleast contain 3 Characters").css("color","#F90A0A");;
           $("#category_error_message").show();
           $("#basicpill-firstname-input").css("border-bottom","2px solid #F90A0A");
           error_category = true;
        } else {
           $("#category_error_message").hide();
           $("#basicpill-firstname-input").css("border-bottom","2px solid #34F458");

        }
        
        
     }
     function check_description() {
        var description = $("#basicpill-address-input").val();
        if ( description.length = 0 || description.length < 10 ) {

           $("#description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");;
           $("#description_error_message").show();
           $("#basicpill-address-input").css("border-bottom","2px solid #F90A0A");
           error_description = true;
        } else {
           $("#description_error_message").hide();
           $("#basicpill-address-input").css("border-bottom","2px solid #34F458");

        }
        
        
     }

     $("#add_category_id").submit(function() {
        error_category = false;
        error_description = false;

        check_category();
        check_description();


        if (error_category == false && error_description == false ) {
           return true;
        } else {
         Swal.fire('Fill the fields correctly')
           return false;
        }


     });

})


// add sub category validation
$(function(){

   $("#sub_category_error_message").hide();
   $("#description_error_message").hide();


   var error_sub_category = false;
   var error_description = false;




   $("#basicpill-firstname-input").focusout(function(){
      check_sub_category();
    });
    $("#basicpill-address-input").focusout(function(){
       check_description();
    });



    function check_sub_category() {
       var category = $("#basicpill-firstname-input").val();
       if ( category.length = 0 || category.length < 3 ) {

          $("#sub_category_error_message").html("Should atleast contain 3 Characters").css("color","#F90A0A");
          $("#sub_category_error_message").show();
          $("#basicpill-firstname-input").css("border-bottom","2px solid #F90A0A");
          error_category = true;
       } else {
          $("#sub_category_error_message").hide();
          $("#basicpill-firstname-input").css("border-bottom","2px solid #34F458");

       }
       
       
    }
    function check_description() {
       var description = $("#basicpill-address-input").val();
       if ( description.length = 0 || description.length < 10 ) {

          $("#description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");
          $("#description_error_message").show();
          $("#basicpill-address-input").css("border-bottom","2px solid #F90A0A");
          error_description = true;
       } else {
          $("#description_error_message").hide();
          $("#basicpill-address-input").css("border-bottom","2px solid #34F458");

       }
       
       
    }

    $("#add_sub_category_form").submit(function() {
       error_sub_category = false;
       error_description = false;

       check_sub_category();
       check_description();


       if (error_sub_category == false && error_description == false ) {
          return true;
       } else {
         Swal.fire('Fill the fields correctly')
          return false;
       }


    });

})

// sub_category edit validation

$(function(){

   $("#sub_category_error_message").hide();
   $("#description_error_message").hide();


   var error_sub_category = false;
   var error_description = false;




   $("#basicpill-firstname-input").focusout(function(){
      check_sub_category();
    });
    $("#basicpill-address-input").focusout(function(){
       check_description();
    });



    function check_sub_category() {
       var category = $("#basicpill-firstname-input").val();
       if ( category.length = 0 || category.length < 3 ) {

          $("#sub_category_error_message").html("Should atleast contain 3 Characters").css("color","#F90A0A");
          $("#sub_category_error_message").show();
          $("#basicpill-firstname-input").css("border-bottom","2px solid #F90A0A");
          error_category = true;
       } else {
          $("#sub_category_error_message").hide();
          $("#basicpill-firstname-input").css("border-bottom","2px solid #34F458");

       }
       
       
    }
    function check_description() {
       var description = $("#basicpill-address-input").val();
       if ( description.length = 0 || description.length < 10 ) {

          $("#description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");
          $("#description_error_message").show();
          $("#basicpill-address-input").css("border-bottom","2px solid #F90A0A");
          error_description = true;
       } else {
          $("#description_error_message").hide();
          $("#basicpill-address-input").css("border-bottom","2px solid #34F458");

       }
       
       
    }

    $("#sub_category_edit_form").submit(function() {
       error_sub_category = false;
       error_description = false;

       check_sub_category();
       check_description();


       if (error_sub_category == false && error_description == false ) {
          return true;
       } else {
         Swal.fire('Fill the fields correctly')
          return false;
       }


    });

})


// product add validations

$(function(){

   $("#product_name_error_message").hide();
   $("#mrp_error_message").hide();
   $("#sale_price_error_message").hide();
   $("#stock_error_message").hide();
   $("#description_error_message").hide();
   $("#picture_error_message").hide();
   $("#picture2_error_message").hide();
   $("#picture3_error_message").hide();
   $("#picture4_error_message").hide();
   $("#picture5_error_message").hide();







   var error_product = false;
   var error_mrp = false;
   var error_sale_price = false;
   var error_stock = false;
   var error_description = false;
   var error_picture = false;

   var error_picture2 = false;
   var error_picture3 = false;
   var error_picture4 = false;
   var error_picture5 = false;





   $("#productname").focusout(function(){
       check_product_name();
    });
    $("#m_r_p").focusout(function() {
       check_mrp();
    });
    $("#product_salesprice").focusout(function(){
      check_sale_price();
   });
   $("#product_stock").focusout(function() {
      check_stock();
   });
   $("#productdesc").focusout(function(){
      check_description();
   });
   $("#img01").focusout(function(){
      picture_validation();
   });

   $("#img02").focusout(function(){
      picture_validation2();
   });
   $("#img03").focusout(function(){
      picture_validation3();
   });
   $("#img04").focusout(function(){
      picture_validation4();
   });
   $("#img05").focusout(function(){
      picture_validation5();
   });

   function check_product_name() {
      var product_name = $("#productname").val();
      if (product_name !== '' && product_name.length > 2) {
         $("#product_name_error_message").hide();
         $("#productname").css("border-bottom","2px solid #34F458");
      } else {
         $("#product_name_error_message").html("Product name should atleast contain 3 character").css("color","#F90A0A");
         $("#product_name_error_message").show();
         $("#productname").css("border-bottom","2px solid #F90A0A");
         error_product = true;
      }
   }
   function check_mrp() {
      var mrp = $("#m_r_p").val();
      if (mrp !== '') {
         $("#mrp_error_message").hide();
         $("#m_r_p").css("border-bottom","2px solid #34F458");
      } else {
         $("#mrp_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#mrp_error_message").show();
         $("#m_r_p").css("border-bottom","2px solid #F90A0A");
         error_mrp = true;
      }
   }
   function check_sale_price() {
      var sale_price = $("#product_salesprice").val();
      if (sale_price !== '') {
         $("#sale_price_error_message").hide();
         $("#product_salesprice").css("border-bottom","2px solid #34F458");
      } else {
         $("#sale_price_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#sale_price_error_message").show();
         $("#product_salesprice").css("border-bottom","2px solid #F90A0A");
         error_sale_price = true;
      }
   }
   
   function check_stock() {
      var stock = $("#product_stock").val();
      if (stock !== '') {
         $("#stock_error_message").hide();
         $("#product_stock").css("border-bottom","2px solid #34F458");
      } else {
         $("#stock_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#stock_error_message").show();
         $("#product_stock").css("border-bottom","2px solid #F90A0A");
         error_stock = true;
      }
   }
   function check_description() {
      var description = $("#productdesc").val();
      if ( description.length = 0 || description.length < 10 ) {

         $("#description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");
         $("#description_error_message").show();
         $("#productdesc").css("border-bottom","2px solid #F90A0A");
         error_description = true;
      } else {
         $("#description_error_message").hide();
         $("#productdesc").css("border-bottom","2px solid #34F458");

      }
   }
   function picture_validation() {

         if($('#img01')[0].files.length === 0){
            $('#img01').focus();
             $("#picture_error_message").html("Attachments required").css("color","#F90A0A");
             $("#picture_error_message").show();

             error_picture = true;
            }

         else{

            $("#picture_error_message").hide();

         }
     }

     function picture_validation2() {

      if($('#img02')[0].files.length === 0){
         $('#img02').focus();
          $("#picture2_error_message").html("Attachments required").css("color","#F90A0A");
          $("#picture2_error_message").show();

          error_picture2 = true;
         }

      else{

         $("#picture2_error_message").hide();

      }
  }
  function picture_validation3() {

   if($('#img03')[0].files.length === 0){
      $('#img03').focus();
       $("#picture3_error_message").html("Attachments required").css("color","#F90A0A");
       $("#picture3_error_message").show();

       error_picture3 = true;
      }

   else{

      $("#picture3_error_message").hide();

   }
   }

   function picture_validation4() {

      if($('#img04')[0].files.length === 0){
         $('#img04').focus();
          $("#picture4_error_message").html("Attachments required").css("color","#F90A0A");
          $("#picture4_error_message").show();

          error_picture4 = true;
         }

      else{

         $("#picture4_error_message").hide();

      }
  }
  function picture_validation5() {

   if($('#img05')[0].files.length === 0){
      $('#img05').focus();
       $("#picture5_error_message").html("Attachments required").css("color","#F90A0A");
       $("#picture5_error_message").show();

       error_picture5 = true;
      }

   else{

      $("#picture5_error_message").hide();

   }

  }
   
   
    $("#add_product_form").submit(function() {
      error_product = false;
      error_mrp = false;
      error_sale_price = false;
      error_stock = false;
      error_description = false;
      error_picture = false;

      error_picture2 = false;
      error_picture3 = false;
      error_picture4 = false;
      error_picture5 = false;


       check_product_name();
       check_mrp();
       check_sale_price();
       check_stock();
       check_description();
       picture_validation();

       picture_validation2();
       picture_validation3();
       picture_validation4();
       picture_validation5();



       if (error_product === false && error_mrp === false && error_sale_price == false && error_stock === false && error_description === false && error_picture === false && error_picture2 === false && error_picture3 === false && error_picture4 === false && error_picture5 === false) {
          return true;
       } else {
         Swal.fire('Fill the fields correctly')
          return false;
       }


    });
})




// edit product validation


$(function(){

   $("#product_name_error_message").hide();
   $("#mrp_error_message").hide();
   $("#sale_price_error_message").hide();
   $("#stock_error_message").hide();
   $("#description_error_message").hide();








   var error_product = false;
   var error_mrp = false;
   var error_sale_price = false;
   var error_stock = false;
   var error_description = false;
 


   $("#productname").focusout(function(){
       check_product_name();
    });
    $("#m_r_p").focusout(function() {
       check_mrp();
    });
    $("#product_salesprice").focusout(function(){
      check_sale_price();
   });
   $("#product_stock").focusout(function() {
      check_stock();
   });
   $("#productdesc").focusout(function(){
      check_description();
   });


   function check_product_name() {
      var product_name = $("#productname").val();
      if (product_name !== '' && product_name.length > 2) {
         $("#product_name_error_message").hide();
         $("#productname").css("border-bottom","2px solid #34F458");
      } else {
         $("#product_name_error_message").html("Product name should atleast contain 3 character").css("color","#F90A0A");
         $("#product_name_error_message").show();
         $("#productname").css("border-bottom","2px solid #F90A0A");
         error_product = true;
      }
   }
   function check_mrp() {
      var mrp = $("#m_r_p").val();
      if (mrp !== '') {
         $("#mrp_error_message").hide();
         $("#m_r_p").css("border-bottom","2px solid #34F458");
      } else {
         $("#mrp_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#mrp_error_message").show();
         $("#m_r_p").css("border-bottom","2px solid #F90A0A");
         error_mrp = true;
      }
   }
   function check_sale_price() {
      var sale_price = $("#product_salesprice").val();
      if (sale_price !== '') {
         $("#sale_price_error_message").hide();
         $("#product_salesprice").css("border-bottom","2px solid #34F458");
      } else {
         $("#sale_price_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#sale_price_error_message").show();
         $("#product_salesprice").css("border-bottom","2px solid #F90A0A");
         error_sale_price = true;
      }
   }
   
   function check_stock() {
      var stock = $("#product_stock").val();
      if (stock !== '') {
         $("#stock_error_message").hide();
         $("#product_stock").css("border-bottom","2px solid #34F458");
      } else {
         $("#stock_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#stock_error_message").show();
         $("#product_stock").css("border-bottom","2px solid #F90A0A");
         error_stock = true;
      }
   }
   function check_description() {
      var description = $("#productdesc").val();
      if ( description.length = 0 || description.length < 10 ) {

         $("#description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");
         $("#description_error_message").show();
         $("#productdesc").css("border-bottom","2px solid #F90A0A");
         error_description = true;
      } else {
         $("#description_error_message").hide();
         $("#productdesc").css("border-bottom","2px solid #34F458");

      }
   }

   
    $("#product_edit_form").submit(function() {
      error_product = false;
      error_mrp = false;
      error_sale_price = false;
      error_stock = false;
      error_description = false;
      // error_picture = false;

      // error_picture2 = false;
      // error_picture3 = false;
      // error_picture4 = false;
      // error_picture5 = false;


       check_product_name();
       check_mrp();
       check_sale_price();
       check_stock();
       check_description();
      //  picture_validation();

      //  picture_validation2();
      //  picture_validation3();
      //  picture_validation4();
      //  picture_validation5();



       if (error_product === false && error_mrp === false && error_sale_price == false && error_stock === false && error_description === false ) {
          return true;
       } else {
         Swal.fire('Fill the fields correctly')
          return false;
       }


    });
})


// add offer validation

$(function(){

    $("#offer_name_error_message").hide();
    $("#offer_percent_error_message").hide();
    $("#offer_expiry_error_message").hide();
    $("#offer_time_error_message").hide();




    var error_offer_name = false;
    var error_offer_percent = false;
    var error_offer_expiry = false;
    var error_offer_time = false;






    $("#offer_name_id").focusout(function(){
        check_offer_name();
     });
     $("#offer_percent_id").focusout(function(){
        check_offer_percent();
     });
     $("#offer_expiry_date_id").focusout(function(){
      check_offer_expiry_date();
   });
   $("#offer_expiry_time_id").focusout(function(){
      check_offer_expiry_time();
   });




     function check_offer_name() {
        var offer_name = $("#offer_name_id").val();
        if ( offer_name.length = 0 || offer_name.length < 3 ) {

           $("#offer_name_error_message").html("Should atleast contain 3 Characters").css("color","#F90A0A");;
           $("#offer_name_error_message").show();
           $("#offer_name_id").css("border-bottom","2px solid #F90A0A");
           error_offer_name = true;
        } else {
           $("#offer_name_error_message").hide();
           $("#offer_name_id").css("border-bottom","2px solid #34F458");

        }
        
        
     }
     function check_offer_percent() {
      var offer_percent = $("#offer_percent_id").val();
      if (offer_percent < 50 && offer_percent >= 1) {
         $("#offer_percent_error_message").hide();
         $("#offer_percent_id").css("border-bottom","2px solid #34F458");
      } else {
         $("#offer_percent_error_message").html("The offer percent can only be added between 1% to 50%").css("color","#F90A0A");;
         $("#offer_percent_error_message").show();
         $("#offer_percent_id").css("border-bottom","2px solid #F90A0A");
         error_offer_percent = true;
      }
   }

   function check_offer_expiry_date() {
      var expiry_date= $("#offer_expiry_date_id").val();

      if (expiry_date !== '') {
         $("#offer_expiry_error_message").hide();
         $("#offer_expiry_date_id").css("border-bottom","2px solid #34F458");
      } else {
         $("#offer_expiry_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#offer_expiry_error_message").show();
         $("#offer_expiry_date_id").css("border-bottom","2px solid #F90A0A");
         error_offer_expiry = true;
      }
   }

   function check_offer_expiry_time() {
      var expiry_time= $("#offer_expiry_time_id").val();

      if (expiry_time !== '') {
         $("#offer_time_error_message").hide();
         $("#offer_expiry_time_id").css("border-bottom","2px solid #34F458");
      } else {
         $("#offer_time_error_message").html("The field can't be empty").css("color","#F90A0A");;
         $("#offer_time_error_message").show();
         $("#offer_expiry_time_id").css("border-bottom","2px solid #F90A0A");
         error_offer_time = true;
      }
   }
   

     $("#add_offer_form").submit(function() {

        error_offer_name = false;
        error_offer_name = false;
        error_offer_expiry = false;
        error_offer_time = false

        check_offer_name();
        check_offer_percent();
        check_offer_expiry_date()
        check_offer_expiry_time()


        if (error_offer_name == false && error_offer_name == false && error_offer_expiry == false && error_offer_time == false) {
           return true;
        } else {
         Swal.fire('Fill the fields correctly')
           return false;
        }


     });

})

// add coupon validation

$(function(){

   $("#coupon_name_error_message").hide();
   $("#coupon_percent_error_message").hide();
   $("#expiry_date_error_message").hide();
   $("#expiry_time_error_message").hide();




   var error_coupon_name = false;
   var error_coupon_percent = false;
   var error_expiry_date = false;
   var error_expiry_time = false;




   $("#coupon_name_id").focusout(function(){
       check_coupon_name();
    });
    $("#coupon_percent_id").focusout(function(){
       check_coupon_percent();
    });
    $("#coupon_expiry_date_id").focusout(function(){
     check_coupon_expiry_date();
  });
  $("#coupon_expiry_time_id").focusout(function(){
     check_coupon_expiry_time();
  });




    function check_coupon_name() {
       var coupon_name = $("#coupon_name_id").val();
       if ( coupon_name.length = 0 || coupon_name.length < 3 ) {

          $("#coupon_name_error_message").html("Should atleast contain 3 Characters").css("color","#F90A0A");;
          $("#coupon_name_error_message").show();
          $("#coupon_name_id").css("border-bottom","2px solid #F90A0A");
          error_coupon_name = true;
       } else {
          $("#coupon_name_error_message").hide();
          $("#coupon_name_id").css("border-bottom","2px solid #34F458");

       }
       
       
    }
    function check_coupon_percent() {
     var offer_percent = $("#coupon_percent_id").val();
     if (offer_percent <= 50 && offer_percent >= 1) {
        $("#coupon_percent_error_message").hide();
        $("#coupon_percent_id").css("border-bottom","2px solid #34F458");
     } else {
        $("#coupon_percent_error_message").html("The offer percent can only be added between 1% to 50%").css("color","#F90A0A");;
        $("#coupon_percent_error_message").show();
        $("#coupon_percent_id").css("border-bottom","2px solid #F90A0A");
        error_coupon_percent = true;
     }
  }

  function check_coupon_expiry_date() {
     var expiry_date= $("#coupon_expiry_date_id").val();

     if (expiry_date !== '') {
        $("#expiry_date_error_message").hide();
        $("#coupon_expiry_date_id").css("border-bottom","2px solid #34F458");
     } else {
        $("#expiry_date_error_message").html("The field can't be empty").css("color","#F90A0A");;
        $("#expiry_date_error_message").show();
        $("#coupon_expiry_date_id").css("border-bottom","2px solid #F90A0A");
        error_expiry_date = true;
     }
  }

  function check_coupon_expiry_time() {
     var expiry_time= $("#coupon_expiry_time_id").val();

     if (expiry_time !== '') {
        $("#expiry_time_error_message").hide();
        $("#coupon_expiry_time_id").css("border-bottom","2px solid #34F458");
     } else {
        $("#expiry_time_error_message").html("The field can't be empty").css("color","#F90A0A");;
        $("#expiry_time_error_message").show();
        $("#coupon_expiry_time_id").css("border-bottom","2px solid #F90A0A");
        error_expiry_time = true;
     }
  }
  

    $("#coupon_add_id").submit(function() {

      error_coupon_name = false;
      error_coupon_percent = false;
      error_expiry_date = false;
      error_expiry_time = false

       check_coupon_name();
       check_coupon_percent();
       check_coupon_expiry_date()
       check_coupon_expiry_time()


       if (error_coupon_name == false && error_coupon_percent == false && error_expiry_date == false && error_expiry_time == false) {
          return true;
       } else {
        Swal.fire('Fill the fields correctly')
          return false;
       }


    });

})



// Coupon date validation

$(function () {

   var dtToday = new Date();

   var month = dtToday.getMonth() + 1;
   var day = dtToday.getDate() + 1;
   var year = dtToday.getFullYear();
   var time = dtToday.getHours() + ":" + dtToday.getMinutes();
   if (month < 10)

       month = '0' + month.toString();

   if (day < 10)

       day = '0' + day.toString();
    
   var maxDate = year + '-' + month + '-' + day

   console.log(maxDate);

   $('#coupon_expiry_date_id').attr('min', maxDate);


});

// offer date validation

$(function () {

   var dtToday = new Date();

   var month = dtToday.getMonth() + 1;
   var day = dtToday.getDate() + 1;
   var year = dtToday.getFullYear();
   var time = dtToday.getHours() + ":" + dtToday.getMinutes();
   if (month < 10)

       month = '0' + month.toString();

   if (day < 10)

       day = '0' + day.toString();
    
   var maxDate = year + '-' + month + '-' + day

   console.log(maxDate);

   $('#offer_expiry_date_id').attr('min', maxDate);


});


// Banner validation

/* $(function(){

   $("#banner_image_error_message").hide();
   $("#image_description_error_message").hide();


   var error_image = false;
   var error_image_description = false;




   $("#banner_image_id").focusout(function(){
       check_image();
    });
    $("#productdescription").focusout(function(){
      image_description_description();
    });



    function check_image() {

       var formData = new FormData();
       var file = document.getElementById("banner_image_id").files[0];
       formData.append("Filedata", file);
       
       var t = file.type.split('/').pop().toLowerCase();

       if (file == ''){
         $("#banner_image_error_message").html("This field can't be empty").css("color","#F90A0A");
         $("#banner_image_error_message").show();
         $("#banner_image_id").css("border-bottom","2px solid #F90A0A");

         error_image = true;

       }

      if (t != "jpeg" && t != "jpg" && t != "png" && t != "bmp" && t != "gif" ) {

         $("#banner_image_error_message").html("Invalid image format").css("color","#F90A0A");
         $("#banner_image_error_message").show();
         $("#banner_image_id").css("border-bottom","2px solid #F90A0A");

         error_image = true;


       }



      else {
          $("#banner_image_error_message").hide();
          $("#banner_image_id").css("border-bottom","2px solid #34F458");

       }
      }
       
       
    
    function image_description_description() {
       var description = $("#productdescription").val();


     
       if ( description.length == 0 || description.length < 10 || description == '') {

          $("#image_description_error_message").html("Should atleast contain 10 Characters").css("color","#F90A0A");
          $("#image_description_error_message").show();
          $("#productdescription").css("border-bottom","2px solid #F90A0A");
          error_image_description = true;
       } else {
          $("#image_description_error_message").hide();
          $("#productdescription").css("border-bottom","2px solid #34F458");

       }
       
       
    }

    $("#add_banner_id_id").submit(function() {
      error_image = false;
      error_image_description = false;

      check_image();
      image_description_description();
      print(error_image)
      print(error_image_description)


       if (error_image == false && error_image_description == false ) {

          return true;

       } else {

        Swal.fire('Fill the fields correctly')

          return false;

       }


    });

}) */



