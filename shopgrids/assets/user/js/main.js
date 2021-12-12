(function () {
  window.onload = function () {
    window.setTimeout(fadeout, 500);
  };
  function fadeout() {
    document.querySelector(".preloader").style.opacity = "0";
    document.querySelector(".preloader").style.display = "none";
  }
  window.onscroll = function () {
    var header_navbar = document.querySelector(".navbar-area");
    var sticky = header_navbar.offsetTop;
    var backToTo = document.querySelector(".scroll-top");
    if (
      document.body.scrollTop > 50 ||
      document.documentElement.scrollTop > 50
    ) {
      backToTo.style.display = "flex";
    } else {
      backToTo.style.display = "none";
    }
  };
  let navbarToggler = document.querySelector(".mobile-menu-btn");
  navbarToggler.addEventListener("click", function () {
    navbarToggler.classList.toggle("active");
  });
})();



// setTimeout(function(){
//     $('message').fadeOut('slow')
// }, 4000)




// image change on onclick (single product display)


        var my_image = document.getElementsByClassName("my_image")
        var container = document.getElementById("main_image");

        for(i =0 ;i< my_image.length;i++){
          my_image[i].addEventListener('click',function(){
          image_src = this.dataset.image_src;
          console.log(image_src)

          Action = this.dataset.action;
          console.log(Action)  

          container.src = image_src;
    
    
      

          })
        }

       

// zoom








