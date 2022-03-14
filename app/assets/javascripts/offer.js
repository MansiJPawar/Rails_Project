$(document).on('turbolinks:load', function () {
    // offers filter 
    function applyFilters(filters) {
      if (filters != '') {
        $('#challenge-list-table').DataTable().ajax.url(
            "/admin/campaigns/" + $('#challenge-list-table').attr('campaign_id') + "/challenges/fetch_challenges"
            + "?filters=" + JSON.stringify(filters)
        )
            .load() //checked
      } else {
        $('#challenge-list-table').DataTable().ajax.reload();
      }
    }
  
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
        'offer[coupon]': {
          required: 'Please enter valid coupon'
        }
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
    $('#offer-table').DataTable({
      processing: true,
      paging: true,
      serverSide: true,
      responsive: false,
      ajax: {
        "url": "/fetch_offers",
        "dataSrc": "offers",
        dataFilter: function (data) {
          var json = jQuery.parseJSON(data);
          return JSON.stringify(json);
        },
      },
      columns: [
        {
          title: 'Title',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.title
          }
        },
        {
          title: 'Description',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.description
          }
        },
        {
          title: 'Business',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return '<span data-offer-id="' + data.id + '" data-business-id="' + data.business_id + '">' +
                data.name + '</span>'
          }
        },
        {
          title: 'Coupon',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.coupon
          }
        },
        {
          title: 'Start',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.start
          }
        },
        {
          title: 'End',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.end
          }
        },
        {
          title: 'Actions', data: null,
          searchable: true,
          render: function (data, type, row) {
          var action_html = ''
          action_html =action_html + "<a class='dropdown-item' href = '/offers/new'" +
            "data-toggle='tooltip' data-placement='top' data-original-title='Add Offer'>" + 
            "<i class='feather icon-edit-2'></i> Add Offer</a>"+
            "<a class='dropdown-item' href = '/offers/" + data.id + "/edit'" +
            "data-toggle='tooltip' data-placement='top' data-original-title='Edit Offer'>" +
            "<i class='feather icon-edit-2'></i> Edit</a>"
  
          action_html = action_html + '</div></div></div>'
          return action_html;
          }
        }
      ],
      dom: '<"top"<"actions action-btns"B><"action-filters"lf>><"clear">rt<"bottom"<"actions">p>',
      oLanguage: {
        sLengthMenu: "_MENU_",
        sSearch: ""
      },
      aLengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
      order: [[1, "asc"]],
      bInfo: false,
      pageLength: 10,
      // oLanguage: {
      //   sProcessing: "<div class='spinner-border' role='status'><span class='sr-only'></span></div>"
      // },
      aoColumnDefs: [
        {'bSortable': false, 'aTargets': [0]}
      ],
      initComplete: function (settings, json) {
        $(".dt-buttons .btn").removeClass("btn-secondary");
        // $('.dataTables_filter').addClass('search-icon-placement');
      },
        
      order: [['1', 'desc']]
    });
  });