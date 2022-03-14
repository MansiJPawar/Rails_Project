$(document).on("turbolinks:load", function() {
    $("#offer-table").DataTable({
        lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
          url: "/fetch_offers",
          dataSrc: 'offers',
          serverSide: true,
        },
        columns: [
        {title: 'Business', data: 'business_id'},
        {title: 'Offer', data: 'title'},
        {title: 'Description', data: 'description'},
        {title: 'StartDate', data: 'start_date'},
        {title: 'EndDate', data: 'end_date'},
        {  
          "data": null,
          "bSortable": false,
          "mRender": function(data, type, full) {
           return '<a class="btn btn-info btn-sm" href="/offers/'+ data.id + "/edit" + '">' + 'Edit' + '</a>';
           }
        },
        {  
          "data": null,
          "bSortable": false,
          "mRender": function(data, type, full) {
           return '<a class="btn btn-info btn-sm" href="/offers/'+ data.id + full[0] + '">' + 'Delete' + '</a>';
           }
        },
        ],
          order: [['1', 'desc']]
    });
  });