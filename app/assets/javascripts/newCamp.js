$(".camps.new").ready(function(){

  $('#starting-date').datepicker({
    format: 'mm-dd-yyyy',
    autoclose: true,
    startView: 0,
  });

  $('#ending-date').datepicker({
    format: 'mm-dd-yyyy',
    autoclose: true,
    startView: 0,
  });

});
