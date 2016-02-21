<?php get_header(); ?>
<!-- qua andrà la slide -->
<header>
    <div class="header-content">
        <div class="header-content-inner">

            <?php masterslider(1); ?>

        </div>
    </div>
</header>

<!-- qua la striscia prenota -->
<form class="form-inline reservation">
    <div class="form-group">
        <i class="fa fa-4x fa-calendar-check-o wow bounceIn text-primary" data-wow-delay=".1s"></i>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="arrivo" placeholder="Arrivo">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="partenza" placeholder="Partenza">
    </div>
    <a href="#" class="btn btn-default btn-xl">Verifica</a>
</form>

<section class="bg-primary welcome" id="struttura">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3 text-center">
            <h2 class="section-heading">Benvenuto in Casa Rabatti</h2>
            <hr class="light">
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <!--foto-->
            <img src="<?php echo get_template_directory_uri() . '/img/header.jpg'; ?>" class="img-responsive" alt="">
        </div>
        <div class="col-lg-8">
            <p class="text-faded">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed urna non risus tempus laoreet. Integer
                id felis ac sem mollis commodo a tristique augue. In libero dolor, gravida id viverra ut, mollis vel
                risus. Donec molestie massa ultrices mauris malesuada, a consequat eros auctor. Duis nisi tellus,
                condimentum sit amet ornare et, ultrices et ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Proin vestibulum ornare quam, sit amet tempus ante venenatis non. Pellentesque commodo erat at felis
                pellentesque tempor. Sed non justo nibh. Fusce id est placerat, dapibus purus tristique, sollicitudin
                velit. In feugiat, magna vel cursus blandit, massa felis commodo lacus, in mollis nibh leo a arcu.
                Curabitur id aliquet felis. Nulla sit amet elit eu lectus sollicitudin lobortis. Aliquam condimentum vel
                ipsum sit amet sollicitudin. Suspendisse potenti. Curabitur nunc tellus, sagittis id turpis eget,
                blandit vestibulum massa.
            </p>
        </div>
    </div>
</section>
<section id="locali" class="rooms">
    <div class="container-fluid">
        <div class="col-lg-8">
            <div class="row no-gutter">
                <div class="col-lg-6">
                    <a href="#" class="portfolio-box">
                        <img src="<?php echo get_template_directory_uri() . '/img/slide_01_b.jpg'; ?>"
                             class="img-responsive" alt="">

                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">

                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a href="#" class="portfolio-box">
                        <img src="<?php echo get_template_directory_uri() . '/img/slide_02_b.jpg'; ?>"
                             class="img-responsive" alt="">

                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="row no-gutter">
                <div class="col-lg-6">
                    <a href="#" class="portfolio-box">
                        <img src="<?php echo get_template_directory_uri() . '/img/slide_03_b.jpg'; ?>"
                             class="img-responsive" alt="">

                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a href="#" class="portfolio-box">
                        <img src="<?php echo get_template_directory_uri() . '/img/slide_05_b-1.jpg'; ?>"
                             class="img-responsive" alt="">

                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">I Locali</h2>
                    <hr class="primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p class="">
                        Proin lacinia diam eu blandit viverra. Sed condimentum mauris eros, vel feugiat mi congue et.
                        Quisque in turpis justo. Aenean pharetra vulputate elit, in dictum risus pellentesque sit amet.
                        Morbi eu ante sed eros rhoncus bibendum. Cras a nisi erat. Aliquam mi neque, varius eget
                        convallis et, aliquam viverra elit.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="dove-siamo" class="bg-primary location">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Dove Siamo</h2>
                        <hr class="primary">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-faded">
                            Nunc laoreet nisl lorem, consequat finibus tortor convallis ac. Mauris ut odio porta, ultrices tortor quis, mattis ligula. Donec congue eros quis ligula rutrum, et interdum risus fringilla. Quisque euismod commodo iaculis.
                        </p>
                    </div>
                </div>

            </div>
            <div class="col-lg-8">
                <iframe class="map"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6236.307000560893!2d11.250786546960951!3d43.77469133191034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132a541cfda04781%3A0xdb119873f5022caf!2sVia+S.+Zanobi%2C+48%2C+50129+Firenze!5e0!3m2!1sit!2sit!4v1455924896838"
                        width="600" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</section>

<section id="contatti" class="contacts">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Contattaci</h2>
                <hr class="primary">
                <p>Aenean scelerisque, purus sit amet tempor blandit, elit erat cursus purus, sed suscipit lorem libero
                    eget lacus. Morbi at tortor pharetra, ultrices dolor ac, tincidunt mauris. In ut sem vel odio
                    laoreet cursus.</p>
            </div>
            <div class="col-lg-4 col-lg-offset-2 text-center">
                <i class="fa fa-phone fa-3x wow bounceIn"></i>

                <p>+39 338.1534159</p>
            </div>
            <div class="col-lg-4 text-center">
                <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>

                <p><a href="mailto:info@casarabatti.it">info@casarabatti.it</a></p>
            </div>
        </div>
    </div>
</section>

<?php get_footer(); ?>
