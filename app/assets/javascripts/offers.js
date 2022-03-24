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
        { title: "Business", data: "business_name" },
        { title: "Title", data: "title" },
        { title: "Description", data: "description" },
        // { title: "Start Time", data: "start_date" },
        // { title: "End Time", data: "end_date" },
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
        {  
          "data": null,
          "bSortable": false,
          "mRender": function(data, type, full) {
           return '<a class="btn btn-info btn-sm"">' + 'Audit' + '</a>';
           }
        },
        ],
          order: [['1', 'desc']]
    });

    // Generates Challenge Filter Query String
    
    function generateFilterParams() {
      console.log("hiii");
      var filters = {
          business_id: [$("#businesses :selected").val()],
      }
      $("select[name=businesses]:selected").each(function() {
        filters['business_id'].push($(this).data('val'));
      });
    return filters;
  }

  // offers filter 
  function applyFilters(filters) {
      console.log("hello", filters);
      if (filters != '') {
          // var id = $(this).attr("business_id");
          $('#offers-table').DataTable().ajax.url(
                  "/fetch_offers" +
                  "?filters=" + JSON.stringify(filters)
              )
              .load() //checked
      } else {
          $('#offers-table').DataTable().ajax.reload();
      }
  }

  $('.business-sidebar').change(function() {
      console.log("hello")
      applyFilters(generateFilterParams());
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

  });

  