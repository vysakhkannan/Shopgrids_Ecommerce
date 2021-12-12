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
               alert("Please Fill the form Correctly");
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
            if (password !== retype_password) {
               $("#confirmpassword_error_message").html("Passwords Did not Matched").css("color","#F90A0A");;
               $("#confirmpassword_error_message").show();
               $("#id_confirm_password").css("border-bottom","2px solid #F90A0A");
               error_retype_password = true;
            } else {
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
                alert("Please Fill the form Correctly");
                return false;
             }
     
     
          });
     })



