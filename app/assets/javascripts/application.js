// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery.validate
//= require select2-full
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require datatables
//= require toggle
//= require turbolinks
//= require_tree .


// loads datatables
  $(document).ready(function(){
  $('#ajax-table').DataTable({
    lengthMenu: [5, 10, 15, 25, 50],
    ajax: {
      url: '/get_dataset',
      dataSrc: 'sports',
      serverSide: true,
    },
    columns: [
      {title: 'Sport name', data: 'sport_name'},
      {title: 'Sport equipement', data: 'sport_equipement'},
    ],
    order: [['1', 'desc']]
  });
});
