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
    },
    eventReceive: function(event){
      var title = event.title;
      var start = event.start.format("YYYY-MM-DD[T]HH:MM:SS");
      $.ajax({
        url: 'process.php',
        data: 'type=new&title='+title+'&startdate='+start+'&zone='+zone,
        type: 'POST',
        dataType: 'json',
        success: function(response){
          event.id = response.eventid;
          $('#calendar').fullCalendar('updateEvent',event);
        },
        error: function(e){
          console.log(e.responseText);
        }
      });
      $('#calendar').fullCalendar('updateEvent',event);
    }
  });

  jQuery(document).on("click",".fc-content",function(){

  });

  jQuery("#ricerca-cliente, #ricerca-cliente-edit").autocomplete({
    source: "../wp-content/themes/casarabatti/clienti.php",
    minLength: 1,//search after two characters
    select: function(event, ui) {
      /*var url = ui.item.id;
      if(url != '#') {
        location.href = '/blog/' + url;
      }*/
    },
  });

  jQuery(document).on("click","#add-customer",function(event){
    event.preventDefault();
    var customer = jQuery("#ricerca-cliente").val();
    if (customer.toString() !== "") {
      jQuery("#cliente").val(customer);
    }
  });

  jQuery(document).on("click","#new-customer",function(){
    jQuery("#ClienteLabel").html("Nuovo Cliente");
    jQuery("#label-search-customer").hide();
    jQuery("#search-customer").hide();
    jQuery('#new-event-detail').modal('hide');
    jQuery('#customer-detail').modal('show');
  });

  jQuery(document).on("click","#save-customer",function(event){
    event.preventDefault();
    var formData = {
      'nome'              : jQuery("#cognome-nome").val(),
      'email'             : jQuery("#email").val(),
      'telefono'          : jQuery("#telefono").val(),
      'indirizzo'         : jQuery("#indirizzo").val(),
      'citta'             : jQuery("#citta").val(),
      'nazione'           : jQuery("#nazione").val()
    };

    // process the form
    jQuery.ajax({
          type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
          url         : '../wp-content/themes/casarabatti/clientiSubmit.php', // the url where we want to POST
          data        : formData, // our data object
          dataType    : 'json', // what type of data do we expect back from the server
          encode          : true
        })
        // using the done promise callback
        .done(function(data) {

          // log data to the console so we can see
          if (data.success== true) {
            jQuery('#new-customer-detail').modal('hide');
            jQuery('#new-event-detail').modal('show');
          } else {
            console.log(data);
            jQuery('#new-customer-detail').modal('hide');
            jQuery('#new-event-detail').modal('show');
          }
          // here we will handle errors and validation messages
        });

  });

  jQuery(document).on("click","#manage-customer",function(event){
      event.preventDefault();
      jQuery("#ClienteLabel").html("Gestisci Clienti");
      jQuery("#label-search-customer").show();
      jQuery("#search-customer").show();
      jQuery('#customer-detail').modal('show');
  });



});

