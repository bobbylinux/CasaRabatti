jQuery(document).ready(function () {
    var $submitter = null;
    var $selectedVar = false;
    var $body = jQuery("body");

    jQuery(document).on("click",".btn-invia", function(event) {

        $submitter = jQuery(this).html();
    });

    jQuery(document).on("click",".btn-invia-prova", function(event) {

        $submitter = jQuery(this).html();
    });

    jQuery(document).on("submit", "#form-newsletter", function (event) {
        event.preventDefault();

        jQuery(".wait-msg").modal('show');

        jQuery("#subject-error").hide();
        jQuery("#message-error").hide();
        jQuery("#interessi-error").hide();


        var chkArray = [];

        /* look for all checkboes that have a class 'chk' attached to it and check if it was checked */
        jQuery(".chk:checked").each(function () {
            chkArray.push(jQuery(this).val());
        });

        /* we join the array separated by the comma */
        var selected;
        selected = chkArray.join(',');

        var formData = {
            'oggetto': jQuery("#subject-newsletter").val(),
            'testo': jQuery("#text-newsletter").val(),
            'interessi': selected,
            'interessiTutti': jQuery("#all-selected-newsletter").val(),
            'invio' : $submitter
        };


        // process the form
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/sendletterSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {

                console.log(data);
                if (typeof data.errors !== 'undefined') {
                    $num = data.errors.length;
                    for ($i = 0; $i < $num; $i++) {
                        if (data.errors[$i] == "oggetto") {
                            jQuery("#subject-error").show();
                        }
                        if (data.errors[$i] == "messaggio") {
                            jQuery("#message-error").show();
                        }
                        if (data.errors[$i] == "interessi") {
                            jQuery("#interessi-error").show();
                        }
                    }

                    jQuery(".wait-msg").modal('hide');
                } else {
                    if (typeof data.message !== 'undefined') {
                        if (data.message == "fake") {
                            jQuery.ajax({
                                type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
                                url: '../wp-content/themes/casarabatti/sendletter/mailAjax.php', // the url where we want to POST
                                data: formData, // our data object
                                dataType: 'json', // what type of data do we expect back from the server
                                encode: true

                            }).done(function (data) {

                                jQuery(".wait-msg").modal('hide');
                                jQuery("#modal-invio-prova").modal('show');

                            });
                        } else {

                            jQuery(".wait-msg").modal('hide');
                            jQuery("#modal-invio").modal('show');
                        }
                    }

                }

            });

    });


    jQuery('#text-newsletter').ckeditor();

    jQuery(document).on("click", "#toggle-selection", function (event) {
        event.preventDefault();

        if ($selectedVar === false) {
            jQuery(".chk").each(function () {
                jQuery('.chk').prop('checked', true);
            });
            jQuery(this).html("Deseleziona Tutto");
            jQuery("#all-selected-newsletter").val("1");
            $selectedVar = true;
        } else {
            jQuery(".chk").each(function () {
                jQuery('.chk').prop('checked', false);
            });
            jQuery(this).html("Seleziona Tutto");
            jQuery("#all-selected-newsletter").val("0");
            $selectedVar = false;
        }
    });

    jQuery(document).on("change", ".chk", function () {
        var allSelected = checkSelected();
        if (allSelected === false) {
            jQuery("#all-selected-newsletter").val("0");
        } else {
            jQuery("#all-selected-newsletter").val("1");
        }
    });

    function checkSelected() {
        var allSelected = true;
        jQuery(".chk").each(function () {
            if (!jQuery('.chk').is(':checked')) {
                allSelected = false;
            }
        });
        return allSelected;
    }

    jQuery(document).on("click","#btn-add-interesse",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'interesse': jQuery("#interesse-input").val(),
            'type'     : 'add'

        };


        jQuery(".wait-msg").modal('show');

        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/interessiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery("#table-interessi tr:last").after(data.message);
                    jQuery("#interesse-input").val("");
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });

    jQuery(document).on("click",".btn-del-interesse",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'type'     : 'delete',
            'id'       : jQuery(this).data("id")

        };

        jQuery(".wait-msg").modal('show');
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/interessiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            context: this,
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery(this).closest('tr').remove();
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });

    jQuery(document).on("click",".btn-edit-interesse",function(event){
        event.preventDefault();
        jQuery(this).html("Salva");
        jQuery(this).closest("tr").find(".interesse-edit-input").show();
        jQuery(this).closest("tr").find(".interesse-td").hide();
        jQuery(this).removeClass("btn-edit-interesse");
        jQuery(this).addClass("btn-save-interesse");
    });

    jQuery(document).on("click",".btn-save-interesse",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'type'     : 'edit',
            'id'       : jQuery(this).data("id"),
            'interesse': jQuery(this).closest("tr").find(".interesse-edit-input").val()

        };


        jQuery(".wait-msg").modal('show');

        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/interessiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true,
            context: this
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery(this).html("Modifica");
                    jQuery(this).removeClass("btn-save-interesse");
                    jQuery(this).addClass("btn-edit-interesse");
                    jQuery(this).closest("tr").find(".interesse-td").html(jQuery(this).closest("tr").find(".interesse-edit-input").val());
                    jQuery(this).closest("tr").find(".interesse-edit-input").hide();
                    jQuery(this).closest("tr").find(".interesse-td").show();
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });


    jQuery(document).on("click",".btn-del-iscritto",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'type'     : 'delete',
            'id'       : jQuery(this).data("id")

        };

        jQuery(".wait-msg").modal('show');
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/iscrittiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            context: this,
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery(this).closest('tr').remove();
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });

    jQuery(document).on("click",".btn-confirm-iscritto",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'type'     : 'confirm',
            'id'       : jQuery(this).data("id")

        };

        jQuery(".wait-msg").modal('show');
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/iscrittiSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            context: this,
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery(this).closest('tr').remove();
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });


    jQuery(document).on("click","#btn-add-iscritto-prova",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'indirizzo': jQuery("#iscritto-prova-input").val(),
            'type'     : 'add'

        };


        jQuery(".wait-msg").modal('show');

        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/iscrittiProvaSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery("#table-iscritti-prova tr:last").after(data.message);
                    jQuery("#iscritto-prova-input").val("");
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });

    jQuery(document).on("click",".btn-edit-iscritto-prova",function(event){
        event.preventDefault();
        jQuery(this).html("Salva");
        jQuery(this).closest("tr").find(".iscritto-prova-edit-input").show();
        jQuery(this).closest("tr").find(".iscritto-prova-td").hide();
        jQuery(this).removeClass("btn-edit-iscritto-prova");
        jQuery(this).addClass("btn-save-iscritto-prova");
    });

    jQuery(document).on("click",".btn-save-iscritto-prova",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'type'     : 'edit',
            'id'       : jQuery(this).data("id"),
            'indirizzo': jQuery(this).closest("tr").find(".iscritto-prova-edit-input").val()

        };


        jQuery(".wait-msg").modal('show');

        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/iscrittiProvaSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true,
            context: this
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery(this).html("Modifica");
                    jQuery(this).removeClass("btn-save-iscritto-prova");
                    jQuery(this).addClass("btn-edit-iscritto-prova");
                    jQuery(this).closest("tr").find(".iscritto-prova-td").html(jQuery(this).closest("tr").find(".iscritto-prova-edit-input").val());
                    jQuery(this).closest("tr").find(".iscritto-prova-edit-input").hide();
                    jQuery(this).closest("tr").find(".iscritto-prova-td").show();
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });

    jQuery(document).on("click",".btn-del-iscritto-prova",function(event){
        event.preventDefault();
        // process the form
        var formData = {
            'type'     : 'delete',
            'id'       : jQuery(this).data("id")

        };

        jQuery(".wait-msg").modal('show');
        jQuery.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: '../wp-content/themes/casarabatti/sendletter/iscrittiProvaSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            context: this,
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                console.log(data);
                if (data.success == true) {
                    jQuery(this).closest('tr').remove();
                } else {
                    jQuery("#error-msg-text").html(data.errors);
                    jQuery(".error-msg").modal("show");
                }

            });
    });

});

