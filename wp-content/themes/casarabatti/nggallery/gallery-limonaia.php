<?php
/**
Template Page for the gallery overview

Follow variables are useable :

$gallery     : Contain all about the gallery
$images      : Contain all images, path, title
$pagination  : Contain the pagination content

You can check the content when you insert the tag <?php var_dump($variable) ?>
If you would like to show the timestamp of the image ,you can use <?php echo $exif['created_timestamp'] ?>
 **/
?>
<?php if (!defined ('ABSPATH')) die ('No direct access allowed'); ?>
<?php if (!empty ($gallery)) : ?>

    <?php $i=1; ?>

    <div class="gallery-holder gal<?php echo $gallery->ID; ?>">
        <?php foreach ($images as $image) : ?>

            <?php if ($i < 2) : ?>
                <div style="display:none;">
                    <img src="<?php echo $image->imageURL ?>" />
                </div>
                <a href="<?php echo $image->imageURL ?>" <?php echo $image->thumbcode ?> title="<?php echo $gallery->title ?>">
                    <img class="img-responsive" src="<?php echo $image->thumbnailURL ?>" /></a>
            <?php else : ?>
                <a style="display:none" href="<?php echo $image->imageURL ?>" <?php echo $image->thumbcode ?>>link</a>
            <?php endif; $i++; ?>

        <?php endforeach; ?>
    </div>

<?php endif;?>