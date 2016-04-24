/*!
 * Start Bootstrap - Creative Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

(function ($) {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function (event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 50)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    })

    // Closes the Responsive Menu on Menu Item Click

    $(document).on("click",".navbar-collapse a", function(){
        $('.navbar-toggle:visible').click();
    });

    // Fit Text Plugin for Main Header
    $("h1").fitText(
        1.2, {
            minFontSize: '35px',
            maxFontSize: '65px'
        }
    );

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 100
        }
    })

    // Initialize WOW.js Scrolling Animations
    new WOW().init();

    $(document).on("click", ".page-scroll", function (e) {
        // prevent default anchor click behavior
        e.preventDefault();

        // store hash
        var hash = this.hash;

        // animate
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 1000, function () {

            // when done, add hash to url
            // (default click behaviour)
            window.location.hash = hash;
        });
    });

    $(function () {

        $('#arrivo').datepicker({
            format: 'dd/mm/yyyy',
            language: 'it',
            startDate: new Date(),
            autoclose: true
        });
        $('#partenza').datepicker({
            format: 'dd/mm/yyyy',
            language: 'it',
            startDate: new Date(),
            autoclose: true
        });
        $("#arrivo").on("dp.change", function (e) {
            $('#partenza').data("DatePicker").minDate(e.date);
        });
        $("#partenza").on("dp.change", function (e) {
            $('#arrivo').data("DatePicker").maxDate(e.date);
            console.log(e.date);
        });
    });

    $(document).on("click", ".btn-contattaci", function (event) {
        event.preventDefault();

        $("#ambiente-id").val($(this).data("id"));
        $('#contact-detail').modal('show');
    });

    $(document).on("submit", ".form-newsletter", function (e) {
        e.preventDefault();
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)

        jQuery(".wait-msg").modal('show');
        var chkArray = [];

        /* look for all checkboes that have a class 'chk' attached to it and check if it was checked */
        jQuery(".chk:checked").each(function () {
            chkArray.push(jQuery(this).val());
        });

        /* we join the array separated by the comma */
        var $selected;
        $selected = chkArray.join(',');

        var formData = {
            'nome': $("#nome").val(),
            'email': $("#email").val(),
            'captchaResponse': $("#g-recaptcha-response").val(),
            'interessi': $selected,
        };

        // process the form
        $.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: 'wp-content/themes/casarabatti/newsletterSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {
                jQuery(".wait-msg").modal('hide');
                // log data to the console so we can see
                if (data.success === true) {

                    $('#modal-newsletter').modal('show');
                } else {
                    var $errors = "";
                    console.log(data);
                    $.each(data.errors, function (key, value) {
                        $errors += "<p>" + value + "</p>";
                    });
                    jQuery("#error-msg-text").html($errors);
                    jQuery(".error-msg").modal("show");
                }
            });
    });

    $(document).on("click", ".btn-invia-richiesta", function (e) {
        e.preventDefault();
        $("body").css({"cursor": "wait"});
        $(".alert").hide();

        var formData = {
            'nome': $("#nome").val(),
            'mail': $("#mail").val(),
            'telefono': $("#telefono").val(),
            'arrivo': $("#arrivo").val(),
            'partenza': $("#partenza").val(),
            'adulti': $("#adulti").val(),
            'bambini': $("#bambini").val(),
            'messaggio': $("#messaggio").val(),
            'ambiente': $("#ambiente-id").val()
        };

        // process the form
        $.ajax({
            type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url: 'wp-content/themes/casarabatti/contattaciSubmit.php', // the url where we want to POST
            data: formData, // our data object
            dataType: 'json', // what type of data do we expect back from the server
            encode: true
        })
            // using the done promise callback
            .done(function (data) {

                $("body").css({"cursor": "pointer"});
                // log data to the console so we can see
                if (data.success === true) {
                    $("#nome").val("");
                    $("#mail").val("");
                    $("#telefono").val("");
                    $("#arrivo").val("");
                    $("#partenza").val("");
                    $('#adulti').find(":selected").text();
                    $('#bambini').find(":selected").text();
                    $("#messaggio").val("");
                    $("#ambiente-id").val("");

                    $('#contact-detail').modal('hide');
                } else {
                    var $errors = "";
                    console.log(data);
                    $.each(data.errors, function (key, value) {
                        switch (key) {
                            case "nome":
                                $("#nome-error").html(value);
                                $("#nome-error").show();
                                break;
                            case "mail":
                                $("#mail-error").html(value);
                                $("#mail-error").show();
                                break;
                            case "telefono":
                                $("#telefono-error").html(value);
                                $("#telefono-error").show();
                                break;
                            case "arrivo":
                                $("#arrivo-error").html(value);
                                $("#arrivo-error").show();
                                break;
                            case "partenza":
                                $("#partenza-error").html(value);
                                $("#partenza-error").show();
                                break;
                            case "adulti":
                                $("#adulti-error").html(value);
                                $("#adulti-error").show();
                                break;
                            case "bambini":
                                $("#bambini-error").html(value);
                                $("#bambini-error").show();
                                break;
                        }
                    });

                }
            });
    });

    $(document).on("click", ".btn-annulla-richiesta", function () {
        $("#contact-detail").modal("hide");
        $("#nome").val("");
        $("#mail").val("");
        $("#telefono").val("");
        $("#arrivo").val("");
        $("#partenza").val("");
        $("#adulti").val("");
        $("#bambini").val("");
        $("#messaggio").val("");
        $("#ambiente-id").val("");
        $(".alert").hide();
    });
})(jQuery); // End of use strict
