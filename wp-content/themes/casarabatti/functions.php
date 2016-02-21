<?php

function casarabatti_scripts()
{
    wp_register_style( 'bootstrap-css', get_template_directory_uri() . '/css/bootstrap.min.css', array(), 'all' );

    wp_register_style( 'animate-css', get_template_directory_uri() . '/css/animate.min.css', array(), 'all' );

    wp_register_style( 'font-css', get_template_directory_uri() . '/font-awesome/css/font-awesome.min.css', array(), 'all' );

    wp_register_style( 'style-css', get_template_directory_uri() . '/style.css', array(), 'all' );

    wp_register_script( 'bootstrap-js', get_template_directory_uri() . '/js/bootstrap.min.js', array( 'jquery' ), true );

    wp_register_script( 'easing-js', get_template_directory_uri() . '/js/jquery.easing.min.js', true );

    wp_register_script( 'fittext-js', get_template_directory_uri() . '/js/jquery.fittext.js', true );

    wp_register_script( 'wow-js', get_template_directory_uri() . '/js/wow.min.js', true );

    wp_register_script( 'creative-js', get_template_directory_uri() . '/js/creative.js', true );

    wp_enqueue_style( 'bootstrap-css' );

    wp_enqueue_style( 'font-css' );

    wp_enqueue_style( 'animate-css' );

    wp_enqueue_style( 'style-css' );


    wp_enqueue_script( 'bootstrap-js' );

    wp_enqueue_script( 'easing-js' );

    wp_enqueue_script( 'fittext-js' );

    wp_enqueue_script( 'wow-js' );

    wp_enqueue_script( 'creative-js' );
}

add_action( 'wp_enqueue_scripts', 'casarabatti_scripts' );

remove_filter('the_content', 'wpautop');

?>

