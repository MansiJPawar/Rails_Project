// menu collapse
$(function(){
  $('#sidebarCollapse').on('click',function() {
    $('#sidebar, #content').toggleClass('active');
  });
});