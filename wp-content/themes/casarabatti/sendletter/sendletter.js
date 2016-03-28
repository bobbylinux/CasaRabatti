jQuery(document).ready(function () {

    var $selectedVar = false;

    jQuery(document).on("submit", "#form-newsletter", function (event) {
        event.preventDefault();


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
            'interessiTutti': jQuery("#all-selected-newsletter").val()

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
                } else {
                    jQuery("#modal-invio").modal('show');
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

});