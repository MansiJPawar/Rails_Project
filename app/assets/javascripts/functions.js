$(document).ready(function() {

// ......JQUERY FUNCTION...........
  $(".myclass").css("background-color", "yellow");

  $("#myid").css("background-color", "red");

  $('#divid').text($("em").attr("title"));
  
 //$("#myimg").attr("src", "https://www.google.com/search?q=default+image&client=ubuntu&channel=fs&sxsrf=APq-WBvVneuXgaWACuUJBlzG8cXwksSBPQ:1647950478586&tbm=isch&source=iu&ictx=1&vet=1&fir=NfE8TAjA2ODYnM%252C26W_wkibIY4McM%252C_%253BdzPYWaGt8jz9-M%252CxyV8ddqOau4KMM%252C_%253BdAOBLb6Mi03B7M%252CnRsdETgijWg0QM%252C_%253B6tO2K22XfMJMrM%252CtjwcAW2gZVajyM%252C_%253Bdxonrn0cJEMI6M%252CSW4yfvw9aJ_usM%252C_%253BA0pMe2lq2NT_jM%252CCrJKSX1AFUwp9M%252C_%253BZUQ4hqK0eoOE9M%252CCG1CySSEUS0-DM%252C_%253BJpaFCmffhUdABM%252CeirPelkp9eoYkM%252C_%253BQ6BBzp2xDdCTDM%252C5SCId8Hd97daPM%252C_%253BmFBeEI-GK2RjoM%252CBcplb9fZWTvvRM%252C_%253Bfzm-cB-sF1nIvM%252CYlh7sHyFI9lHtM%252C_%253BNUuwdMoJ0wedMM%252CEh_frbRje_4DLM%252C_%253B4C9OujEfKWS37M%252CNm1oKmcR1ertvM%252C_%253B8LqQ7tYSXubpoM%252CnEyqGzec7yPv6M%252C_&usg=AI4_-kRdHtsJKDhhCOBtWSV-0iVNQczBrw&sa=X&ved=2ahUKEwjrtoj31dn2AhWgyYsBHX-rAlYQ9QF6BAgZEAE#imgrc=dzPYWaGt8jz9-M");

  $("em").addClass("selected");

  $("#myid").addClass("highlight");

  $("li").filter(".middle").addClass("selected");

  //$("li").eq(1).addClass("selected");

  //$("li").eq(1).css("color", "red");

  //$("li").eq(1).css({"color":"red", "background-color":"green"});

  $("p").find("span").addClass("selected");
  
  //$("div:first").width(100);
  //$("div:first").css("background-color", "blue");

// ......JQUERY FUNCTION...........

 $(".division").click(function () {
    var content = $(this).html();
    $("#result").text( content );
 });

 $(".division1").click(function(){
   $(this).replaceWith("<h3>Its Me</h3>");
 });

 $(".division2").click(function(){
   $(this).remove( );
 });

 $(".division3").click(function(){
   $(this).before("<div>HI</div>")
 });

 $(".div4").bind('click', function(event){
   alert('hey its me');
 });

 $(".div5").click(function(){
   $(".div55").load('');
 });


 $("#show").click(function () {
   $(".mydiv1").show( 1000 );
  });

  $("#hide").click(function () {
    $(".mydiv1").hide( 1000 );
  });

  $(".clickme").click(function(event){
    $(".target").toggle('slow', function(){
       $(".log").text('Transition Complete');
    });
  });

  $("#trigger").click(function(){
    $("#input").change();
  });

  $(".db").dblclick(function(){
    $(this).hide(); 
  });

  $(".mouse-enter").mouseenter(function(){
    alert("You entered this section");
  });

  $(".mouse-leave").mouseleave(function(){
    alert("You left this section");
  });

  $(".input2").focus(function(){
    $(this).css("background-color", "yellow");
  });

  $(".input2").blur(function(){
    $(this).css("background-color", "green");
  });

  function changeColor(newColor) {
    var elem = document.getElementById('para');
    elem.style.color = newColor;
  }

});