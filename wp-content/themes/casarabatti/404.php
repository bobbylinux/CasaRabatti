<?php get_header(); ?>
<section class="bg-primary welcome" id="404">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 text-center main-title">
                <h2 class="section-heading">Pagina non trovata</h2>
                <img src="<?php echo get_template_directory_uri() . '/img/alloro.png'; ?>"
                     class="img-responsive primary" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 vcenter text-center">
                <p class="text-faded">
                    La pagina che stai cercando non esiste.
                </p>
            </div>
        </div>
    </div>
</section>
<?php get_footer(); ?>