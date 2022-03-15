$(document).on("turbolinks:load", function() {

  //Server Side DataTable
  $("#offers-table").DataTable({
    lengthMenu: [5, 10, 15, 25, 50],
      ajax: {
        url: "/fetch_offers",
        dataSrc: 'offers',
        serverSide: true,
      },
      columns: [
        { title: "Business", data: "business_id" },
        { title: "Title", data: "title" },
        { title: "Description", data: "description" },
        { title: "Start Time", data: "start_date" },
        { title: "End Time", data: "end_date" },
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
           return  "<a class='btn btn-info btn-sm' href = '/offers/" + data.id +
           "data-confirm='Are you sure?' data-method='delete' data-toggle='tooltip' data-placement='top' data-original-title='Destroy Business'>"
           + 'Delete' + '</a>'; }
        },
        ],
          order: [['1', 'desc']]
    });
  });

  //validations
  $('.offer-validation').validate({
    errorElement: 'span',
    onfocusout: function (element) {
      return false;
    },
    ignore: function (index, el) {
      var $el = $(el);

      if ($el.hasClass('always-validate')) {
        return false;
      }

    // Default behavior
      return $el.is(':hidden') || $el.hasClass('ignore');
    },
    rules: {
      'offer[title]': {
        required: true
      },
      'offer[description]': {
        required: true
      },
      'offer[coupon]': {
        required: true
      }
    },
    messages: {
      'offer[title]': {
        required: 'Please enter title'
      },
      'offer[description]': {
        required: 'Please enter description.'
      },
    },
    errorPlacement: function (error, element) {
      var placement = $(element).data('error');
      if (placement) {
        $('.' + placement).html(error)
      } else {
        error.insertAfter(element);
      }
    }
  });