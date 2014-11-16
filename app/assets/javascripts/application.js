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
  $('#expense_bal_sheet_or_pl').change(function(){
    if($('#expense_bal_sheet_or_pl').find('option:selected').attr('value') == "Profit & Loss"){
      $('.bs-or-pl-select .profit-loss').show();
      $('.bs-or-pl-select .profit-loss').first().attr('selected','selected');
      $('.bs-or-pl-select .balance-sheet').hide();
    }
    else if($('#expense_bal_sheet_or_pl').find('option:selected').attr('value') == "Balance Sheet"){
      $('.bs-or-pl-select .balance-sheet').show();
      $('.bs-or-pl-select .balance-sheet').first().attr('selected','selected');
      $('.bs-or-pl-select .profit-loss').hide();
    }
  });
  $('#income_bal_sheet_or_pl').change(function(){
    if($('#income_bal_sheet_or_pl').find('option:selected').attr('value') == "Profit & Loss"){
      $('.bs-or-pl-select .profit-loss').show();
      $('.bs-or-pl-select .profit-loss').first().attr('selected','selected');
      $('.bs-or-pl-select .balance-sheet').hide();
    }
    else if($('#income_bal_sheet_or_pl').find('option:selected').attr('value') == "Balance Sheet"){
      $('.bs-or-pl-select .balance-sheet').show();
      $('.bs-or-pl-select .balance-sheet').first().attr('selected','selected');
      $('.bs-or-pl-select .profit-loss').hide();
    }
  });
  $('#expense_bal_sheet_or_pl').trigger('change');
  $('#income_bal_sheet_or_pl').trigger('change');
});

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
  $('#expense_cost_centerable_id').change(function(){
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
