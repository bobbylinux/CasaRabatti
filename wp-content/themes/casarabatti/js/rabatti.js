jQuery(document).ready(function () {

    jQuery(".alert").hide();

    jQuery('#arrivo-cal').datepicker({
        format: 'dd/mm/yyyy',
        language: 'it',
        autoclose: true
    });

    jQuery('#partenza-cal').datepicker({
        format: 'dd/mm/yyyy',
        language: 'it',
        autoclose: true
    });

    jQuery('#calendar').fullCalendar({
        firstDay: 1,
        eventTextColor: "black",
        events: {
            url: '../wp-content/themes/casarabatti/process.php',
            type: 'POST', // Send post data
            error: function (data) {
                alert('Errore caricamento calendario');
            },
        },
        dayClick: function (date, allDay, jsEvent, view) {
            jQuery("#ricerca-cliente").val("");
            jQuery("#ricerca-cliente-hidden").val("");
            jQuery("#cliente").val("");
            jQuery("#ambiente").val("");
            jQuery("#partenza-cal").val("");
            jQuery(".alert").hide();
            jQuery("#arrivo-cal").val(date.format('DD/MM/YYYY'));
            jQuery("#event-type-hidden").val("new");
            jQuery(".btn-elimina-evento").hide();
            jQuery('#event-detail').modal('show');
        },
        eventClick: function (calEvent, jsEvent, view) {
            //var title = prompt('Event Title:', calEvent.title, { buttons: { Ok: true, Cancel: false} });
            // jQuery("#arrivo-cal").val(date.format('DD/MM/YYYY'));
            jQuery("#ricerca-cliente").val("");
            jQuery("#PrenotazioneLabel").html("Modifica Prenotazione");
            jQuery("#cliente").val(calEvent.title);
            jQuery("#ricerca-cliente-hidden").val(calEvent.cliente);
            jQuery("#ambiente").val(calEvent.ambiente);
            jQuery("#arrivo-cal").val(calEvent.start.format("DD/MM/YYYY"));
            jQuery("#partenza-cal").val((calEvent.end).format("DD/MM/YYYY"));
            jQuery("#note").val(calEvent.note);
            jQuery(".alert").hide();
            jQuery("#event-type-hidden").val("edit");
            jQuery("#event-id-hidden").val(calEvent.id);
            jQuery(".btn-elimina-evento").show();
            jQuery('#event-detail').modal('show');
        }
    });


    jQuery(document).on("click", ".fc-content", function () {

    });


    jQuery("#ricerca-cliente").autocomplete({
        source: function (request, response) {
            jQuery.ajax({
                url: "../wp-content/themes/casarabatti/clienti.php",
                dataType: "json",
                type: "POST",
                context: this,
                data: {
                    term: request.term,
                    row_num: 1
                },
                success: function (data) {
                    response(jQuery.map(data, function (item) {
                        var code = item.split("|");
                        return {
                            label: code[1],
                            value: code[1],
                            data: item
                        }
                    }));
                }
            });
        },
        autoFocus: true,
        minLength: 2,
        select: function (event, ui) {
            var names = ui.item.data.split("|");
            jQuery("#ricerca-cliente-hidden").val(names[0]); // save selected id to hidden input
        }
    });


    jQuery("#ricerca-cliente-edit").autocomplete({
        source: function (request, response) {
            jQuery.ajax({
                url: "../wp-content/themes/casarabatti/clienti.php",
                dataType: "json",
                type: "POST",
                context: this,
                data: {
                    term: request.term,
                    row_num: 1
                },
                success: function (data) {
                    response(jQuery.map(data, function (item) {
                        var code = item.split("|");
                        return {
                            label: code[1],
                            value: code[1],
                            data: item
                        }
                    }));
                }
            });
        },
        autoFocus: true,
        minLength: 2,
        select: function (event, ui) {
            var names = ui.item.data.split("|");
            jQuery("#ricerca-cliente-edit-hidden").val(names[0]); // save selected id to hidden input
            jQuery("#cognome-nome").val(names[1]);
            jQuery("#telefono").val(names[2]);
            jQuery("#email").val(names[3]);
            jQuery("#indirizzo").val(names[4]);
            jQuery("#citta").val(names[5]);
            jQuery("#nazione").val(names[6]);

        }
    });


    jQuery(document).on("click", "#add-customer", function (event) {
        event.preventDefault();
        var customer = jQuery("#ricerca-cliente").val();
        if (customer.toString() !== "") {
            jQuery("#cliente").val(customer);
            var idCliente = jQuery("#ricerca-cliente").data("id");
            jQuery("#cliente").data("id", idCliente);
        }
    });

    jQuery(document).on("click", "#new-customer", function () {
        jQuery("#ClienteLabel").html("Nuovo Cliente");
        jQuery("#edit-customer").attr("id","save-customer");
        jQuery("#label-search-customer").hide();
        jQuery("#search-customer").hide();
        jQuery('#event-detail').modal('hide');
        jQuery('#customer-detail').modal('show');
    });

    jQuery(document).on("click","#edit-customer",function(event) {
        event.preventDefault();
        jQuery(".wait-msg").modal("show");
        var formData = {
            'id' : jQuery("#ricerca-cliente-edit-hidden").val(),
            'nome': jQuery("#cognome-nome").val(),
            'email': jQuery("#email").val(),
            'telefono': jQuery("#telefono").val(),
            'indirizzo': jQuery("#indirizzo").val(),
            'citta': jQuery("#citta").val(),
            'nazione': jQuery("#nazione").val(),
            'type' : "edit"
        };

        // process the form
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/clientiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                // log data to the console so we can see
                if (data.success == false) {
                    console.log(data);
                }
                jQuery(".wait-msg").modal("hide");
                jQuery('#customer-detail').modal('hide');
                jQuery("#ricerca-cliente-edit-hidden").val("");
                jQuery("#edit-customer").attr("id","save-customer");
                // here we will handle errors and validation messages
            });


    });
    jQuery(document).on("click", "#save-customer", function (event) {
        event.preventDefault();
        jQuery(".wait-msg").modal("show");
        var formData = {
            'nome': jQuery("#cognome-nome").val(),
            'email': jQuery("#email").val(),
            'telefono': jQuery("#telefono").val(),
            'indirizzo': jQuery("#indirizzo").val(),
            'citta': jQuery("#citta").val(),
            'nazione': jQuery("#nazione").val(),
            'type' : "add"
        };

        // process the form
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/clientiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                // log data to the console so we can see
                if (data.success == false) {
                    console.log(data);
                }
                jQuery(".wait-msg").modal("hide");
                jQuery('#customer-detail').modal('hide');
                // here we will handle errors and validation messages
            });

    });

    jQuery(document).on("click", "#manage-customer", function (event) {
        event.preventDefault();
        jQuery("#ClienteLabel").html("Gestisci Clienti");
        jQuery("#label-search-customer").show();
        jQuery("#search-customer").show();
        jQuery("#save-customer").attr("id","edit-customer");
        jQuery('#customer-detail').modal('show');
    });

    jQuery('#customer-detail').on('show.bs.modal', function () {
        jQuery("#cognome-nome").val("");
        jQuery("#email").val("");
        jQuery("#telefono").val("");
        jQuery("#indirizzo").val("");
        jQuery("#citta").val("");
        jQuery("#nazione").val("");
        jQuery("#ricerca-cliente-edit").val("");
        jQuery("#note").val("");
        jQuery(".alert").hide();
    });

    jQuery(document).on("click", ".btn-elimina-evento", function (event) {
        jQuery("#event-type-hidden").val("delete");
        jQuery( ".btn-salva-evento" ).trigger( "click" );
    });

    jQuery(document).on("click", ".btn-salva-evento", function (event) {
        event.preventDefault();

        var evento = {
            cliente: jQuery("#ricerca-cliente-hidden").val(),
            ambiente: jQuery("#ambiente").val(),
            arrivo: jQuery("#arrivo-cal").val(),
            partenza: jQuery("#partenza-cal").val(),
            tipo: jQuery("#event-type-hidden").val(),
            id: jQuery("#event-id-hidden").val(),
            note: jQuery("#note").val()
        };

        manageEvent(evento);

    });

    function manageEvent(evento) {
        jQuery.ajax({
            url: '../wp-content/themes/casarabatti/eventiSubmit.php', // the url where we want to POST
            data: evento,
            type: "POST",
            dataType: 'json'
        })
            .done(function (data) {
                if (data.success == false) {
                    jQuery.each(data.errors, function (key, value) {
                        switch (key) {
                            case "cliente":
                                jQuery("#cliente-error").html(value);
                                jQuery("#cliente-error").show();
                                break;
                            case "arrivo":
                                jQuery("#arrivo-error").html(value);
                                jQuery("#arrivo-error").show();
                                break;
                            case "partenza":
                                jQuery("#partenza-error").html(value);
                                jQuery("#partenza-error").show();
                                break;
                            case "ambiente":
                                jQuery("#ambiente-error").html(value);
                                jQuery("#ambiente-error").show();
                                break;
                        }
                    });
                } else {
                    jQuery("#ricerca-cliente").val("");
                    jQuery("#ricerca-cliente-hidden").val("");
                    jQuery("#cliente").val("");
                    jQuery("#ambiente").val("");
                    jQuery("#partenza-cal").val("");
                    jQuery(".alert").hide();
                    jQuery('#event-detail').modal('hide');
                    jQuery('#calendar').fullCalendar(
                        'refetchEvents'
                    );
                }

            });

    }

    jQuery(document).on("click",".btn-cliente-edit",function(){
       alert("clicked");
    });
});

