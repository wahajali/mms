$(document).ready(function(){
  $(document.body).on('change', '#medication-type-homeo, #medication-type-herbal, #medication-type-allo', function(){
   if($(this).is(':checked') == true){
     $(this).closest('.prescription').find('option.medication-type-' + $(this).val()).show();
   }else{
     $(this).closest('.prescription').find('option.medication-type-' + $(this).val()).hide();
   };
  });
});

