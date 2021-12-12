//   <!-- add to cart -->

    function add_to_cart(product_id){

      console.log(product_id)
      var data = {
          'product_id': product_id,
          'csrf_token' : '{{csrf_token}}',
      
  
      }
      $.ajax({
          url:"cart/add_cart/",
          type:"POST",
          data: data,
          success: function(data){
            console.log('success')
            Toastify({
    
              text: "Item added to cart",
              duration: 3000,
              style: {
                  background: "linear-gradient(to right, #ff512f",
                }

              }).showToast();
            
          c
              
              
          }
      })
  
  
  }

//   <!-- add to cart ends -->



