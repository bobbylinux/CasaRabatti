<?php get_header(); ?>
<!-- qua andrà la slide -->
<header>
    <div class="header-content">
        <div class="header-content-inner">
            <?php masterslider(1); ?>
            <h2 class="section-heading welcome-title">Benvenuto in Casa Rabatti</h2>
               
            
        </div>
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
        <?php $the_post =  get_post(34); ?>
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading"><?php echo  $the_post->post_title; ?></h2>
                <hr class="primary">
            </div>
        </div>
        <div class="row">           
            <div class="col-lg-8">
                <p class="text-faded">
                   <?php echo $the_post->post_content;?>
                </p>
            </div>
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
                                
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <?php $the_post =  get_post(36); ?>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading"><?php echo $the_post->post_title;?></h2>
                    <hr class="primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p class="">
                       <?php echo $the_post->post_content;?>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="dove-siamo" class="bg-primary location">
    <div class="container">
        <?php $the_post =  get_post(38); ?>
        <div class="row">
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading"><?php echo $the_post->post_title;?></h2>
                        <hr class="primary">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-faded">
                            <?php echo $the_post->post_content;?>
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

        <?php $the_post =  get_post(40); ?>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading"><?php echo $the_post->post_title;?></h2>
                <hr class="primary">
                <p><?php echo $the_post->post_content;?></p>
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
