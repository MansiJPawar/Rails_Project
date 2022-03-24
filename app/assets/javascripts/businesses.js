$(document).ready(function(){

  // //validation
  //  $('.business-validation').validate({
  //   errorElement: 'span',
  //   onfocusout: function (element) {
  //     return false;
  //   },
  //   ignore: function (index, el) {
  //     var $el = $(el);

  //     if ($el.hasClass('always-validate')) {
  //       return false;
  //     }

  //     // Default behavior
  //     return $el.is(':hidden') || $el.hasClass('ignore');
  //   },
  //   rules: {
  //     'business[name]': {
  //       required: true
  //     },
  //     'business[address]': {
  //       required: true
  //     },
  //   },
  //   messages: {
  //     'business[name]': {
  //       required: 'Please enter business name'
  //     },
  //     // 'business[logo]': {
  //     //   required: 'Please add logo',
  //     //   extension: 'Please select business photo with valid extension'
  //     // },
  //     'business[address]': {
  //       required: 'Please add business address'
  //     },
  //     'business[working_hours]': {
  //       required: 'Please enter valid details'
  //     },

  //   },
  //   errorPlacement: function (error, element) {
  //     var placement = $(element).data('error');
  //     if (placement) {
  //       $('.' + placement).html(error)
  //     } else {
  //       error.insertAfter(element);
  //     }
  //   }
  // });

  //server side rendering
  $('#business-table').DataTable({
    lengthMenu: [5, 10, 15, 25, 50],
      ajax: {
        url: "/fetch_businesses",
        dataSrc: 'businesses',
        serverSide: true,
      },
      columns: [
      {title: 'Business', data: 'name'},
      {title: 'Address', data: 'address'},
      {  
        "data": null,
        "bSortable": false,
        "mRender": function(data, type, full) {
         return '<a class="btn btn-info btn-sm" href="/businesses/'+ data.id + "/edit" + '">' + 'Edit' + '</a>';
         }
      },
      {  
        "data": null,
        "bSortable": false,
        "mRender": function(data, type, full) {
         return  "<a class='btn btn-info btn-sm' href = '/businesses/" + data.id +
         "data-confirm='Are you sure?' data-method='delete' data-toggle='tooltip' data-placement='top' data-original-title='Destroy Business'>"
         + 'Delete' + '</a>'; }
      },
      {  
        "data": null,
        "bSortable": false,
        "mRender": function(data, type, full) {
         return '<a class="btn btn-info btn-sm"">' + 'Audit' + '</a>';
         }
      },
   
      
      // {
      //   "mrender": function(data, type, row) {
      //       img_str = '<img src="http://www.jacklmoore.com/colorbox/content/ohoopee3.jpg"/>';
      //       return img_str;
      // }},
      // {  
      //   "data": null,
      //   "bSortable": false,
      //   "mRender": function(data, type, full) {
      //    return "<a class='dropdown-item display-challenge-participants' href='javascript:void(0);'" +
      //    "data-toggle='tooltip' data-placement='top' data-original-title='Download CSV file of challenge participants'>" +
      //    "<i class='feather icon-download'></i> Download CSV</a>"';
      //    }
      // },
      ],
        order: [['1', 'desc']]
  });
});