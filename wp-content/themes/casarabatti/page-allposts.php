<?php
/*
Template Name: All posts
*/
?>
<?php get_header(); ?>
<?php if(have_posts()) : ?>
    <?php while(have_posts()) : the_post(); ?>
        <section id="<?php the_title(); ?>" class="contacts">
            <div class="container-fluid">
                <?php the_content(); ?>
                <?php
                $current_date ="";
                $count_posts = wp_count_posts();
                $nextpost = 0;
                $published_posts = $count_posts->publish;
                $args = array(
                    'post__in' => array(290,292)
                );
                $myposts = get_posts(array('posts_per_page'=>$published_posts,'category'=>'6','orderby'=>'title','order'=>'asc'));
                foreach($myposts as $post) :
                $nextpost++;
                setup_postdata($post);
                $date = get_the_date("F Y");
                if($current_date!=$date):
                if($nextpost>1): ?>
                <?php endif; ?>
                <?php $current_date=$date;
                endif; ?>
                <div class="row ambiente">
                    <div class="col-md-12 text-center main-title">
                        <h2 class="section-heading"><?php __(the_title()); ?></h2>
                        <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                             class="img-responsive primary" alt="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <?php echo do_shortcode('[nggallery id='.get_the_ID().' template=limonaia]'); ?>
                    </div>
                    <div class="col-sm-8">
                        <p><?php __(the_content()); ?></p>
                    </div>
                </div>
                <section class="reservation">
                    <div class="container">
                        <a class="btn btn-default btn-xl btn-contattaci" data-id="<?php echo strtolower(get_the_title());?>"><?php echo (get_locale() == "it_IT") ? 'Contattaci' : 'Contact Us'; ?></a>
                    </div>
                </section>
                <?php endforeach; wp_reset_postdata(); ?>
            </div>
        </section>
    <?php endwhile; ?>
<?php endif; ?>
<?php get_footer(); ?>

<!-- Modal Event -->
<div class="modal fade" id="contact-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="PrenotazioneLabel"><?php echo (get_locale() == "it_IT") ? 'Richiesta Informazioni' : 'Asked For Information'; ?></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="nome"><?php echo (get_locale() == "it_IT") ? 'Il tuo nome' : 'Your name'; ?>: </label>
                    <input type="text" class="form-control" id="nome" placeholder="Nome">
                    <div class="alert alert-danger" id="nome-error" role="alert">Nome: </div>
                </div>
                <div class="form-group">
                    <label for="mail"><?php echo (get_locale() == "it_IT") ? 'La tua e-mail' : 'Your e-mail address'; ?>: </label>
                    <input type="email" class="form-control" id="mail" placeholder="E-Mail">
                    <div class="alert alert-danger" id="mail-error" role="alert">E-Mail: </div>
                </div>
                <div class="form-group">
                    <label for="telefono"><?php echo (get_locale() == "it_IT") ? 'Il tuo telefono' : 'Your phone number'; ?>: </label>
                    <input type="text" class="form-control" id="telefono" placeholder="Telefono">
                    <div class="alert alert-danger" id="telefono-error" role="alert">Telefono: </div>
                </div>
                <div class="form-group">
                    <label for="sel1"><?php echo (get_locale() == "it_IT") ? 'Adulti' : 'Adults'; ?>: </label>
                    <select class="form-control" id="adulti" name="adulti" placeholder="Adulti">
                        <?php
                        for ($idx = 1; $idx <= 10; $idx ++) {
                            if ($idx == $_POST['adulti']) {
                                echo '<option value="'.$idx.'" selected>'. $idx . '</option>';
                            } else {
                                echo '<option value="'.$idx.'">'. $idx . '</option>';
                            }
                        }
                        ?>
                    </select>
                    <div class="alert alert-danger" id="adulti-error" role="alert">Adulti: </div>
                </div>
                <div class="form-group">
                    <label for="sel1"><?php echo (get_locale() == 'it_IT') ? 'Bambini 0-3' : 'Children 0-3'; ?>: </label>
                    <select class="form-control" id="bambini" name="bambini" placeholder="<?php echo (get_locale() == 'it_IT') ? 'Bambini 0-3' : 'Children 0-3'; ?>">
                        <?php
                        for ($idx = 1; $idx <= 10; $idx ++) {
                            if ($idx == $_POST['bambini']) {
                                echo '<option value="'.$idx.'" selected>'. $idx . '</option>';
                            } else {
                                echo '<option value="'.$idx.'">'. $idx . '</option>';
                            }
                        }
                        ?>
                    </select>
                    <div class="alert alert-danger" id="bambini-error" role="alert">Bambini: </div>
                </div>
                <input type="hidden" id="ambiente-id" name="ambiente-id" value=""/>
                <div class="form-group">
                    <label for="arrivo"><?php echo (get_locale() == 'it_IT') ? 'Data di arrivo' : 'Check In'; ?>: </label>
                    <input type="text" class="form-control" id="arrivo" name="arrivo" placeholder="<?php echo (get_locale() == 'it_IT') ? 'Arrivo' : 'Check In'; ?>" value="<?php echo $_POST['arrivo']; ?>">
                    <div class="alert alert-danger" id="arrivo-error" role="alert">Arrivo: </div>
                </div>
                <div class="form-group">
                    <label for="partenza"><?php echo (get_locale() == 'it_IT') ? 'Data di partenza' : 'Check Out'; ?>: </label>
                    <input type="text" class="form-control" id="partenza" name="partenza" placeholder="<?php echo (get_locale() == 'it_IT') ? 'Partenza' : 'Check Out'; ?>" value="<?php echo $_POST['partenza']; ?>">
                    <div class="alert alert-danger" id="partenza-error" role="alert">Partenza: </div>
                </div>
                <div class="form-group">
                    <label for="messaggio"><?php echo (get_locale() == 'it_IT') ? 'Il tuo messaggio' : 'Your message for us'; ?>: </label>
                    <textarea class="form-control" id="messaggio" rows="5"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-annulla-richiesta"><?php echo (get_locale() == 'it_IT') ? 'Annulla' : 'Undo'; ?></button>
                <button type="button" class="btn btn-primary btn-invia-richiesta"><?php echo (get_locale() == 'it_IT') ? 'Invia' : 'Send'; ?></button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade wait-msg" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                    </div>
                </div>
                <h4 class="text-center"><?php echo (get_locale() == 'it_IT') ? 'Attendere Prego' : 'Please Wait'; ?></h4>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->