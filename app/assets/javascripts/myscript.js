console.log("hiiiii");

$(document).ready(function() {
  $("#dropdown").select2();
  
  //jquery-validator
  $(function() {
    console.log("hi");
      var $form = $("#postValidate");
        if ($form.length) {
          $(form.validate({
            rules: {
                    "user[phone_number]": {
                        required: true,
                        digits: true,
                        minlength: 10
                    },
                    "post[title]":{
                        required: true,
                        minlength: 4
                    }
            }
          })
        )}
    })
});

