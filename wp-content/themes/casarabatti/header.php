<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Casa Rabatti - 1823 - Firenze</title>


    <!-- Custom Fonts -->
    <link
        href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
        rel='stylesheet' type='text/css'>
    <link
        href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
        rel='stylesheet' type='text/css'>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <?php wp_head(); ?>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-73233746-1', 'auto');
        ga('send', 'pageview');

    </script>
</head>

<body id="page-top">
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand page-scroll" href="#page-top"><img
                    src="<?php echo get_template_directory_uri() . '/img/logo.png'; ?>" class="img"
                    alt=""></a>

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <?php
        $menu = wp_menu_id_by_name("HomeMenu");
        ?>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <!--<ul  class="nav navbar-nav navbar-left">
                <li><a href="<?php echo get_site_url() . '/it/' ?>" target="_self">it</a>
                </li>
                <li><a href="<?php echo get_site_url() . '/en/' ?>" target="_self">en</a>
                </li>
            </ul>-->
            <ul class="nav navbar-nav navbar-right">

                <?php
                $menuArray = wp_get_nav_menu_items($menu);
                if (is_home()) {
                    foreach ($menuArray as $menuItem) {
                        $menuId = str_replace(' ', '-', $menuItem->title);
                        ?>
                        <li>
                            <?php
                            if (strtolower($menuId) == "i-locali") {
                                $href = get_site_url() . "/ambienti";
                                echo '<a ';
                            } else {
                                $href = "#" . strtolower($menuId);
                                echo '<a class="page-scroll" ';
                            }
                            ?>
                            href="<?php echo $href; ?>"><?php echo $menuItem->title; ?></a>
                        </li>
                        <?php
                    }
                } else { ?>
                    <li>
                        <a class="" href="<?php echo get_home_url(); ?>">HOME PAGE</a>
                    </li>
                <?php }
                ?>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>