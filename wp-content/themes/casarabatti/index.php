<?php get_header(); ?>
<!-- qua andrà la slide -->
<header>
    <div class="header-content" id="slider">
        <?php echo do_shortcode('[wonderplugin_slider id="1"]'); ?>
    </div>
</header>
<!-- qua la striscia prenota -->
<section class="reservation">
    <div class="container">
        <form class="form-inline">
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <i class="fa fa-4x fa-calendar-check-o wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="arrivo" placeholder="Arrivo">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="partenza" placeholder="Partenza">
                    </div>
                    <div class="form-group persone">
                        <label for="sel1">Persone</label>
                        <select class="form-control" id="persone" placeholder="Persone">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                        </select>
                    </div>
                    <a href="#" class="btn btn-default btn-xl btn-verifica">Verifica Disponibilit&agrave;</a>
                </div>
            </div>
        </form>
    </div>
</section>
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
                <img src="<?php echo get_template_directory_uri() . '/img/header.jpg'; ?>"
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
        <div class="row">
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
<section class="bg-primary newsletter" id="newsletter">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center main-title">
                <h2 class="section-heading">Newsletter</h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <p>Se siete interessati a ricevere informazioni da Casa Rabatti
                    <br>iscrivetevi alla nostra mailing list.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 text-center">
                <form class="form-newsletter">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nome" placeholder="Nome E Cognome">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <div class="g-recaptcha" data-sitekey="6LfagxsTAAAAAA5Cy4nVCL3qs5tTAlFli-qpCf4R"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-block btn-default">Registrati</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<section class="partners" id="partners">
    <div class="container-fluid">
        <?php $the_post =  get_post(231); ?>
        <div class="row">
            <div class="col-lg-12 text-center main-title">
                <h2 class="section-heading"><?php echo $the_post->post_title; ?></h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-lg-offset-1 vcenter">
                <img src="<?php echo get_template_directory_uri() . '/img/genesi.jpg'; ?>"
                     class="img-responsive" alt="">
            </div>
            <div class="col-lg-6 vcenter">
                <p>
                    <?php echo $the_post->post_content; ?>
                </p>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="modal-newsletter" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p>Iscrizione alla newsletter avvenuta correttamente<br>A breve riceverai una mail di conferma</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Chiudi</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php get_footer(); ?>
