<?php get_header(); ?>
<!-- qua andrà la slide -->
<header>
    <div class="header-content" id="slider">
        <?php echo do_shortcode('[wonderplugin_slider id="2"]'); ?>
    </div>
    </div>
</header>

<!-- qua la striscia prenota -->
<form class="form-inline reservation">
    <div class="col-lg-12">
        <div class="form-group verifica-disonibilita">
            <h4>Verifica Disponibilit&agrave;</h4>
        </div>
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
    </div>
</form>

<section class="bg-primary welcome" id="struttura">
    <div class="container-fluid">
        <?php $the_post = get_post(11); ?>
        <div class="row">
            <div class="col-lg-12 text-center main-title">
                <h2 class="section-heading"><?php echo $the_post->post_title; ?></h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-1 vcenter">
                <p class="text-faded">
                    <?php echo $the_post->post_content; ?>
                </p>
            </div>
            <div class="col-lg-4 vcenter">
                <img src="<?php echo get_template_directory_uri() . '/img/slide_01_b.jpg'; ?>"
                     class="img-responsive" alt="">
            </div>
        </div>
    </div>
</section>
<section id="locali" class="rooms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5 vcenter">
                <div class="row no-gutter">
                    <div class="col-lg-6">
                        <a href="#" class="portfolio-box">
                            <?php echo do_shortcode('[nggallery id=20 template=limonaia]'); ?>
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a href="#" class="portfolio-box">
                            <?php echo do_shortcode('[nggallery id=21 template=limonaia]'); ?>
                        </a>
                    </div>
                </div>
                <div class="row no-gutter">
                    <div class="col-lg-6">
                        <a href="#" class="portfolio-box">
                            <?php echo do_shortcode('[nggallery id=22 template=limonaia]'); ?>
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a href="#" class="portfolio-box">
                            <?php echo do_shortcode('[nggallery id=23 template=limonaia]'); ?>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 vcenter">
                <?php $the_post = get_post(16); ?>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading"><?php echo $the_post->post_title; ?></h2>
                        <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                             class="img-responsive primary" alt="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p class="">
                            <?php echo $the_post->post_content; ?>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<section class="bg-primary welcome" id="dove-siamo">
    <div class="container-fluid">
        <?php $the_post = get_post(18); ?>
        <div class="row">
            <div class="col-lg-12 text-center main-title">
                <h2 class="section-heading"><?php echo $the_post->post_title; ?></h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-lg-offset-1 vcenter">
                <p class="text-faded">
                    <?php echo $the_post->post_content; ?>
                </p>
            </div>
            <div class="col-lg-5 vcenter">
                <?php echo do_shortcode("[huge_it_maps id='1']"); ?>
            </div>
        </div>
    </div>
</section>

<section id="contatti" class="contacts">
    <div class="container">

        <?php $the_post = get_post(224); ?>
        <div class="row">
            <div class="col-lg-12 text-center main-title">
                <h2 class="section-heading"><?php echo $the_post->post_title; ?></h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <p><?php echo $the_post->post_content; ?></p>
            </div>
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
<section class="bg-primary partners" id="partners">
    <div class="container-fluid">
        <?php $the_post = get_post(227); ?>
        <div class="row">
            <div class="col-lg-12 text-center main-title">
                <h2 class="section-heading"><?php echo $the_post->post_title; ?></h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-1 vcenter">
                <p class="text-faded">
                    <?php echo $the_post->post_content; ?>
                </p>
            </div>
            <div class="col-lg-4 vcenter">
                <img src="<?php echo get_template_directory_uri() . '/img/slide_01_b.jpg'; ?>"
                     class="img-responsive" alt="">
            </div>
        </div>
    </div>
</section>

<?php get_footer(); ?>
