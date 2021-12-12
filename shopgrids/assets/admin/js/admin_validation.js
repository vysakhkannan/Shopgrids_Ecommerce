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
           alert("Please Fill the form Correctly");
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
           alert("Please Fill the form Correctly");
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
          alert("Please Fill the form Correctly");
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
          alert("Please Fill the form Correctly");
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
   // $("#picture_error_message").hide();
   // $("#picture2_error_message").hide();
   // $("#picture3_error_message").hide();
   // $("#picture4_error_message").hide();
   // $("#picture5_error_message").hide();







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
   // $("#img01").focusout(function(){
   //    picture_validation();
   // });

   // $("#img02").focusout(function(){
   //    picture_validation2();
   // });
   // $("#img03").focusout(function(){
   //    picture_validation3();
   // });
   // $("#img04").focusout(function(){
   //    picture_validation4();
   // });
   // $("#img05").focusout(function(){
   //    picture_validation5();
   // });

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
//    function picture_validation() {

//          if($('#img01')[0].files.length === 0){
//             $('#img01').focus();
//              $("#picture_error_message").html("Attachments required").css("color","#F90A0A");
//              $("#picture_error_message").show();

//              error_picture = true;
//             }

//          else{

//             $("#picture_error_message").hide();

//          }
//      }

//      function picture_validation2() {

//       if($('#img02')[0].files.length === 0){
//          $('#img02').focus();
//           $("#picture2_error_message").html("Attachments required").css("color","#F90A0A");
//           $("#picture2_error_message").show();

//           error_picture2 = true;
//          }

//       else{

//          $("#picture2_error_message").hide();

//       }
//   }
//   function picture_validation3() {

//    if($('#img03')[0].files.length === 0){
//       $('#img03').focus();
//        $("#picture3_error_message").html("Attachments required").css("color","#F90A0A");
//        $("#picture3_error_message").show();

//        error_picture3 = true;
//       }

//    else{

//       $("#picture3_error_message").hide();

//    }
//    }

//    function picture_validation4() {

//       if($('#img04')[0].files.length === 0){
//          $('#img04').focus();
//           $("#picture4_error_message").html("Attachments required").css("color","#F90A0A");
//           $("#picture4_error_message").show();

//           error_picture4 = true;
//          }

//       else{

//          $("#picture4_error_message").hide();

//       }
//   }
//   function picture_validation5() {

//    if($('#img05')[0].files.length === 0){
//       $('#img05').focus();
//        $("#picture5_error_message").html("Attachments required").css("color","#F90A0A");
//        $("#picture5_error_message").show();

//        error_picture5 = true;
//       }

//    else{

//       $("#picture5_error_message").hide();

//    }

//   }
   
   
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





