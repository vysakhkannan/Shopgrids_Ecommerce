/* scripts for not allowing text in number field */


function isNumber(evt) {
   evt = (evt) ? evt : window.event;
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if ( (charCode > 31 && charCode < 48) || charCode > 57) {
       return false;
   }
   return true;
}






// login page validation

$(function(){

        $("#fusername_error_message").hide();
        $("#fpassword_error_message").hide();
    
        var error_fusername = false;
        var error_fpassword = false;
    
    
        $("#reg_username").focusout(function(){
            check_fusername();
         });
         $("#reg_pass").focusout(function() {
            check_fpassword();
         });
    
    
         function check_fusername() {
            var pattern = /^[a-zA-Z0-9]+$/;
            var fusername = $("#reg_username").val();
            if ( fusername.length = 0 || fusername.length < 5 ) {

               $("#fusername_error_message").html("Should atleast contain 5 Characters");
               $("#fusername_error_message").show();
               $("#reg_username").css("border-bottom","2px solid #F90A0A");
               error_fusername = true;
            } else {
               $("#fusername_error_message").hide();
               $("#reg_username").css("border-bottom","2px solid #34F458");

            }
            
            
            
            if (pattern.test(fusername) && fusername !== '') {
               $("#fusername_error_message").hide();
               $("#reg_username").css("border-bottom","2px solid #34F458");
            } else {
               $("#fusername_error_message").html("Should contain only Characters");
               $("#fusername_error_message").show();
               $("#reg_username").css("border-bottom","2px solid #F90A0A");
               error_fusername = true;
            }
         }
    
         function check_fpassword() {
            var password_length = $("#reg_pass").val().length;
            if (password_length < 6) {
               $("#fpassword_error_message").html("Atleast 6 Characters");
               $("#fpassword_error_message").show();
               $("#reg_pass").css("border-bottom","2px solid #F90A0A");
               error_fpassword = true;
            } else {
               $("#fpassword_error_message").hide();
               $("#reg_pass").css("border-bottom","2px solid #34F458");
            }
         }
         $("#login_form").submit(function() {
            error_fusername = false;
            error_fpassword = false;
    
            check_fusername();
            check_fpassword();
 
    
            if (error_fusername === false && error_fusername === false) {
               return true;
            } else {
               Swal.fire('Fill the fields correctly')
               return false;
            }
    
    
         });
    })



// register form validation

        $(function(){

         $("#first_error_message").hide();
         $("#last_error_message").hide();
         $("#email_error_message").hide();
         $("#username_error_message").hide();
         $("#phone_error_message").hide();
         $("#password_error_message").hide();
         $("#confirmpassword_error_message").hide();

     
         var error_firstname = false;
         var error_lastname = false;
         var error_email = false;
         var error_username = false;
         var error_phonenumber = false;
         var error_retype_password = false;
         var error_password = false;
     
     
         $("#id_first_name").focusout(function(){
            check_firstname();
          });
          $("#id_last_name").focusout(function() {
            check_lastname();
          });
          $("#id_email").focusout(function(){
            check_email();
         });
         $("#id_username").focusout(function() {
            check_username();
         });
         $("#id_phone_number").focusout(function(){
            check_phone_number();
         });
         $("#id_password").focusout(function() {
            check_password();
         });
         $("#id_confirm_password").focusout(function(){
            check_retype_password();
         });
         function check_firstname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#id_first_name").val();
            if (pattern.test(fname) && fname !== '') {
               $("#first_error_message").hide();
               $("#id_first_name").css("border-bottom","2px solid #34F458");
            } else {
               $("#first_error_message").html("Should contain only Characters").css("color","#F90A0A");
               $("#first_error_message").show();
               $("#id_first_name").css("border-bottom","2px solid #F90A0A");
               error_firstname = true;
            }
         }
         function check_lastname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#id_last_name").val();
            if (pattern.test(fname) && fname !== '') {
               $("#last_error_message").hide();
               $("#id_last_name").css("border-bottom","2px solid #34F458");
            } else {
               $("#last_error_message").html("Should contain only Characters").css("color","#F90A0A");;
               $("#last_error_message").show();
               $("#id_last_name").css("border-bottom","2px solid #F90A0A");
               error_lastname = true;
            }
         }
         function check_email() {
            var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            var email = $("#id_email").val();
            if (pattern.test(email) && email !== '') {
               $("#email_error_message").hide();
               $("#id_email").css("border-bottom","2px solid #34F458");
            } else {
               $("#email_error_message").html("Invalid Email").css("color","#F90A0A");;
               $("#email_error_message").show();
               $("#id_email").css("border-bottom","2px solid #F90A0A");
               error_email = true;
            }
         }
         function check_phone_number() {
            var pattern = /[0-9]/g;
            var phone = $("#id_phone_number").val();
            if (pattern.test(phone) && phone !== '') {
               $("#phone_error_message").hide();
               $("#id_phone_number").css("border-bottom","2px solid #34F458");
            } else {
               $("#phone_error_message").html("Invalid phone number").css("color","#F90A0A");;
               $("#phone_error_message").show();
               $("#id_phone_number").css("border-bottom","2px solid #F90A0A");
               error_email = true;
            }
         }

     
          function check_username() {
             var pattern = /^[a-zA-Z0-9]+$/;
             var fusername = $("#id_username").val();
             if ( fusername.length = 0 || fusername.length < 5 ) {
 
                $("#username_error_message").html("Should atleast contain 5 Characters").css("color","#F90A0A");;
                $("#username_error_message").show();
                $("#id_username").css("border-bottom","2px solid #F90A0A");
                error_username = true;
             } else {
                $("#username_error_message").hide();
                $("#id_username").css("border-bottom","2px solid #34F458");
 
             }
             
             
             
             if (pattern.test(fusername) && fusername !== '') {
                $("#username_error_message").hide();
                $("#id_username").css("border-bottom","2px solid #34F458");
             } else {
                $("#username_error_message").html("Should contain only Characters").css("color","#F90A0A");;
                $("#username_error_message").show();
                $("#id_username").css("border-bottom","2px solid #F90A0A");
                error_fusername = true;
             }
          }
     
          function check_password() {
             var password_length = $("#id_password").val().length;
             if (password_length < 6) {
                $("#password_error_message").html("Atleast 6 Characters").css("color","#F90A0A");;
                $("#password_error_message").show();
                $("#id_password").css("border-bottom","2px solid #F90A0A");
                error_fpassword = true;
             } else {
                $("#password_error_message").hide();
                $("#id_password").css("border-bottom","2px solid #34F458");
             }
          }

          function check_retype_password() {
            var password = $("#id_password").val();
            var retype_password = $("#id_confirm_password").val();
            if (retype_password == '') {
               $("#confirmpassword_error_message").html("This field can't be empty").css("color","#F90A0A");;
               $("#confirmpassword_error_message").show();
               $("#id_confirm_password").css("border-bottom","2px solid #F90A0A");
               error_retype_password = true;
            }
            else if (password != retype_password){

               $("#confirmpassword_error_message").html("Passwords Did not Matched").css("color","#F90A0A");;
               $("#confirmpassword_error_message").show();
               $("#id_confirm_password").css("border-bottom","2px solid #F90A0A");
               error_retype_password = true;

            }
            
            
            else {
               $("#confirmpassword_error_message").hide();
               $("#id_confirm_password").css("border-bottom","2px solid #34F458");
            }
         }
         
          $("#register_form").submit(function() {
             error_username = false;
             error_password = false;
             error_firstname = false;
             error_email = false;
             error_phonenumber = false;
             error_lastname = false;
             error_retype_password = false;
     
             check_firstname();
             check_lastname();
             check_phone_number();
             check_email();
             check_username();
             check_password();
             check_retype_password();
  
     
             if (error_username === false && error_password === false && error_firstname == false && error_phonenumber === false && error_email === false && error_lastname == false && error_retype_password == false) {
                return true;
             } else {
               Swal.fire('Fill the fields correctly')
               return false;
             }
     
     
          });
     })






/* scripts for not allowing text in number field */


function isNumber(evt) {
   evt = (evt) ? evt : window.event;
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if ( (charCode > 31 && charCode < 48) || charCode > 57) {
       return false;
   }
   return true;
}


       // Address Validation

       $(function(){

         $("#first_name_error_message").hide();
         $("#last_name_error_message").hide();
         $("#email_error_message").hide();
         $("#phone_number_error_message").hide();
         $("#address_error_message").hide();
         $("#city_error_message").hide();
         $("#post_code_error_message").hide();
         $("#country_error_message").hide();
         $("#state_error_message").hide();

         
   
   
     
         var error_firstname = false;
         var error_lastname = false;
         var error_email = false;
         var error_phone_number = false;
         var error_address = false;
         var error_city = false;
         var error_post_code = false;
         var error_country = false;
         var error_error = false;

   
     
     
         $("#user_first_name").focusout(function(){
            check_firstname();
          });
          $("#user_last_name").focusout(function() {
            check_lastname();
          });
          $("#user_email").focusout(function(){
            check_email();
         });
         $("#user_phone_number").focusout(function() {
            check_phone_number();
         });
         $("#user_address").focusout(function(){
            check_address();
         });
         $("#user_city").focusout(function() {
            check_city();
         });
         $("#user_post_code").focusout(function(){
            check_post_code();
         });
   
         $("#user_country").focusout(function(){
            check_country();
         });
         $("#user_state").focusout(function(){
            check_state();
         });
   
   
   
         function check_firstname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#user_first_name").val();
            if (pattern.test(fname) && fname !== '') {
               $("#first_name_error_message").hide();
               $("#user_first_name").css("border-bottom","2px solid #34F458");
            } else {
               $("#first_name_error_message").html("Should contain only Characters").css("color","#F90A0A");
               $("#first_name_error_message").show();
               $("#user_first_name").css("border-bottom","2px solid #F90A0A");
               error_firstname = true;
            }
         }
         function check_lastname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#user_last_name").val();
            if (pattern.test(fname) && fname !== '') {
               $("#last_name_error_message").hide();
               $("#user_last_name").css("border-bottom","2px solid #34F458");
            } else {
               $("#last_name_error_message").html("Should contain only Characters").css("color","#F90A0A");;
               $("#last_name_error_message").show();
               $("#user_last_name").css("border-bottom","2px solid #F90A0A");
               error_lastname = true;
            }
         }
         function check_email() {
            var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            var email = $("#user_email").val();
            if (pattern.test(email) && email !== '') {
               $("#email_error_message").hide();
               $("#user_email").css("border-bottom","2px solid #34F458");
            } else {
               $("#email_error_message").html("Invalid Email").css("color","#F90A0A");;
               $("#email_error_message").show();
               $("#user_email").css("border-bottom","2px solid #F90A0A");
               error_email = true;
            }
         }
         function check_phone_number() {
            var pattern = /[0-9]/g;
            var phone = $("#user_phone_number").val();
            if (pattern.test(phone) && phone !== '' && phone.length == 10) {
               $("#phone_number_error_message").hide();
               $("#user_phone_number").css("border-bottom","2px solid #34F458");
            } else {
               $("#phone_number_error_message").html("The phone number must have 10 digit").css("color","#F90A0A");;
               $("#phone_number_error_message").show();
               $("#user_phone_number").css("border-bottom","2px solid #F90A0A");
               error_phone_number = true;
            }
         }
   
     
          function check_address() {
             var address = $("#user_address").val();
             if (address.length < 10) {
   
                $("#address_error_message").html("Should atleast contain 12 Characters").css("color","#F90A0A");
                $("#address_error_message").show();
                $("#user_address").css("border-bottom","2px solid #F90A0A");
                error_address = true;
             } else {
                $("#address_error_message").hide();
                $("#user_address").css("border-bottom","2px solid #34F458");
   
             }
             
          }
     
          function check_city() {
             var city = $("#user_city").val().length;
             if (city < 3 ) {
                $("#city_error_message").html("Atleast 3 Characters").css("color","#F90A0A");;
                $("#city_error_message").show();
                $("#user_city").css("border-bottom","2px solid #F90A0A");
                error_city = true;
             } else {
                $("#city_error_message").hide();
                $("#user_city").css("border-bottom","2px solid #34F458");
             }
          }
   
          function check_post_code() {
            var pattern = /[0-9]/g;
            var post_code = $("#user_post_code").val();
            if (pattern.test(post_code) && post_code.length == 6 && post_code.length != 0 ) {
               $("#post_code_error_message").hide();
               $("#user_post_code").css("border-bottom","2px solid #34F458");
            } else {
               $("#post_code_error_message").html("Post-code must contain 6 digit").css("color","#F90A0A");;
               $("#post_code_error_message").show();
               $("#user_post_code").css("border-bottom","2px solid #F90A0A");
               error_post_code = true;
            }
         }
   
         function check_country() {
            var pattern = /^[a-zA-Z]*$/;
            var country = $("#user_country").val();
            if (pattern.test(country) && country !== '') {
               $("#country_error_message").hide();
               $("#user_country").css("border-bottom","2px solid #34F458");
            } else {
               $("#country_error_message").html("Should contain only Characters").css("color","#F90A0A");;
               $("#country_error_message").show();
               $("#user_country").css("border-bottom","2px solid #F90A0A");
               error_country = true;
            }
         }

         function check_state() {
            var country = $("#user_state").val();
            if (country !== '') {
               $("#state_error_message").hide();
               $("#user_state").css("border-bottom","2px solid #34F458");
            } else {
               $("#state_error_message").html("Please select your state").css("color","#F90A0A");;
               $("#state_error_message").show();
               $("#user_state").css("border-bottom","2px solid #F90A0A");
               error_state = true;
            }
         }
         
          $("#address_form_id").submit(function() {
   
            error_firstname = false;
            error_lastname = false;
            error_email = false;
            error_phone_number = false;
            error_address = false;
            error_city = false;
            error_post_code = false;
            error_country = false;
            error_state = false;

   
         
     
             check_firstname();
             check_lastname();
             check_phone_number();
             check_email();
             check_address();
             check_city();
             check_post_code();
             check_country()
             check_state()
   

   
   
     
             if (error_firstname == false && error_lastname == false && error_email == false && error_phone_number == false && error_address == false && error_city == false && error_post_code == false && error_country == false && error_state == false) {
                return true;
             } else {
               Swal.fire('Fill the fields correctly')
               return false;
             }
     
     
          });
     })

     function isNumber(evt) {
      evt = (evt) ? evt : window.event;
      var charCode = (evt.which) ? evt.which : evt.keyCode;
      if ( (charCode > 31 && charCode < 48) || charCode > 57) {
          return false;
      }
      return true;
  }
