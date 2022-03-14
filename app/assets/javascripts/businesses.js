$(document).ready(function(){
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
      {title: 'StartDate', data: 'start_date'},
      {title: 'EndDate', data: 'finish_date'},
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
         return '<a class="btn btn-info btn-sm" href="/businesses/'+ data.id + full[0] + '">' + 'Delete' + '</a>';
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