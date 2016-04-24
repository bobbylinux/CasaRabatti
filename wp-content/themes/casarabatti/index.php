<?php get_header(); ?>
    <!-- qua andrà la slide -->
    <header>
        <div class="header-content" id="slider">
            <?php echo do_shortcode('[wonderplugin_slider id="1"]'); ?>
        </div>
    </header>
    <section class="reservation">
        <div class="container">
            <form class="form-inline" action="ambienti" method="post">
                <div class="col-xs-12 text-center">
                    <div class="form-group">
                        <i class="fa fa-4x fa-calendar-check-o wow bounceIn text-primary" data-wow-delay=".1s"></i>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control hidden-xs" id="arrivo" name="arrivo"
                               placeholder="Arrivo">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control hidden-xs" id="partenza" name="partenza"
                               placeholder="Partenza">
                    </div>
                    <div class="form-group persone hidden-xs">
                        <label for="sel1">Adulti</label>
                        <select class="form-control" id="persone" name="adulti" placeholder="Adulti">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                        </select>
                    </div>
                    <div class="form-group bambini hidden-xs">
                        <label for="sel1">Bambini</label>
                        <select class="form-control" id="bambini" name="bambini" placeholder="Bambini">
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-default btn-xl btn-verifica hidden-xs" value="verifica"/>
                    </div>
                </div>
                <div class="form-group visible-xs-block">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <input type="submit" class="btn btn-default btn-block btn-verifica-xs" value="Prenota"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
<?php
$the_post = get_post(11);
$postId = str_replace(' ', '-', __($the_post->post_title));
?>
    <section class="bg-primary welcome" id="<?php echo strtolower($postId); ?>">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 text-center main-title">
                    <h2 class="section-heading"><?php echo __($the_post->post_title); ?></h2>
                    <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                         class="img-responsive primary" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 hidden-sm hidden-xs col-md-offset-1 vcenter">
                    <p class="text-faded">
                        <?php echo __($the_post->post_content); ?>
                    </p>
                </div>
                <div class="visible-xs-block visible-sm-block text-center col-xs-12 vcenter">
                    <p class="text-faded">
                        <?php echo __($the_post->post_content); ?>
                    </p>
                </div>
                <div class="col-md-4 vcenter col-xs-10 col-xs-offset-1">
                    <img src="<?php echo get_template_directory_uri() . '/img/old-stile.png'; ?>"
                         class="img-responsive" alt="">
                </div>
            </div>
        </div>
    </section>
<?php
$the_post = get_post(16);
$postId = str_replace(' ', '-', __($the_post->post_title));
?>
    <section id="<?php echo strtolower($postId); ?>" class="rooms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 text-center main-title">
                    <h2 class="section-heading"><?php echo __($the_post->post_title); ?></h2>
                    <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                         class="img-responsive primary" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-5 col-xs-offset-1">
                    <div class="row no-gutter">
                        <div class="col-sm-12">
                            <a href="#" class="portfolio-box">
                                <?php echo do_shortcode('[nggallery id=290 template=limonaia]'); ?>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-5">
                    <div class="row no-gutter">
                        <div class="col-sm-12">
                            <a href="#" class="portfolio-box">
                                <?php echo do_shortcode('[nggallery id=294 template=limonaia]'); ?>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-5 col-xs-offset-1">
                    <div class="row no-gutter">
                        <div class="col-xs-12">
                            <a href="#" class="portfolio-box">
                                <?php echo do_shortcode('[nggallery id=296 template=limonaia]'); ?>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-5">
                    <div class="row no-gutter">
                        <div class="col-xs-12">
                            <a href="#" class="portfolio-box">
                                <?php echo do_shortcode('[nggallery id=292 template=limonaia]'); ?>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p class="">
                        <?php echo __($the_post->post_content); ?>
                    </p>
                </div>
            </div>
        </div>
    </section>

<?php
$the_post = get_post(18);
$postId = str_replace(' ', '-', __($the_post->post_title));
?>
    <section class="bg-primary welcome" id="<?php echo strtolower($postId); ?>">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 text-center main-title">
                    <h2 class="section-heading"><?php echo __($the_post->post_title); ?></h2>
                    <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                         class="img-responsive primary" alt="">
                </div>
            </div>
            <div class="row map-row">
                <div class="col-xs-10 col-xs-offset-1 vcenter text-center">
                    <?php echo do_shortcode("[huge_it_maps id='1']"); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 vcenter text-center">
                    <p class="text-faded">
                        <?php echo __($the_post->post_content); ?>
                    </p>
                </div>
            </div>
        </div>
    </section>
<?php
$the_post = get_post(224);
$postId = str_replace(' ', '-', __($the_post->post_title));
?>
    <section id="<?php echo strtolower($postId); ?>" class="contacts">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 text-center main-title">
                    <h2 class="section-heading"><?php echo __($the_post->post_title); ?></h2>
                    <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                         class="img-responsive primary" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p><?php echo __($the_post->post_content); ?></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>

                    <p>+39 338.1534159</p>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>

                    <p><a href="mailto:info@casarabatti.it">info@casarabatti.it</a></p>
                </div>
            </div>
        </div>
    </section>
    <!-- newsletter -->
    <section class="bg-primary newsletter" id="newsletter">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center main-title">
                    <h2 class="section-heading">Newsletter</h2>
                    <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                         class="img-responsive primary" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p>Se siete interessati a ricevere informazioni da Casa Rabatti
                        <br>iscrivetevi alla nostra mailing list.</p>
                </div>
            </div>
            <?php

            try {
                $con = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
                mysqli_select_db($con, "casarabatti");
            } catch (mysqli_sql__xception $error) {
                echo json__ncode(array("error" => $error->getMessage()));
            }
            $result_interessi = mysqli_query($con, "SELECT ID, nome FROM interessi WHERE cancellato = 0 ORDER BY nome ASC");
            $tabCounter = 0;
            while ($row = mysqli_fetch_assoc($result_interessi)) {
                if (($tabCounter % 4) == 0) {
                    $interessi .= '<div class="checkbox">';
                }
                $interessi .= '<label class="checkbox-inline"><input type="checkbox" class="chk" value="' . $row['ID'] . '" ';
                $interessi .= ">" . stripslashes($row['nome']);
                $interessi .= "</label>";
                if (($tabCounter % 4) == 3) {
                    $interessi .= "</div>";
                }
                $tabCounter++;
            }


            ?>
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 text-center">
                    <form class="form-newsletter">
                        <div class="form-group">
                            <input type="text" class="form-control" id="nome" placeholder="Nome E Cognome">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="email" placeholder="Email">
                        </div>
                        <?php if ($interessi != "") { ?>
                            <div class="form-group">
                                <label for="interessi">Sono interessato a:</label>
                                <?php echo $interessi; ?>
                            </div>
                        <?php } ?>
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
<?php
$the_post = get_post(231);
$postId = str_replace(' ', '-', __($the_post->post_title));
?>
    <section id="<?php echo strtolower($postId); ?>" class="partners">
        <?php $the_post = get_post(231); ?>

        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center main-title">
                    <h2 class="section-heading"><?php echo __($the_post->post_title); ?></h2>
                    <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                         class="img-responsive primary" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p><?php echo __($the_post->post_content); ?></p>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade newsletter-confirm" id="modal-newsletter" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <p>Richiesta di iscrizione alla newsletter avvenuta correttamente<br>A breve riceverai una mail di
                        conferma</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Chiudi</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div class="modal fade wait-msg" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100"
                             aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                        </div>
                    </div>
                    <h4 class="text-center">Attendere Prego</h4>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div class="modal fade error-msg" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>

                    <h4 class="modal-title">Errore</h4>
                </div>
                <div class="modal-body text-center">

                    <p id="error-msg-text"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Chiudi</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- footer-->
<?php get_footer(); ?>