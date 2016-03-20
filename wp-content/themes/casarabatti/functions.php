<?php

function casarabatti_scripts()
{
    wp_register_style( 'bootstrap-css', get_template_directory_uri() . '/css/bootstrap.min.css', array(), 'all' );
    wp_register_style( 'animate-css', get_template_directory_uri() . '/css/animate.min.css', array(), 'all' );
    wp_register_style( 'bootstrap-datepicker-css', get_template_directory_uri() . '/css/bootstrap.datepicker.min.css', array(), 'all' );
    wp_register_style( 'font-css', get_template_directory_uri() . '/font-awesome/css/font-awesome.min.css', array(), 'all' );
    wp_register_style( 'style-css', get_template_directory_uri() . '/style.css', array(), 'all' );

    wp_register_script( 'bootstrap-js', get_template_directory_uri() . '/js/bootstrap.min.js', array( 'jquery' ), true );
    wp_register_script( 'easing-js', get_template_directory_uri() . '/js/jquery.easing.min.js', true );
    wp_register_script( 'fittext-js', get_template_directory_uri() . '/js/jquery.fittext.js', true );
    wp_register_script( 'wow-js', get_template_directory_uri() . '/js/wow.min.js', true );
    wp_register_script( 'creative-js', get_template_directory_uri() . '/js/creative.js', true );
    wp_register_script( 'moments-js', get_template_directory_uri() . '/js/moments.js',  true );
    wp_register_script( 'bootstrap-datepicker-js', get_template_directory_uri() . '/js/bootstrap.datepicker.min.js',  true );
    wp_register_script( 'bootstrap-datepicker-locale-it-js', get_template_directory_uri() . '/js/bootstrap.datepicker.locale.it.js',  true );

    wp_enqueue_style( 'bootstrap-css' );
    wp_enqueue_style( 'bootstrap-datepicker-css' );
    wp_enqueue_style( 'font-css' );
    wp_enqueue_style( 'animate-css' );
    wp_enqueue_style( 'style-css' );

    //wp_enqueue_script('jquery-ui-datepicker');
    wp_enqueue_script( 'bootstrap-js' );
    wp_enqueue_script( 'moments-js' );
    wp_enqueue_script( 'bootstrap-datepicker-js' );
    wp_enqueue_script( 'bootstrap-datepicker-locale-it-js' );
    wp_enqueue_script( 'easing-js' );
    wp_enqueue_script( 'fittext-js' );
    wp_enqueue_script( 'wow-js' );
    wp_enqueue_script( 'creative-js' );
}

add_action( 'wp_enqueue_scripts', 'casarabatti_scripts' );

remove_filter('the_content', 'wpautop');

function custom_register_admin_scripts() {
    wp_register_style( 'fullcalendar-css', get_template_directory_uri() . '/js/fullcalendar-2.6.1/fullcalendar.min.css', array(), 'all' );
    wp_register_style( 'bootstrap-css', get_template_directory_uri() . '/css/bootstrap.min.css', array(), 'all' );
    wp_register_style( 'bootstrap-datepicker-css', get_template_directory_uri() . '/css/bootstrap.datepicker.min.css', array(), 'all' );
    wp_register_style( 'font-css', get_template_directory_uri() . '/font-awesome/css/font-awesome.min.css', array(), 'all' );

    wp_register_script( 'moments-js', get_template_directory_uri() . '/js/fullcalendar-2.6.1/lib/moment.min.js',  true );
    wp_register_script( 'fullcalendar', get_template_directory_uri() . '/js/fullcalendar-2.6.1/fullcalendar.min.js',array( 'jquery' ),true );
    wp_register_script( 'fullcalendar-lang', get_template_directory_uri() . '/js/fullcalendar-2.6.1/lang/it.js',  true );
    wp_register_script( 'custom-javascript', get_template_directory_uri() . '/js/rabatti.js' );
    wp_register_script( 'bootstrap-js', get_template_directory_uri() . '/js/bootstrap.min.js', array( 'jquery' ), true );
    wp_register_script( 'bootstrap-datepicker-js', get_template_directory_uri() . '/js/bootstrap.datepicker.min.js',  true );
    wp_register_script( 'bootstrap-datepicker-locale-it-js', get_template_directory_uri() . '/js/bootstrap.datepicker.locale.it.js',  true );

    wp_enqueue_style( 'bootstrap-css' );
    wp_enqueue_style( 'bootstrap-datepicker-css' );
    wp_enqueue_style( 'font-css' );
    wp_enqueue_style( 'fullcalendar-css' );


    wp_enqueue_script( 'jquery-ui-autocomplete' );
    wp_enqueue_script( 'bootstrap-js' );
    wp_enqueue_script( 'moments-js' );
    wp_enqueue_script( 'fullcalendar' );
    wp_enqueue_script( 'fullcalendar-lang' );
    wp_enqueue_script( 'bootstrap-datepicker-js' );
    wp_enqueue_script( 'bootstrap-datepicker-locale-it-js' );
    wp_enqueue_script( 'custom-javascript' );

} // end custom_register_admin_scripts
add_action( 'admin_enqueue_scripts', 'custom_register_admin_scripts' );

function remove_menus()
{
    global $menu;
    global $current_user;
    get_currentuserinfo();
 
    if($current_user->user_level < 10)
    {
        $restricted = array(__('Pages'),
                            __('Posts'),
                            __('Comments'),
                            __('Users'),
                            __('Media'),
                            __('Links'),
                            __('Plugins'),
 
        );
        end ($menu);
        while (prev($menu)){
            $value = explode(' ',$menu[key($menu)][0]);
            if(in_array($value[0] != NULL?$value[0]:"" , $restricted)){unset($menu[key($menu)]);}
        }// end while
 
    }// end if
}
add_action('admin_menu', 'remove_menus');


function mt_add_pages() {
    add_menu_page('admin-menu', 'Calendario', 5, __FILE__, 'mt_toplevel_page');
}
function mt_toplevel_page() {
    include 'calendar.php';

}
add_action('admin_menu', 'mt_add_pages');

?>

