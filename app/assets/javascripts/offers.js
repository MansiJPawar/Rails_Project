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


  // //Reset offers filter checkboxes and update datatable
  // $('.reset_user_filters_btn').on('click', function (e) {
  //   $('input:checkbox').each(function () {
  //     this.checked = false;
  //   });
  //   $('.users-filter-selection').html('');
  //   ageFilterSlider.noUiSlider.reset();

  //   applyParticipantFilters(generateParticipantFilterParams());
  // });

  // Offers Selection in Business Filter With Auto Suggestion
  $('.participants-offers-filter').select2({
    placeholder: "Select Challenge",
    tags: true,
    dropdownAutoWidth: true,
    width: '100%'
  }).on("select2:select", function (e) {
    let tagTemplate = $('#participant-filter-tag-template').html();
    let tagHtml = replaceParticipantTagFields(tagTemplate, $('.participants-offers-filter :selected').text(),
        $('.participants-offers-filter :selected').val());
    $('.participants-filter-offers-selection').append(tagHtml);

    // Reset offers Selector
    $('.participants-offers-filter').val(null).trigger('change');

    applyParticipantFilters(generateParticipantFilterParams());
  });

  $('.participants-filter-offers-selection .participant-tags-filter-chip').each(function () {
    filters['offers'].push($(this).data('tag-val'));
  });

  //   // Generates Challenge Filter Query String
  // function generateFilterParams() {
  //   var filters = {
  //     status: [],
  //     challenge_type: [],
  //     platform_type: [],
  //     reward_type: [],
  //     tags: []
  //   }

  //   $("input[name='filters[status][]']:checked").each(function () {
  //     filters['status'].push($(this).data('val'));
  //   });

  //   $("input[name='filters[challenge_type][]']:checked").each(function () {
  //     filters['challenge_type'].push($(this).data('val'));
  //   });

  //   $("input[name='filters[platform_type][]']:checked").each(function () {
  //     filters['platform_type'].push($(this).data('val'));
  //   });

  //   $("input[name='filters[reward_type][]']:checked").each(function () {
  //     filters['reward_type'].push($(this).data('val'));
  //   });

  //   $('.challenge-tags-filter-chip').each(function () {
  //     filters['tags'].push($(this).data('tag-val'));
  //   });

  //   return filters;
  // }

  // // Applly Challenge Filters
  // function applyFilters(filters) {
  //   if (filters != '') {
  //     $('#challenge-list-table').DataTable().ajax.url(
  //         "/admin/campaigns/" + $('#challenge-list-table').attr('campaign_id') + "/offers/fetch_offers"
  //         + "?filters=" + JSON.stringify(filters)
  //     )
  //         .load() //checked
  //   } else {
  //     $('#challenge-list-table').DataTable().ajax.reload();
  //   }
  // }

  // // Challenge sidebar status filters
  // $('.challenge_sidebar_filter').change(function () {
  //   applyFilters(generateFilterParams());
  // });

  // $('.challenge-tags-form').select2({
  //   placeholder: "Select Tags",
  //   tags: true,
  //   dropdownAutoWidth: true,
  //   width: '70%'
  // });

  // //Reset filter checkboxes and update datatable
  // $('.reset_challenge_filter_checkboxes').on('click', function (e) {
  //   $('input:checkbox').each(function () {
  //     this.checked = false;
  //   });
  //   $('.challenge-filter-tag-selection').html('');

  //   applyFilters(generateFilterParams());
  // });

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