$(document).ready(function(){
  document.getElementById("demo").innerHTML = "Hello World!";    
  
function myFunction() {
  var x = document.getElementById("mySelect").value;
  document.getElementById("demo").innerHTML = "SELECTED" + X ; 
}


  // $("#ddselect").change(function(){
  //   var displaycourse = ("#ddselect option:selected").text();
  //   $("#textresults").val(displaycourse);
  // })

  $('#GFG_UP')
  .text('First check few elements then click on the button.');
  $('button').on('click', function() {
      var array = [];
      $("input:checkbox[name=type]:checked").each(function() {
          array.push($(this).val());
      });
      $('#GFG_DOWN').text(array);
  });

  const person = {
    firstName: "Sourav",
    lastName: "  Babar",
    display: function(){
      let x = document.getElementById("bind");
      x.innerHTML = this.firstName + "" + this.lastName;
    }
  }

  let display = person.display.bind(person);
  setTimeout(display, 3000);
});