document.getElementById('files').onchange = function () {
    var src = URL.createObjectURL(this.files[0])
    document.getElementById('image').src = src
  }
  document.getElementById('files2').onchange = function () {
    var src = URL.createObjectURL(this.files[0])
    document.getElementById('image2').src = src
  }
  document.getElementById('files3').onchange = function () {
    var src = URL.createObjectURL(this.files[0])
    document.getElementById('image3').src = src
  }
  document.getElementById('files4').onchange = function () {
    var src = URL.createObjectURL(this.files[0])
    document.getElementById('image4').src = src
  }
  document.getElementByClass('files0').onchange = function () {
    var src = URL.createObjectURL(this.files[0])
    document.getElementByClass('image0').src = src
  }


  document.getElementByClass('banner_image').onchange = function () {
    var src = URL.createObjectURL(this.files[0])
    alert(src)
    document.getElementById('image0').src = src
  }


/* scripts for not allowing text in number field */


    function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if ( (charCode > 31 && charCode < 48) || charCode > 57) {
                return false;
            }
            return true;
        }




  
  