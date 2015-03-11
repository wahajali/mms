// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require selectize
//= require jquery_nested_form
//= require jquery.turbolinks
//= require_tree .
//

$(document).ready(function(){
  $('.balance-sheet-or-pl-select').change(function(){
    if($('.balance-sheet-or-pl-select').find('option:selected').attr('value') == "Profit & Loss"){
      update_dropdowns('profit-loss', 'balance-sheet');
    }
    else if($('.balance-sheet-or-pl-select').find('option:selected').attr('value') == "Balance Sheet"){
      update_dropdowns('balance-sheet', 'profit-loss');
    }
  });
  $('.bs-or-pl-select').change(function(){
    var val = $('.bs-or-pl-select').find('option:selected').attr('value');
    $('.bs-or-pl-sub-category-select option.' + val).show();
    $('.bs-or-pl-sub-category-select option').not('.' + val).hide();
    $('.bs-or-pl-sub-category-select option.' + val).first().attr('selected','selected');
  })

  $('.balance-sheet-or-pl-select').trigger('change');
});

function update_dropdowns(show, hide){
  $('.bs-or-pl-select .' + show).show();
  $('.bs-or-pl-select .' + show).first().attr('selected','selected');
  $('.bs-or-pl-select .' + hide).hide();
  $('.bs-or-pl-select').trigger('change');
}

$(document).ready(function(){
  $(document.body).on("click", '#link-to-medicine', function(){
    var selected_id = $(event.target).parent('.prescription').find('select option:selected').val();
    var left  = ($(window).width()/2) - 200;
    var t = ($(window).height()/2);
    var url = window.location.origin + "\/medicines\/" + selected_id + "\/preview";
    var popup = window.open (url, "popup", "width=400, height=300, top=" + t + ", left=" + left);
    return false;
  }); 
});

$(document).ready(function(){
  $('.slider-percentage').slider({min: 0, max: 100, step: 1});
  $('#link-to-associated-disease, #link-to-main-disease').on('click', function(){
    setTimeout("$('.slider-percentage').slider({min: 0, max: 100})", 10);
  });
  $('.patient-diseases-form').on('slideStop', '.slider-percentage', function(e){
    $(e.currentTarget).slider('setValue', e.value);
  });
});

$(document).ready(function(){
  $('#cost-centerable-id').change(function(){
    $.ajax({
      url: '/business_categories/get_categories',
      type: 'GET',
      data: { value: $(this).val() },
      dataType: 'script'
    })
  });
});

$(document).ajaxStart(function () {
  $.blockUI({ css: { 
    border: 'none', 
    padding: '15px', 
    backgroundColor: '#000', 
    '-webkit-border-radius': '10px', 
    '-moz-border-radius': '10px', 
    opacity: .5, 
    color: '#fff' 
  } }); 
});

$(document).ajaxStop($.unblockUI); 

$(document).ready(function(){
  $('#family-history, #previous-diseases').parent().find('option').bind("contextmenu", function(){
    var left  = ($(window).width()/2) - 200;
    var t = ($(window).height()/2);
    var url = window.location.origin + "\/diseases\/" + $(this).val() + "\/preview";
    var popup = window.open (url, "popup", "width=400, height=300, top=" + t + ", left=" + left);
    return false;
  }); 
});

$(document).ready(function(){
  $('#expense-category-id').change(function(){
    var selected_id = $(this).val();
    var url = '/expense_categories/' + selected_id + '/sub_categories';
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'script'
    })
  });
});

$(document).ready(function(){
  $('#income-category-id').change(function(){
    var selected_id = $(this).val();
    var url = '/income_categories/' + selected_id + '/sub_categories';
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'script'
    })
  });
});
