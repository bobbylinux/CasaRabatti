<?php get_header(); ?>
    <section id="<?php the_title(); ?>" class="contacts">
        <div class="container-fluid">
            <?php if (have_posts()) : ?>

                <?php while (have_posts()) : the_post(); ?>
                    <div class="row">
                        <div class="col-md-12 text-center main-title">
                            <h2 class="section-heading"><?php the_title(); ?></h2>
                            <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                                 class="img-responsive primary" alt="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <p><?php the_content('Leggi...'); ?></p>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else : ?>
                <article class="post">
                    <p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
                </article>
            <?php endif; ?>
        </div>
    </section>
<?php get_footer(); ?>