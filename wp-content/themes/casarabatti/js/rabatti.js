jQuery(document).ready(function(){

  jQuery('#arrivo-cal').datetimepicker({
    format: 'DD/MM/YYYY',
    locale: 'it'
  });
  jQuery('#partenza').datetimepicker({
    format: 'DD/MM/YYYY',
    locale: 'it',
    useCurrent: false //Important! See issue #1075
  });
  jQuery("#arrivo").on("dp.change", function (e) {
    $('#partenza').data("DateTimePicker").minDate(e.date);
  });
  jQuery("#partenza").on("dp.change", function (e) {
    $('#arrivo').data("DateTimePicker").maxDate(e.date);
    console.log(e.date);
  });

  jQuery('#calendar').fullCalendar({
    firstDay: 1,
    events: "../wp-content/themes/casarabatti/process.php",
    dayClick: function(date, allDay, jsEvent, view) {

      jQuery("#arrivo-cal").val(date.format('DD/MM/YYYY'));
      jQuery('#new-event-detail').modal('show');
    }
  });

  jQuery(document).on("click",".fc-content",function(){

  });

  jQuery("#cliente").autocomplete({
    source: "clienti.php",
    minLength: 2,//search after two characters
    select: function(event,ui){
      //do something
    }
  });
});

