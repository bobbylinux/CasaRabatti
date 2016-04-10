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
    $('.navbar-collapse ul li a').click(function () {
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

        $('#arrivo').datetimepicker({
            format: 'DD/MM/YYYY',
            locale: 'it'
        });
        $('#partenza').datetimepicker({
            format: 'DD/MM/YYYY',
            locale: 'it',
            useCurrent: false //Important! See issue #1075
        });
        $("#arrivo").on("dp.change", function (e) {
            $('#partenza').data("DateTimePicker").minDate(e.date);
        });
        $("#partenza").on("dp.change", function (e) {
            $('#arrivo').data("DateTimePicker").maxDate(e.date);
            console.log(e.date);
        });
    });

    $(document).on("submit",".form-newsletter",function(e){
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
            'nome'              : $("#nome").val(),
            'email'             : $("#email").val(),
            'captchaResponse'   : $("#g-recaptcha-response").val(),
            'interessi'         : $selected,
        };

        // process the form
        $.ajax({
                type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                url         : 'wp-content/themes/casarabatti/newsletterSubmit.php', // the url where we want to POST
                data        : formData, // our data object
                dataType    : 'json', // what type of data do we expect back from the server
                encode          : true
            })
            // using the done promise callback
            .done(function(data) {
                jQuery(".wait-msg").modal('hide');
                // log data to the console so we can see
                if (data.success === true) {

                    $('#modal-newsletter').modal('show');
                } else {
                    var $errors = "";
                    console.log(data);
                    $.each( data.errors, function( key, value ) {
                        $errors += "<p>"+value+ "</p>";
                    });
                    jQuery("#error-msg-text").html($errors);
                    jQuery(".error-msg").modal("show");
                }
            });
    })



})(jQuery); // End of use strict
