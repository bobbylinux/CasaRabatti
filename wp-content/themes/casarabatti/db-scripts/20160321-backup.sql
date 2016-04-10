-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mar 21, 2016 alle 20:32
-- Versione del server: 10.1.10-MariaDB
-- Versione PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casarabatti`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cal_ambienti`
--

CREATE TABLE `cal_ambienti` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `descrizione` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `colore` varchar(10) NOT NULL DEFAULT '#0000FF',
  `inizio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fine` timestamp NULL DEFAULT NULL,
  `cancellato` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `cal_ambienti`
--

INSERT INTO `cal_ambienti` (`id`, `nome`, `descrizione`, `colore`, `inizio`, `fine`, `cancellato`) VALUES
(1, 'Leonardo', NULL, '#3366ff', '2016-03-20 16:59:06', NULL, 0),
(2, 'Michelangelo', NULL, '#cc0000', '2016-03-20 16:59:30', NULL, 0),
(3, 'San Zanobi', NULL, '#cc3399', '2016-03-20 16:59:30', NULL, 0),
(4, 'Limonaia', NULL, '#ffcc00', '2016-03-20 17:00:25', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `cal_calendario`
--

CREATE TABLE `cal_calendario` (
  `id` int(10) UNSIGNED NOT NULL,
  `ambiente` int(10) UNSIGNED NOT NULL,
  `cliente` int(10) UNSIGNED NOT NULL,
  `inizio` date NOT NULL,
  `fine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `cal_calendario`
--

INSERT INTO `cal_calendario` (`id`, `ambiente`, `cliente`, `inizio`, `fine`) VALUES
(1, 1, 1, '2016-03-27', '2016-03-31'),
(3, 2, 3, '2016-03-29', '2016-04-02'),
(4, 3, 2, '2016-03-21', '2016-03-30'),
(5, 4, 4, '2016-03-24', '2016-03-29');

-- --------------------------------------------------------

--
-- Struttura della tabella `cal_clienti`
--

CREATE TABLE `cal_clienti` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mail` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `indirizzo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `citta` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nazione` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `cal_clienti`
--

INSERT INTO `cal_clienti` (`id`, `nome`, `telefono`, `mail`, `indirizzo`, `citta`, `nazione`) VALUES
(1, 'Bani', '3492906672', 'roberto.bani@gmail.com', 'Borgo San Frediano 75', 'Firenze', 'Italia'),
(2, 'Porzilli', '1234576123', 'gporzilli@globeit.it', 'borgo san frediano 75', 'Firenze', 'Italia'),
(3, 'Rossi', '05223654231', 'rossi@gmail.com', 'Via Roma 12', 'Milano', 'Italia'),
(4, 'Smith', '001555123456', 'jsmith@hotmail.it', '44#In Str. 12-5', 'Washington', 'U.S.A.');

-- --------------------------------------------------------

--
-- Struttura della tabella `interessi`
--

CREATE TABLE `interessi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `interessi_soci`
--

CREATE TABLE `interessi_soci` (
  `id_socio` int(10) UNSIGNED NOT NULL,
  `id_interesse` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `mail`
--

CREATE TABLE `mail` (
  `id` int(10) NOT NULL,
  `oggetto` varchar(2000) CHARACTER SET latin1 NOT NULL,
  `messaggio` longtext CHARACTER SET latin1 NOT NULL,
  `associazione` varchar(45) CHARACTER SET latin1 NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inviare` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `inviate` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `soci`
--

CREATE TABLE `soci` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mail` varchar(256) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tmpdoc`
--

CREATE TABLE `tmpdoc` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tmpimg`
--

CREATE TABLE `tmpimg` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tmpmail`
--

CREATE TABLE `tmpmail` (
  `id` int(11) UNSIGNED NOT NULL,
  `indirizzo` varchar(256) NOT NULL,
  `id_utente` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ora_invio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `oggetto_mail` varchar(100) NOT NULL,
  `esito` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_album`
--

CREATE TABLE `wp_bwg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `preview_image` mediumtext NOT NULL,
  `random_preview_image` mediumtext NOT NULL,
  `order` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_album_gallery`
--

CREATE TABLE `wp_bwg_album_gallery` (
  `id` bigint(20) NOT NULL,
  `album_id` bigint(20) NOT NULL,
  `is_album` tinyint(1) NOT NULL,
  `alb_gal_id` bigint(20) NOT NULL,
  `order` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_gallery`
--

CREATE TABLE `wp_bwg_gallery` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `page_link` mediumtext NOT NULL,
  `preview_image` mediumtext NOT NULL,
  `random_preview_image` mediumtext NOT NULL,
  `order` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `gallery_type` varchar(32) NOT NULL,
  `gallery_source` varchar(256) NOT NULL,
  `autogallery_image_number` int(4) NOT NULL,
  `update_flag` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_image`
--

CREATE TABLE `wp_bwg_image` (
  `id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL,
  `slug` longtext NOT NULL,
  `filename` varchar(255) NOT NULL,
  `image_url` mediumtext NOT NULL,
  `thumb_url` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `alt` mediumtext NOT NULL,
  `date` varchar(128) NOT NULL,
  `size` varchar(128) NOT NULL,
  `filetype` varchar(128) NOT NULL,
  `resolution` varchar(128) NOT NULL,
  `author` bigint(20) NOT NULL,
  `order` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `comment_count` bigint(20) NOT NULL,
  `avg_rating` float NOT NULL,
  `rate_count` bigint(20) NOT NULL,
  `hit_count` bigint(20) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `pricelist_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_image_comment`
--

CREATE TABLE `wp_bwg_image_comment` (
  `id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` varchar(64) NOT NULL,
  `comment` mediumtext NOT NULL,
  `url` mediumtext NOT NULL,
  `mail` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_image_rate`
--

CREATE TABLE `wp_bwg_image_rate` (
  `id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `rate` float NOT NULL,
  `ip` varchar(64) NOT NULL,
  `date` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_image_tag`
--

CREATE TABLE `wp_bwg_image_tag` (
  `id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_option`
--

CREATE TABLE `wp_bwg_option` (
  `id` bigint(20) NOT NULL,
  `images_directory` mediumtext NOT NULL,
  `masonry` varchar(255) NOT NULL,
  `mosaic` varchar(255) NOT NULL,
  `resizable_mosaic` tinyint(1) NOT NULL,
  `mosaic_total_width` int(4) NOT NULL,
  `image_column_number` int(4) NOT NULL,
  `images_per_page` int(4) NOT NULL,
  `thumb_width` int(4) NOT NULL,
  `thumb_height` int(4) NOT NULL,
  `upload_thumb_width` int(4) NOT NULL,
  `upload_thumb_height` int(4) NOT NULL,
  `image_enable_page` tinyint(1) NOT NULL,
  `image_title_show_hover` varchar(20) NOT NULL,
  `ecommerce_icon_show_hover` varchar(20) NOT NULL,
  `album_column_number` int(4) NOT NULL,
  `albums_per_page` int(4) NOT NULL,
  `album_title_show_hover` varchar(8) NOT NULL,
  `album_thumb_width` int(4) NOT NULL,
  `album_thumb_height` int(4) NOT NULL,
  `album_enable_page` tinyint(1) NOT NULL,
  `extended_album_height` int(4) NOT NULL,
  `extended_album_description_enable` tinyint(1) NOT NULL,
  `image_browser_width` int(4) NOT NULL,
  `image_browser_title_enable` tinyint(1) NOT NULL,
  `image_browser_description_enable` tinyint(1) NOT NULL,
  `blog_style_width` int(4) NOT NULL,
  `blog_style_title_enable` tinyint(1) NOT NULL,
  `blog_style_images_per_page` int(4) NOT NULL,
  `blog_style_enable_page` tinyint(1) NOT NULL,
  `slideshow_type` varchar(16) NOT NULL,
  `slideshow_interval` int(4) NOT NULL,
  `slideshow_width` int(4) NOT NULL,
  `slideshow_height` int(4) NOT NULL,
  `slideshow_enable_autoplay` tinyint(1) NOT NULL,
  `slideshow_enable_shuffle` tinyint(1) NOT NULL,
  `slideshow_enable_ctrl` tinyint(1) NOT NULL,
  `slideshow_enable_filmstrip` tinyint(1) NOT NULL,
  `slideshow_filmstrip_height` int(4) NOT NULL,
  `slideshow_enable_title` tinyint(1) NOT NULL,
  `slideshow_title_position` varchar(16) NOT NULL,
  `slideshow_enable_description` tinyint(1) NOT NULL,
  `slideshow_description_position` varchar(16) NOT NULL,
  `slideshow_enable_music` tinyint(1) NOT NULL,
  `slideshow_audio_url` varchar(255) NOT NULL,
  `popup_width` int(4) NOT NULL,
  `popup_height` int(4) NOT NULL,
  `popup_type` varchar(16) NOT NULL,
  `popup_interval` int(4) NOT NULL,
  `popup_enable_filmstrip` tinyint(1) NOT NULL,
  `popup_filmstrip_height` int(4) NOT NULL,
  `popup_enable_ctrl_btn` tinyint(1) NOT NULL,
  `popup_enable_fullscreen` tinyint(1) NOT NULL,
  `popup_enable_info` tinyint(1) NOT NULL,
  `popup_info_always_show` tinyint(1) NOT NULL,
  `popup_enable_rate` tinyint(1) NOT NULL,
  `popup_enable_comment` tinyint(1) NOT NULL,
  `popup_enable_email` tinyint(1) NOT NULL,
  `popup_enable_captcha` tinyint(1) NOT NULL,
  `popup_enable_download` tinyint(1) NOT NULL,
  `popup_enable_fullsize_image` tinyint(1) NOT NULL,
  `popup_enable_facebook` tinyint(1) NOT NULL,
  `popup_enable_twitter` tinyint(1) NOT NULL,
  `popup_enable_google` tinyint(1) NOT NULL,
  `popup_enable_ecommerce` tinyint(1) NOT NULL,
  `watermark_type` varchar(8) NOT NULL,
  `watermark_position` varchar(16) NOT NULL,
  `watermark_width` int(4) NOT NULL,
  `watermark_height` int(4) NOT NULL,
  `watermark_url` mediumtext NOT NULL,
  `watermark_text` mediumtext NOT NULL,
  `watermark_link` mediumtext NOT NULL,
  `watermark_font_size` int(4) NOT NULL,
  `watermark_font` varchar(16) NOT NULL,
  `watermark_color` varchar(8) NOT NULL,
  `watermark_opacity` int(4) NOT NULL,
  `built_in_watermark_type` varchar(16) NOT NULL,
  `built_in_watermark_position` varchar(16) NOT NULL,
  `built_in_watermark_size` int(4) NOT NULL,
  `built_in_watermark_url` mediumtext NOT NULL,
  `built_in_watermark_text` mediumtext NOT NULL,
  `built_in_watermark_font_size` int(4) NOT NULL,
  `built_in_watermark_font` varchar(16) NOT NULL,
  `built_in_watermark_color` varchar(8) NOT NULL,
  `built_in_watermark_opacity` int(4) NOT NULL,
  `image_right_click` tinyint(1) NOT NULL,
  `popup_fullscreen` tinyint(1) NOT NULL,
  `gallery_role` tinyint(1) NOT NULL,
  `album_role` tinyint(1) NOT NULL,
  `image_role` tinyint(1) NOT NULL,
  `popup_autoplay` tinyint(1) NOT NULL,
  `album_view_type` varchar(16) NOT NULL,
  `popup_enable_pinterest` tinyint(1) NOT NULL,
  `popup_enable_tumblr` tinyint(1) NOT NULL,
  `show_search_box` tinyint(1) NOT NULL,
  `search_box_width` int(4) NOT NULL,
  `preload_images` tinyint(1) NOT NULL,
  `preload_images_count` int(4) NOT NULL,
  `thumb_click_action` varchar(16) NOT NULL,
  `thumb_link_target` tinyint(1) NOT NULL,
  `comment_moderation` tinyint(1) NOT NULL,
  `popup_hit_counter` tinyint(1) NOT NULL,
  `enable_ML_import` tinyint(1) NOT NULL,
  `showthumbs_name` tinyint(1) NOT NULL,
  `show_album_name` tinyint(1) NOT NULL,
  `show_image_counts` tinyint(1) NOT NULL,
  `upload_img_width` int(4) NOT NULL,
  `upload_img_height` int(4) NOT NULL,
  `play_icon` tinyint(1) NOT NULL,
  `show_masonry_thumb_description` tinyint(1) NOT NULL,
  `slideshow_title_full_width` tinyint(1) NOT NULL,
  `popup_info_full_width` tinyint(1) NOT NULL,
  `show_sort_images` tinyint(1) NOT NULL,
  `autoupdate_interval` int(4) NOT NULL,
  `instagram_access_token` varchar(128) NOT NULL,
  `description_tb` tinyint(1) NOT NULL,
  `enable_seo` tinyint(1) NOT NULL,
  `autohide_lightbox_navigation` tinyint(1) NOT NULL,
  `autohide_slideshow_navigation` tinyint(1) NOT NULL,
  `read_metadata` tinyint(1) NOT NULL,
  `enable_loop` tinyint(1) NOT NULL,
  `enable_addthis` tinyint(1) NOT NULL,
  `addthis_profile_id` varchar(66) NOT NULL,
  `carousel_interval` int(4) NOT NULL,
  `carousel_width` int(4) NOT NULL,
  `carousel_height` int(4) NOT NULL,
  `carousel_image_column_number` int(4) NOT NULL,
  `carousel_image_par` varchar(32) NOT NULL,
  `carousel_enable_title` tinyint(1) NOT NULL,
  `carousel_enable_autoplay` tinyint(1) NOT NULL,
  `carousel_r_width` int(4) NOT NULL,
  `carousel_fit_containerWidth` tinyint(1) NOT NULL,
  `carousel_prev_next_butt` tinyint(1) NOT NULL,
  `carousel_play_pause_butt` tinyint(1) NOT NULL,
  `permissions` varchar(20) NOT NULL,
  `facebook_app_id` varchar(64) NOT NULL,
  `facebook_app_secret` varchar(64) NOT NULL,
  `show_tag_box` tinyint(1) NOT NULL,
  `show_hide_custom_post` tinyint(1) NOT NULL,
  `show_hide_post_meta` tinyint(1) NOT NULL,
  `placeholder` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_bwg_option`
--

INSERT INTO `wp_bwg_option` (`id`, `images_directory`, `masonry`, `mosaic`, `resizable_mosaic`, `mosaic_total_width`, `image_column_number`, `images_per_page`, `thumb_width`, `thumb_height`, `upload_thumb_width`, `upload_thumb_height`, `image_enable_page`, `image_title_show_hover`, `ecommerce_icon_show_hover`, `album_column_number`, `albums_per_page`, `album_title_show_hover`, `album_thumb_width`, `album_thumb_height`, `album_enable_page`, `extended_album_height`, `extended_album_description_enable`, `image_browser_width`, `image_browser_title_enable`, `image_browser_description_enable`, `blog_style_width`, `blog_style_title_enable`, `blog_style_images_per_page`, `blog_style_enable_page`, `slideshow_type`, `slideshow_interval`, `slideshow_width`, `slideshow_height`, `slideshow_enable_autoplay`, `slideshow_enable_shuffle`, `slideshow_enable_ctrl`, `slideshow_enable_filmstrip`, `slideshow_filmstrip_height`, `slideshow_enable_title`, `slideshow_title_position`, `slideshow_enable_description`, `slideshow_description_position`, `slideshow_enable_music`, `slideshow_audio_url`, `popup_width`, `popup_height`, `popup_type`, `popup_interval`, `popup_enable_filmstrip`, `popup_filmstrip_height`, `popup_enable_ctrl_btn`, `popup_enable_fullscreen`, `popup_enable_info`, `popup_info_always_show`, `popup_enable_rate`, `popup_enable_comment`, `popup_enable_email`, `popup_enable_captcha`, `popup_enable_download`, `popup_enable_fullsize_image`, `popup_enable_facebook`, `popup_enable_twitter`, `popup_enable_google`, `popup_enable_ecommerce`, `watermark_type`, `watermark_position`, `watermark_width`, `watermark_height`, `watermark_url`, `watermark_text`, `watermark_link`, `watermark_font_size`, `watermark_font`, `watermark_color`, `watermark_opacity`, `built_in_watermark_type`, `built_in_watermark_position`, `built_in_watermark_size`, `built_in_watermark_url`, `built_in_watermark_text`, `built_in_watermark_font_size`, `built_in_watermark_font`, `built_in_watermark_color`, `built_in_watermark_opacity`, `image_right_click`, `popup_fullscreen`, `gallery_role`, `album_role`, `image_role`, `popup_autoplay`, `album_view_type`, `popup_enable_pinterest`, `popup_enable_tumblr`, `show_search_box`, `search_box_width`, `preload_images`, `preload_images_count`, `thumb_click_action`, `thumb_link_target`, `comment_moderation`, `popup_hit_counter`, `enable_ML_import`, `showthumbs_name`, `show_album_name`, `show_image_counts`, `upload_img_width`, `upload_img_height`, `play_icon`, `show_masonry_thumb_description`, `slideshow_title_full_width`, `popup_info_full_width`, `show_sort_images`, `autoupdate_interval`, `instagram_access_token`, `description_tb`, `enable_seo`, `autohide_lightbox_navigation`, `autohide_slideshow_navigation`, `read_metadata`, `enable_loop`, `enable_addthis`, `addthis_profile_id`, `carousel_interval`, `carousel_width`, `carousel_height`, `carousel_image_column_number`, `carousel_image_par`, `carousel_enable_title`, `carousel_enable_autoplay`, `carousel_r_width`, `carousel_fit_containerWidth`, `carousel_prev_next_butt`, `carousel_play_pause_butt`, `permissions`, `facebook_app_id`, `facebook_app_secret`, `show_tag_box`, `show_hide_custom_post`, `show_hide_post_meta`, `placeholder`) VALUES
(1, 'wp-content/uploads', 'vertical', 'vertical', 0, 100, 5, 30, 180, 90, 300, 300, 1, 'none', '', 5, 30, 'hover', 120, 90, 1, 150, 1, 800, 1, 1, 800, 1, 5, 1, 'fade', 5, 800, 500, 0, 0, 1, 1, 90, 0, 'top-right', 0, 'bottom-right', 0, '', 800, 500, 'fade', 5, 1, 70, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 'none', 'bottom-left', 90, 90, 'http://casarabatti.dev/wp-content/plugins/photo-gallery/images/watermark.png', 'web-dorado.com', 'https://web-dorado.com', 20, 'arial', 'FFFFFF', 30, 'none', 'middle-center', 15, 'http://casarabatti.dev/wp-content/plugins/photo-gallery/images/watermark.png', 'web-dorado.com', 20, 'arial', 'FFFFFF', 30, 0, 0, 0, 0, 0, 0, 'thumbnail', 0, 0, 0, 180, 0, 10, 'open_lightbox', 1, 0, 0, 0, 0, 0, 0, 1200, 1200, 1, 0, 0, 0, 0, 30, '', 0, 1, 1, 1, 1, 1, 0, '', 5, 300, 300, 5, '0.75', 0, 0, 800, 1, 1, 1, 'manage_options', '', '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_shortcode`
--

CREATE TABLE `wp_bwg_shortcode` (
  `id` bigint(20) NOT NULL,
  `tagtext` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_bwg_theme`
--

CREATE TABLE `wp_bwg_theme` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `options` longtext NOT NULL,
  `default_theme` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_bwg_theme`
--

INSERT INTO `wp_bwg_theme` (`id`, `name`, `options`, `default_theme`) VALUES
(1, 'Theme 1', '{"thumb_margin":4,"thumb_padding":0,"thumb_border_radius":"0","thumb_border_width":0,"thumb_border_style":"none","thumb_border_color":"CCCCCC","thumb_bg_color":"FFFFFF","thumbs_bg_color":"FFFFFF","thumb_bg_transparent":0,"thumb_box_shadow":"0px 0px 0px #888888","thumb_transparent":100,"thumb_align":"center","thumb_hover_effect":"scale","thumb_hover_effect_value":"1.1","thumb_transition":1,"thumb_title_font_color":"CCCCCC","thumb_title_font_style":"segoe ui","thumb_title_pos":"bottom","thumb_title_font_size":16,"thumb_title_font_weight":"bold","thumb_title_margin":"2px","thumb_title_shadow":"0px 0px 0px #888888","page_nav_position":"bottom","page_nav_align":"center","page_nav_number":0,"page_nav_font_size":12,"page_nav_font_style":"segoe ui","page_nav_font_color":"666666","page_nav_font_weight":"bold","page_nav_border_width":1,"page_nav_border_style":"solid","page_nav_border_color":"E3E3E3","page_nav_border_radius":"0","page_nav_margin":"0","page_nav_padding":"3px 6px","page_nav_button_bg_color":"FFFFFF","page_nav_button_bg_transparent":100,"page_nav_box_shadow":"0","page_nav_button_transition":1,"page_nav_button_text":0,"lightbox_overlay_bg_color":"000000","lightbox_overlay_bg_transparent":70,"lightbox_bg_color":"000000","lightbox_ctrl_btn_pos":"bottom","lightbox_ctrl_btn_align":"center","lightbox_ctrl_btn_height":20,"lightbox_ctrl_btn_margin_top":10,"lightbox_ctrl_btn_margin_left":7,"lightbox_ctrl_btn_transparent":100,"lightbox_ctrl_btn_color":"FFFFFF","lightbox_toggle_btn_height":14,"lightbox_toggle_btn_width":100,"lightbox_ctrl_cont_bg_color":"000000","lightbox_ctrl_cont_transparent":65,"lightbox_ctrl_cont_border_radius":4,"lightbox_close_btn_transparent":100,"lightbox_close_btn_bg_color":"000000","lightbox_close_btn_border_width":2,"lightbox_close_btn_border_radius":"16px","lightbox_close_btn_border_style":"none","lightbox_close_btn_border_color":"FFFFFF","lightbox_close_btn_box_shadow":"0","lightbox_close_btn_color":"FFFFFF","lightbox_close_btn_size":10,"lightbox_close_btn_width":20,"lightbox_close_btn_height":20,"lightbox_close_btn_top":"-10","lightbox_close_btn_right":"-10","lightbox_close_btn_full_color":"FFFFFF","lightbox_rl_btn_bg_color":"000000","lightbox_rl_btn_border_radius":"20px","lightbox_rl_btn_border_width":0,"lightbox_rl_btn_border_style":"none","lightbox_rl_btn_border_color":"FFFFFF","lightbox_rl_btn_box_shadow":"","lightbox_rl_btn_color":"FFFFFF","lightbox_rl_btn_height":40,"lightbox_rl_btn_width":40,"lightbox_rl_btn_size":20,"lightbox_close_rl_btn_hover_color":"CCCCCC","lightbox_comment_pos":"left","lightbox_comment_width":400,"lightbox_comment_bg_color":"000000","lightbox_comment_font_color":"CCCCCC","lightbox_comment_font_style":"segoe ui","lightbox_comment_font_size":12,"lightbox_comment_button_bg_color":"616161","lightbox_comment_button_border_color":"666666","lightbox_comment_button_border_width":1,"lightbox_comment_button_border_style":"none","lightbox_comment_button_border_radius":"3px","lightbox_comment_button_padding":"3px 10px","lightbox_comment_input_bg_color":"333333","lightbox_comment_input_border_color":"666666","lightbox_comment_input_border_width":1,"lightbox_comment_input_border_style":"none","lightbox_comment_input_border_radius":"0","lightbox_comment_input_padding":"2px","lightbox_comment_separator_width":1,"lightbox_comment_separator_style":"solid","lightbox_comment_separator_color":"383838","lightbox_comment_author_font_size":14,"lightbox_comment_date_font_size":10,"lightbox_comment_body_font_size":12,"lightbox_comment_share_button_color":"CCCCCC","lightbox_filmstrip_pos":"top","lightbox_filmstrip_rl_bg_color":"3B3B3B","lightbox_filmstrip_rl_btn_size":20,"lightbox_filmstrip_rl_btn_color":"FFFFFF","lightbox_filmstrip_thumb_margin":"0 1px","lightbox_filmstrip_thumb_border_width":1,"lightbox_filmstrip_thumb_border_style":"solid","lightbox_filmstrip_thumb_border_color":"000000","lightbox_filmstrip_thumb_border_radius":"0","lightbox_filmstrip_thumb_deactive_transparent":80,"lightbox_filmstrip_thumb_active_border_width":0,"lightbox_filmstrip_thumb_active_border_color":"FFFFFF","lightbox_rl_btn_style":"fa-chevron","lightbox_rl_btn_transparent":80,"album_compact_back_font_color":"000000","album_compact_back_font_style":"segoe ui","album_compact_back_font_size":16,"album_compact_back_font_weight":"bold","album_compact_back_padding":"0","album_compact_title_font_color":"CCCCCC","album_compact_title_font_style":"segoe ui","album_compact_thumb_title_pos":"bottom","album_compact_title_font_size":16,"album_compact_title_font_weight":"bold","album_compact_title_margin":"2px","album_compact_title_shadow":"0px 0px 0px #888888","album_compact_thumb_margin":4,"album_compact_thumb_padding":0,"album_compact_thumb_border_radius":"0","album_compact_thumb_border_width":0,"album_compact_thumb_border_style":"none","album_compact_thumb_border_color":"CCCCCC","album_compact_thumb_bg_color":"FFFFFF","album_compact_thumbs_bg_color":"FFFFFF","album_compact_thumb_bg_transparent":0,"album_compact_thumb_box_shadow":"0px 0px 0px #888888","album_compact_thumb_transparent":100,"album_compact_thumb_align":"center","album_compact_thumb_hover_effect":"scale","album_compact_thumb_hover_effect_value":"1.1","album_compact_thumb_transition":0,"album_extended_thumb_margin":2,"album_extended_thumb_padding":0,"album_extended_thumb_border_radius":"0","album_extended_thumb_border_width":0,"album_extended_thumb_border_style":"none","album_extended_thumb_border_color":"CCCCCC","album_extended_thumb_bg_color":"FFFFFF","album_extended_thumbs_bg_color":"FFFFFF","album_extended_thumb_bg_transparent":0,"album_extended_thumb_box_shadow":"","album_extended_thumb_transparent":100,"album_extended_thumb_align":"left","album_extended_thumb_hover_effect":"scale","album_extended_thumb_hover_effect_value":"1.1","album_extended_thumb_transition":0,"album_extended_back_font_color":"000000","album_extended_back_font_style":"segoe ui","album_extended_back_font_size":20,"album_extended_back_font_weight":"bold","album_extended_back_padding":"0","album_extended_div_bg_color":"FFFFFF","album_extended_div_bg_transparent":0,"album_extended_div_border_radius":"0 0 0 0","album_extended_div_margin":"0 0 5px 0","album_extended_div_padding":10,"album_extended_div_separator_width":1,"album_extended_div_separator_style":"solid","album_extended_div_separator_color":"E0E0E0","album_extended_thumb_div_bg_color":"FFFFFF","album_extended_thumb_div_border_radius":"0","album_extended_thumb_div_border_width":1,"album_extended_thumb_div_border_style":"solid","album_extended_thumb_div_border_color":"E8E8E8","album_extended_thumb_div_padding":"5px","album_extended_text_div_bg_color":"FFFFFF","album_extended_text_div_border_radius":"0","album_extended_text_div_border_width":1,"album_extended_text_div_border_style":"solid","album_extended_text_div_border_color":"E8E8E8","album_extended_text_div_padding":"5px","album_extended_title_span_border_width":1,"album_extended_title_span_border_style":"none","album_extended_title_span_border_color":"CCCCCC","album_extended_title_font_color":"000000","album_extended_title_font_style":"segoe ui","album_extended_title_font_size":16,"album_extended_title_font_weight":"bold","album_extended_title_margin_bottom":2,"album_extended_title_padding":"2px","album_extended_desc_span_border_width":1,"album_extended_desc_span_border_style":"none","album_extended_desc_span_border_color":"CCCCCC","album_extended_desc_font_color":"000000","album_extended_desc_font_style":"segoe ui","album_extended_desc_font_size":14,"album_extended_desc_font_weight":"normal","album_extended_desc_padding":"2px","album_extended_desc_more_color":"F2D22E","album_extended_desc_more_size":12,"masonry_thumb_padding":4,"masonry_thumb_border_radius":"0","masonry_thumb_border_width":0,"masonry_thumb_border_style":"none","masonry_thumb_border_color":"CCCCCC","masonry_thumbs_bg_color":"FFFFFF","masonry_thumb_bg_transparent":0,"masonry_thumb_transparent":100,"masonry_thumb_align":"center","masonry_thumb_hover_effect":"scale","masonry_thumb_hover_effect_value":"1.1","masonry_thumb_transition":0,"slideshow_cont_bg_color":"000000","slideshow_close_btn_transparent":100,"slideshow_rl_btn_bg_color":"000000","slideshow_rl_btn_border_radius":"20px","slideshow_rl_btn_border_width":0,"slideshow_rl_btn_border_style":"none","slideshow_rl_btn_border_color":"FFFFFF","slideshow_rl_btn_box_shadow":"0px 0px 0px #000000","slideshow_rl_btn_color":"FFFFFF","slideshow_rl_btn_height":40,"slideshow_rl_btn_size":20,"slideshow_rl_btn_width":40,"slideshow_close_rl_btn_hover_color":"CCCCCC","slideshow_filmstrip_pos":"top","slideshow_filmstrip_thumb_border_width":1,"slideshow_filmstrip_thumb_border_style":"solid","slideshow_filmstrip_thumb_border_color":"000000","slideshow_filmstrip_thumb_border_radius":"0","slideshow_filmstrip_thumb_margin":"0 1px","slideshow_filmstrip_thumb_active_border_width":0,"slideshow_filmstrip_thumb_active_border_color":"FFFFFF","slideshow_filmstrip_thumb_deactive_transparent":80,"slideshow_filmstrip_rl_bg_color":"3B3B3B","slideshow_filmstrip_rl_btn_color":"FFFFFF","slideshow_filmstrip_rl_btn_size":20,"slideshow_title_font_size":16,"slideshow_title_font":"segoe ui","slideshow_title_color":"FFFFFF","slideshow_title_opacity":70,"slideshow_title_border_radius":"5px","slideshow_title_background_color":"000000","slideshow_title_padding":"0 0 0 0","slideshow_description_font_size":14,"slideshow_description_font":"segoe ui","slideshow_description_color":"FFFFFF","slideshow_description_opacity":70,"slideshow_description_border_radius":"0","slideshow_description_background_color":"000000","slideshow_description_padding":"5px 10px 5px 10px","slideshow_dots_width":12,"slideshow_dots_height":12,"slideshow_dots_border_radius":"5px","slideshow_dots_background_color":"F2D22E","slideshow_dots_margin":3,"slideshow_dots_active_background_color":"FFFFFF","slideshow_dots_active_border_width":1,"slideshow_dots_active_border_color":"000000","slideshow_play_pause_btn_size":60,"slideshow_rl_btn_style":"fa-chevron","blog_style_margin":"2px","blog_style_padding":"0","blog_style_border_radius":"0","blog_style_border_width":1,"blog_style_border_style":"solid","blog_style_border_color":"F5F5F5","blog_style_bg_color":"FFFFFF","blog_style_transparent":80,"blog_style_box_shadow":"","blog_style_align":"center","blog_style_share_buttons_margin":"5px auto 10px auto","blog_style_share_buttons_border_radius":"0","blog_style_share_buttons_border_width":0,"blog_style_share_buttons_border_style":"none","blog_style_share_buttons_border_color":"000000","blog_style_share_buttons_bg_color":"FFFFFF","blog_style_share_buttons_align":"right","blog_style_img_font_size":16,"blog_style_img_font_family":"segoe ui","blog_style_img_font_color":"000000","blog_style_share_buttons_color":"B3AFAF","blog_style_share_buttons_bg_transparent":0,"blog_style_share_buttons_font_size":20,"image_browser_margin":"2px auto","image_browser_padding":"4px","image_browser_border_radius":"0","image_browser_border_width":1,"image_browser_border_style":"none","image_browser_border_color":"F5F5F5","image_browser_bg_color":"EBEBEB","image_browser_box_shadow":"","image_browser_transparent":80,"image_browser_align":"center","image_browser_image_description_margin":"0px 5px 0px 5px","image_browser_image_description_padding":"8px 8px 8px 8px","image_browser_image_description_border_radius":"0","image_browser_image_description_border_width":1,"image_browser_image_description_border_style":"none","image_browser_image_description_border_color":"FFFFFF","image_browser_image_description_bg_color":"EBEBEB","image_browser_image_description_align":"center","image_browser_img_font_size":15,"image_browser_img_font_family":"segoe ui","image_browser_img_font_color":"000000","image_browser_full_padding":"4px","image_browser_full_border_radius":"0","image_browser_full_border_width":2,"image_browser_full_border_style":"none","image_browser_full_border_color":"F7F7F7","image_browser_full_bg_color":"F5F5F5","image_browser_full_transparent":90,"lightbox_info_pos":"top","lightbox_info_align":"right","lightbox_info_bg_color":"000000","lightbox_info_bg_transparent":70,"lightbox_info_border_width":1,"lightbox_info_border_style":"none","lightbox_info_border_color":"000000","lightbox_info_border_radius":"5px","lightbox_info_padding":"5px","lightbox_info_margin":"15px","lightbox_title_color":"FFFFFF","lightbox_title_font_style":"segoe ui","lightbox_title_font_weight":"bold","lightbox_title_font_size":18,"lightbox_description_color":"FFFFFF","lightbox_description_font_style":"segoe ui","lightbox_description_font_weight":"normal","lightbox_description_font_size":14,"lightbox_rate_pos":"bottom","lightbox_rate_align":"right","lightbox_rate_icon":"star","lightbox_rate_color":"F9D062","lightbox_rate_size":20,"lightbox_rate_stars_count":5,"lightbox_rate_padding":"15px","lightbox_rate_hover_color":"F7B50E","lightbox_hit_pos":"bottom","lightbox_hit_align":"left","lightbox_hit_bg_color":"000000","lightbox_hit_bg_transparent":70,"lightbox_hit_border_width":1,"lightbox_hit_border_style":"none","lightbox_hit_border_color":"000000","lightbox_hit_border_radius":"5px","lightbox_hit_padding":"5px","lightbox_hit_margin":"0 5px","lightbox_hit_color":"FFFFFF","lightbox_hit_font_style":"segoe ui","lightbox_hit_font_weight":"normal","lightbox_hit_font_size":14,"masonry_description_font_size":12,"masonry_description_color":"CCCCCC","masonry_description_font_style":"segoe ui","album_masonry_back_font_color":"000000","album_masonry_back_font_style":"segoe ui","album_masonry_back_font_size":16,"album_masonry_back_font_weight":"bold","album_masonry_back_padding":"0","album_masonry_title_font_color":"CCCCCC","album_masonry_title_font_style":"segoe ui","album_masonry_thumb_title_pos":"bottom","album_masonry_title_font_size":16,"album_masonry_title_font_weight":"bold","album_masonry_title_margin":"2px","album_masonry_title_shadow":"0px 0px 0px #888888","album_masonry_thumb_margin":4,"album_masonry_thumb_padding":0,"album_masonry_thumb_border_radius":"0","album_masonry_thumb_border_width":0,"album_masonry_thumb_border_style":"none","album_masonry_thumb_border_color":"CCCCCC","album_masonry_thumb_bg_color":"FFFFFF","album_masonry_thumbs_bg_color":"FFFFFF","album_masonry_thumb_bg_transparent":0,"album_masonry_thumb_box_shadow":"0px 0px 0px #888888","album_masonry_thumb_transparent":100,"album_masonry_thumb_align":"center","album_masonry_thumb_hover_effect":"scale","album_masonry_thumb_hover_effect_value":"1.1","album_masonry_thumb_transition":0,"mosaic_thumb_padding":4,"mosaic_thumb_border_radius":"0","mosaic_thumb_border_width":0,"mosaic_thumb_border_style":"none","mosaic_thumb_border_color":"CCCCCC","mosaic_thumbs_bg_color":"FFFFFF","mosaic_thumb_bg_transparent":0,"mosaic_thumb_transparent":100,"mosaic_thumb_align":"center","mosaic_thumb_hover_effect":"scale","mosaic_thumb_hover_effect_value":"1.1","mosaic_thumb_title_font_color":"CCCCCC","mosaic_thumb_title_font_style":"segoe ui","mosaic_thumb_title_font_weight":"bold","mosaic_thumb_title_margin":"2px","mosaic_thumb_title_shadow":"0px 0px 0px #888888","mosaic_thumb_title_font_size":16,"carousel_cont_bg_color":"000000","carousel_cont_btn_transparent":0,"carousel_close_btn_transparent":100,"carousel_rl_btn_bg_color":"000000","carousel_rl_btn_border_radius":"20px","carousel_rl_btn_border_width":0,"carousel_rl_btn_border_style":"none","carousel_rl_btn_border_color":"FFFFFF","carousel_rl_btn_color":"FFFFFF","carousel_rl_btn_height":40,"carousel_rl_btn_size":20,"carousel_play_pause_btn_size":20,"carousel_rl_btn_width":40,"carousel_close_rl_btn_hover_color":"CCCCCC","carousel_rl_btn_style":"fa-chevron","carousel_mergin_bottom":"0.5","carousel_font_family":"Arial","carousel_feature_border_width":2,"carousel_feature_border_style":"solid","carousel_feature_border_color":"5D204F","carousel_caption_background_color":"000000","carousel_caption_bottom":0,"carousel_caption_p_mergin":0,"carousel_caption_p_pedding":5,"carousel_caption_p_font_weight":"bold","carousel_caption_p_font_size":14,"carousel_caption_p_color":"white","carousel_title_opacity":100,"carousel_title_border_radius":"5px","mosaic_thumb_transition":1}', 1),
(2, 'Theme 2', '{"thumb_margin":4,"thumb_padding":4,"thumb_border_radius":"0","thumb_border_width":5,"thumb_border_style":"none","thumb_border_color":"FFFFFF","thumb_bg_color":"E8E8E8","thumbs_bg_color":"FFFFFF","thumb_bg_transparent":0,"thumb_box_shadow":"0px 0px 0px #888888","thumb_transparent":100,"thumb_align":"center","thumb_hover_effect":"rotate","thumb_hover_effect_value":"2deg","thumb_transition":1,"thumb_title_font_color":"CCCCCC","thumb_title_font_style":"segoe ui","thumb_title_pos":"bottom","thumb_title_font_size":16,"thumb_title_font_weight":"bold","thumb_title_margin":"5px","thumb_title_shadow":"","page_nav_position":"bottom","page_nav_align":"center","page_nav_number":0,"page_nav_font_size":12,"page_nav_font_style":"segoe ui","page_nav_font_color":"666666","page_nav_font_weight":"bold","page_nav_border_width":1,"page_nav_border_style":"none","page_nav_border_color":"E3E3E3","page_nav_border_radius":"0","page_nav_margin":"0","page_nav_padding":"3px 6px","page_nav_button_bg_color":"FCFCFC","page_nav_button_bg_transparent":100,"page_nav_box_shadow":"0","page_nav_button_transition":1,"page_nav_button_text":0,"lightbox_overlay_bg_color":"000000","lightbox_overlay_bg_transparent":70,"lightbox_bg_color":"000000","lightbox_ctrl_btn_pos":"bottom","lightbox_ctrl_btn_align":"center","lightbox_ctrl_btn_height":20,"lightbox_ctrl_btn_margin_top":10,"lightbox_ctrl_btn_margin_left":7,"lightbox_ctrl_btn_transparent":80,"lightbox_ctrl_btn_color":"FFFFFF","lightbox_toggle_btn_height":14,"lightbox_toggle_btn_width":100,"lightbox_ctrl_cont_bg_color":"000000","lightbox_ctrl_cont_transparent":80,"lightbox_ctrl_cont_border_radius":4,"lightbox_close_btn_transparent":95,"lightbox_close_btn_bg_color":"000000","lightbox_close_btn_border_width":0,"lightbox_close_btn_border_radius":"16px","lightbox_close_btn_border_style":"none","lightbox_close_btn_border_color":"FFFFFF","lightbox_close_btn_box_shadow":"","lightbox_close_btn_color":"FFFFFF","lightbox_close_btn_size":10,"lightbox_close_btn_width":20,"lightbox_close_btn_height":20,"lightbox_close_btn_top":"-10","lightbox_close_btn_right":"-10","lightbox_close_btn_full_color":"FFFFFF","lightbox_rl_btn_bg_color":"000000","lightbox_rl_btn_border_radius":"20px","lightbox_rl_btn_border_width":2,"lightbox_rl_btn_border_style":"none","lightbox_rl_btn_border_color":"FFFFFF","lightbox_rl_btn_box_shadow":"","lightbox_rl_btn_color":"FFFFFF","lightbox_rl_btn_height":40,"lightbox_rl_btn_width":40,"lightbox_rl_btn_size":20,"lightbox_close_rl_btn_hover_color":"FFFFFF","lightbox_comment_pos":"left","lightbox_comment_width":400,"lightbox_comment_bg_color":"000000","lightbox_comment_font_color":"CCCCCC","lightbox_comment_font_style":"arial","lightbox_comment_font_size":12,"lightbox_comment_button_bg_color":"333333","lightbox_comment_button_border_color":"666666","lightbox_comment_button_border_width":1,"lightbox_comment_button_border_style":"none","lightbox_comment_button_border_radius":"3px","lightbox_comment_button_padding":"3px 10px","lightbox_comment_input_bg_color":"333333","lightbox_comment_input_border_color":"666666","lightbox_comment_input_border_width":1,"lightbox_comment_input_border_style":"none","lightbox_comment_input_border_radius":"0","lightbox_comment_input_padding":"3px","lightbox_comment_separator_width":1,"lightbox_comment_separator_style":"solid","lightbox_comment_separator_color":"2B2B2B","lightbox_comment_author_font_size":14,"lightbox_comment_date_font_size":10,"lightbox_comment_body_font_size":12,"lightbox_comment_share_button_color":"FFFFFF","lightbox_filmstrip_pos":"top","lightbox_filmstrip_rl_bg_color":"2B2B2B","lightbox_filmstrip_rl_btn_size":20,"lightbox_filmstrip_rl_btn_color":"FFFFFF","lightbox_filmstrip_thumb_margin":"0 1px","lightbox_filmstrip_thumb_border_width":1,"lightbox_filmstrip_thumb_border_style":"none","lightbox_filmstrip_thumb_border_color":"000000","lightbox_filmstrip_thumb_border_radius":"0","lightbox_filmstrip_thumb_deactive_transparent":80,"lightbox_filmstrip_thumb_active_border_width":0,"lightbox_filmstrip_thumb_active_border_color":"FFFFFF","lightbox_rl_btn_style":"fa-chevron","lightbox_rl_btn_transparent":80,"album_compact_back_font_color":"000000","album_compact_back_font_style":"segoe ui","album_compact_back_font_size":14,"album_compact_back_font_weight":"normal","album_compact_back_padding":"0","album_compact_title_font_color":"CCCCCC","album_compact_title_font_style":"segoe ui","album_compact_thumb_title_pos":"bottom","album_compact_title_font_size":16,"album_compact_title_font_weight":"bold","album_compact_title_margin":"5px","album_compact_title_shadow":"","album_compact_thumb_margin":4,"album_compact_thumb_padding":4,"album_compact_thumb_border_radius":"0","album_compact_thumb_border_width":1,"album_compact_thumb_border_style":"none","album_compact_thumb_border_color":"000000","album_compact_thumb_bg_color":"E8E8E8","album_compact_thumbs_bg_color":"FFFFFF","album_compact_thumb_bg_transparent":100,"album_compact_thumb_box_shadow":"","album_compact_thumb_transparent":100,"album_compact_thumb_align":"center","album_compact_thumb_hover_effect":"rotate","album_compact_thumb_hover_effect_value":"2deg","album_compact_thumb_transition":1,"album_extended_thumb_margin":2,"album_extended_thumb_padding":4,"album_extended_thumb_border_radius":"0","album_extended_thumb_border_width":4,"album_extended_thumb_border_style":"none","album_extended_thumb_border_color":"E8E8E8","album_extended_thumb_bg_color":"E8E8E8","album_extended_thumbs_bg_color":"FFFFFF","album_extended_thumb_bg_transparent":100,"album_extended_thumb_box_shadow":"","album_extended_thumb_transparent":100,"album_extended_thumb_align":"left","album_extended_thumb_hover_effect":"rotate","album_extended_thumb_hover_effect_value":"2deg","album_extended_thumb_transition":0,"album_extended_back_font_color":"000000","album_extended_back_font_style":"segoe ui","album_extended_back_font_size":16,"album_extended_back_font_weight":"bold","album_extended_back_padding":"0","album_extended_div_bg_color":"FFFFFF","album_extended_div_bg_transparent":0,"album_extended_div_border_radius":"0","album_extended_div_margin":"0 0 5px 0","album_extended_div_padding":10,"album_extended_div_separator_width":1,"album_extended_div_separator_style":"none","album_extended_div_separator_color":"CCCCCC","album_extended_thumb_div_bg_color":"FFFFFF","album_extended_thumb_div_border_radius":"0","album_extended_thumb_div_border_width":0,"album_extended_thumb_div_border_style":"none","album_extended_thumb_div_border_color":"CCCCCC","album_extended_thumb_div_padding":"0","album_extended_text_div_bg_color":"FFFFFF","album_extended_text_div_border_radius":"0","album_extended_text_div_border_width":1,"album_extended_text_div_border_style":"none","album_extended_text_div_border_color":"CCCCCC","album_extended_text_div_padding":"5px","album_extended_title_span_border_width":1,"album_extended_title_span_border_style":"none","album_extended_title_span_border_color":"CCCCCC","album_extended_title_font_color":"000000","album_extended_title_font_style":"segoe ui","album_extended_title_font_size":16,"album_extended_title_font_weight":"bold","album_extended_title_margin_bottom":2,"album_extended_title_padding":"2px","album_extended_desc_span_border_width":1,"album_extended_desc_span_border_style":"none","album_extended_desc_span_border_color":"CCCCCC","album_extended_desc_font_color":"000000","album_extended_desc_font_style":"segoe ui","album_extended_desc_font_size":14,"album_extended_desc_font_weight":"normal","album_extended_desc_padding":"2px","album_extended_desc_more_color":"FFC933","album_extended_desc_more_size":12,"masonry_thumb_padding":4,"masonry_thumb_border_radius":"2px","masonry_thumb_border_width":1,"masonry_thumb_border_style":"none","masonry_thumb_border_color":"CCCCCC","masonry_thumbs_bg_color":"FFFFFF","masonry_thumb_bg_transparent":0,"masonry_thumb_transparent":80,"masonry_thumb_align":"center","masonry_thumb_hover_effect":"rotate","masonry_thumb_hover_effect_value":"2deg","masonry_thumb_transition":0,"slideshow_cont_bg_color":"000000","slideshow_close_btn_transparent":100,"slideshow_rl_btn_bg_color":"000000","slideshow_rl_btn_border_radius":"20px","slideshow_rl_btn_border_width":0,"slideshow_rl_btn_border_style":"none","slideshow_rl_btn_border_color":"FFFFFF","slideshow_rl_btn_box_shadow":"","slideshow_rl_btn_color":"FFFFFF","slideshow_rl_btn_height":40,"slideshow_rl_btn_size":20,"slideshow_rl_btn_width":40,"slideshow_close_rl_btn_hover_color":"DBDBDB","slideshow_filmstrip_pos":"bottom","slideshow_filmstrip_thumb_border_width":1,"slideshow_filmstrip_thumb_border_style":"none","slideshow_filmstrip_thumb_border_color":"000000","slideshow_filmstrip_thumb_border_radius":"0","slideshow_filmstrip_thumb_margin":"0 1px","slideshow_filmstrip_thumb_active_border_width":0,"slideshow_filmstrip_thumb_active_border_color":"FFFFFF","slideshow_filmstrip_thumb_deactive_transparent":80,"slideshow_filmstrip_rl_bg_color":"303030","slideshow_filmstrip_rl_btn_color":"FFFFFF","slideshow_filmstrip_rl_btn_size":20,"slideshow_title_font_size":16,"slideshow_title_font":"segoe ui","slideshow_title_color":"FFFFFF","slideshow_title_opacity":70,"slideshow_title_border_radius":"5px","slideshow_title_background_color":"000000","slideshow_title_padding":"5px 10px 5px 10px","slideshow_description_font_size":14,"slideshow_description_font":"segoe ui","slideshow_description_color":"FFFFFF","slideshow_description_opacity":70,"slideshow_description_border_radius":"0","slideshow_description_background_color":"000000","slideshow_description_padding":"5px 10px 5px 10px","slideshow_dots_width":10,"slideshow_dots_height":10,"slideshow_dots_border_radius":"10px","slideshow_dots_background_color":"292929","slideshow_dots_margin":1,"slideshow_dots_active_background_color":"292929","slideshow_dots_active_border_width":2,"slideshow_dots_active_border_color":"FFC933","slideshow_play_pause_btn_size":60,"slideshow_rl_btn_style":"fa-chevron","blog_style_margin":"2px","blog_style_padding":"4px","blog_style_border_radius":"0","blog_style_border_width":1,"blog_style_border_style":"none","blog_style_border_color":"CCCCCC","blog_style_bg_color":"E8E8E8","blog_style_transparent":70,"blog_style_box_shadow":"","blog_style_align":"center","blog_style_share_buttons_margin":"5px auto 10px auto","blog_style_share_buttons_border_radius":"0","blog_style_share_buttons_border_width":0,"blog_style_share_buttons_border_style":"none","blog_style_share_buttons_border_color":"000000","blog_style_share_buttons_bg_color":"FFFFFF","blog_style_share_buttons_align":"right","blog_style_img_font_size":16,"blog_style_img_font_family":"segoe ui","blog_style_img_font_color":"000000","blog_style_share_buttons_color":"A1A1A1","blog_style_share_buttons_bg_transparent":0,"blog_style_share_buttons_font_size":20,"image_browser_margin":"2px auto","image_browser_padding":"4px","image_browser_border_radius":"2px","image_browser_border_width":1,"image_browser_border_style":"none","image_browser_border_color":"E8E8E8","image_browser_bg_color":"E8E8E8","image_browser_box_shadow":"","image_browser_transparent":80,"image_browser_align":"center","image_browser_image_description_margin":"24px 0px 0px 0px","image_browser_image_description_padding":"8px 8px 8px 8px","image_browser_image_description_border_radius":"0","image_browser_image_description_border_width":1,"image_browser_image_description_border_style":"none","image_browser_image_description_border_color":"FFFFFF","image_browser_image_description_bg_color":"E8E8E8","image_browser_image_description_align":"center","image_browser_img_font_size":14,"image_browser_img_font_family":"segoe ui","image_browser_img_font_color":"000000","image_browser_full_padding":"4px","image_browser_full_border_radius":"0","image_browser_full_border_width":1,"image_browser_full_border_style":"solid","image_browser_full_border_color":"EDEDED","image_browser_full_bg_color":"FFFFFF","image_browser_full_transparent":90,"lightbox_info_pos":"top","lightbox_info_align":"right","lightbox_info_bg_color":"000000","lightbox_info_bg_transparent":70,"lightbox_info_border_width":1,"lightbox_info_border_style":"none","lightbox_info_border_color":"000000","lightbox_info_border_radius":"5px","lightbox_info_padding":"5px","lightbox_info_margin":"15px","lightbox_title_color":"FFFFFF","lightbox_title_font_style":"segoe ui","lightbox_title_font_weight":"bold","lightbox_title_font_size":18,"lightbox_description_color":"FFFFFF","lightbox_description_font_style":"segoe ui","lightbox_description_font_weight":"normal","lightbox_description_font_size":14,"lightbox_rate_pos":"bottom","lightbox_rate_align":"right","lightbox_rate_icon":"star","lightbox_rate_color":"F9D062","lightbox_rate_size":20,"lightbox_rate_stars_count":5,"lightbox_rate_padding":"15px","lightbox_rate_hover_color":"F7B50E","lightbox_hit_pos":"bottom","lightbox_hit_align":"left","lightbox_hit_bg_color":"000000","lightbox_hit_bg_transparent":70,"lightbox_hit_border_width":1,"lightbox_hit_border_style":"none","lightbox_hit_border_color":"000000","lightbox_hit_border_radius":"5px","lightbox_hit_padding":"5px","lightbox_hit_margin":"0 5px","lightbox_hit_color":"FFFFFF","lightbox_hit_font_style":"segoe ui","lightbox_hit_font_weight":"normal","lightbox_hit_font_size":14,"masonry_description_font_size":12,"masonry_description_color":"CCCCCC","masonry_description_font_style":"segoe ui","album_masonry_back_font_color":"000000","album_masonry_back_font_style":"segoe ui","album_masonry_back_font_size":14,"album_masonry_back_font_weight":"normal","album_masonry_back_padding":"0","album_masonry_title_font_color":"CCCCCC","album_masonry_title_font_style":"segoe ui","album_masonry_thumb_title_pos":"bottom","album_masonry_title_font_size":16,"album_masonry_title_font_weight":"bold","album_masonry_title_margin":"5px","album_masonry_title_shadow":"","album_masonry_thumb_margin":4,"album_masonry_thumb_padding":4,"album_masonry_thumb_border_radius":"0","album_masonry_thumb_border_width":1,"album_masonry_thumb_border_style":"none","album_masonry_thumb_border_color":"000000","album_masonry_thumb_bg_color":"E8E8E8","album_masonry_thumbs_bg_color":"FFFFFF","album_masonry_thumb_bg_transparent":100,"album_masonry_thumb_box_shadow":"","album_masonry_thumb_transparent":100,"album_masonry_thumb_align":"center","album_masonry_thumb_hover_effect":"rotate","album_masonry_thumb_hover_effect_value":"2deg","album_masonry_thumb_transition":1,"mosaic_thumb_padding":4,"mosaic_thumb_border_radius":"2px","mosaic_thumb_border_width":1,"mosaic_thumb_border_style":"none","mosaic_thumb_border_color":"CCCCCC","mosaic_thumbs_bg_color":"FFFFFF","mosaic_thumb_bg_transparent":0,"mosaic_thumb_transparent":80,"mosaic_thumb_align":"center","mosaic_thumb_hover_effect":"rotate","mosaic_thumb_hover_effect_value":"2deg","mosaic_thumb_title_font_color":"CCCCCC","mosaic_thumb_title_font_style":"segoe ui","mosaic_thumb_title_font_weight":"bold","mosaic_thumb_title_margin":"2px","mosaic_thumb_title_shadow":"0px 0px 0px #888888","mosaic_thumb_title_font_size":16,"carousel_cont_bg_color":"000000","carousel_cont_btn_transparent":0,"carousel_close_btn_transparent":100,"carousel_rl_btn_bg_color":"000000","carousel_rl_btn_border_radius":"20px","carousel_rl_btn_border_width":0,"carousel_rl_btn_border_style":"none","carousel_rl_btn_border_color":"FFFFFF","carousel_rl_btn_color":"FFFFFF","carousel_rl_btn_height":40,"carousel_rl_btn_size":20,"carousel_play_pause_btn_size":20,"carousel_rl_btn_width":40,"carousel_close_rl_btn_hover_color":"CCCCCC","carousel_rl_btn_style":"fa-chevron","carousel_mergin_bottom":"0.5","carousel_font_family":"Arial","carousel_feature_border_width":2,"carousel_feature_border_style":"solid","carousel_feature_border_color":"5D204F","carousel_caption_background_color":"000000","carousel_caption_bottom":0,"carousel_caption_p_mergin":0,"carousel_caption_p_pedding":5,"carousel_caption_p_font_weight":"bold","carousel_caption_p_font_size":14,"carousel_caption_p_color":"white","carousel_title_opacity":100,"carousel_title_border_radius":"5px","default_theme":0,"mosaic_thumb_transition":1}', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2016-02-16 21:13:48', '2016-02-16 20:13:48', 'Ciao, questo è un commento.\nPer cancellare un commento effettua la login e visualizza i commenti agli articoli. Lì troverai le opzioni per modificarli o cancellarli.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_g_circles`
--

CREATE TABLE `wp_g_circles` (
  `id` int(11) UNSIGNED NOT NULL,
  `map` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `center_lat` varchar(255) NOT NULL,
  `center_lng` varchar(255) NOT NULL,
  `radius` varchar(255) NOT NULL,
  `line_width` varchar(5) NOT NULL,
  `line_opacity` varchar(5) NOT NULL,
  `line_color` varchar(7) NOT NULL,
  `fill_color` varchar(7) NOT NULL,
  `fill_opacity` varchar(7) NOT NULL,
  `hover_line_opacity` varchar(5) NOT NULL,
  `hover_line_color` varchar(7) NOT NULL,
  `hover_fill_color` varchar(7) NOT NULL,
  `hover_fill_opacity` varchar(7) NOT NULL,
  `show_marker` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_g_circles`
--

INSERT INTO `wp_g_circles` (`id`, `map`, `name`, `center_lat`, `center_lng`, `radius`, `line_width`, `line_opacity`, `line_color`, `fill_color`, `fill_opacity`, `hover_line_opacity`, `hover_line_color`, `hover_fill_color`, `hover_fill_opacity`, `show_marker`) VALUES
(1, 1, 'My First Circle', '40.805493843894155', '-76.3165283203125', '50000', '5', '0.8', 'FF2B39', '4FFF72', '0.4', '0.6', 'FF5C5C', '96FFA1', '0.3', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_g_maps`
--

CREATE TABLE `wp_g_maps` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `zoom` int(5) NOT NULL,
  `min_zoom` varchar(55) NOT NULL DEFAULT '0',
  `max_zoom` varchar(55) NOT NULL DEFAULT '22',
  `border_radius` int(5) NOT NULL,
  `center_lat` varchar(255) NOT NULL DEFAULT '0',
  `pan_controller` varchar(5) NOT NULL DEFAULT 'true',
  `zoom_controller` varchar(5) NOT NULL DEFAULT 'true',
  `type_controller` varchar(5) NOT NULL DEFAULT 'true',
  `scale_controller` varchar(5) NOT NULL DEFAULT 'true',
  `street_view_controller` varchar(5) NOT NULL DEFAULT 'true',
  `overview_map_controller` varchar(5) NOT NULL DEFAULT 'true',
  `center_lng` varchar(255) NOT NULL DEFAULT '0',
  `width` varchar(5) NOT NULL DEFAULT '100',
  `height` varchar(5) NOT NULL DEFAULT '450',
  `align` varchar(11) NOT NULL DEFAULT 'left',
  `info_type` varchar(9) NOT NULL DEFAULT 'click',
  `traffic_layer` varchar(55) NOT NULL DEFAULT 'false',
  `bike_layer` varchar(55) NOT NULL DEFAULT 'false',
  `transit_layer` varchar(55) NOT NULL DEFAULT 'false',
  `styling_hue` text NOT NULL,
  `styling_lightness` varchar(55) NOT NULL DEFAULT '0',
  `styling_gamma` varchar(55) NOT NULL DEFAULT '1',
  `styling_saturation` varchar(55) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_g_maps`
--

INSERT INTO `wp_g_maps` (`id`, `name`, `type`, `zoom`, `min_zoom`, `max_zoom`, `border_radius`, `center_lat`, `pan_controller`, `zoom_controller`, `type_controller`, `scale_controller`, `street_view_controller`, `overview_map_controller`, `center_lng`, `width`, `height`, `align`, `info_type`, `traffic_layer`, `bike_layer`, `transit_layer`, `styling_hue`, `styling_lightness`, `styling_gamma`, `styling_saturation`) VALUES
(1, 'Firenze', 'ROADMAP', 14, '0', '22', 0, '43.7790028', 'true', 'true', 'true', 'true', 'true', 'true', '11.255310000000009', '100', '300', 'center', 'click', 'false', 'false', 'false', '', '0', '1', '0');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_g_markers`
--

CREATE TABLE `wp_g_markers` (
  `id` int(11) UNSIGNED NOT NULL,
  `map` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `lat` varchar(255) NOT NULL DEFAULT '0',
  `lng` varchar(255) NOT NULL DEFAULT '0',
  `animation` varchar(255) NOT NULL DEFAULT 'NONE',
  `description` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_g_markers`
--

INSERT INTO `wp_g_markers` (`id`, `map`, `title`, `lat`, `lng`, `animation`, `description`, `img`, `size`) VALUES
(2, 1, 'Casa Rabatti', '43.7790028', '11.255310000000009', 'DROP', 'Casa Rabatti', '', '16');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_g_polygones`
--

CREATE TABLE `wp_g_polygones` (
  `id` int(11) UNSIGNED NOT NULL,
  `map` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `line_opacity` varchar(5) NOT NULL,
  `line_color` varchar(9) NOT NULL,
  `fill_opacity` varchar(5) NOT NULL,
  `fill_color` varchar(9) NOT NULL,
  `url` text NOT NULL,
  `hover_line_opacity` varchar(5) NOT NULL,
  `hover_line_color` varchar(9) NOT NULL,
  `hover_fill_opacity` varchar(5) NOT NULL,
  `hover_fill_color` varchar(9) NOT NULL,
  `line_width` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_g_polygones`
--

INSERT INTO `wp_g_polygones` (`id`, `map`, `name`, `data`, `line_opacity`, `line_color`, `fill_opacity`, `fill_color`, `url`, `hover_line_opacity`, `hover_line_color`, `hover_fill_opacity`, `hover_fill_color`, `line_width`) VALUES
(1, 1, 'My First Polygon', '(40.538851525354666, -74.3060302734375),(40.16208338164619, -73.9764404296875),(39.40224434029277, -74.3499755859375),(38.950865400920016, -74.8883056640625),(39.13858199058352, -75.0091552734375),(39.46164364205549, -75.5035400390625),(39.774769485295465, -75.4815673828125),(39.86758762451019, -75.0201416015625)', '0.9', 'E2574C', '0.5', 'F6C37A', 'http://www.huge-it.com', '0.8', 'FF80B7', '0.5', '75FF7E', '5');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_g_polylines`
--

CREATE TABLE `wp_g_polylines` (
  `id` int(11) UNSIGNED NOT NULL,
  `map` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `line_opacity` varchar(5) NOT NULL,
  `line_color` varchar(7) NOT NULL,
  `line_width` varchar(5) NOT NULL,
  `hover_line_color` varchar(9) NOT NULL,
  `hover_line_opacity` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wp_g_polylines`
--

INSERT INTO `wp_g_polylines` (`id`, `map`, `name`, `data`, `line_opacity`, `line_color`, `line_width`, `hover_line_color`, `hover_line_opacity`) VALUES
(1, 1, 'My First Polyline', '(42.24071874922666, -71.81488037109375),(42.1532233123986, -71.95770263671875),(42.13082130188811, -72.06207275390625),(42.14507804381756, -72.125244140625),(42.18579390537848, -72.2186279296875),(42.16340342422401, -72.2845458984375),(42.1837587346522, -72.3175048828125),(42.1552594657786, -72.36968994140625),(42.169510705216595, -72.4822998046875),(42.157295553651636, -72.630615234375),(42.13896840458089, -72.72674560546875),(42.165439250064324, -72.850341796875),(42.173581898327754, -72.92312622070312),(42.2366518803206, -73.00277709960938),(42.24478535602799, -73.10714721679688),(42.30169032824452, -73.17306518554688),(42.3016903282445, -73.34884643554688),(42.37883631647602, -73.45596313476562),(42.41940144722477, -73.54385375976562),(42.47209690919285, -73.63174438476562),(42.482225570025925, -73.67294311523438),(42.50652766705062, -73.78005981445312),(42.34027515373573, -73.85421752929688),(42.173581898327754, -73.93112182617188),(41.9921602333763, -73.99703979492188),(41.91249742196845, -74.04098510742188),(41.83682786072714, -74.17831420898438),(41.79179268262892, -74.23599243164062),(41.75492216766298, -74.36782836914062),(41.70777900286713, -74.38430786132812),(41.582579601430346, -74.48318481445312),(41.36238012945534, -74.70291137695312)', '0.9', '18A326', '4', '11A000', '0.5');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_masterslider_options`
--

CREATE TABLE `wp_masterslider_options` (
  `ID` smallint(5) UNSIGNED NOT NULL,
  `option_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_masterslider_options`
--

INSERT INTO `wp_masterslider_options` (`ID`, `option_name`, `option_value`) VALUES
(1, 'custom_inline_style', '.ms-parent-id-1 > .master-slider{ background:#000000; }');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_masterslider_sliders`
--

CREATE TABLE `wp_masterslider_sliders` (
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slides_num` smallint(5) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_styles` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fonts` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_masterslider_sliders`
--

INSERT INTO `wp_masterslider_sliders` (`ID`, `title`, `type`, `slides_num`, `date_created`, `date_modified`, `params`, `custom_styles`, `custom_fonts`, `status`) VALUES
(1, 'HomePage', 'custom', 5, '2016-02-20 02:04:35', '2016-02-27 21:50:51', 'eyJtZXRhIjp7IlNldHRpbmdzIWlkcyI6IjEiLCJTZXR0aW5ncyFuZXh0SWQiOjIsIlNsaWRlIWlkcyI6IjIxLDIyLDIzLDI0LDI1IiwiU2xpZGUhbmV4dElkIjoyNiwiQ29udHJvbCFpZHMiOiIxIiwiQ29udHJvbCFuZXh0SWQiOjZ9LCJNU1BhbmVsLlNldHRpbmdzIjp7IjEiOiJ7XCJpZFwiOlwiMVwiLFwic25hcHBpbmdcIjp0cnVlLFwiZGlzYWJsZUNvbnRyb2xzXCI6ZmFsc2UsXCJuYW1lXCI6XCJIb21lUGFnZVwiLFwid2lkdGhcIjoxMDAwLFwiaGVpZ2h0XCI6OTkwLFwid3JhcHBlcldpZHRoXCI6OTQ1LFwid3JhcHBlcldpZHRoVW5pdFwiOlwicHhcIixcImF1dG9Dcm9wXCI6ZmFsc2UsXCJ0eXBlXCI6XCJjdXN0b21cIixcInNsaWRlcklkXCI6XCIxXCIsXCJsYXlvdXRcIjpcImZ1bGx3aWR0aFwiLFwiYXV0b0hlaWdodFwiOmZhbHNlLFwidHJWaWV3XCI6XCJmYWRlXCIsXCJzcGVlZFwiOjIwLFwic3BhY2VcIjowLFwic3RhcnRcIjoxLFwiZ3JhYkN1cnNvclwiOnRydWUsXCJzd2lwZVwiOnRydWUsXCJtb3VzZVwiOnRydWUsXCJ3aGVlbFwiOmZhbHNlLFwiYXV0b3BsYXlcIjp0cnVlLFwibG9vcFwiOnRydWUsXCJzaHVmZmxlXCI6ZmFsc2UsXCJwcmVsb2FkXCI6XCItMVwiLFwib3ZlclBhdXNlXCI6ZmFsc2UsXCJlbmRQYXVzZVwiOmZhbHNlLFwiaGlkZUxheWVyc1wiOmZhbHNlLFwiZGlyXCI6XCJoXCIsXCJwYXJhbGxheE1vZGVcIjpcInN3aXBlXCIsXCJ1c2VEZWVwTGlua1wiOmZhbHNlLFwiZGVlcExpbmtUeXBlXCI6XCJwYXRoXCIsXCJzY3JvbGxQYXJhbGxheE1vdmVcIjozMCxcInNjcm9sbFBhcmFsbGF4QkdNb3ZlXCI6NTAsXCJzY3JvbGxQYXJhbGxheEZhZGVcIjp0cnVlLFwiY2VudGVyQ29udHJvbHNcIjpmYWxzZSxcImluc3RhbnRTaG93TGF5ZXJzXCI6ZmFsc2UsXCJjbGFzc05hbWVcIjpcInNsaWRlXCIsXCJiZ0NvbG9yXCI6XCIjMDAwMDAwXCIsXCJjdXN0b21TdHlsZVwiOlwiXCIsXCJza2luXCI6XCJtcy1za2luLWxpZ2h0LTYgcm91bmQtc2tpblwiLFwibXNUZW1wbGF0ZVwiOlwiY3VzdG9tXCIsXCJtc1RlbXBsYXRlQ2xhc3NcIjpcIlwiLFwidXNlZEZvbnRzXCI6XCJcIn0ifSwiTVNQYW5lbC5TbGlkZSI6eyIyMSI6IntcImlkXCI6MjEsXCJ0aW1lbGluZV9oXCI6MjAwLFwiYmdUaHVtYlwiOlwiLzIwMTYvMDIvc2VyZ2lvLWFwcGFydGFtZW50by0yLTI3LTEwLTE1LTA4OS0xNTB4MTUwLmpwZ1wiLFwib3JkZXJcIjowLFwiYmdcIjpcIi8yMDE2LzAyL3Nlcmdpby1hcHBhcnRhbWVudG8tMi0yNy0xMC0xNS0wODkuanBnXCIsXCJkdXJhdGlvblwiOlwiM1wiLFwiZmlsbE1vZGVcIjpcImZpbGxcIixcImJndl9maWxsbW9kZVwiOlwiZmlsbFwiLFwiYmd2X2xvb3BcIjpcIjFcIixcImJndl9tdXRlXCI6XCIxXCIsXCJiZ3ZfYXV0b3BhdXNlXCI6XCJcIixcImJnQWx0XCI6XCJcIixcImxheWVyX2lkc1wiOltdfSIsIjIyIjoie1wiaWRcIjoyMixcInRpbWVsaW5lX2hcIjoyMDAsXCJiZ1RodW1iXCI6XCIvMjAxNi8wMi9zbGlkZV8wNV9iLTEtMTUweDE1MC5qcGdcIixcIm9yZGVyXCI6MSxcImJnXCI6XCIvMjAxNi8wMi9zbGlkZV8wNV9iLTEuanBnXCIsXCJkdXJhdGlvblwiOlwiM1wiLFwiZmlsbE1vZGVcIjpcImZpbGxcIixcImJndl9maWxsbW9kZVwiOlwiZmlsbFwiLFwiYmd2X2xvb3BcIjpcIjFcIixcImJndl9tdXRlXCI6XCIxXCIsXCJiZ3ZfYXV0b3BhdXNlXCI6XCJcIixcImJnQWx0XCI6XCJcIixcImxheWVyX2lkc1wiOltdfSIsIjIzIjoie1wiaWRcIjoyMyxcInRpbWVsaW5lX2hcIjoyMDAsXCJiZ1RodW1iXCI6XCIvMjAxNi8wMi9zbGlkZV8wM19iLTE1MHgxNTAuanBnXCIsXCJvcmRlclwiOjIsXCJiZ1wiOlwiLzIwMTYvMDIvc2xpZGVfMDNfYi5qcGdcIixcImR1cmF0aW9uXCI6XCIzXCIsXCJmaWxsTW9kZVwiOlwiZmlsbFwiLFwiYmd2X2ZpbGxtb2RlXCI6XCJmaWxsXCIsXCJiZ3ZfbG9vcFwiOlwiMVwiLFwiYmd2X211dGVcIjpcIjFcIixcImJndl9hdXRvcGF1c2VcIjpcIlwiLFwiYmdBbHRcIjpcIlwiLFwibGF5ZXJfaWRzXCI6W119IiwiMjQiOiJ7XCJpZFwiOjI0LFwidGltZWxpbmVfaFwiOjIwMCxcImJnVGh1bWJcIjpcIi8yMDE2LzAyL3NsaWRlXzAyX2ItMTUweDE1MC5qcGdcIixcIm9yZGVyXCI6MyxcImJnXCI6XCIvMjAxNi8wMi9zbGlkZV8wMl9iLmpwZ1wiLFwiZHVyYXRpb25cIjpcIjNcIixcImZpbGxNb2RlXCI6XCJmaWxsXCIsXCJiZ3ZfZmlsbG1vZGVcIjpcImZpbGxcIixcImJndl9sb29wXCI6XCIxXCIsXCJiZ3ZfbXV0ZVwiOlwiMVwiLFwiYmd2X2F1dG9wYXVzZVwiOlwiXCIsXCJiZ0FsdFwiOlwiXCIsXCJsYXllcl9pZHNcIjpbXX0iLCIyNSI6IntcImlkXCI6MjUsXCJ0aW1lbGluZV9oXCI6MjAwLFwiYmdUaHVtYlwiOlwiLzIwMTYvMDIvc2xpZGVfMDFfYi0xNTB4MTUwLmpwZ1wiLFwib3JkZXJcIjo0LFwiYmdcIjpcIi8yMDE2LzAyL3NsaWRlXzAxX2IuanBnXCIsXCJkdXJhdGlvblwiOlwiM1wiLFwiZmlsbE1vZGVcIjpcImZpbGxcIixcImJndl9maWxsbW9kZVwiOlwiZmlsbFwiLFwiYmd2X2xvb3BcIjpcIjFcIixcImJndl9tdXRlXCI6XCIxXCIsXCJiZ3ZfYXV0b3BhdXNlXCI6XCJcIixcImJnQWx0XCI6XCJcIixcImxheWVyX2lkc1wiOltdfSJ9LCJNU1BhbmVsLkNvbnRyb2wiOnsiMSI6IntcImlkXCI6XCIxXCIsXCJsYWJlbFwiOlwiQXJyb3dzXCIsXCJuYW1lXCI6XCJhcnJvd3NcIixcImF1dG9IaWRlXCI6dHJ1ZSxcIm92ZXJWaWRlb1wiOnRydWUsXCJpbnNldFwiOnRydWV9In19', '', '', 'published');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_ngg_album`
--

CREATE TABLE `wp_ngg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `sortorder` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_ngg_gallery`
--

CREATE TABLE `wp_ngg_gallery` (
  `gid` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` mediumtext COLLATE utf8mb4_unicode_ci,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `galdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_ngg_gallery`
--

INSERT INTO `wp_ngg_gallery` (`gid`, `name`, `slug`, `path`, `title`, `galdesc`, `pageid`, `previewpic`, `author`, `extras_post_id`) VALUES
(20, 'limonaia', 'limonaia-1', '/wp-content/gallery/limonaia-1', 'Limonaia', 'Dependance di 50 mq. immersa nel verde del giardino e raggiungibile tramite un caratteristico vialetto.  Ha un'' ampia  zona notte soppalcata caratterizzata dal soffitto con travi a vista. Un ambiente  intimo dotato anche di zona giorno con  cucina moderna  completamente attrezzata e \r\nampio soggiorno. Per chiunque desideri la  privacy totale.\r\n\r\n- Letto matrimoniale o letti singoli e divano letto (max 5 persone)\r\n- Bagno Old England (doccia)\r\n- TV schermo piatto\r\n- Climatizzazione\r\n- Wi-Fi \r\n- Macchina  caffè americano\r\n- Microonde\r\n- Frigorifero\r\n- Asciugacapelli\r\n- Lavatrice', 0, 19, 1, 108),
(21, 'michelangelo', 'michelangelo', '/wp-content/gallery/michelangelo', 'Michelangelo', NULL, 0, 37, 1, 146),
(22, 'appartamento-san-zanobi', 'appartamento-san-zanobi', 'wp-content/gallery/appartamento-san-zanobi', 'Appartamento San Zanobi', '', 0, 0, 1, 185),
(23, 'appartamento-leonardo', 'appartamento-leonardo', '/wp-content/gallery/appartamento-leonardo', 'Appartamento Leonardo', NULL, 0, 65, 1, 189);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_ngg_pictures`
--

CREATE TABLE `wp_ngg_pictures` (
  `pid` bigint(20) NOT NULL,
  `image_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `alttext` mediumtext COLLATE utf8mb4_unicode_ci,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8mb4_unicode_ci,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_ngg_pictures`
--

INSERT INTO `wp_ngg_pictures` (`pid`, `image_slug`, `post_id`, `galleryid`, `filename`, `description`, `alttext`, `imagedate`, `exclude`, `sortorder`, `meta_data`, `extras_post_id`, `updated_at`) VALUES
(19, 'sergio-appartamento-2-27-10-15-089-min-1', 0, 20, 'sergio-appartamento-2-27-10-15-089-min.jpg', '', 'sergio appartamento 2 27-10-15 089-min', '2016-02-28 16:28:48', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMDg5LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjIwMzAxOTAwIDE0NTY2NzY5MjgifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMDg5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjk4MjE1NDAwIDE0NTY2NzY5MzEifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWUsIm5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMCI6eyJ3aWR0aCI6NjI5LCJoZWlnaHQiOjI5MywiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMDg5LW1pbi5qcGctbmdnaWQwMjE5LW5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjIzNjc2NjAwIDE0NTY2Nzc3MzgifX0=', 107, 1458084231),
(20, 'sergio-appartamento-2-27-10-15-094-min-1', 0, 20, 'sergio-appartamento-2-27-10-15-094-min.jpg', '', 'sergio appartamento 2 27-10-15 094-min', '2016-02-28 16:28:53', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMDk0LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjIyNjU4NDAwIDE0NTY2NzY5MzMifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMDk0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjk1MDQ2NTAwIDE0NTY2NzY5MzYifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 110, 1458084232),
(21, 'sergio-appartamento-2-27-10-15-110-min-1', 0, 20, 'sergio-appartamento-2-27-10-15-110-min.jpg', '', 'sergio appartamento 2 27-10-15 110-min', '2016-02-28 16:28:57', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTEwLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjcwNTczMzAwIDE0NTY2NzY5MzcifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTEwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjYyMTYzOTAwIDE0NTY2NzY5NDEifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 112, 1458084232),
(22, 'sergio-appartamento-2-27-10-15-131-min-1', 0, 20, 'sergio-appartamento-2-27-10-15-131-min.jpg', '', 'sergio appartamento 2 27-10-15 131-min', '2016-02-28 16:29:03', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTMxLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjg4ODMyMDAwIDE0NTY2NzY5NDMifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTMxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjE4OTM0MzAwIDE0NTY2NzY5NDcifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 114, 1458084232),
(23, 'sergio-appartamento-2-27-10-15-137-min-1', 0, 20, 'sergio-appartamento-2-27-10-15-137-min.jpg', '', 'sergio appartamento 2 27-10-15 137-min', '2016-02-28 16:29:09', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTM3LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjYwMDU4ODAwIDE0NTY2NzY5NDkifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTM3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjI1NzYxMDAwIDE0NTY2NzY5NTkifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 116, 1458084232),
(24, 'sergio-appartamento-3-16-12-15-000-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-000-min.jpg', '', 'sergio appartamento 3 16-12-15 000-min', '2016-02-28 16:29:20', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDAwLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjI2MjUwOTAwIDE0NTY2NzY5NjAifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDAwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQzNzU1MjAwIDE0NTY2NzY5NjIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 118, 1458084232),
(25, 'sergio-appartamento-3-16-12-15-001-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-001-min.jpg', '', 'sergio appartamento 3 16-12-15 001-min', '2016-02-28 16:29:23', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDAxLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjI5NTExMzAwIDE0NTY2NzY5NjMifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDAxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ1MjU3MjAwIDE0NTY2NzY5NzAifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 120, 1458084232),
(26, 'sergio-appartamento-3-16-12-15-002-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-002-min.jpg', '', 'sergio appartamento 3 16-12-15 002-min', '2016-02-28 16:29:31', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDAyLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjM1NTQyMjAwIDE0NTY2NzY5NzEifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDAyLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjM3MDI3NDAwIDE0NTY2NzY5NzUifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 122, 1458084232),
(27, 'sergio-appartamento-3-16-12-15-055-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-055-min.jpg', '', 'sergio appartamento 3 16-12-15 055-min', '2016-02-28 16:29:37', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDU1LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjQ5MTczOTAwIDE0NTY2NzY5NzcifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMDU1LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjI3MDE1NzAwIDE0NTY2NzY5ODIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 124, 1458084232),
(28, 'sergio-appartamento-3-16-12-15-103-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-103-min.jpg', '', 'sergio appartamento 3 16-12-15 103-min', '2016-02-28 16:29:44', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTAzLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjY2NzI2MzAwIDE0NTY2NzY5ODQifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTAzLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjAwNTU1NjAwIDE0NTY2NzY5ODcifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 126, 1458084232),
(29, 'sergio-appartamento-3-16-12-15-138-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-138-min.jpg', '', 'sergio appartamento 3 16-12-15 138-min', '2016-02-28 16:29:49', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTM4LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjMyMzkzOTAwIDE0NTY2NzY5ODkifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTM4LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjk4MDQ3NzAwIDE0NTY2NzY5OTMifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 128, 1458084232),
(30, 'sergio-appartamento-3-16-12-15-157-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-157-min.jpg', '', 'sergio appartamento 3 16-12-15 157-min', '2016-02-28 16:29:55', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTU3LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjI1MjUzOTAwIDE0NTY2NzY5OTUifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTU3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjkxMTQ2ODAwIDE0NTY2NzY5OTgifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 130, 1458084232),
(31, 'sergio-appartamento-3-16-12-15-179-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-179-min.jpg', '', 'sergio appartamento 3 16-12-15 179-min', '2016-02-28 16:30:00', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTc5LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjI3NjAxMDAwIDE0NTY2NzcwMDAifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTc5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjk0MzIxNjAwIDE0NTY2NzcwMDMifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 132, 1458084232),
(32, 'sergio-appartamento-3-16-12-15-191-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-191-min.jpg', '', 'sergio appartamento 3 16-12-15 191-min', '2016-02-28 16:30:05', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTkxLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjUwOTE0OTAwIDE0NTY2NzcwMDUifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMTkxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjU1OTA3OTAwIDE0NTY2NzcwMDgifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 134, 1458084233),
(33, 'sergio-appartamento-3-16-12-15-204-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-204-min.jpg', '', 'sergio appartamento 3 16-12-15 204-min', '2016-02-28 16:30:10', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjA0LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjI4OTkzODAwIDE0NTY2NzcwMTAifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjA0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjYzMzI2MjAwIDE0NTY2NzcwMTIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 136, 1458084233),
(34, 'sergio-appartamento-3-16-12-15-215-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-215-min.jpg', '', 'sergio appartamento 3 16-12-15 215-min', '2016-02-28 16:30:14', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjE1LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjI3ODQ5MjAwIDE0NTY2NzcwMTQifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjE1LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjMxODQwNjAwIDE0NTY2NzcwMTgifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 138, 1458084233),
(35, 'sergio-appartamento-3-16-12-15-239-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-239-min.jpg', '', 'sergio appartamento 3 16-12-15 239-min', '2016-02-28 16:30:19', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjM5LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjM1OTYxMTAwIDE0NTY2NzcwMTkifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjM5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjcyOTI2MDAwIDE0NTY2NzcwMjMifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 140, 1458084233),
(36, 'sergio-appartamento-3-16-12-15-267-min-1', 0, 20, 'sergio-appartamento-3-16-12-15-267-min.jpg', '', 'sergio appartamento 3 16-12-15 267-min', '2016-02-28 16:30:25', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjY3LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjM5ODE1MjAwIDE0NTY2NzcwMjUifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTMtMTYtMTItMTUtMjY3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjM4MTY2NDAwIDE0NTY2NzcwMjkifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 142, 1458084233),
(37, 'sergio-appartamento-2-27-10-15-280-min', 0, 21, 'sergio-appartamento-2-27-10-15-280-min.jpg', '', 'sergio appartamento 2 27-10-15 280-min', '2016-02-28 16:58:45', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjgwLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjQ3NDg5MzAwIDE0NTY2Nzg3MjUifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjgwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjk4MDgzMzAwIDE0NTY2Nzg3MjcifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWUsIm5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMCI6eyJ3aWR0aCI6NjI5LCJoZWlnaHQiOjI5MywiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjgwLW1pbi5qcGctbmdnaWQwMjM3LW5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjkxMzE2MTAwIDE0NTY2Nzg4NTIifX0=', 145, 1456678852),
(38, 'sergio-appartamento-2-27-10-15-281-min', 0, 21, 'sergio-appartamento-2-27-10-15-281-min.jpg', '', 'sergio appartamento 2 27-10-15 281-min', '2016-02-28 16:58:48', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjgxLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjg2ODQ1MDAwIDE0NTY2Nzg3MjgifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjgxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjAwNzQ3NTAwIDE0NTY2Nzg3MzEifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 148, 1456678731),
(39, 'sergio-appartamento-2-27-10-15-299-min', 0, 21, 'sergio-appartamento-2-27-10-15-299-min.jpg', '', 'sergio appartamento 2 27-10-15 299-min', '2016-02-28 16:58:51', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjk5LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjgzNTkyNTAwIDE0NTY2Nzg3MzEifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjk5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjY1ODc5MjAwIDE0NTY2Nzg3MzUifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 150, 1456678735),
(40, 'sergio-appartamento-2-27-10-15-306-min', 0, 21, 'sergio-appartamento-2-27-10-15-306-min.jpg', '', 'sergio appartamento 2 27-10-15 306-min', '2016-02-28 16:58:56', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzA2LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjY1MDc2NDAwIDE0NTY2Nzg3MzYifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzA2LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ4MzA0MDAwIDE0NTY2Nzg3NDAifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 152, 1456678740),
(41, 'sergio-appartamento-2-27-10-15-309-min', 0, 21, 'sergio-appartamento-2-27-10-15-309-min.jpg', '', 'sergio appartamento 2 27-10-15 309-min', '2016-02-28 16:59:01', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzA5LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjM1NTk1MDAwIDE0NTY2Nzg3NDEifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzA5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjU3NTQyNTAwIDE0NTY2Nzg3NDMifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 154, 1456678743),
(42, 'sergio-appartamento-2-27-10-15-334-min', 0, 21, 'sergio-appartamento-2-27-10-15-334-min.jpg', '', 'sergio appartamento 2 27-10-15 334-min', '2016-02-28 16:59:04', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzM0LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjM2NDEzMjAwIDE0NTY2Nzg3NDQifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzM0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjcwMTg4OTAwIDE0NTY2Nzg3NDYifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 156, 1456678746),
(43, 'sergio-appartamento-2-27-10-15-335-min', 0, 21, 'sergio-appartamento-2-27-10-15-335-min.jpg', '', 'sergio appartamento 2 27-10-15 335-min', '2016-02-28 16:59:07', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzM1LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjUzNDk3MTAwIDE0NTY2Nzg3NDcifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzM1LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjgzMzU5ODAwIDE0NTY2Nzg3NDkifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 158, 1456678749),
(44, 'sergio-appartamento-2-27-10-15-341-min', 0, 21, 'sergio-appartamento-2-27-10-15-341-min.jpg', '', 'sergio appartamento 2 27-10-15 341-min', '2016-02-28 16:59:10', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQxLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjY4ODc5NzAwIDE0NTY2Nzg3NTAifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjY3NTAyMDAwIDE0NTY2Nzg3NTQifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 160, 1456678754),
(45, 'sergio-appartamento-2-27-10-15-342-min', 0, 21, 'sergio-appartamento-2-27-10-15-342-min.jpg', '', 'sergio appartamento 2 27-10-15 342-min', '2016-02-28 16:59:15', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQyLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjYyNzE0NTAwIDE0NTY2Nzg3NTUifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQyLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjU0NjczNzAwIDE0NTY2Nzg3NTkifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 162, 1456678759),
(46, 'sergio-appartamento-2-27-10-15-344-min', 0, 21, 'sergio-appartamento-2-27-10-15-344-min.jpg', '', 'sergio appartamento 2 27-10-15 344-min', '2016-02-28 16:59:20', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQ0LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjQ4ODgwOTAwIDE0NTY2Nzg3NjAifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQ0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjU5Mzc0NTAwIDE0NTY2Nzg3NjIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 164, 1456678762),
(47, 'sergio-appartamento-2-27-10-15-345-min', 0, 21, 'sergio-appartamento-2-27-10-15-345-min.jpg', '', 'sergio appartamento 2 27-10-15 345-min', '2016-02-28 16:59:23', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQ1LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjQ3NTE5MjAwIDE0NTY2Nzg3NjMifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQ1LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjYwNTc5NTAwIDE0NTY2Nzg3NjcifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 166, 1456678767),
(48, 'sergio-appartamento-2-27-10-15-346-min', 0, 21, 'sergio-appartamento-2-27-10-15-346-min.jpg', '', 'sergio appartamento 2 27-10-15 346-min', '2016-02-28 16:59:28', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQ2LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjY2MTI1NjAwIDE0NTY2Nzg3NjgifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMzQ2LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ4MTU5NjAwIDE0NTY2Nzg3NzIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 168, 1456678772),
(49, 'sergio-appartamento-10-09-15-006-min', 0, 22, 'sergio appartamento 10-09-15 006-min.jpg', '', 'sergio appartamento 10-09-15 006-min', '2016-02-28 17:11:17', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDAwNi1taW4uanBnIiwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZ2VuZXJhdGVkIjoiMC43OTgwNTQwMCAxNDU2Njc5NDc3In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjozNzQ0LCJoZWlnaHQiOjU2MTYsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDA2LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjMwMjQ1OTAwIDE0NTY2Nzk0OTQifSwibmdnMGR5bi02Mjl4MjkzeDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjo2MjksImhlaWdodCI6MjkzLCJmaWxlbmFtZSI6InNlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDA2LW1pbi5qcGctbmdnaWQwMjQ5LW5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjc5NTQ2MzAwIDE0NTY2Nzk2ODAifX0=', 169, 1456679680),
(50, 'sergio-appartamento-10-09-15-007-min', 0, 22, 'sergio appartamento 10-09-15 007-min.jpg', '', 'sergio appartamento 10-09-15 007-min', '2016-02-28 17:11:17', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDAwNy1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC44ODc0OTQwMCAxNDU2Njc5NDc3In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDA3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjcyOTA2NDAwIDE0NTY2Nzk1MDcifX0=', 170, 1456679604),
(51, 'sergio-appartamento-10-09-15-018-min', 0, 22, 'sergio appartamento 10-09-15 018-min.jpg', '', 'sergio appartamento 10-09-15 018-min', '2016-02-28 17:11:17', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDAxOC1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC45NTkzMjcwMCAxNDU2Njc5NDc3In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDE4LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjE5MDI3NDAwIDE0NTY2Nzk1MTMifX0=', 171, 1456679604),
(52, 'sergio-appartamento-10-09-15-027-min', 0, 22, 'sergio appartamento 10-09-15 027-min.jpg', '', 'sergio appartamento 10-09-15 027-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDAyNy1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC4wMzk1NTAwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDI3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjI3NzQwNTAwIDE0NTY2Nzk1MTkifX0=', 172, 1456679604),
(53, 'sergio-appartamento-10-09-15-047-min', 0, 22, 'sergio appartamento 10-09-15 047-min.jpg', '', 'sergio appartamento 10-09-15 047-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDA0Ny1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC4xMDMxMTUwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDQ3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjI1NzY1NTAwIDE0NTY2Nzk1MjYifX0=', 173, 1456679604),
(54, 'sergio-appartamento-10-09-15-064-min', 0, 22, 'sergio appartamento 10-09-15 064-min.jpg', '', 'sergio appartamento 10-09-15 064-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDA2NC1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC4yMjQxMDEwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDY0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ3NDgzMjAwIDE0NTY2Nzk1MzIifX0=', 174, 1456679604),
(55, 'sergio-appartamento-10-09-15-086-min', 0, 22, 'sergio appartamento 10-09-15 086-min.jpg', '', 'sergio appartamento 10-09-15 086-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDA4Ni1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC4yOTUxNDkwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDg2LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjc5MzUzNTAwIDE0NTY2Nzk1MzgifX0=', 175, 1456679604),
(56, 'sergio-appartamento-10-09-15-087-min', 0, 22, 'sergio appartamento 10-09-15 087-min.jpg', '', 'sergio appartamento 10-09-15 087-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDA4Ny1taW4uanBnIiwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZ2VuZXJhdGVkIjoiMC4zNTY2NzQwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjozNzQ0LCJoZWlnaHQiOjU2MTYsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDg3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjMxNzMyNDAwIDE0NTY2Nzk1NDQifX0=', 176, 1456679604),
(57, 'sergio-appartamento-10-09-15-088-min', 0, 22, 'sergio appartamento 10-09-15 088-min.jpg', '', 'sergio appartamento 10-09-15 088-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDA4OC1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC40MzIwNjEwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDg4LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjc5NDE1NjAwIDE0NTY2Nzk1NTAifX0=', 177, 1456679604),
(58, 'sergio-appartamento-10-09-15-089-min', 0, 22, 'sergio appartamento 10-09-15 089-min.jpg', '', 'sergio appartamento 10-09-15 089-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDA4OS1taW4uanBnIiwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZ2VuZXJhdGVkIjoiMC40OTczODUwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjozNzQ0LCJoZWlnaHQiOjU2MTYsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMDg5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjE3Mzc4OTAwIDE0NTY2Nzk1NTUifX0=', 178, 1456679604),
(59, 'sergio-appartamento-10-09-15-190-min', 0, 22, 'sergio appartamento 10-09-15 190-min.jpg', '', 'sergio appartamento 10-09-15 190-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIDEwLTA5LTE1IDE5MC1taW4uanBnIiwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZ2VuZXJhdGVkIjoiMC41NjA4MjcwMCAxNDU2Njc5NDc4In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsInNhdmVkIjp0cnVlLCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzX3NlcmdpbyBhcHBhcnRhbWVudG8gMTAtMDktMTUgMTkwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjc3OTU5NTAwIDE0NTY2Nzk1NjQifX0=', 179, 1456679604),
(60, 'sergio-appartamento-rrr-10-09-15-137-min', 0, 22, 'sergio appartamento RRR 10-09-15 137-min.jpg', '', 'sergio appartamento RRR 10-09-15 137-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxMzctbWluLmpwZyIsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsImdlbmVyYXRlZCI6IjAuNjQ4NTMzMDAgMTQ1NjY3OTQ3OCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJzYXZlZCI6dHJ1ZSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxMzctbWluLmpwZyIsImdlbmVyYXRlZCI6IjAuMzQxNTg2MDAgMTQ1NjY3OTU3MSJ9fQ==', 180, 1456679604),
(61, 'sergio-appartamento-rrr-10-09-15-138-min', 0, 22, 'sergio appartamento RRR 10-09-15 138-min.JPG', '', 'sergio appartamento RRR 10-09-15 138-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxMzgtbWluLkpQRyIsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsImdlbmVyYXRlZCI6IjAuNzA4NDk4MDAgMTQ1NjY3OTQ3OCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJzYXZlZCI6dHJ1ZSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxMzgtbWluLkpQRyIsImdlbmVyYXRlZCI6IjAuOTQ5NzMzMDAgMTQ1NjY3OTU3NiJ9fQ==', 181, 1456679604),
(62, 'sergio-appartamento-rrr-10-09-15-152-min', 0, 22, 'sergio appartamento RRR 10-09-15 152-min.JPG', '', 'sergio appartamento RRR 10-09-15 152-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxNTItbWluLkpQRyIsIndpZHRoIjozNzQ0LCJoZWlnaHQiOjU2MTYsImdlbmVyYXRlZCI6IjAuNzkzNDYyMDAgMTQ1NjY3OTQ3OCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJzYXZlZCI6dHJ1ZSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxNTItbWluLkpQRyIsImdlbmVyYXRlZCI6IjAuNDM0NTUwMDAgMTQ1NjY3OTU4MSJ9fQ==', 182, 1456679604),
(63, 'sergio-appartamento-rrr-10-09-15-164-min', 0, 22, 'sergio appartamento RRR 10-09-15 164-min.JPG', '', 'sergio appartamento RRR 10-09-15 164-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxNjQtbWluLkpQRyIsIndpZHRoIjo1NjE2LCJoZWlnaHQiOjM3NDQsImdlbmVyYXRlZCI6IjAuODYwNjU0MDAgMTQ1NjY3OTQ3OCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJzYXZlZCI6dHJ1ZSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxNjQtbWluLkpQRyIsImdlbmVyYXRlZCI6IjAuODcwNzQ2MDAgMTQ1NjY3OTU5MCJ9fQ==', 183, 1456679604),
(64, 'sergio-appartamento-rrr-10-09-15-178-min', 0, 22, 'sergio appartamento RRR 10-09-15 178-min.JPG', '', 'sergio appartamento RRR 10-09-15 178-min', '2016-02-28 17:11:18', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxNzgtbWluLkpQRyIsIndpZHRoIjozNzQ0LCJoZWlnaHQiOjU2MTYsImdlbmVyYXRlZCI6IjAuOTgwMDgwMDAgMTQ1NjY3OTQ3OCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJzYXZlZCI6dHJ1ZSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8gYXBwYXJ0YW1lbnRvIFJSUiAxMC0wOS0xNSAxNzgtbWluLkpQRyIsImdlbmVyYXRlZCI6IjAuOTY1MzUwMDAgMTQ1NjY3OTU5NCJ9fQ==', 184, 1456679604),
(65, 'sergio-appartamento-2-27-10-15-152-min', 0, 23, 'sergio-appartamento-2-27-10-15-152-min.jpg', '', 'sergio appartamento 2 27-10-15 152-min', '2016-02-28 17:22:17', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTUyLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjI3ODIyOTAwIDE0NTY2ODAxMzcifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTUyLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ5MjY0NDAwIDE0NTY2ODAxMzkifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWUsIm5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMCI6eyJ3aWR0aCI6NjI5LCJoZWlnaHQiOjI5MywiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTUyLW1pbi5qcGctbmdnaWQwMjY1LW5nZzBkeW4tNjI5eDI5M3gxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjYzMzAyNTAwIDE0NTY2ODAxNjkifX0=', 188, 1456680169),
(66, 'sergio-appartamento-2-27-10-15-154-min', 0, 23, 'sergio-appartamento-2-27-10-15-154-min.jpg', '', 'sergio appartamento 2 27-10-15 154-min', '2016-02-28 17:22:22', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTU0LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjc3NzkwOTAwIDE0NTY2ODAxNDIifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTU0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ4Mjk1NTAwIDE0NTY2ODAxNDgifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 191, 1456680148),
(67, 'sergio-appartamento-2-27-10-15-170-min', 0, 23, 'sergio-appartamento-2-27-10-15-170-min.jpg', '', 'sergio appartamento 2 27-10-15 170-min', '2016-02-28 17:22:29', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTcwLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjM0NTE3NzAwIDE0NTY2ODAxNDkifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTcwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjA5ODQ4NzAwIDE0NTY2ODAxNTQifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 193, 1456680154),
(68, 'sergio-appartamento-2-27-10-15-171-min', 0, 23, 'sergio-appartamento-2-27-10-15-171-min.jpg', '', 'sergio appartamento 2 27-10-15 171-min', '2016-02-28 17:22:35', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTcxLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjM0MTU1ODAwIDE0NTY2ODAxNTUifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTcxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQ1NDQxOTAwIDE0NTY2ODAxNjUifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 195, 1456680165),
(69, 'sergio-appartamento-2-27-10-15-177-min', 0, 23, 'sergio-appartamento-2-27-10-15-177-min.jpg', '', 'sergio appartamento 2 27-10-15 177-min', '2016-02-28 17:22:48', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTc3LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjgzMjM5MTAwIDE0NTY2ODAxNjgifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTc3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjg5Mzc4MDAwIDE0NTY2ODAxNzEifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 197, 1456680171),
(70, 'sergio-appartamento-2-27-10-15-178-min', 0, 23, 'sergio-appartamento-2-27-10-15-178-min.jpg', '', 'sergio appartamento 2 27-10-15 178-min', '2016-02-28 17:22:53', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTc4LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjEwNDY1OTAwIDE0NTY2ODAxNzMifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTc4LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjE3MzM2NDAwIDE0NTY2ODAxNzcifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 199, 1456680177);
INSERT INTO `wp_ngg_pictures` (`pid`, `image_slug`, `post_id`, `galleryid`, `filename`, `description`, `alttext`, `imagedate`, `exclude`, `sortorder`, `meta_data`, `extras_post_id`, `updated_at`) VALUES
(71, 'sergio-appartamento-2-27-10-15-179-min', 0, 23, 'sergio-appartamento-2-27-10-15-179-min.jpg', '', 'sergio appartamento 2 27-10-15 179-min', '2016-02-28 17:22:58', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTc5LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjE4NTUzNDAwIDE0NTY2ODAxNzgifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTc5LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjM5OTQzMTAwIDE0NTY2ODAxODAifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 201, 1456680180),
(72, 'sergio-appartamento-2-27-10-15-180-min', 0, 23, 'sergio-appartamento-2-27-10-15-180-min.jpg', '', 'sergio appartamento 2 27-10-15 180-min', '2016-02-28 17:23:02', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgwLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjQ5MjUxMjAwIDE0NTY2ODAxODIifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjAyMzQ5ODAwIDE0NTY2ODAxODgifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 203, 1456680188),
(73, 'sergio-appartamento-2-27-10-15-181-min', 0, 23, 'sergio-appartamento-2-27-10-15-181-min.jpg', '', 'sergio appartamento 2 27-10-15 181-min', '2016-02-28 17:23:10', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgxLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjk3OTgyOTAwIDE0NTY2ODAxOTAifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjg1NDIyMjAwIDE0NTY2ODAxOTUifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 205, 1456680195),
(74, 'sergio-appartamento-2-27-10-15-182-min', 0, 23, 'sergio-appartamento-2-27-10-15-182-min.jpg', '', 'sergio appartamento 2 27-10-15 182-min', '2016-02-28 17:23:17', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgyLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjI5NTk4NTAwIDE0NTY2ODAxOTcifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgyLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjcxOTc4OTAwIDE0NTY2ODAyMDMifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 207, 1456680203),
(75, 'sergio-appartamento-2-27-10-15-183-min', 0, 23, 'sergio-appartamento-2-27-10-15-183-min.jpg', '', 'sergio appartamento 2 27-10-15 183-min', '2016-02-28 17:23:27', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgzLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjcxODg4NTAwIDE0NTY2ODAyMDcifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTgzLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjk0MTk2MjAwIDE0NTY2ODAyMTIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 209, 1456680212),
(76, 'sergio-appartamento-2-27-10-15-184-min', 0, 23, 'sergio-appartamento-2-27-10-15-184-min.jpg', '', 'sergio appartamento 2 27-10-15 184-min', '2016-02-28 17:23:35', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTg0LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjQ3NzU5OTAwIDE0NTY2ODAyMTUifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTg0LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjI4NTAxOTAwIDE0NTY2ODAyMTkifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 211, 1456680219),
(77, 'sergio-appartamento-2-27-10-15-185-min', 0, 23, 'sergio-appartamento-2-27-10-15-185-min.jpg', '', 'sergio appartamento 2 27-10-15 185-min', '2016-02-28 17:23:40', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTg1LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjc1MTU3MzAwIDE0NTY2ODAyMjAifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTg1LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjkyODQzMjAwIDE0NTY2ODAyMjcifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 213, 1456680227),
(78, 'sergio-appartamento-2-27-10-15-186-min', 0, 23, 'sergio-appartamento-2-27-10-15-186-min.jpg', '', 'sergio appartamento 2 27-10-15 186-min', '2016-02-28 17:23:49', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTg2LW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjMwMTQ3MDAwIDE0NTY2ODAyMjkifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMTg2LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjQxNDk3MjAwIDE0NTY2ODAyMzIifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 215, 1456680232),
(79, 'sergio-appartamento-2-27-10-15-241-min', 0, 23, 'sergio-appartamento-2-27-10-15-241-min.jpg', '', 'sergio appartamento 2 27-10-15 241-min', '2016-02-28 17:23:54', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjQxLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjYwNTQ3MTAwIDE0NTY2ODAyMzQifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjQxLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjA2NTgyMzAwIDE0NTY2ODAyNDAifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 217, 1456680240),
(80, 'sergio-appartamento-2-27-10-15-247-min', 0, 23, 'sergio-appartamento-2-27-10-15-247-min.jpg', '', 'sergio appartamento 2 27-10-15 247-min', '2016-02-28 17:24:01', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjQ3LW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjE3OTkwMTAwIDE0NTY2ODAyNDEifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjQ3LW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjE5NDA0MjAwIDE0NTY2ODAyNDYifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 219, 1456680246),
(81, 'sergio-appartamento-2-27-10-15-263-min', 0, 23, 'sergio-appartamento-2-27-10-15-263-min.jpg', '', 'sergio appartamento 2 27-10-15 263-min', '2016-02-28 17:24:07', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjYzLW1pbi5qcGciLCJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0LCJnZW5lcmF0ZWQiOiIwLjE5NDY5NzAwIDE0NTY2ODAyNDcifSwid2lkdGgiOjU2MTYsImhlaWdodCI6Mzc0NCwiZnVsbCI6eyJ3aWR0aCI6NTYxNiwiaGVpZ2h0IjozNzQ0fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjYzLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjAwNTA4OTAwIDE0NTY2ODAyNTEifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 221, 1456680251),
(82, 'sergio-appartamento-2-27-10-15-270-min', 0, 23, 'sergio-appartamento-2-27-10-15-270-min.jpg', '', 'sergio appartamento 2 27-10-15 270-min', '2016-02-28 17:24:12', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjcwLW1pbi5qcGciLCJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2LCJnZW5lcmF0ZWQiOiIwLjEzMjAxMDAwIDE0NTY2ODAyNTIifSwid2lkdGgiOjM3NDQsImhlaWdodCI6NTYxNiwiZnVsbCI6eyJ3aWR0aCI6Mzc0NCwiaGVpZ2h0Ijo1NjE2fSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic19zZXJnaW8tYXBwYXJ0YW1lbnRvLTItMjctMTAtMTUtMjcwLW1pbi5qcGciLCJnZW5lcmF0ZWQiOiIwLjYwNTUzNDAwIDE0NTY2ODAyNTQifSwiYXBlcnR1cmUiOmZhbHNlLCJjcmVkaXQiOmZhbHNlLCJjYW1lcmEiOmZhbHNlLCJjYXB0aW9uIjpmYWxzZSwiY3JlYXRlZF90aW1lc3RhbXAiOmZhbHNlLCJjb3B5cmlnaHQiOmZhbHNlLCJmb2NhbF9sZW5ndGgiOmZhbHNlLCJpc28iOmZhbHNlLCJzaHV0dGVyX3NwZWVkIjpmYWxzZSwiZmxhc2giOmZhbHNlLCJ0aXRsZSI6ZmFsc2UsImtleXdvcmRzIjpmYWxzZSwic2F2ZWQiOnRydWV9', 223, 1456680254);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/casarabatti', 'yes'),
(2, 'home', 'http://localhost/casarabatti', 'yes'),
(3, 'blogname', 'Casa Rabatti', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'roberto.bani@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y G:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'hack_file', '0', 'yes'),
(30, 'blog_charset', 'UTF-8', 'yes'),
(31, 'moderation_keys', '', 'no'),
(32, 'active_plugins', 'a:9:{i:0;s:19:"akismet/akismet.php";i:1;s:31:"cookie-notice/cookie-notice.php";i:2;s:25:"google-maps/googlemap.php";i:3;s:19:"jetpack/jetpack.php";i:4;s:29:"nextgen-gallery/nggallery.php";i:5;s:57:"reveal-ids-for-wp-admin-25/reveal-ids-for-wp-admin-25.php";i:6;s:25:"sucuri-scanner/sucuri.php";i:7;s:27:"updraftplus/updraftplus.php";i:8;s:42:"wonderplugin-slider/wonderpluginslider.php";}', 'yes'),
(33, 'category_base', '', 'yes'),
(34, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(35, 'comment_max_links', '2', 'yes'),
(36, 'gmt_offset', '', 'yes'),
(37, 'default_email_category', '1', 'yes'),
(38, 'recently_edited', '', 'no'),
(39, 'template', 'casarabatti', 'yes'),
(40, 'stylesheet', 'casarabatti', 'yes'),
(41, 'comment_whitelist', '1', 'yes'),
(42, 'blacklist_keys', '', 'no'),
(43, 'comment_registration', '0', 'yes'),
(44, 'html_type', 'text/html', 'yes'),
(45, 'use_trackback', '0', 'yes'),
(46, 'default_role', 'subscriber', 'yes'),
(47, 'db_version', '35700', 'yes'),
(48, 'uploads_use_yearmonth_folders', '1', 'yes'),
(49, 'upload_path', '', 'yes'),
(50, 'blog_public', '1', 'yes'),
(51, 'default_link_category', '2', 'yes'),
(52, 'show_on_front', 'posts', 'yes'),
(53, 'tag_base', '', 'yes'),
(54, 'show_avatars', '1', 'yes'),
(55, 'avatar_rating', 'G', 'yes'),
(56, 'upload_url_path', '', 'yes'),
(57, 'thumbnail_size_w', '150', 'yes'),
(58, 'thumbnail_size_h', '150', 'yes'),
(59, 'thumbnail_crop', '1', 'yes'),
(60, 'medium_size_w', '300', 'yes'),
(61, 'medium_size_h', '300', 'yes'),
(62, 'avatar_default', 'mystery', 'yes'),
(63, 'large_size_w', '1024', 'yes'),
(64, 'large_size_h', '1024', 'yes'),
(65, 'image_default_link_type', 'none', 'yes'),
(66, 'image_default_size', '', 'yes'),
(67, 'image_default_align', '', 'yes'),
(68, 'close_comments_for_old_posts', '0', 'yes'),
(69, 'close_comments_days_old', '14', 'yes'),
(70, 'thread_comments', '1', 'yes'),
(71, 'thread_comments_depth', '5', 'yes'),
(72, 'page_comments', '0', 'yes'),
(73, 'comments_per_page', '50', 'yes'),
(74, 'default_comments_page', 'newest', 'yes'),
(75, 'comment_order', 'asc', 'yes'),
(76, 'sticky_posts', 'a:0:{}', 'yes'),
(77, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(78, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'uninstall_plugins', 'a:1:{s:42:"wonderplugin-slider/wonderpluginslider.php";s:29:"wonderplugin_slider_uninstall";}', 'no'),
(81, 'timezone_string', 'Europe/Rome', 'yes'),
(82, 'page_for_posts', '0', 'yes'),
(83, 'page_on_front', '0', 'yes'),
(84, 'default_post_format', '0', 'yes'),
(85, 'link_manager_enabled', '0', 'yes'),
(86, 'finished_splitting_shared_terms', '1', 'yes'),
(87, 'site_icon', '0', 'yes'),
(88, 'medium_large_size_w', '768', 'yes'),
(89, 'medium_large_size_h', '0', 'yes'),
(90, 'initial_db_version', '35700', 'yes'),
(91, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:77:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:19:"access_masterslider";b:1;s:20:"publish_masterslider";b:1;s:19:"delete_masterslider";b:1;s:19:"create_masterslider";b:1;s:19:"export_masterslider";b:1;s:22:"duplicate_masterslider";b:1;s:24:"NextGEN Gallery overview";b:1;s:19:"NextGEN Use TinyMCE";b:1;s:21:"NextGEN Upload images";b:1;s:22:"NextGEN Manage gallery";b:1;s:19:"NextGEN Manage tags";b:1;s:29:"NextGEN Manage others gallery";b:1;s:18:"NextGEN Edit album";b:1;s:20:"NextGEN Change style";b:1;s:22:"NextGEN Change options";b:1;s:24:"NextGEN Attach Interface";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:40:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:19:"access_masterslider";b:1;s:20:"publish_masterslider";b:1;s:19:"delete_masterslider";b:1;s:19:"create_masterslider";b:1;s:19:"export_masterslider";b:1;s:22:"duplicate_masterslider";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(92, 'WPLANG', 'it_IT', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'cron', 'a:11:{i:1458508389;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1458518612;a:1:{s:40:"jetpack_display_posts_widget_cron_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"minutes_10";s:4:"args";a:0:{}s:8:"interval";i:600;}}}i:1458519259;a:1:{s:29:"ngg_delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"ngg_custom";s:4:"args";a:0:{}s:8:"interval";i:900;}}}i:1458520406;a:1:{s:25:"sucuriscan_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1458520412;a:1:{s:20:"jetpack_clean_nonces";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1458548053;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1458585215;a:1:{s:20:"jetpack_v2_heartbeat";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1458585257;a:1:{s:24:"jp_purge_transients_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1458585727;a:2:{s:14:"updraft_backup";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:23:"updraft_backup_database";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1458591262;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(107, 'auth_key', 'cSG/Cy~|D8KyzR#5j!t5Hrt7=F_x>;9(S)02l=dw)g*DWT{L7dCH,rp 4^3.y&:?', 'yes'),
(108, 'auth_salt', 'FGYr{c#T%GVi,MaXVQKd02g&5P`fRK3<[AdNLOb*|nk9^`y8HAq=q6<F__/]/vM$', 'yes'),
(109, 'logged_in_key', ',OI>|Bi}FMp+dE;N!`Y~GCP`$lR,o!%3KtVN~^Y:OQsm@h^yxu49swl1@8lj%nun', 'yes'),
(110, 'logged_in_salt', 'i8I?.h*2qHtmFh1KqDJC5$tYhcZ.7y?HC]S;29z~3ENWN,f1DM*eiBp<zPOGF*bT', 'yes'),
(111, 'nonce_key', 'Z:Em){0OT SJ9ay0Gh@N}?DhKiMj[BIkm{?2t?Y{k./j}uMJpds=AnJLcTHY<dMM', 'yes'),
(112, 'nonce_salt', 'pP%I^3t$.tZ~SzQ !VBPzHo?;UW`9fV7[836)^vs6Sm`T$yAZA<>w#;r#QWr(JV)', 'yes'),
(118, '_site_transient_timeout_browser_3277c546c4e61dc53f62b3c664af0093', '1456258466', 'yes'),
(119, '_site_transient_browser_3277c546c4e61dc53f62b3c664af0093', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"48.0.2564.109";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(120, 'can_compress_scripts', '1', 'yes'),
(139, 'recently_activated', 'a:1:{s:31:"master-slider/master-slider.php";i:1457906240;}', 'yes'),
(142, 'theme_mods_twentysixteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1455655253;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(143, 'current_theme', 'Casa Rabatti', 'yes'),
(144, 'theme_mods_casarabatti', 'a:1:{i:0;b:0;}', 'yes'),
(145, 'theme_switched', '', 'yes'),
(146, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1455670231', 'yes'),
(147, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5703";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3563";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3517";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"3018";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2749";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2246";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2172";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"2019";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1970";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1955";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1952";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1904";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1805";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1608";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1521";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1504";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"1477";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1318";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1267";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1256";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1158";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1075";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1053";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"984";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"948";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"904";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"900";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"888";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"881";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"872";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"864";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"814";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"767";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"766";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"752";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"735";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"730";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"729";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"726";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"721";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"710";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"709";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"680";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"678";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"662";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"657";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"656";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"645";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"640";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"631";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"617";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"610";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"599";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"593";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"591";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"583";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"577";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"576";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"570";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"560";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"549";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"541";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"541";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"526";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"526";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"515";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"507";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"503";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"502";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"500";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"483";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"483";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"477";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"468";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"458";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"457";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"432";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"432";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"426";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"426";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"425";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"418";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"413";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"411";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"409";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"406";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"401";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"400";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"398";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"393";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"391";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"389";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"388";}s:4:"text";a:3:{s:4:"name";s:4:"text";s:4:"slug";s:4:"text";s:5:"count";s:3:"384";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"381";}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";s:3:"381";}s:9:"automatic";a:3:{s:4:"name";s:9:"automatic";s:4:"slug";s:9:"automatic";s:5:"count";s:3:"378";}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";s:3:"376";}s:6:"paypal";a:3:{s:4:"name";s:6:"paypal";s:4:"slug";s:6:"paypal";s:5:"count";s:3:"375";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"374";}}', 'yes'),
(150, 'wd_bwg_version', '1.2.87', 'no'),
(151, 'wd_bwg_theme_version', '1.0.0', 'no'),
(152, 'widget_bwp_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(153, 'widget_bwp_gallery_slideshow', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(154, 'bwg_admin_notice', 'a:3:{s:15:"ecommerce_promo";a:2:{s:5:"start";s:9:"2/20/2016";s:3:"int";i:3;}s:15:"two_week_review";a:2:{s:5:"start";s:8:"3/2/2016";s:3:"int";i:14;}s:16:"one_week_support";a:2:{s:5:"start";s:9:"2/24/2016";s:3:"int";i:7;}}', 'yes'),
(175, 'ftp_credentials', 'a:3:{s:8:"hostname";s:9:"localhost";s:8:"username";s:5:"admin";s:15:"connection_type";s:3:"ftp";}', 'yes'),
(176, 'widget_akismet_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(177, 'jetpack_options', 'a:9:{s:7:"version";s:16:"3.9.4:1457642022";s:11:"old_version";s:16:"3.9.2:1457116374";s:28:"fallback_no_verify_ssl_certs";i:0;s:9:"time_diff";i:4;s:2:"id";i:107112430;s:6:"public";i:0;s:9:"jumpstart";s:14:"new_connection";s:11:"master_user";i:1;s:14:"last_heartbeat";i:1458419377;}', 'yes'),
(178, 'jetpack_activated', '1', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(179, 'jetpack_file_data', 'a:1:{s:5:"3.9.2";a:49:{s:32:"31e5b9ae08b62c2b0cd8a7792242298b";a:14:{s:4:"name";s:20:"Spelling and Grammar";s:11:"description";s:89:"Check your spelling, style, and grammar with the After the Deadline proofreading service.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"6";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:115:"after the deadline, afterthedeadline, spell, spellchecker, spelling, grammar, proofreading, style, language, cliche";}s:32:"3f41b2d629265b5de8108b463abbe8e2";a:14:{s:4:"name";s:8:"Carousel";s:11:"description";s:63:"Transform standard image galleries into full-screen slideshows.";s:14:"jumpstart_desc";s:79:"Brings your photos and images to life as full-size, easily navigable galleries.";s:4:"sort";s:2:"22";s:20:"recommendation_order";s:2:"12";s:10:"introduced";s:3:"1.5";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:17:"Photos and Videos";s:7:"feature";s:9:"Jumpstart";s:25:"additional_search_queries";s:80:"gallery, carousel, diaporama, slideshow, images, lightbox, exif, metadata, image";}s:32:"c6ebb418dde302de09600a6025370583";a:14:{s:4:"name";s:8:"Comments";s:11:"description";s:79:"Let readers comment with WordPress.com, Twitter, Facebook, or Google+ accounts.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"20";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:6:"Social";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:53:"comments, comment, facebook, twitter, google+, social";}s:32:"836f9485669e1bbb02920cb474730df0";a:14:{s:4:"name";s:12:"Contact Form";s:11:"description";s:44:"Insert a contact form anywhere on your site.";s:14:"jumpstart_desc";s:111:"Adds a button to your post and page editors, allowing you to build simple forms to help visitors stay in touch.";s:4:"sort";s:2:"15";s:20:"recommendation_order";s:2:"14";s:10:"introduced";s:3:"1.3";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:5:"Other";s:7:"feature";s:9:"Jumpstart";s:25:"additional_search_queries";s:44:"contact, form, grunion, feedback, submission";}s:32:"ea3970eebf8aac55fc3eca5dca0e0157";a:14:{s:4:"name";s:20:"Custom Content Types";s:11:"description";s:92:"Organize and display different types of content on your site, separate from posts and pages.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"34";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:72:"cpt, custom post types, portfolio, portfolios, testimonial, testimonials";}s:32:"d2bb05ccad3d8789df40ca3abb97336c";a:14:{s:4:"name";s:10:"Custom CSS";s:11:"description";s:57:"Customize your site’s CSS without modifying your theme.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"2";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.7";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:10:"Appearance";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:108:"css, customize, custom, style, editor, less, sass, preprocessor, font, mobile, appearance, theme, stylesheet";}s:32:"a2064eec5b9c7e0d816af71dee7a715f";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"53a4ec755022ef3953699734c343da02";a:14:{s:4:"name";s:21:"Enhanced Distribution";s:11:"description";s:27:"Increase reach and traffic.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"5";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:6:"Public";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:7:"Traffic";s:25:"additional_search_queries";s:54:"google, seo, firehose, search, broadcast, broadcasting";}s:32:"72fecb67ee6704ba0a33e0225316ad06";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"d56e2886185a9eace719cc57d46770df";a:14:{s:4:"name";s:19:"Gravatar Hovercards";s:11:"description";s:58:"Enable pop-up business cards over commenters’ Gravatars.";s:14:"jumpstart_desc";s:131:"Let commenters link their profiles to their Gravatar accounts, making it easy for your visitors to learn more about your community.";s:4:"sort";s:2:"11";s:20:"recommendation_order";s:2:"13";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:18:"Social, Appearance";s:7:"feature";s:9:"Jumpstart";s:25:"additional_search_queries";s:20:"gravatar, hovercards";}s:32:"e391e760617bd0e0736550e34a73d7fe";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:8:"2.0.3 ??";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"2e345370766346c616b3c5046e817720";a:14:{s:4:"name";s:15:"Infinite Scroll";s:11:"description";s:46:"Add support for infinite scroll to your theme.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"26";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:10:"Appearance";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:33:"scroll, infinite, infinite scroll";}s:32:"bd69edbf134de5fae8fdcf2e70a45b56";a:14:{s:4:"name";s:8:"JSON API";s:11:"description";s:69:"Allow applications to securely access your content through the cloud.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"19";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:6:"Public";s:11:"module_tags";s:19:"Writing, Developers";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:50:"api, rest, develop, developers, json, klout, oauth";}s:32:"8110b7a4423aaa619dfa46b8843e10d1";a:14:{s:4:"name";s:14:"Beautiful Math";s:11:"description";s:85:"Use LaTeX markup language in posts and pages for complex equations and other geekery.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"12";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:47:"latex, math, equation, equations, formula, code";}s:32:"fd7e85d3b4887fa6b6f997d6592c1f33";a:14:{s:4:"name";s:5:"Likes";s:11:"description";s:70:"Give visitors an easy way to show their appreciation for your content.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"23";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:6:"Social";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:26:"like, likes, wordpress.com";}s:32:"c5dfef41fad5bcdcaae8e315e5cfc420";a:14:{s:4:"name";s:6:"Manage";s:11:"description";s:76:"Manage all your sites from a centralized place, https://wordpress.com/sites.";s:14:"jumpstart_desc";s:151:"Helps you remotely manage plugins, turn on automated updates, and more from <a href="https://wordpress.com/plugins/" target="_blank">wordpress.com</a>.";s:4:"sort";s:1:"1";s:20:"recommendation_order";s:1:"3";s:10:"introduced";s:3:"3.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:35:"Centralized Management, Recommended";s:7:"feature";s:22:"Recommended, Jumpstart";s:25:"additional_search_queries";s:26:"manage, management, remote";}s:32:"fd6dc399b92bce76013427e3107c314f";a:14:{s:4:"name";s:8:"Markdown";s:11:"description";s:51:"Write posts or pages in plain-text Markdown syntax.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"31";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.8";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:12:"md, markdown";}s:32:"c49a35b6482b0426cb07ad28ecf5d7df";a:14:{s:4:"name";s:12:"Mobile Theme";s:11:"description";s:64:"Optimize your site with a mobile-friendly theme for smartphones.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"21";s:20:"recommendation_order";s:2:"11";s:10:"introduced";s:3:"1.8";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:31:"Appearance, Mobile, Recommended";s:7:"feature";s:11:"Recommended";s:25:"additional_search_queries";s:24:"mobile, theme, minileven";}s:32:"b42e38f6fafd2e4104ebe5bf39b4be47";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"771cfeeba0d3d23ec344d5e781fb0ae2";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"54f0661d27c814fc8bde39580181d939";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"46c4c413b5c72bbd3c3dbd14ff8f8adc";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"9ea52fa25783e5ceeb6bfaed3268e64e";a:14:{s:4:"name";s:7:"Monitor";s:11:"description";s:25:"Reports on site downtime.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"28";s:20:"recommendation_order";s:2:"10";s:10:"introduced";s:3:"2.6";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:11:"Recommended";s:7:"feature";s:33:"Recommended, Performance-Security";s:25:"additional_search_queries";s:37:"monitor, uptime, downtime, monitoring";}s:32:"cfcaafd0fcad087899d715e0b877474d";a:14:{s:4:"name";s:13:"Notifications";s:11:"description";s:84:"Receive notification of site activity via the admin toolbar and your Mobile devices.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"13";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:5:"Other";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:62:"notification, notifications, toolbar, adminbar, push, comments";}s:32:"0d18bfa69bec61550c1d813ce64149b0";a:14:{s:4:"name";s:10:"Omnisearch";s:11:"description";s:66:"Search your entire database from a single field in your Dashboard.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"16";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.3";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:10:"Developers";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:6:"search";}s:32:"3f0a11e23118f0788d424b646a6d465f";a:14:{s:4:"name";s:6:"Photon";s:11:"description";s:27:"Speed up images and photos.";s:14:"jumpstart_desc";s:141:"Mirrors and serves your images from our free and fast image CDN, improving your site’s performance with no additional load on your servers.";s:4:"sort";s:2:"25";s:20:"recommendation_order";s:1:"1";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:42:"Photos and Videos, Appearance, Recommended";s:7:"feature";s:44:"Recommended, Jumpstart, Performance-Security";s:25:"additional_search_queries";s:38:"photon, image, cdn, performance, speed";}s:32:"e37cfbcb72323fb1fe8255a2edb4d738";a:14:{s:4:"name";s:13:"Post by Email";s:11:"description";s:58:"Publish posts by email, using any device and email client.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"14";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:20:"post by email, email";}s:32:"728290d131a480bfe7b9e405d7cd925f";a:14:{s:4:"name";s:7:"Protect";s:11:"description";s:28:"Prevent brute force attacks.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"1";s:20:"recommendation_order";s:1:"4";s:10:"introduced";s:3:"3.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:11:"Recommended";s:7:"feature";s:33:"Recommended, Performance-Security";s:25:"additional_search_queries";s:65:"security, secure, protection, botnet, brute force, protect, login";}s:32:"f9ce784babbbf4dcca99b8cd2ceb420c";a:14:{s:4:"name";s:9:"Publicize";s:11:"description";s:30:"Automatically promote content.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"10";s:20:"recommendation_order";s:1:"7";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:19:"Social, Recommended";s:7:"feature";s:20:"Recommended, Traffic";s:25:"additional_search_queries";s:107:"facebook, twitter, google+, googleplus, google, path, tumblr, linkedin, social, tweet, connections, sharing";}s:32:"052c03877dd3d296a71531cb07ad939a";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"52edecb2a75222e75b2dce4356a4efce";a:14:{s:4:"name";s:13:"Related Posts";s:11:"description";s:24:"Display similar content.";s:14:"jumpstart_desc";s:113:"Keep visitors engaged on your blog by highlighting relevant and new content at the bottom of each published post.";s:4:"sort";s:2:"29";s:20:"recommendation_order";s:1:"9";s:10:"introduced";s:3:"2.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:11:"Recommended";s:7:"feature";s:31:"Recommended, Jumpstart, Traffic";s:25:"additional_search_queries";s:22:"related, related posts";}s:32:"8b059cb50a66b717f1ec842e736b858c";a:14:{s:4:"name";s:7:"Sharing";s:11:"description";s:32:"Visitors can share your content.";s:14:"jumpstart_desc";s:116:"Twitter, Facebook and Google+ buttons at the bottom of each post, making it easy for visitors to share your content.";s:4:"sort";s:1:"7";s:20:"recommendation_order";s:1:"6";s:10:"introduced";s:3:"1.1";s:7:"changed";s:3:"1.2";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:19:"Social, Recommended";s:7:"feature";s:31:"Recommended, Jumpstart, Traffic";s:25:"additional_search_queries";s:141:"share, sharing, sharedaddy, buttons, icons, email, facebook, twitter, google+, linkedin, pinterest, pocket, press this, print, reddit, tumblr";}s:32:"a6d2394329871857401255533a9873f7";a:14:{s:4:"name";s:16:"Shortcode Embeds";s:11:"description";s:77:"Embed content from YouTube, Vimeo, SlideShare, and more, no coding necessary.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"3";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:3:"1.2";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:46:"Photos and Videos, Social, Writing, Appearance";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:251:"shortcodes, shortcode, embeds, media, bandcamp, blip.tv, dailymotion, digg, facebook, flickr, google calendars, google maps, google+, polldaddy, recipe, recipes, scribd, slideshare, slideshow, slideshows, soundcloud, ted, twitter, vimeo, vine, youtube";}s:32:"21496e2897ea5f81605e2f2ac3beb921";a:14:{s:4:"name";s:16:"WP.me Shortlinks";s:11:"description";s:56:"Enable WP.me-powered shortlinks for all posts and pages.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"8";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:6:"Social";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:17:"shortlinks, wp.me";}s:32:"e2a54a5d7879a4162709e6ffb540dd08";a:14:{s:4:"name";s:9:"Site Icon";s:11:"description";s:29:"Add a site icon to your site.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"22";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:5:"Other";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:24:"favicon, icon, site icon";}s:32:"f5c537bc304f55b29c1a87e30be0cd24";a:14:{s:4:"name";s:8:"Sitemaps";s:11:"description";s:75:"Creates sitemaps to allow your site to be easily indexed by search engines.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"13";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:6:"Public";s:11:"module_tags";s:20:"Recommended, Traffic";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:39:"sitemap, traffic, search, site map, seo";}s:32:"59a23643437358a9b557f1d1e20ab040";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"6a90f97c3194cfca5671728eaaeaf15e";a:14:{s:4:"name";s:14:"Single Sign On";s:11:"description";s:27:"Secure user authentication.";s:14:"jumpstart_desc";s:98:"Lets you log in to all your Jetpack-enabled sites with one click using your WordPress.com account.";s:4:"sort";s:2:"30";s:20:"recommendation_order";s:1:"5";s:10:"introduced";s:3:"2.6";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:10:"Developers";s:7:"feature";s:31:"Jumpstart, Performance-Security";s:25:"additional_search_queries";s:34:"sso, single sign on, login, log in";}s:32:"b65604e920392e2f7134b646760b75e8";a:14:{s:4:"name";s:10:"Site Stats";s:11:"description";s:35:"Collect traffic stats and insights.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"1";s:20:"recommendation_order";s:1:"2";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:23:"Site Stats, Recommended";s:7:"feature";s:20:"Recommended, Traffic";s:25:"additional_search_queries";s:54:"statistics, tracking, analytics, views, traffic, stats";}s:32:"23a586dd7ead00e69ec53eb32ef740e4";a:14:{s:4:"name";s:13:"Subscriptions";s:11:"description";s:88:"Allow users to subscribe to your posts and comments and receive notifications via email.";s:14:"jumpstart_desc";s:126:"Give visitors two easy subscription options — while commenting, or via a separate email subscription widget you can display.";s:4:"sort";s:1:"9";s:20:"recommendation_order";s:1:"8";s:10:"introduced";s:3:"1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:6:"Social";s:7:"feature";s:9:"Jumpstart";s:25:"additional_search_queries";s:74:"subscriptions, subscription, email, follow, followers, subscribers, signup";}s:32:"1d978b8d84d2f378fe1a702a67633b6d";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"b3b983461d7f3d27322a3551ed8a9405";a:14:{s:4:"name";s:15:"Tiled Galleries";s:11:"description";s:73:"Display your image galleries in a variety of sleek, graphic arrangements.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"24";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:17:"Photos and Videos";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:43:"gallery, tiles, tiled, grid, mosaic, images";}s:32:"d924e5b05722b0e104448543598f54c0";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}s:32:"36741583b10c521997e563ad8e1e8b77";a:14:{s:4:"name";s:12:"Data Backups";s:11:"description";s:27:"Daily or real-time backups.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"32";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:5:"0:1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:5:"false";s:4:"free";s:5:"false";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:0:"";s:7:"feature";s:20:"Performance-Security";s:25:"additional_search_queries";s:28:"vaultpress, backup, security";}s:32:"2b9b44f09b5459617d68dd82ee17002a";a:14:{s:4:"name";s:17:"Site Verification";s:11:"description";s:77:"Verify your site or domain with Google Search Console, Pinterest, and others.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"33";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:56:"webmaster, seo, google, bing, pinterest, search, console";}s:32:"5ab4c0db7c42e10e646342da0274c491";a:14:{s:4:"name";s:10:"VideoPress";s:11:"description";s:68:"Upload and embed videos right on your site. (Subscription required.)";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"27";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.5";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:5:"false";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:17:"Photos and Videos";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:25:"video, videos, videopress";}s:32:"174ed3416476c2cb9ff5b0f671280b15";a:14:{s:4:"name";s:21:"Extra Sidebar Widgets";s:11:"description";s:79:"Add images, Twitter streams, your site’s RSS links, and more to your sidebar.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"4";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:18:"Social, Appearance";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:65:"widget, widgets, facebook, gallery, twitter, gravatar, image, rss";}s:32:"60a1d3aa38bc0fe1039e59dd60888543";a:14:{s:4:"name";s:17:"Widget Visibility";s:11:"description";s:57:"Specify which widgets appear on which pages of your site.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"17";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:10:"Appearance";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:54:"widget visibility, logic, conditional, widgets, widget";}s:32:"28b931a1db19bd24869bd54b14e733d5";a:14:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";s:25:"additional_search_queries";s:0:"";}}}', 'yes'),
(180, 'jetpack_available_modules', 'a:1:{s:5:"3.9.2";a:37:{s:18:"after-the-deadline";s:3:"1.1";s:8:"carousel";s:3:"1.5";s:8:"comments";s:3:"1.4";s:12:"contact-form";s:3:"1.3";s:20:"custom-content-types";s:3:"3.1";s:10:"custom-css";s:3:"1.7";s:21:"enhanced-distribution";s:3:"1.2";s:19:"gravatar-hovercards";s:3:"1.1";s:15:"infinite-scroll";s:3:"2.0";s:8:"json-api";s:3:"1.9";s:5:"latex";s:3:"1.1";s:5:"likes";s:3:"2.2";s:6:"manage";s:3:"3.4";s:8:"markdown";s:3:"2.8";s:9:"minileven";s:3:"1.8";s:7:"monitor";s:3:"2.6";s:5:"notes";s:3:"1.9";s:10:"omnisearch";s:3:"2.3";s:6:"photon";s:3:"2.0";s:13:"post-by-email";s:3:"2.0";s:7:"protect";s:3:"3.4";s:9:"publicize";s:3:"2.0";s:13:"related-posts";s:3:"2.9";s:10:"sharedaddy";s:3:"1.1";s:10:"shortcodes";s:3:"1.1";s:10:"shortlinks";s:3:"1.1";s:9:"site-icon";s:3:"3.2";s:8:"sitemaps";s:3:"3.9";s:3:"sso";s:3:"2.6";s:5:"stats";s:3:"1.1";s:13:"subscriptions";s:3:"1.2";s:13:"tiled-gallery";s:3:"2.1";s:10:"vaultpress";s:5:"0:1.2";s:18:"verification-tools";s:3:"3.0";s:10:"videopress";s:3:"2.5";s:7:"widgets";s:3:"1.2";s:17:"widget-visibility";s:3:"2.4";}}', 'yes'),
(181, 'jetpack_security_report', 'a:0:{}', 'yes'),
(184, 'masterslider_db_version', '1.03', 'yes'),
(185, 'masterslider_capabilities_added', '1', 'yes'),
(186, 'widget_master-slider-main-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(187, 'msp_general_setting', 'a:3:{s:15:"hide_info_table";s:2:"on";s:13:"_enable_cache";s:2:"on";s:13:"_cache_period";d:12;}', 'yes'),
(188, 'msp_advanced', 'a:1:{s:22:"allways_load_ms_assets";s:2:"on";}', 'yes'),
(189, 'upgrade_to_pro', '', 'yes'),
(190, 'masterslider_lite_plugin_version', '2.7.1', 'yes'),
(191, 'cookie_notice_options', 'a:18:{s:12:"message_text";s:322:"Questo sito utilizza cookie tecnici e di profilazione propri e di terze parti per le sue funzionalità e per inviarti pubblicità e servizi in linea con le tue preferenze. Se vuoi saperne di più clicca qui. Chiudendo questo banner, scorrendo questa pagina o cliccando qualunque suo elemento acconsenti all''uso dei cookie.";s:11:"accept_text";s:2:"Ok";s:8:"see_more";s:3:"yes";s:12:"see_more_opt";a:4:{s:4:"text";s:13:"Leggi di più";s:9:"link_type";s:4:"page";s:2:"id";i:227;s:4:"link";s:0:"";}s:11:"link_target";s:6:"_blank";s:11:"refuse_text";s:2:"No";s:11:"refuse_code";s:0:"";s:9:"on_scroll";s:3:"yes";s:16:"on_scroll_offset";i:100;s:4:"time";s:5:"month";s:16:"script_placement";s:6:"header";s:8:"position";s:6:"bottom";s:11:"hide_effect";s:4:"fade";s:9:"css_style";s:9:"bootstrap";s:6:"colors";a:2:{s:4:"text";s:4:"#fff";s:3:"bar";s:4:"#000";}s:10:"refuse_opt";s:2:"no";s:19:"deactivation_delete";s:2:"no";s:9:"translate";b:0;}', 'no'),
(192, 'cookie_notice_version', '1.2.34', 'no'),
(194, 'sucuriscan_api_key', '618092369556ca3aeb5ee33b0aac888f', 'yes'),
(195, 'sucuriscan_dns_lookups', 'enabled', 'yes'),
(200, 'jetpack_log', 'a:4:{i:0;a:4:{s:4:"time";i:1455929469;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"register";}i:1;a:4:{s:4:"time";i:1455929475;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"register";}i:2;a:4:{s:4:"time";i:1457116374;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"register";}i:3;a:4:{s:4:"time";i:1457116410;s:7:"user_id";i:1;s:7:"blog_id";i:107112430;s:4:"code";s:9:"authorize";}}', 'no'),
(201, 'jetpack_private_options', 'a:3:{s:8:"register";s:76:"N4VpcQ5LgtNIeGDxgdFqj2UrvwAfiOW6:H5XHO09p80wjyEuj1Ti2pi02oYbj4e3u:1457116974";s:10:"blog_token";s:65:"Rx@xZX^67&)FGMEJE@UY1TEcX0%5TkCi.Z3xlu)(Ibah6nRP%jBvRJr4cGe@o9c6m";s:11:"user_tokens";a:1:{i:1;s:67:"6P!so$sKWUvcDx!HVGvUJp)B8bFovj^3.fRzYtSM@jSpe!ujclxh2RjYafRazCOkU.1";}}', 'yes'),
(206, 'sucuriscan_emails_sent', '0', 'yes'),
(207, 'sucuriscan_last_email_at', '1458379048', 'yes'),
(238, 'updraftplus_dismissedautobackup', '1463224896', 'yes'),
(272, 'jqlb_help_text', '', 'yes'),
(273, 'jqlb_automate', '0', 'yes'),
(274, 'jqlb_comments', '0', 'yes'),
(275, 'jqlb_resize_on_demand', '0', 'yes'),
(276, 'jqlb_show_download', '0', 'yes'),
(277, 'jqlb_navbarOnTop', '0', 'yes'),
(278, 'jqlb_resize_speed', '400', 'yes'),
(279, 'jqlb_overlay_opacity', '80', 'yes'),
(280, 'jqlb_margin_size', '0', 'yes'),
(339, '_site_transient_timeout_available_translations', '1456679848', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(340, '_site_transient_available_translations', 'a:77:{s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-12 10:15:45";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/ary.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-07 13:09:53";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-07 20:53:51";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:3:"azb";a:8:{s:8:"language";s:3:"azb";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-11 22:42:10";s:12:"english_name";s:17:"South Azerbaijani";s:11:"native_name";s:29:"گؤنئی آذربایجان";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/azb.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:3;s:3:"azb";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 08:50:29";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-08 13:17:04";s:12:"english_name";s:7:"Bengali";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-04 09:40:25";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-16 13:48:03";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:3:"ceb";a:8:{s:8:"language";s:3:"ceb";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-16 15:34:57";s:12:"english_name";s:7:"Cebuano";s:11:"native_name";s:7:"Cebuano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/ceb.zip";s:3:"iso";a:2:{i:2;s:3:"ceb";i:3;s:3:"ceb";}s:7:"strings";a:1:{s:8:"continue";s:7:"Padayun";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-26 16:01:40";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 22:48:20";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 14:19:21";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-26 16:11:41";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-26 16:11:56";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.4.2/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-25 16:27:59";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-06 23:10:59";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-14 21:14:29";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 13:34:17";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-15 11:52:35";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-07 04:39:48";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-25 13:07:29";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-28 19:55:54";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_GT";a:8:{s:8:"language";s:5:"es_GT";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-09 18:08:52";s:12:"english_name";s:19:"Spanish (Guatemala)";s:11:"native_name";s:21:"Español de Guatemala";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_GT.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-24 15:17:36";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-13 06:14:13";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_VE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:6:"4.3-RC";s:7:"updated";s:19:"2015-08-04 06:10:33";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.3-RC/es_CO.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-07 17:35:10";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_AR";a:8:{s:8:"language";s:5:"es_AR";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-23 00:46:01";s:12:"english_name";s:19:"Spanish (Argentina)";s:11:"native_name";s:21:"Español de Argentina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_AR.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-13 12:28:49";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-18 06:44:22";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-07 21:19:15";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-31 19:24:20";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-23 06:49:15";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 13:47:35";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-11 10:20:56";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_CA";a:8:{s:8:"language";s:5:"fr_CA";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-09 02:16:19";s:12:"english_name";s:15:"French (Canada)";s:11:"native_name";s:19:"Français du Canada";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/fr_CA.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.3.3";s:7:"updated";s:19:"2015-09-24 15:25:30";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.3/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-13 16:48:03";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-05 00:59:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-20 23:17:57";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-06 14:16:56";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:12:"जारी";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-24 11:33:48";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-03 14:37:42";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-04 07:13:54";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-21 16:17:50";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 00:20:24";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-30 18:58:39";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-25 13:08:14";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ka_GE";a:8:{s:8:"language";s:5:"ka_GE";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-08 07:31:53";s:12:"english_name";s:8:"Georgian";s:11:"native_name";s:21:"ქართული";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/ka_GE.zip";s:3:"iso";a:2:{i:1;s:2:"ka";i:2;s:3:"kat";}s:7:"strings";a:1:{s:8:"continue";s:30:"გაგრძელება";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-24 00:12:01";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 20:07:24";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"ms_MY";a:8:{s:8:"language";s:5:"ms_MY";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-28 05:41:39";s:12:"english_name";s:5:"Malay";s:11:"native_name";s:13:"Bahasa Melayu";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/ms_MY.zip";s:3:"iso";a:2:{i:1;s:2:"ms";i:2;s:3:"msa";}s:7:"strings";a:1:{s:8:"continue";s:8:"Teruskan";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:6:"4.1.10";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.1.10/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-07 10:01:09";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:12:"nl_NL_formal";a:8:{s:8:"language";s:12:"nl_NL_formal";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-20 13:35:50";s:12:"english_name";s:14:"Dutch (Formal)";s:11:"native_name";s:20:"Nederlands (Formeel)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.4.2/nl_NL_formal.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-23 18:59:13";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-14 12:19:44";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-08 16:21:37";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-26 19:07:19";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:6:"4.1.10";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.10/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-10 18:05:56";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-25 13:02:32";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-24 11:09:36";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-02 00:04:31";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-26 11:29:13";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-11-26 00:00:18";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-02-23 10:30:30";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-09 09:09:51";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 23:28:56";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-08 03:22:55";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-11-27 15:51:36";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-17 23:12:27";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:6:"4.1.10";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.1.10/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-01-03 22:04:41";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-09 01:01:25";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.4.2/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-11 18:51:41";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-12 22:55:08";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'yes'),
(341, 'ridwpa_version', '1.4.6.1', 'yes'),
(346, 'widget_ngg-images', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(347, 'widget_ngg-mrssw', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(348, 'widget_slideshow', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(349, 'ngg_transient_groups', 'a:7:{s:9:"__counter";i:7;s:3:"MVC";a:2:{s:2:"id";i:2;s:7:"enabled";b:1;}s:15:"col_in_wp_posts";a:2:{s:2:"id";i:3;s:7:"enabled";b:1;}s:21:"col_in_wp_ngg_gallery";a:2:{s:2:"id";i:4;s:7:"enabled";b:1;}s:22:"col_in_wp_ngg_pictures";a:2:{s:2:"id";i:5;s:7:"enabled";b:1;}s:27:"displayed_gallery_rendering";a:2:{s:2:"id";i:6;s:7:"enabled";b:1;}s:19:"col_in_wp_ngg_album";a:2:{s:2:"id";i:7;s:7:"enabled";b:1;}}', 'yes'),
(350, 'ngg_options', 'a:70:{s:11:"gallerypath";s:19:"wp-content/gallery/";s:11:"wpmuCSSfile";s:13:"nggallery.css";s:9:"wpmuStyle";b:0;s:9:"wpmuRoles";b:0;s:16:"wpmuImportFolder";b:0;s:13:"wpmuZipUpload";b:0;s:14:"wpmuQuotaCheck";b:0;s:17:"datamapper_driver";s:22:"custom_post_datamapper";s:21:"gallerystorage_driver";s:25:"ngglegacy_gallery_storage";s:20:"maximum_entity_count";i:500;s:17:"router_param_slug";s:9:"nggallery";s:22:"router_param_separator";s:2:"--";s:19:"router_param_prefix";s:0:"";s:9:"deleteImg";b:1;s:9:"swfUpload";b:1;s:13:"usePermalinks";b:0;s:13:"permalinkSlug";s:9:"nggallery";s:14:"graphicLibrary";s:2:"gd";s:14:"imageMagickDir";s:15:"/usr/local/bin/";s:11:"useMediaRSS";b:0;s:18:"galleries_in_feeds";b:0;s:12:"activateTags";i:0;s:10:"appendType";s:4:"tags";s:9:"maxImages";i:7;s:14:"relatedHeading";s:28:"<h3>Immagini collegate:</h3>";s:10:"thumbwidth";i:240;s:11:"thumbheight";i:160;s:8:"thumbfix";b:1;s:12:"thumbquality";i:100;s:8:"imgWidth";i:800;s:9:"imgHeight";i:600;s:10:"imgQuality";i:100;s:9:"imgBackup";b:1;s:13:"imgAutoResize";b:0;s:9:"galImages";s:2:"20";s:17:"galPagedGalleries";i:0;s:10:"galColumns";i:0;s:12:"galShowSlide";b:1;s:12:"galTextSlide";s:18:"[Mostra slideshow]";s:14:"galTextGallery";s:18:"[Mostra miniature]";s:12:"galShowOrder";s:7:"gallery";s:7:"galSort";s:9:"sortorder";s:10:"galSortDir";s:3:"ASC";s:10:"galNoPages";b:1;s:13:"galImgBrowser";i:0;s:12:"galHiddenImg";i:0;s:10:"galAjaxNav";i:0;s:11:"thumbEffect";s:8:"fancybox";s:9:"thumbCode";s:41:"class="ngg-fancybox" rel="%GALLERY_NAME%"";s:18:"thumbEffectContext";s:14:"nextgen_images";s:5:"wmPos";s:8:"botRight";s:6:"wmXpos";i:5;s:6:"wmYpos";i:5;s:6:"wmType";i:0;s:6:"wmPath";s:0:"";s:6:"wmFont";s:9:"arial.ttf";s:6:"wmSize";i:10;s:6:"wmText";s:12:"Casa Rabatti";s:7:"wmColor";s:6:"000000";s:8:"wmOpaque";s:3:"100";s:7:"slideFX";s:4:"fade";s:7:"irWidth";i:600;s:8:"irHeight";i:400;s:12:"irRotatetime";i:10;s:11:"activateCSS";i:1;s:7:"CSSfile";s:13:"nggallery.css";s:28:"always_enable_frontend_logic";b:0;s:22:"dynamic_thumbnail_slug";s:13:"nextgen-image";s:23:"dynamic_stylesheet_slug";s:12:"nextgen-dcss";s:11:"installDate";i:1456671612;}', 'yes'),
(352, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(353, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(354, 'ngg_db_version', '1.8.1', 'yes'),
(357, 'pope_module_list', 'a:34:{i:0;s:17:"photocrati-fs|0.4";i:1;s:19:"photocrati-i18n|0.1";i:2;s:25:"photocrati-validation|0.1";i:3;s:21:"photocrati-router|0.7";i:4;s:32:"photocrati-wordpress_routing|0.6";i:5;s:23:"photocrati-security|0.2";i:6;s:31:"photocrati-nextgen_settings|0.9";i:7;s:18:"photocrati-mvc|0.5";i:8;s:19:"photocrati-ajax|0.8";i:9;s:25:"photocrati-datamapper|0.9";i:10;s:30:"photocrati-nextgen-legacy|0.14";i:11;s:28:"photocrati-nextgen-data|0.10";i:12;s:33:"photocrati-dynamic_thumbnails|0.6";i:13;s:28:"photocrati-nextgen_admin|0.9";i:14;s:39:"photocrati-nextgen_gallery_display|0.13";i:15;s:34:"photocrati-frame_communication|0.4";i:16;s:30:"photocrati-attach_to_post|0.11";i:17;s:38:"photocrati-nextgen_addgallery_page|0.6";i:18;s:36:"photocrati-nextgen_other_options|0.8";i:19;s:33:"photocrati-nextgen_pagination|0.3";i:20;s:33:"photocrati-dynamic_stylesheet|0.3";i:21;s:34:"photocrati-nextgen_pro_upgrade|0.4";i:22;s:20:"photocrati-cache|0.2";i:23;s:24:"photocrati-lightbox|0.14";i:24;s:38:"photocrati-nextgen_basic_templates|0.5";i:25;s:37:"photocrati-nextgen_basic_gallery|0.13";i:26;s:42:"photocrati-nextgen_basic_imagebrowser|0.10";i:27;s:39:"photocrati-nextgen_basic_singlepic|0.11";i:28;s:38:"photocrati-nextgen_basic_tagcloud|0.11";i:29;s:35:"photocrati-nextgen_basic_album|0.10";i:30;s:21:"photocrati-widget|0.5";i:31;s:33:"photocrati-third_party_compat|0.4";i:32;s:29:"photocrati-nextgen_xmlrpc|0.4";i:33;s:20:"photocrati-wpcli|0.1";}', 'yes'),
(638, 'widget_huge_it_google_mapss_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(708, '_site_transient_timeout_browser_e3ae366e66d1c39ce6cf9f9706edbba9', '1457720393', 'yes'),
(709, '_site_transient_browser_e3ae366e66d1c39ce6cf9f9706edbba9', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"48.0.2564.116";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(710, 'sucuriscan_datastore_path', 'C:\\inetpub\\CasaRabatti/wp-content/uploads/sucuri', 'yes'),
(727, 'sucuriscan_runtime', '1458489793', 'yes'),
(728, 'sucuriscan_site_version', '4.4.2', 'yes'),
(778, 'jetpack_unique_connection', 'a:3:{s:9:"connected";i:1;s:12:"disconnected";i:0;s:7:"version";s:5:"3.6.1";}', 'yes'),
(779, 'jetpack_active_modules', 'a:20:{i:0;s:18:"after-the-deadline";i:1;s:12:"contact-form";i:2;s:20:"custom-content-types";i:3;s:10:"custom-css";i:4;s:19:"gravatar-hovercards";i:5;s:5:"latex";i:6;s:5:"notes";i:7;s:10:"omnisearch";i:8;s:13:"post-by-email";i:9;s:7:"protect";i:10;s:9:"publicize";i:11;s:10:"sharedaddy";i:12;s:10:"shortcodes";i:13;s:10:"shortlinks";i:14;s:5:"stats";i:15;s:13:"subscriptions";i:16;s:10:"vaultpress";i:17;s:18:"verification-tools";i:18;s:17:"widget-visibility";i:19;s:7:"widgets";}', 'yes'),
(784, 'widget_blog_subscription', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(785, 'widget_facebook-likebox', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(786, 'widget_wpcom-goodreads', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(787, 'widget_googleplus-badge', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(788, 'widget_grofile', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(789, 'widget_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(790, 'widget_rss_links', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(791, 'widget_wpcom_social_media_icons_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(792, 'widget_twitter_timeline', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(793, 'widget_jetpack_display_posts_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(795, 'jetpack_protect_key', '8c846c12cbf918f69f45b9558b2c4fda06ebe9ff', 'yes'),
(796, 'stats_options', 'a:7:{s:9:"admin_bar";b:1;s:5:"roles";a:1:{i:0;s:13:"administrator";}s:11:"count_roles";a:0:{}s:7:"blog_id";i:107112430;s:12:"do_not_track";b:1;s:10:"hide_smile";b:1;s:7:"version";s:1:"9";}', 'yes'),
(801, 'trusted_ip_header', 'O:8:"stdClass":3:{s:14:"trusted_header";s:11:"REMOTE_ADDR";s:8:"segments";i:1;s:7:"reverse";b:0;}', 'yes'),
(803, 'updraftplus-addons_siteid', 'ebff2be07e7776046fd7188f14d45e5b', 'yes'),
(805, 'sharing-options', 'a:1:{s:6:"global";a:5:{s:12:"button_style";s:9:"icon-text";s:13:"sharing_label";s:11:"Share this:";s:10:"open_links";s:4:"same";s:4:"show";a:0:{}s:6:"custom";a:0:{}}}', 'yes'),
(821, 'updraft_retain_extrarules', 'a:0:{}', 'yes'),
(822, 'updraft_email', 'roberto.bani@gmail.com', 'yes'),
(823, 'updraft_report_warningsonly', 'a:0:{}', 'yes'),
(824, 'updraft_report_wholebackup', 'a:0:{}', 'yes'),
(825, 'updraft_extradbs', 'a:0:{}', 'yes'),
(826, 'updraft_include_more_path', 'a:0:{}', 'yes'),
(827, 'updraft_interval', 'daily', 'yes'),
(828, 'updraft_retain', '7', 'yes'),
(829, 'updraft_interval_database', 'daily', 'yes'),
(830, 'updraft_retain_db', '7', 'yes'),
(831, 'updraft_s3', 'a:3:{s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";s:4:"path";s:0:"";}', 'yes'),
(832, 'updraft_cloudfiles', 'a:5:{s:7:"authurl";s:35:"https://auth.api.rackspacecloud.com";s:6:"region";s:3:"DFW";s:4:"user";s:0:"";s:6:"apikey";s:0:"";s:4:"path";s:0:"";}', 'yes'),
(833, 'updraft_googledrive', 'a:3:{s:8:"clientid";s:0:"";s:6:"secret";s:0:"";s:6:"folder";s:11:"UpdraftPlus";}', 'yes'),
(834, 'updraft_ftp', 'a:5:{s:4:"host";s:0:"";s:4:"user";s:0:"";s:4:"pass";s:0:"";s:4:"path";s:0:"";s:7:"passive";s:1:"1";}', 'yes'),
(835, 'updraft_s3generic', 'a:4:{s:8:"endpoint";s:0:"";s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";s:4:"path";s:0:"";}', 'yes'),
(836, 'updraft_openstack', 'a:6:{s:7:"authurl";s:0:"";s:6:"tenant";s:0:"";s:6:"region";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:4:"path";s:0:"";}', 'yes'),
(837, 'updraft_dreamobjects', 'a:3:{s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";s:4:"path";s:0:"";}', 'yes'),
(838, 'updraft_include_plugins', '1', 'yes'),
(839, 'updraft_include_themes', '1', 'yes'),
(840, 'updraft_include_uploads', '1', 'yes'),
(841, 'updraft_include_uploads_exclude', 'backup*,*backups,backwpup*,wp-clone', 'yes'),
(842, 'updraft_include_others', '1', 'yes'),
(843, 'updraft_include_others_exclude', 'upgrade,cache,updraft,backup*,*backups,mysql.sql,debug.log', 'yes'),
(844, 'updraft_split_every', '800', 'yes'),
(845, 'updraft_delete_local', '1', 'yes'),
(846, 'updraft_dir', 'D:/BACKUP_WP/CASARABATTI', 'yes'),
(847, 'updraft_service', '', 'yes'),
(848, 'updraft_debug_mode', '0', 'yes'),
(849, 'updraft_ssl_useservercerts', '0', 'yes'),
(850, 'updraft_ssl_disableverify', '0', 'yes'),
(851, 'updraft_ssl_nossl', '0', 'yes'),
(852, 'updraft_lastmessage', 'Il backup apparentemente è riuscito ed ora è completo (Mar 20 20:10:36)', 'yes'),
(853, 'updraftplus_unlocked_fd', '1', 'yes'),
(854, 'updraftplus_last_lock_time_fd', '2016-03-20 18:58:42', 'yes'),
(855, 'updraftplus_semaphore_fd', '0', 'yes'),
(856, 'updraft_last_scheduled_fd', '1458500321', 'yes'),
(858, 'updraft_backup_history', 'a:7:{i:1458500321;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-plugins.zip";}s:12:"plugins-size";i:20262768;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-themes.zip";}s:11:"themes-size";i:8406584;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-uploads.zip";}s:12:"uploads-size";i:40611276;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-others.zip";}s:11:"others-size";i:11645228;s:2:"db";s:54:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-db.gz";s:7:"db-size";i:70810;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"f0941e3a43a1ac6f84c3f86977cbe5bcd68657c0";s:7:"themes0";s:40:"69eaa01f465bfe3e2364cba418134efc12dfc1a0";s:8:"uploads0";s:40:"ca0951d4d6f7d0097e60bfb808fee0eccd6e8b49";s:7:"others0";s:40:"1aa1768c8abcb80623cc49cd9f519d39cec2b7ea";s:3:"db0";s:40:"b87744d34d592188897b01b1838227f804779f70";}}s:5:"nonce";s:12:"9ff459833574";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}i:1458419380;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-19-2129_Casa_Rabatti_816075a4ec7e-plugins.zip";}s:12:"plugins-size";i:20213769;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-19-2129_Casa_Rabatti_816075a4ec7e-themes.zip";}s:11:"themes-size";i:8043309;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-19-2129_Casa_Rabatti_816075a4ec7e-uploads.zip";}s:12:"uploads-size";i:44062332;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-19-2129_Casa_Rabatti_816075a4ec7e-others.zip";}s:11:"others-size";i:11644971;s:2:"db";s:54:"backup_2016-03-19-2129_Casa_Rabatti_816075a4ec7e-db.gz";s:7:"db-size";i:71700;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"4e3271cd30cc9ffaee036226eb2d14adb6482bbf";s:7:"themes0";s:40:"a91c05bbbc239a2b14e246ce451672f4abc48bb5";s:8:"uploads0";s:40:"03a65141bae11e435b985d6d14880f0748a9ed51";s:7:"others0";s:40:"38396026596392d1bd5e16f354adcd8582b40eea";s:3:"db0";s:40:"1a2705147d7b63c58005a4fbf31bd2e5365520df";}}s:5:"nonce";s:12:"816075a4ec7e";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}i:1458373733;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-19-0848_Casa_Rabatti_ae98a69dfac7-plugins.zip";}s:12:"plugins-size";i:20213769;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-19-0848_Casa_Rabatti_ae98a69dfac7-themes.zip";}s:11:"themes-size";i:8043309;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-19-0848_Casa_Rabatti_ae98a69dfac7-uploads.zip";}s:12:"uploads-size";i:44061773;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-19-0848_Casa_Rabatti_ae98a69dfac7-others.zip";}s:11:"others-size";i:11644679;s:2:"db";s:54:"backup_2016-03-19-0848_Casa_Rabatti_ae98a69dfac7-db.gz";s:7:"db-size";i:70470;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"a8da97763abeeb5e05a48c53cba3cded8a3f8023";s:7:"themes0";s:40:"78eef44407fbd42dd038bec07be3a6cf47e8a53c";s:8:"uploads0";s:40:"3c1eb1a96e10048a2a99333cbb4d4151be4526c5";s:7:"others0";s:40:"ec9538f6227c892089cb7486e0b35aeb5bd6b22e";s:3:"db0";s:40:"34472df1ca0bea7b448ec1e2d122998bfc9d8b9d";}}s:5:"nonce";s:12:"ae98a69dfac7";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}i:1458307063;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-18-1417_Casa_Rabatti_b93aa936ef3d-plugins.zip";}s:12:"plugins-size";i:20213769;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-18-1417_Casa_Rabatti_b93aa936ef3d-themes.zip";}s:11:"themes-size";i:8043309;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-18-1417_Casa_Rabatti_b93aa936ef3d-uploads.zip";}s:12:"uploads-size";i:44061773;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-18-1417_Casa_Rabatti_b93aa936ef3d-others.zip";}s:11:"others-size";i:11644679;s:2:"db";s:54:"backup_2016-03-18-1417_Casa_Rabatti_b93aa936ef3d-db.gz";s:7:"db-size";i:75617;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"9bbcbda10c7d17d110234a42c8dfd70a81e517c7";s:7:"themes0";s:40:"237fad36f123270b45b272fe6081d1613c3b5e21";s:8:"uploads0";s:40:"20e221873925cad6257907b9ced3dd62a20d3f63";s:7:"others0";s:40:"706c6a3f98dcb5082a1e42d81e46d4a03537f11b";s:3:"db0";s:40:"d9cfe781ff29a520accd838bdc20e309d978b580";}}s:5:"nonce";s:12:"b93aa936ef3d";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}i:1458165043;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-16-2250_Casa_Rabatti_16b9a5c89f56-plugins.zip";}s:12:"plugins-size";i:20213769;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-16-2250_Casa_Rabatti_16b9a5c89f56-themes.zip";}s:11:"themes-size";i:8043309;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-16-2250_Casa_Rabatti_16b9a5c89f56-uploads.zip";}s:12:"uploads-size";i:44061747;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-16-2250_Casa_Rabatti_16b9a5c89f56-others.zip";}s:11:"others-size";i:11644679;s:2:"db";s:54:"backup_2016-03-16-2250_Casa_Rabatti_16b9a5c89f56-db.gz";s:7:"db-size";i:75484;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"ea8308d83fa2ee11bba7476372ad5b14dc61803b";s:7:"themes0";s:40:"b9ab1a64e8272020da9657ad7cf15cd97840df32";s:8:"uploads0";s:40:"4311c0e9d28503582732f973da495c0e691e64d5";s:7:"others0";s:40:"421f75598bc813e83f0f2ca3c7fd5fd4e453345a";s:3:"db0";s:40:"2f70d07ec1ef9c6178ff6e58899067d719b17172";}}s:5:"nonce";s:12:"16b9a5c89f56";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}i:1458071252;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-15-2047_Casa_Rabatti_c2c341d61bf0-plugins.zip";}s:12:"plugins-size";i:20213769;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-15-2047_Casa_Rabatti_c2c341d61bf0-themes.zip";}s:11:"themes-size";i:8043485;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-15-2047_Casa_Rabatti_c2c341d61bf0-uploads.zip";}s:12:"uploads-size";i:40605720;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-15-2047_Casa_Rabatti_c2c341d61bf0-others.zip";}s:11:"others-size";i:11642407;s:2:"db";s:54:"backup_2016-03-15-2047_Casa_Rabatti_c2c341d61bf0-db.gz";s:7:"db-size";i:68831;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"1030ab95d15a7e193cd21601b5920aef84e39eb8";s:7:"themes0";s:40:"db6443c27bfe5e7fe43534bc7866f0730b663ec5";s:8:"uploads0";s:40:"d3db0b3850ce958550e7dd2f4d67c0583e153337";s:7:"others0";s:40:"3a99f0b84776d0595d4d7ddf641b18f71a8de35d";s:3:"db0";s:40:"30ef892e1ab39d71713b95521a503e67955b12e9";}}s:5:"nonce";s:12:"c2c341d61bf0";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}i:1458023360;a:15:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-15-0729_Casa_Rabatti_5622c0175a78-plugins.zip";}s:12:"plugins-size";i:20213769;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-15-0729_Casa_Rabatti_5622c0175a78-themes.zip";}s:11:"themes-size";i:8043485;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-15-0729_Casa_Rabatti_5622c0175a78-uploads.zip";}s:12:"uploads-size";i:40605693;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-15-0729_Casa_Rabatti_5622c0175a78-others.zip";}s:11:"others-size";i:11642407;s:2:"db";s:54:"backup_2016-03-15-0729_Casa_Rabatti_5622c0175a78-db.gz";s:7:"db-size";i:68190;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"369c3e1fa9f82ab4dc200246ab60e336a8e32655";s:7:"themes0";s:40:"706d9fc06fe8fbf0322e21569684f426ed140c89";s:8:"uploads0";s:40:"fe449aa08a8f1914663fa89f6f460b30594e4554";s:7:"others0";s:40:"0c0304be0be6f1f6ea6bb04bca8e993252055867";s:3:"db0";s:40:"fba23314b9ded77f086a473a5e9263af3243bc0f";}}s:5:"nonce";s:12:"5622c0175a78";s:7:"service";a:1:{i:0;s:0:"";}s:18:"created_by_version";s:7:"1.11.28";s:12:"is_multisite";b:0;}}', 'yes'),
(859, 'updraft_last_backup', 'a:5:{s:11:"backup_time";i:1458500321;s:12:"backup_array";a:11:{s:7:"plugins";a:1:{i:0;s:60:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-plugins.zip";}s:12:"plugins-size";i:20262768;s:6:"themes";a:1:{i:0;s:59:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-themes.zip";}s:11:"themes-size";i:8406584;s:7:"uploads";a:1:{i:0;s:60:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-uploads.zip";}s:12:"uploads-size";i:40611276;s:6:"others";a:1:{i:0;s:59:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-others.zip";}s:11:"others-size";i:11645228;s:2:"db";s:54:"backup_2016-03-20-1958_Casa_Rabatti_9ff459833574-db.gz";s:7:"db-size";i:70810;s:9:"checksums";a:1:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"f0941e3a43a1ac6f84c3f86977cbe5bcd68657c0";s:7:"themes0";s:40:"69eaa01f465bfe3e2364cba418134efc12dfc1a0";s:8:"uploads0";s:40:"ca0951d4d6f7d0097e60bfb808fee0eccd6e8b49";s:7:"others0";s:40:"1aa1768c8abcb80623cc49cd9f519d39cec2b7ea";s:3:"db0";s:40:"b87744d34d592188897b01b1838227f804779f70";}}}s:7:"success";i:1;s:6:"errors";a:0:{}s:12:"backup_nonce";s:12:"9ff459833574";}', 'yes'),
(867, 'updraftplus_unlocked_', '1', 'yes'),
(868, 'updraftplus_last_lock_time_', '2016-03-04 18:43:45', 'yes'),
(869, 'updraftplus_semaphore_', '0', 'yes'),
(889, 'stats_cache', 'a:2:{s:32:"28a6def3ec4360f2b528442dcf8a8a8c";a:1:{i:1458379055;a:1:{i:0;a:4:{s:7:"post_id";s:1:"0";s:10:"post_title";s:9:"Home page";s:14:"post_permalink";s:26:"http://www.casarabatti.it/";s:5:"views";s:1:"1";}}}s:32:"fa1a83f6de05bb8b4da8a2e6c314c6b1";a:1:{i:1458379055;a:0:{}}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1327, 'rewrite_rules', 'a:198:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:"ngg_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?ngg_tag=$matches[1]&feed=$matches[2]";s:43:"ngg_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?ngg_tag=$matches[1]&feed=$matches[2]";s:36:"ngg_tag/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?ngg_tag=$matches[1]&paged=$matches[2]";s:18:"ngg_tag/([^/]+)/?$";s:29:"index.php?ngg_tag=$matches[1]";s:37:"ngg_album/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"ngg_album/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"ngg_album/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ngg_album/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ngg_album/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"ngg_album/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"ngg_album/([^/]+)/embed/?$";s:42:"index.php?ngg_album=$matches[1]&embed=true";s:30:"ngg_album/([^/]+)/trackback/?$";s:36:"index.php?ngg_album=$matches[1]&tb=1";s:38:"ngg_album/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?ngg_album=$matches[1]&paged=$matches[2]";s:45:"ngg_album/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?ngg_album=$matches[1]&cpage=$matches[2]";s:34:"ngg_album/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?ngg_album=$matches[1]&page=$matches[2]";s:26:"ngg_album/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"ngg_album/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"ngg_album/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ngg_album/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ngg_album/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"ngg_album/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:39:"ngg_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"ngg_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"ngg_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ngg_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ngg_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"ngg_gallery/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:28:"ngg_gallery/([^/]+)/embed/?$";s:44:"index.php?ngg_gallery=$matches[1]&embed=true";s:32:"ngg_gallery/([^/]+)/trackback/?$";s:38:"index.php?ngg_gallery=$matches[1]&tb=1";s:40:"ngg_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?ngg_gallery=$matches[1]&paged=$matches[2]";s:47:"ngg_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?ngg_gallery=$matches[1]&cpage=$matches[2]";s:36:"ngg_gallery/([^/]+)(?:/([0-9]+))?/?$";s:50:"index.php?ngg_gallery=$matches[1]&page=$matches[2]";s:28:"ngg_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:38:"ngg_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:58:"ngg_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ngg_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ngg_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:34:"ngg_gallery/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"ngg_pictures/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"ngg_pictures/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"ngg_pictures/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"ngg_pictures/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"ngg_pictures/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"ngg_pictures/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"ngg_pictures/([^/]+)/embed/?$";s:45:"index.php?ngg_pictures=$matches[1]&embed=true";s:33:"ngg_pictures/([^/]+)/trackback/?$";s:39:"index.php?ngg_pictures=$matches[1]&tb=1";s:41:"ngg_pictures/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?ngg_pictures=$matches[1]&paged=$matches[2]";s:48:"ngg_pictures/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?ngg_pictures=$matches[1]&cpage=$matches[2]";s:37:"ngg_pictures/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?ngg_pictures=$matches[1]&page=$matches[2]";s:29:"ngg_pictures/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"ngg_pictures/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"ngg_pictures/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"ngg_pictures/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"ngg_pictures/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"ngg_pictures/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:44:"lightbox_library/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"lightbox_library/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"lightbox_library/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"lightbox_library/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"lightbox_library/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:50:"lightbox_library/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"lightbox_library/([^/]+)/embed/?$";s:49:"index.php?lightbox_library=$matches[1]&embed=true";s:37:"lightbox_library/([^/]+)/trackback/?$";s:43:"index.php?lightbox_library=$matches[1]&tb=1";s:45:"lightbox_library/([^/]+)/page/?([0-9]{1,})/?$";s:56:"index.php?lightbox_library=$matches[1]&paged=$matches[2]";s:52:"lightbox_library/([^/]+)/comment-page-([0-9]{1,})/?$";s:56:"index.php?lightbox_library=$matches[1]&cpage=$matches[2]";s:41:"lightbox_library/([^/]+)(?:/([0-9]+))?/?$";s:55:"index.php?lightbox_library=$matches[1]&page=$matches[2]";s:33:"lightbox_library/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"lightbox_library/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"lightbox_library/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"lightbox_library/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"lightbox_library/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"lightbox_library/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"displayed_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"displayed_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"displayed_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"displayed_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"displayed_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"displayed_gallery/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"displayed_gallery/([^/]+)/embed/?$";s:50:"index.php?displayed_gallery=$matches[1]&embed=true";s:38:"displayed_gallery/([^/]+)/trackback/?$";s:44:"index.php?displayed_gallery=$matches[1]&tb=1";s:46:"displayed_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?displayed_gallery=$matches[1]&paged=$matches[2]";s:53:"displayed_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?displayed_gallery=$matches[1]&cpage=$matches[2]";s:42:"displayed_gallery/([^/]+)(?:/([0-9]+))?/?$";s:56:"index.php?displayed_gallery=$matches[1]&page=$matches[2]";s:34:"displayed_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"displayed_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"displayed_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"displayed_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"displayed_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"displayed_gallery/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"display_type/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"display_type/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"display_type/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"display_type/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"display_type/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"display_type/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"display_type/([^/]+)/embed/?$";s:45:"index.php?display_type=$matches[1]&embed=true";s:33:"display_type/([^/]+)/trackback/?$";s:39:"index.php?display_type=$matches[1]&tb=1";s:41:"display_type/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?display_type=$matches[1]&paged=$matches[2]";s:48:"display_type/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?display_type=$matches[1]&cpage=$matches[2]";s:37:"display_type/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?display_type=$matches[1]&page=$matches[2]";s:29:"display_type/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"display_type/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"display_type/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"display_type/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"display_type/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"display_type/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:46:"gal_display_source/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:56:"gal_display_source/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"gal_display_source/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"gal_display_source/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"gal_display_source/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:52:"gal_display_source/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"gal_display_source/([^/]+)/embed/?$";s:51:"index.php?gal_display_source=$matches[1]&embed=true";s:39:"gal_display_source/([^/]+)/trackback/?$";s:45:"index.php?gal_display_source=$matches[1]&tb=1";s:47:"gal_display_source/([^/]+)/page/?([0-9]{1,})/?$";s:58:"index.php?gal_display_source=$matches[1]&paged=$matches[2]";s:54:"gal_display_source/([^/]+)/comment-page-([0-9]{1,})/?$";s:58:"index.php?gal_display_source=$matches[1]&cpage=$matches[2]";s:43:"gal_display_source/([^/]+)(?:/([0-9]+))?/?$";s:57:"index.php?gal_display_source=$matches[1]&page=$matches[2]";s:35:"gal_display_source/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"gal_display_source/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"gal_display_source/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"gal_display_source/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"gal_display_source/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"gal_display_source/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(2140, '_site_transient_timeout_browser_42e8d0bcb2682e378466e2eb27d2d54d', '1458159126', 'yes'),
(2141, '_site_transient_browser_42e8d0bcb2682e378466e2eb27d2d54d', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"44.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(2280, '_site_transient_timeout_browser_93c424ae4d0e7469a4221c7407b7931e', '1458246717', 'yes'),
(2281, '_site_transient_browser_93c424ae4d0e7469a4221c7407b7931e', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"48.0.2564.116";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(2607, 'wonderplugin_slider_userrole', 'manage_options', 'yes'),
(2608, 'wonderplugin-slider-engine', 'Responsive WordPress Image Slider', 'yes'),
(2690, 'wonderplugin_slider_information', 's:4292:"O:8:"stdClass":15:{s:6:"author";s:19:"Magic Hills Pty Ltd";s:8:"homepage";s:46:"https://www.wonderplugin.com/wordpress-slider/";s:4:"name";s:19:"WonderPlugin Slider";s:8:"requires";s:3:"3.6";s:6:"tested";s:5:"4.4.2";s:7:"version";s:3:"6.4";s:11:"new_version";s:3:"6.4";s:12:"last_updated";s:10:"2016-03-10";s:8:"sections";a:1:{s:10:"change log";s:3732:"<h4>Version 6.4</h4>\n<ul>\n<li>Fix the bug when there are uppercase letters in WordPress database prefix</li>\n</ul>\n<h4>Version 6.3</h4>\n<ul>\n<li>Add an advanced option to trigger window resize event</li>\n</ul>\n<h4>Version 6.2</h4>\n<ul>\n<li>Display the plugin version type in the WordPress backend Plugins -> Installed Plugins page</li>\n</ul>\n<h4>Version 6.1</h4>\n<ul>\n<li>WordPress Posts Slider: add an option to link title to the post page</li>\n<li>WordPress Posts Slider: add an option to open the featured image in lightbox</li>\n</ul>\n<h4>Version 6.0</h4>\n<ul>\n<li>Fix a bug in plugin update</li>\n</ul>\n<h4>Version 5.9</h4>\n<ul>\n<li>Fix a bug in ken-burns effect</li>\n</ul>\n<h4>Version 5.8</h4>\n<ul>\n<li>Support trash in slider management. The deleted slider will be moved to the trash in which you can restore or permanently delete it.</li>\n</ul>\n<h4>Version 5.7</h4>\n<ul>\n<li>Support lightbox auto slideshow</li>\n<li>Add an option to always show the previous and next navigation arrows on lightbox</li>\n<li>Display error notice on the WordPress Updates page if the free upgrade period is expired.</li>\n</ul>\n<h4>Version 5.6</h4>\n<ul>\n<li>Add an option to support adding the new item to the beginning of the list\n</li>\n<li>Add a function to reverse the media list</li>\n</ul>\n<h4>Version 5.5</h4>\n<ul>\n<li>Fix the bug of resuming slideshow autoplay when lightbox is closed</li>\n<li>Add an option to hide MP4/WebM video play control bar on lightbox</li>\n<li>Add an option to display text on bottom, inside, left or right of the lightbox</li>\n<li>Add an option to display lightbox in fullscreen mode. In fullscreen mode, the close button will be displayed on the top right corner of the web browser</li>\n<li>Add an option to add prefix to title when the lightbox is displayed in gallery mode</li>\n<li>Add an option to enable or disable closing lightbox when clicking on the overlay background</li>\n<li>Move the left and right navigation arrows to the side of lightbox on touch screen. This will fix the issue of double clicking when playing video on iPhone, iPad and Android.</li>\n</ul>\n<h4>Version 5.4</h4>\n<ul>\n<li>Fix the bug of playing MP4 video on iPad iOS 9.1\n</li>\n</ul>\n<h4>Version 5.3</h4>\n<ul>\n<li>Fix the bug of video lightbox in iPad 2\n</li>\n</ul>\n<h4>Version 5.2</h4>\n<ul>\n<li>Support WordPress posts slider: create slider from recent posts or posts in specified categories\n</li>\n</ul>\n<h4>Version 5.1</h4>\n<ul>\n<li>Fix a minor bug of version 5.0\n</li>\n</ul>\n<h4>Version 5.0</h4>\n<ul>\n<li>Fix a bug of playing mp4 video in the lightbox popup under Firefox\n</li>\n</ul>\n<h4>Version 4.9</h4>\n<ul>\n<li>Fix bugs\n</li>\n</ul>\n<h4>Version 4.7</h4>\n<ul>\n<li>Fix a bug in responsive design\n</li>\n</ul>\n<h4>Version 4.6</h4>\n<ul>\n<li>Support adding alt text for slider images\n</li>\n</ul>\n<h4>Version 4.5</h4>\n<ul>\n<li>Fix bugs\n</li>\n</ul>\n<h4>Version 4.4</h4>\n<ul>\n<li>Add options to change the aspect ratio of sliders on small screen devices\n</li>\n</ul>\n<h4>Version 4.3</h4>\n<ul>\n<li>Add effects Tiles, Ken Burns, Flip, Flip with zoom\n</li>\n<li>Create <a href="/wordpress-slider/examples/wordpress-ken-burns-slider-id43/" target="_blank">WordPress Ken Burns Slider</a>\n</li>\n<li>Add 3D effects 3D with zoom, 3D horizontal with zoom, 3D flip, 3D flip with zoom, 3D tiles\n</li>\n<li>Create <a href="/wordpress-slider/examples/wordpress-3d-slider-id44/" target="_blank">WordPress 3D Slider</a>\n</li>\n<li>Add options to define thumbnail width and height\n</li>\n<li>Add an option to add slider js files to the footer\n</li>\n<li>Add an option to display sliders in text widgets\n</li>\n<li>Add options to define responsive CSS for texts on small screens\n</li>\n</ul>\n<h4>Version 4.2</h4>\n<ul>\n<li>Support version check and update\n</li>\n</ul>";}s:3:"key";s:0:"";s:10:"key_status";s:5:"empty";s:10:"key_expire";i:0;s:4:"slug";s:19:"wonderplugin-slider";s:6:"plugin";s:42:"wonderplugin-slider/wonderpluginslider.php";s:12:"last_checked";i:1458471136;}";', 'yes'),
(2818, '_site_transient_timeout_browser_3bad1b4b9429d332a29f71934d4f1928', '1458676168', 'yes'),
(2819, '_site_transient_browser_3bad1b4b9429d332a29f71934d4f1928', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"49.0.2623.87";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(3597, '_site_transient_timeout_browser_67bffb4457c7c00ae77275828881cb94', '1458983851', 'yes'),
(3598, '_site_transient_browser_67bffb4457c7c00ae77275828881cb94', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"49.0.2623.87";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(3616, 'category_children', 'a:0:{}', 'yes'),
(3619, 'widget_top-posts', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(3620, 'widget_widget_contact_info', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(4025, '_site_transient_timeout_updraft_initial_resume_interval', '1459192228', 'yes'),
(4026, '_site_transient_updraft_initial_resume_interval', '737', 'yes'),
(4106, '_site_transient_timeout_theme_roots', '1458506671', 'yes'),
(4107, '_site_transient_theme_roots', 'a:1:{s:11:"casarabatti";s:7:"/themes";}', 'yes'),
(4109, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.4.2.zip";s:6:"locale";s:5:"it_IT";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/it_IT/wordpress-4.4.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.4.2";s:7:"version";s:5:"4.4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1458504875;s:15:"version_checked";s:5:"4.4.2";s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:4:"core";s:4:"slug";s:7:"default";s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2016-03-13 13:43:58";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.4.2/it_IT.zip";s:10:"autoupdate";b:1;}}}', 'yes'),
(4110, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1458504880;s:7:"checked";a:1:{s:11:"casarabatti";s:3:"1.0";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(4111, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1458504877;s:8:"response";a:2:{s:19:"jetpack/jetpack.php";O:8:"stdClass":8:{s:2:"id";s:5:"20101";s:4:"slug";s:7:"jetpack";s:6:"plugin";s:19:"jetpack/jetpack.php";s:11:"new_version";s:5:"3.9.4";s:3:"url";s:38:"https://wordpress.org/plugins/jetpack/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/jetpack.3.9.4.zip";s:6:"tested";s:5:"4.4.2";s:13:"compatibility";b:0;}s:29:"nextgen-gallery/nggallery.php";O:8:"stdClass":8:{s:2:"id";s:3:"592";s:4:"slug";s:15:"nextgen-gallery";s:6:"plugin";s:29:"nextgen-gallery/nggallery.php";s:11:"new_version";s:6:"2.1.26";s:3:"url";s:46:"https://wordpress.org/plugins/nextgen-gallery/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/nextgen-gallery.2.1.26.zip";s:6:"tested";s:5:"4.4.2";s:13:"compatibility";b:0;}}s:12:"translations";a:0:{}s:9:"no_update";a:8:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.8.zip";}s:31:"cookie-notice/cookie-notice.php";O:8:"stdClass":7:{s:2:"id";s:5:"42123";s:4:"slug";s:13:"cookie-notice";s:6:"plugin";s:31:"cookie-notice/cookie-notice.php";s:11:"new_version";s:6:"1.2.34";s:3:"url";s:44:"https://wordpress.org/plugins/cookie-notice/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/cookie-notice.1.2.34.zip";s:14:"upgrade_notice";s:46:"Fix: Empty href in links HTML validation issue";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:25:"google-maps/googlemap.php";O:8:"stdClass":6:{s:2:"id";s:5:"11433";s:4:"slug";s:11:"google-maps";s:6:"plugin";s:25:"google-maps/googlemap.php";s:11:"new_version";s:5:"2.0.4";s:3:"url";s:42:"https://wordpress.org/plugins/google-maps/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/google-maps.2.0.4.zip";}s:31:"master-slider/master-slider.php";O:8:"stdClass":7:{s:2:"id";s:5:"51874";s:4:"slug";s:13:"master-slider";s:6:"plugin";s:31:"master-slider/master-slider.php";s:11:"new_version";s:5:"2.7.1";s:3:"url";s:44:"https://wordpress.org/plugins/master-slider/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/master-slider.zip";s:14:"upgrade_notice";s:51:"[Fix]: Minor issue with an undefined variable fixed";}s:57:"reveal-ids-for-wp-admin-25/reveal-ids-for-wp-admin-25.php";O:8:"stdClass":6:{s:2:"id";s:4:"2872";s:4:"slug";s:26:"reveal-ids-for-wp-admin-25";s:6:"plugin";s:57:"reveal-ids-for-wp-admin-25/reveal-ids-for-wp-admin-25.php";s:11:"new_version";s:7:"1.4.6.1";s:3:"url";s:57:"https://wordpress.org/plugins/reveal-ids-for-wp-admin-25/";s:7:"package";s:69:"https://downloads.wordpress.org/plugin/reveal-ids-for-wp-admin-25.zip";}s:25:"sucuri-scanner/sucuri.php";O:8:"stdClass":6:{s:2:"id";s:5:"27199";s:4:"slug";s:14:"sucuri-scanner";s:6:"plugin";s:25:"sucuri-scanner/sucuri.php";s:11:"new_version";s:6:"1.7.17";s:3:"url";s:45:"https://wordpress.org/plugins/sucuri-scanner/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/sucuri-scanner.1.7.17.zip";}s:27:"updraftplus/updraftplus.php";O:8:"stdClass":6:{s:2:"id";s:5:"31679";s:4:"slug";s:11:"updraftplus";s:6:"plugin";s:27:"updraftplus/updraftplus.php";s:11:"new_version";s:7:"1.11.28";s:3:"url";s:42:"https://wordpress.org/plugins/updraftplus/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/updraftplus.1.11.28.zip";}}}', 'yes'),
(4126, '_transient_timeout_2__974818834', '1458520182', 'no'),
(4127, '_site_transient_timeout_security_report_performed_recently', '1458519280', 'yes'),
(4128, '_transient_2__974818834', '{"photocrati-ajax#ajax.min.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ajax\\/static\\/ajax.min.js","photocrati-nextgen_admin#gritter\\/gritter.min.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/gritter.min.js","photocrati-nextgen_admin#gritter\\/css\\/gritter.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/css\\/gritter.min.css","photocrati-nextgen_admin#ngg_progressbar.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.js","photocrati-nextgen_admin#ngg_progressbar.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.css","photocrati-nextgen_admin#select2\\/select2.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.css","photocrati-nextgen_admin#select2\\/select2.modded.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.modded.min.js","photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.nextgen_radio_toggle.min.js","photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery-ui\\/jquery-ui-1.10.4.custom.min.css","photocrati-frame_communication#frame_event_publisher.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/frame_communication\\/static\\/frame_event_publisher.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.css","photocrati-nextgen_addgallery_page#browserplus-2.4.21.min.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/browserplus-2.4.21.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/moxie.min.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/moxie.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/plupload.dev.min.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/plupload.dev.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.min.css","photocrati-nextgen_addgallery_page#styles.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/styles.min.css","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.js","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.css","photocrati-nextgen_addgallery_page#media-library-import.js||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.js","photocrati-nextgen_addgallery_page#media-library-import.css||http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti|http:\\/\\/localhost\\/casarabatti\\/wp-content\\/themes\\/casarabatti":"http:\\/\\/localhost\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.css"}', 'no'),
(4129, '_site_transient_security_report_performed_recently', '1', 'yes'),
(4130, '_transient_timeout_2__536483053', '1458520182', 'no'),
(4131, '_transient_2__536483053', '{"photocrati-ajax#ajax.min.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ajax\\/static\\/ajax.min.js","photocrati-nextgen_admin#gritter\\/gritter.min.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/gritter.min.js","photocrati-nextgen_admin#gritter\\/css\\/gritter.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/css\\/gritter.min.css","photocrati-nextgen_admin#ngg_progressbar.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.js","photocrati-nextgen_admin#ngg_progressbar.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.css","photocrati-nextgen_admin#select2\\/select2.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.css","photocrati-nextgen_admin#select2\\/select2.modded.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.modded.min.js","photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.nextgen_radio_toggle.min.js","photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery-ui\\/jquery-ui-1.10.4.custom.min.css","photocrati-frame_communication#frame_event_publisher.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/frame_communication\\/static\\/frame_event_publisher.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.css","photocrati-nextgen_addgallery_page#browserplus-2.4.21.min.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/browserplus-2.4.21.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/moxie.min.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/moxie.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/plupload.dev.min.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/plupload.dev.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.min.css","photocrati-nextgen_addgallery_page#styles.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/styles.min.css","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.js","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.css","photocrati-nextgen_addgallery_page#media-library-import.js|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.js","photocrati-nextgen_addgallery_page#media-library-import.css|0":"\\/opt\\/lampp\\/htdocs\\/casarabatti\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.css"}', 'no');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(4, 6, '_wp_attached_file', '2016/02/slide_01_b.jpg'),
(5, 6, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:700;s:4:"file";s:22:"2016/02/slide_01_b.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"slide_01_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"slide_01_b-300x140.jpg";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"slide_01_b-768x358.jpg";s:5:"width";i:768;s:6:"height";i:358;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"slide_01_b-1024x478.jpg";s:5:"width";i:1024;s:6:"height";i:478;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(6, 7, '_wp_attached_file', '2016/02/slide_02_b.jpg'),
(7, 7, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:700;s:4:"file";s:22:"2016/02/slide_02_b.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"slide_02_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"slide_02_b-300x140.jpg";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"slide_02_b-768x358.jpg";s:5:"width";i:768;s:6:"height";i:358;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"slide_02_b-1024x478.jpg";s:5:"width";i:1024;s:6:"height";i:478;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(8, 8, '_wp_attached_file', '2016/02/slide_03_b.jpg'),
(9, 8, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:700;s:4:"file";s:22:"2016/02/slide_03_b.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"slide_03_b-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"slide_03_b-300x140.jpg";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"slide_03_b-768x358.jpg";s:5:"width";i:768;s:6:"height";i:358;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"slide_03_b-1024x478.jpg";s:5:"width";i:1024;s:6:"height";i:478;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(10, 9, '_wp_attached_file', '2016/02/slide_05_b-1.jpg'),
(11, 9, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:700;s:4:"file";s:24:"2016/02/slide_05_b-1.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"slide_05_b-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"slide_05_b-1-300x140.jpg";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:24:"slide_05_b-1-768x358.jpg";s:5:"width";i:768;s:6:"height";i:358;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:25:"slide_05_b-1-1024x478.jpg";s:5:"width";i:1024;s:6:"height";i:478;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(14, 11, '_edit_last', '1'),
(17, 11, '_edit_lock', '1456669443:1'),
(20, 13, '_wp_attached_file', '2016/02/sergio-appartamento-2-27-10-15-089.jpg'),
(21, 13, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:46:"2016/02/sergio-appartamento-2-27-10-15-089.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-089-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-089-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-089-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:47:"sergio-appartamento-2-27-10-15-089-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:2:"10";s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1445949605";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"20";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:5:"0.008";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(22, 1, '_wp_trash_meta_status', 'publish'),
(23, 1, '_wp_trash_meta_time', '1456669040'),
(24, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(27, 16, '_edit_last', '1'),
(28, 16, '_edit_lock', '1456669548:1'),
(31, 18, '_edit_last', '1'),
(32, 18, '_edit_lock', '1456670946:1'),
(121, 28, '__defaults_set', '1'),
(122, 28, 'filter', 'raw'),
(123, 28, 'id_field', 'ID'),
(124, 29, '__defaults_set', '1'),
(125, 29, 'filter', 'raw'),
(126, 29, 'id_field', 'ID'),
(127, 30, '__defaults_set', '1'),
(128, 30, 'filter', 'raw'),
(129, 30, 'id_field', 'ID'),
(130, 32, '__defaults_set', '1'),
(131, 32, 'filter', 'raw'),
(132, 32, 'id_field', 'ID'),
(133, 31, '__defaults_set', '1'),
(134, 31, 'filter', 'raw'),
(135, 31, 'id_field', 'ID'),
(136, 33, '__defaults_set', '1'),
(137, 33, 'filter', 'raw'),
(138, 33, 'id_field', 'ID'),
(139, 34, '__defaults_set', '1'),
(140, 34, 'filter', 'raw'),
(141, 34, 'id_field', 'ID'),
(142, 35, '__defaults_set', '1'),
(143, 35, 'filter', 'raw'),
(144, 35, 'id_field', 'ID'),
(145, 36, '__defaults_set', '1'),
(146, 36, 'filter', 'raw'),
(147, 36, 'id_field', 'ID'),
(148, 37, '__defaults_set', '1'),
(149, 37, 'filter', 'raw'),
(150, 37, 'id_field', 'ID'),
(151, 38, '__defaults_set', '1'),
(152, 38, 'filter', 'raw'),
(153, 38, 'id_field', 'ID'),
(154, 39, '__defaults_set', '1'),
(155, 39, 'filter', 'raw'),
(156, 39, 'id_field', 'ID'),
(157, 40, '__defaults_set', '1'),
(158, 40, 'filter', 'raw'),
(159, 40, 'id_field', 'ID'),
(160, 41, '__defaults_set', '1'),
(161, 41, 'filter', 'raw'),
(162, 41, 'id_field', 'ID'),
(163, 42, '__defaults_set', '1'),
(164, 42, 'filter', 'raw'),
(165, 42, 'id_field', 'ID'),
(166, 43, '__defaults_set', '1'),
(167, 43, 'filter', 'raw'),
(168, 43, 'id_field', 'ID'),
(169, 44, '__defaults_set', '1'),
(170, 44, 'filter', 'raw'),
(171, 44, 'id_field', 'ID'),
(172, 45, '__defaults_set', '1'),
(173, 45, 'filter', 'raw'),
(174, 45, 'id_field', 'ID'),
(175, 46, '__defaults_set', '1'),
(176, 46, 'filter', 'raw'),
(177, 46, 'id_field', 'ID'),
(178, 47, 'updated_at', '1456673956'),
(179, 47, '__defaults_set', '1'),
(180, 47, 'filter', 'raw'),
(181, 47, 'id_field', 'ID'),
(193, 50, 'updated_at', '1456673962'),
(194, 50, '__defaults_set', '1'),
(195, 50, 'filter', 'raw'),
(196, 50, 'id_field', 'ID'),
(205, 52, 'updated_at', '1456673966'),
(206, 52, '__defaults_set', '1'),
(207, 52, 'filter', 'raw'),
(208, 52, 'id_field', 'ID'),
(217, 54, 'updated_at', '1456673971'),
(218, 54, '__defaults_set', '1'),
(219, 54, 'filter', 'raw'),
(220, 54, 'id_field', 'ID'),
(229, 56, 'updated_at', '1456673974'),
(230, 56, '__defaults_set', '1'),
(231, 56, 'filter', 'raw'),
(232, 56, 'id_field', 'ID'),
(241, 58, 'updated_at', '1456673979'),
(242, 58, '__defaults_set', '1'),
(243, 58, 'filter', 'raw'),
(244, 58, 'id_field', 'ID'),
(253, 60, 'updated_at', '1456673982'),
(254, 60, '__defaults_set', '1'),
(255, 60, 'filter', 'raw'),
(256, 60, 'id_field', 'ID'),
(265, 62, 'updated_at', '1456673986'),
(266, 62, '__defaults_set', '1'),
(267, 62, 'filter', 'raw'),
(268, 62, 'id_field', 'ID'),
(277, 64, 'updated_at', '1456673991'),
(278, 64, '__defaults_set', '1'),
(279, 64, 'filter', 'raw'),
(280, 64, 'id_field', 'ID'),
(289, 66, 'updated_at', '1456673995'),
(290, 66, '__defaults_set', '1'),
(291, 66, 'filter', 'raw'),
(292, 66, 'id_field', 'ID'),
(301, 68, 'updated_at', '1456673998'),
(302, 68, '__defaults_set', '1'),
(303, 68, 'filter', 'raw'),
(304, 68, 'id_field', 'ID'),
(313, 70, 'updated_at', '1456674003'),
(314, 70, '__defaults_set', '1'),
(315, 70, 'filter', 'raw'),
(316, 70, 'id_field', 'ID'),
(325, 72, 'updated_at', '1456674009'),
(326, 72, '__defaults_set', '1'),
(327, 72, 'filter', 'raw'),
(328, 72, 'id_field', 'ID'),
(337, 74, 'updated_at', '1456674013'),
(338, 74, '__defaults_set', '1'),
(339, 74, 'filter', 'raw'),
(340, 74, 'id_field', 'ID'),
(349, 76, 'updated_at', '1456674016'),
(350, 76, '__defaults_set', '1'),
(351, 76, 'filter', 'raw'),
(352, 76, 'id_field', 'ID'),
(361, 78, 'updated_at', '1456674019'),
(362, 78, '__defaults_set', '1'),
(363, 78, 'filter', 'raw'),
(364, 78, 'id_field', 'ID'),
(373, 80, 'updated_at', '1456674024'),
(374, 80, '__defaults_set', '1'),
(375, 80, 'filter', 'raw'),
(376, 80, 'id_field', 'ID'),
(385, 82, 'updated_at', '1456674028'),
(386, 82, '__defaults_set', '1'),
(387, 82, 'filter', 'raw'),
(388, 82, 'id_field', 'ID'),
(509, 49, '__defaults_set', '1'),
(510, 49, 'filter', 'raw'),
(511, 49, 'id_field', 'ID'),
(520, 53, 'updated_at', '1456674473'),
(521, 53, '__defaults_set', '1'),
(522, 53, 'filter', 'raw'),
(523, 53, 'id_field', 'ID'),
(524, 55, 'updated_at', '1456674473'),
(525, 55, '__defaults_set', '1'),
(526, 55, 'filter', 'raw'),
(527, 55, 'id_field', 'ID'),
(528, 57, 'updated_at', '1456674473'),
(529, 57, '__defaults_set', '1'),
(530, 57, 'filter', 'raw'),
(531, 57, 'id_field', 'ID'),
(532, 59, 'updated_at', '1456674473'),
(533, 59, '__defaults_set', '1'),
(534, 59, 'filter', 'raw'),
(535, 59, 'id_field', 'ID'),
(536, 61, 'updated_at', '1456674473'),
(537, 61, '__defaults_set', '1'),
(538, 61, 'filter', 'raw'),
(539, 61, 'id_field', 'ID'),
(540, 63, 'updated_at', '1456674473'),
(541, 63, '__defaults_set', '1'),
(542, 63, 'filter', 'raw'),
(543, 63, 'id_field', 'ID'),
(544, 65, 'updated_at', '1456674473'),
(545, 65, '__defaults_set', '1'),
(546, 65, 'filter', 'raw'),
(547, 65, 'id_field', 'ID'),
(548, 67, 'updated_at', '1456674473'),
(549, 67, '__defaults_set', '1'),
(550, 67, 'filter', 'raw'),
(551, 67, 'id_field', 'ID'),
(552, 69, 'updated_at', '1456674473'),
(553, 69, '__defaults_set', '1'),
(554, 69, 'filter', 'raw'),
(555, 69, 'id_field', 'ID'),
(556, 71, 'updated_at', '1456674473'),
(557, 71, '__defaults_set', '1'),
(558, 71, 'filter', 'raw'),
(559, 71, 'id_field', 'ID'),
(560, 73, 'updated_at', '1456674473'),
(561, 73, '__defaults_set', '1'),
(562, 73, 'filter', 'raw'),
(563, 73, 'id_field', 'ID'),
(564, 75, 'updated_at', '1456674474'),
(565, 75, '__defaults_set', '1'),
(566, 75, 'filter', 'raw'),
(567, 75, 'id_field', 'ID'),
(568, 77, 'updated_at', '1456674474'),
(569, 77, '__defaults_set', '1'),
(570, 77, 'filter', 'raw'),
(571, 77, 'id_field', 'ID'),
(572, 79, 'updated_at', '1456674474'),
(573, 79, '__defaults_set', '1'),
(574, 79, 'filter', 'raw'),
(575, 79, 'id_field', 'ID'),
(576, 81, 'updated_at', '1456674474'),
(577, 81, '__defaults_set', '1'),
(578, 81, 'filter', 'raw'),
(579, 81, 'id_field', 'ID'),
(580, 83, 'updated_at', '1456674474'),
(581, 83, '__defaults_set', '1'),
(582, 83, 'filter', 'raw'),
(583, 83, 'id_field', 'ID'),
(1148, 48, 'updated_at', '1456674919'),
(1149, 48, '__defaults_set', '1'),
(1150, 48, 'filter', 'raw'),
(1151, 48, 'id_field', 'ID'),
(1264, 51, 'updated_at', '1456675006'),
(1265, 51, '__defaults_set', '1'),
(1266, 51, 'filter', 'raw'),
(1267, 51, 'id_field', 'ID'),
(1380, 86, '_wp_attached_file', '2016/02/sergio-appartamento-2-27-10-15-089-min.jpg'),
(1381, 86, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-2-27-10-15-089-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-089-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-089-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-089-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-2-27-10-15-089-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1382, 87, '_wp_attached_file', '2016/02/sergio-appartamento-2-27-10-15-094-min.jpg'),
(1383, 87, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-2-27-10-15-094-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-094-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-094-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-094-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-2-27-10-15-094-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1384, 88, '_wp_attached_file', '2016/02/sergio-appartamento-2-27-10-15-110-min.jpg'),
(1385, 88, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-2-27-10-15-110-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-110-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-110-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-110-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-2-27-10-15-110-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1386, 89, '_wp_attached_file', '2016/02/sergio-appartamento-2-27-10-15-131-min.jpg'),
(1387, 89, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3744;s:6:"height";i:5616;s:4:"file";s:50:"2016/02/sergio-appartamento-2-27-10-15-131-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-131-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-131-min-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:51:"sergio-appartamento-2-27-10-15-131-min-768x1152.jpg";s:5:"width";i:768;s:6:"height";i:1152;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-2-27-10-15-131-min-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1388, 90, '_wp_attached_file', '2016/02/sergio-appartamento-2-27-10-15-137-min.jpg'),
(1389, 90, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-2-27-10-15-137-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-137-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-137-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-2-27-10-15-137-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-2-27-10-15-137-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1390, 91, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-000-min.jpg'),
(1391, 91, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3744;s:6:"height";i:5616;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-000-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-000-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-000-min-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-000-min-768x1152.jpg";s:5:"width";i:768;s:6:"height";i:1152;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-000-min-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1392, 92, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-001-min.jpg'),
(1393, 92, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-001-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-001-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-001-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-001-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-001-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1394, 93, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-002-min.jpg'),
(1395, 93, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-002-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-002-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-002-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-002-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-002-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1396, 94, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-055-min.jpg'),
(1397, 94, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-055-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-055-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-055-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-055-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-055-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1398, 95, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-103-min.jpg'),
(1399, 95, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3744;s:6:"height";i:5616;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-103-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-103-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-103-min-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-103-min-768x1152.jpg";s:5:"width";i:768;s:6:"height";i:1152;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-103-min-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1400, 96, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-138-min.jpg'),
(1401, 96, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-138-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-138-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-138-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-138-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-138-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1402, 97, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-157-min.jpg'),
(1403, 97, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-157-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-157-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-157-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-157-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-157-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1404, 98, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-179-min.jpg'),
(1405, 98, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-179-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-179-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-179-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-179-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-179-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1406, 99, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-191-min.jpg'),
(1407, 99, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3744;s:6:"height";i:5616;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-191-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-191-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-191-min-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-191-min-768x1152.jpg";s:5:"width";i:768;s:6:"height";i:1152;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-191-min-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1408, 100, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-204-min.jpg'),
(1409, 100, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3744;s:6:"height";i:5616;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-204-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-204-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-204-min-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-204-min-768x1152.jpg";s:5:"width";i:768;s:6:"height";i:1152;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-204-min-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1410, 101, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-215-min.jpg'),
(1411, 101, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-215-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-215-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-215-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-215-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-215-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1412, 102, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-239-min.jpg'),
(1413, 102, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-239-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-239-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-239-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-239-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-239-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1414, 103, '_wp_attached_file', '2016/02/sergio-appartamento-3-16-12-15-267-min.jpg'),
(1415, 103, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:5616;s:6:"height";i:3744;s:4:"file";s:50:"2016/02/sergio-appartamento-3-16-12-15-267-min.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-267-min-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-267-min-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-16-12-15-267-min-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"sergio-appartamento-3-16-12-15-267-min-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(1416, 85, '_edit_last', '1'),
(1417, 85, '_edit_lock', '1456676596:1'),
(1418, 105, '__defaults_set', '1'),
(1419, 105, 'filter', 'raw'),
(1420, 105, 'id_field', 'ID'),
(1421, 106, '__defaults_set', '1'),
(1422, 106, 'filter', 'raw'),
(1423, 106, 'id_field', 'ID'),
(1433, 109, '__defaults_set', '1'),
(1434, 109, 'filter', 'raw'),
(1435, 109, 'id_field', 'ID'),
(1442, 111, '__defaults_set', '1'),
(1443, 111, 'filter', 'raw'),
(1444, 111, 'id_field', 'ID'),
(1451, 113, '__defaults_set', '1'),
(1452, 113, 'filter', 'raw'),
(1453, 113, 'id_field', 'ID'),
(1460, 115, '__defaults_set', '1'),
(1461, 115, 'filter', 'raw'),
(1462, 115, 'id_field', 'ID'),
(1469, 117, '__defaults_set', '1'),
(1470, 117, 'filter', 'raw'),
(1471, 117, 'id_field', 'ID'),
(1478, 119, '__defaults_set', '1'),
(1479, 119, 'filter', 'raw'),
(1480, 119, 'id_field', 'ID'),
(1487, 121, '__defaults_set', '1'),
(1488, 121, 'filter', 'raw'),
(1489, 121, 'id_field', 'ID'),
(1496, 123, '__defaults_set', '1'),
(1497, 123, 'filter', 'raw'),
(1498, 123, 'id_field', 'ID'),
(1505, 125, '__defaults_set', '1'),
(1506, 125, 'filter', 'raw'),
(1507, 125, 'id_field', 'ID'),
(1514, 127, '__defaults_set', '1'),
(1515, 127, 'filter', 'raw'),
(1516, 127, 'id_field', 'ID'),
(1523, 129, '__defaults_set', '1'),
(1524, 129, 'filter', 'raw'),
(1525, 129, 'id_field', 'ID'),
(1532, 131, '__defaults_set', '1'),
(1533, 131, 'filter', 'raw'),
(1534, 131, 'id_field', 'ID'),
(1541, 133, '__defaults_set', '1'),
(1542, 133, 'filter', 'raw'),
(1543, 133, 'id_field', 'ID'),
(1550, 135, '__defaults_set', '1'),
(1551, 135, 'filter', 'raw'),
(1552, 135, 'id_field', 'ID'),
(1559, 137, '__defaults_set', '1'),
(1560, 137, 'filter', 'raw'),
(1561, 137, 'id_field', 'ID'),
(1568, 139, '__defaults_set', '1'),
(1569, 139, 'filter', 'raw'),
(1570, 139, 'id_field', 'ID'),
(1577, 141, '__defaults_set', '1'),
(1578, 141, 'filter', 'raw'),
(1579, 141, 'id_field', 'ID'),
(2037, 21, 'filter', 'raw'),
(2038, 21, 'meta_id', '41'),
(2039, 21, 'post_id', '21'),
(2040, 21, 'meta_key', 'name'),
(2041, 21, 'meta_value', 'photocrati-nextgen_basic_thumbnails'),
(2042, 21, 'title', 'NextGEN Miniature Base'),
(2043, 21, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_gallery/static/thumb_preview.jpg'),
(2044, 21, 'default_source', 'galleries'),
(2045, 21, 'view_order', '10000'),
(2046, 21, 'name', 'photocrati-nextgen_basic_thumbnails'),
(2047, 21, 'installed_at_version', '2.1.23'),
(2048, 21, 'hidden_from_ui', ''),
(2049, 21, '__defaults_set', '1'),
(2050, 21, 'entity_types', 'WyJpbWFnZSJd'),
(2051, 21, 'id_field', 'ID'),
(2052, 21, 'settings', 'eyJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIxIiwidGh1bWJuYWlsX3dpZHRoIjoiNjI5IiwidGh1bWJuYWlsX2hlaWdodCI6IjI5MyIsInRodW1ibmFpbF9jcm9wIjoiMSIsImltYWdlc19wZXJfcGFnZSI6IjEiLCJudW1iZXJfb2ZfY29sdW1ucyI6IjAiLCJhamF4X3BhZ2luYXRpb24iOiIwIiwic2hvd19hbGxfaW5fbGlnaHRib3giOiIxIiwidXNlX2ltYWdlYnJvd3Nlcl9lZmZlY3QiOiIwIiwic2hvd19zbGlkZXNob3dfbGluayI6IjAiLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW01vc3RyYSBzbGlkZXNob3ddIiwidGVtcGxhdGUiOiJcL1VzZXJzXC9yb2JlcnRvXC9kZXZcL3d3d1wvY2FzYXJhYmF0dGlcL3dwLWNvbnRlbnRcL3RoZW1lc1wvY2FzYXJhYmF0dGlcL25nZ2FsbGVyeVwvZ2FsbGVyeS1saW1vbmFpYS5waHAiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJ0aHVtYm5haWxfcXVhbGl0eSI6IjEwMCIsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(2053, 22, 'filter', 'raw'),
(2054, 22, 'meta_id', '53'),
(2055, 22, 'post_id', '22'),
(2056, 22, 'meta_key', 'name'),
(2057, 22, 'meta_value', 'photocrati-nextgen_basic_slideshow'),
(2058, 22, 'title', 'NextGEN Slideshow Base'),
(2059, 22, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_gallery/static/slideshow_preview.jpg'),
(2060, 22, 'default_source', 'galleries'),
(2061, 22, 'view_order', '10010'),
(2062, 22, 'name', 'photocrati-nextgen_basic_slideshow'),
(2063, 22, 'installed_at_version', '2.1.23'),
(2064, 22, 'hidden_from_ui', ''),
(2065, 22, '__defaults_set', '1'),
(2066, 22, 'entity_types', 'WyJpbWFnZSJd'),
(2067, 22, 'id_field', 'ID'),
(2068, 22, 'settings', 'eyJnYWxsZXJ5X3dpZHRoIjoiNjAwIiwiZ2FsbGVyeV9oZWlnaHQiOiI0MDAiLCJjeWNsZV9lZmZlY3QiOiJmYWRlIiwiY3ljbGVfaW50ZXJ2YWwiOiIxMCIsInNob3dfdGh1bWJuYWlsX2xpbmsiOiIwIiwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltNb3N0cmEgbWluaWF0dXJlXSIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(2069, 23, 'filter', 'raw'),
(2070, 23, 'meta_id', '65'),
(2071, 23, 'post_id', '23'),
(2072, 23, 'meta_key', 'name'),
(2073, 23, 'meta_value', 'photocrati-nextgen_basic_imagebrowser'),
(2074, 23, 'title', 'NextGEN ImageBrowser Base'),
(2075, 23, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_imagebrowser/static/preview.jpg'),
(2076, 23, 'default_source', 'galleries'),
(2077, 23, 'view_order', '10020'),
(2078, 23, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(2079, 23, 'installed_at_version', '2.1.23'),
(2080, 23, 'hidden_from_ui', ''),
(2081, 23, '__defaults_set', '1'),
(2082, 23, 'entity_types', 'WyJpbWFnZSJd'),
(2083, 23, 'id_field', 'ID'),
(2084, 23, 'settings', 'eyJhamF4X3BhZ2luYXRpb24iOiIwIiwidGVtcGxhdGUiOiIiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(2085, 24, 'filter', 'raw'),
(2086, 24, 'meta_id', '78'),
(2087, 24, 'post_id', '24'),
(2088, 24, 'meta_key', 'name'),
(2089, 24, 'meta_value', 'photocrati-nextgen_basic_singlepic'),
(2090, 24, 'title', 'NextGEN Basic SinglePic'),
(2091, 24, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_singlepic/static/preview.gif'),
(2092, 24, 'default_source', 'galleries'),
(2093, 24, 'view_order', '10060'),
(2094, 24, 'hidden_from_ui', '1'),
(2095, 24, 'name', 'photocrati-nextgen_basic_singlepic'),
(2096, 24, 'installed_at_version', '2.1.23'),
(2097, 24, '__defaults_set', '1'),
(2098, 24, 'entity_types', 'WyJpbWFnZSJd'),
(2099, 24, 'id_field', 'ID'),
(2100, 24, 'settings', 'eyJ3aWR0aCI6IiIsImhlaWdodCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsImZsb2F0IjoiIiwicXVhbGl0eSI6IjEwMCIsImNyb3AiOiIwIiwiZGlzcGxheV93YXRlcm1hcmsiOiIwIiwiZGlzcGxheV9yZWZsZWN0aW9uIjoiMCIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibW9kZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(2101, 25, 'filter', 'raw'),
(2102, 25, 'meta_id', '89'),
(2103, 25, 'post_id', '25'),
(2104, 25, 'meta_key', 'name'),
(2105, 25, 'meta_value', 'photocrati-nextgen_basic_tagcloud'),
(2106, 25, 'title', 'NextGEN Basic TagCloud'),
(2107, 25, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_tagcloud/static/preview.gif'),
(2108, 25, 'default_source', 'tags'),
(2109, 25, 'view_order', '10100'),
(2110, 25, 'name', 'photocrati-nextgen_basic_tagcloud'),
(2111, 25, 'installed_at_version', '2.1.23'),
(2112, 25, 'hidden_from_ui', ''),
(2113, 25, '__defaults_set', '1'),
(2114, 25, 'entity_types', 'WyJpbWFnZSJd'),
(2115, 25, 'id_field', 'ID'),
(2116, 25, 'settings', 'eyJudW1iZXIiOiI0NSIsImRpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(2117, 26, 'filter', 'raw'),
(2118, 26, 'meta_id', '101'),
(2119, 26, 'post_id', '26'),
(2120, 26, 'meta_key', 'name'),
(2121, 26, 'meta_value', 'photocrati-nextgen_basic_compact_album'),
(2122, 26, 'title', 'NextGEN Album Compatto Base'),
(2123, 26, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_album/static/compact_preview.jpg'),
(2124, 26, 'default_source', 'albums'),
(2125, 26, 'view_order', '10200'),
(2126, 26, 'name', 'photocrati-nextgen_basic_compact_album'),
(2127, 26, 'installed_at_version', '2.1.23'),
(2128, 26, 'hidden_from_ui', ''),
(2129, 26, '__defaults_set', '1'),
(2130, 26, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(2131, 26, 'id_field', 'ID'),
(2132, 26, 'settings', 'eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOiIwIiwiZW5hYmxlX2JyZWFkY3J1bWJzIjoiMCIsInRlbXBsYXRlIjoiIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjAiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(2133, 27, 'filter', 'raw'),
(2134, 27, 'meta_id', '113'),
(2135, 27, 'post_id', '27'),
(2136, 27, 'meta_key', 'name'),
(2137, 27, 'meta_value', 'photocrati-nextgen_basic_extended_album'),
(2138, 27, 'title', 'NextGEN Album Esteso Base'),
(2139, 27, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_album/static/extended_preview.jpg'),
(2140, 27, 'default_source', 'albums'),
(2141, 27, 'view_order', '10210'),
(2142, 27, 'name', 'photocrati-nextgen_basic_extended_album'),
(2143, 27, 'installed_at_version', '2.1.23'),
(2144, 27, 'hidden_from_ui', ''),
(2145, 27, '__defaults_set', '1'),
(2146, 27, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(2147, 27, 'id_field', 'ID'),
(2148, 27, 'settings', 'eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjoiMCIsImVuYWJsZV9icmVhZGNydW1icyI6IjAiLCJ0ZW1wbGF0ZSI6IiIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6IjAiLCJ0aHVtYm5haWxfd2lkdGgiOiIyNDAiLCJ0aHVtYm5haWxfaGVpZ2h0IjoiMTYwIiwidGh1bWJuYWlsX2Nyb3AiOiIxIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJ0aHVtYm5haWxfcXVhbGl0eSI6MTAwLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(2149, 143, '__defaults_set', '1'),
(2150, 143, 'filter', 'raw'),
(2151, 143, 'id_field', 'ID'),
(2152, 144, '__defaults_set', '1'),
(2153, 144, 'filter', 'raw'),
(2154, 144, 'id_field', 'ID'),
(2161, 146, '__defaults_set', '1'),
(2162, 146, 'filter', 'raw'),
(2163, 146, 'id_field', 'ID'),
(2164, 147, '__defaults_set', '1'),
(2165, 147, 'filter', 'raw'),
(2166, 147, 'id_field', 'ID'),
(2170, 148, '__defaults_set', '1'),
(2171, 148, 'filter', 'raw'),
(2172, 148, 'id_field', 'ID'),
(2173, 149, '__defaults_set', '1'),
(2174, 149, 'filter', 'raw'),
(2175, 149, 'id_field', 'ID'),
(2179, 150, '__defaults_set', '1'),
(2180, 150, 'filter', 'raw'),
(2181, 150, 'id_field', 'ID'),
(2182, 151, '__defaults_set', '1'),
(2183, 151, 'filter', 'raw'),
(2184, 151, 'id_field', 'ID'),
(2188, 152, '__defaults_set', '1'),
(2189, 152, 'filter', 'raw'),
(2190, 152, 'id_field', 'ID'),
(2191, 153, '__defaults_set', '1'),
(2192, 153, 'filter', 'raw'),
(2193, 153, 'id_field', 'ID'),
(2197, 154, '__defaults_set', '1'),
(2198, 154, 'filter', 'raw'),
(2199, 154, 'id_field', 'ID'),
(2200, 155, '__defaults_set', '1'),
(2201, 155, 'filter', 'raw'),
(2202, 155, 'id_field', 'ID'),
(2206, 156, '__defaults_set', '1'),
(2207, 156, 'filter', 'raw'),
(2208, 156, 'id_field', 'ID'),
(2209, 157, '__defaults_set', '1'),
(2210, 157, 'filter', 'raw'),
(2211, 157, 'id_field', 'ID'),
(2215, 158, '__defaults_set', '1'),
(2216, 158, 'filter', 'raw'),
(2217, 158, 'id_field', 'ID'),
(2218, 159, '__defaults_set', '1'),
(2219, 159, 'filter', 'raw'),
(2220, 159, 'id_field', 'ID'),
(2224, 160, '__defaults_set', '1'),
(2225, 160, 'filter', 'raw'),
(2226, 160, 'id_field', 'ID'),
(2227, 161, '__defaults_set', '1'),
(2228, 161, 'filter', 'raw'),
(2229, 161, 'id_field', 'ID'),
(2233, 162, '__defaults_set', '1'),
(2234, 162, 'filter', 'raw'),
(2235, 162, 'id_field', 'ID'),
(2236, 163, '__defaults_set', '1'),
(2237, 163, 'filter', 'raw'),
(2238, 163, 'id_field', 'ID'),
(2242, 164, '__defaults_set', '1'),
(2243, 164, 'filter', 'raw'),
(2244, 164, 'id_field', 'ID'),
(2245, 165, '__defaults_set', '1'),
(2246, 165, 'filter', 'raw'),
(2247, 165, 'id_field', 'ID'),
(2251, 166, '__defaults_set', '1'),
(2252, 166, 'filter', 'raw'),
(2253, 166, 'id_field', 'ID'),
(2254, 167, '__defaults_set', '1'),
(2255, 167, 'filter', 'raw'),
(2256, 167, 'id_field', 'ID'),
(2260, 168, '__defaults_set', '1'),
(2261, 168, 'filter', 'raw'),
(2262, 168, 'id_field', 'ID'),
(2263, 145, '__defaults_set', '1'),
(2264, 145, 'filter', 'raw'),
(2265, 145, 'id_field', 'ID'),
(2365, 185, '__defaults_set', '1'),
(2366, 185, 'filter', 'raw'),
(2367, 185, 'id_field', 'ID'),
(2371, 170, '__defaults_set', '1'),
(2372, 170, 'filter', 'raw'),
(2373, 170, 'id_field', 'ID'),
(2374, 171, '__defaults_set', '1'),
(2375, 171, 'filter', 'raw'),
(2376, 171, 'id_field', 'ID'),
(2377, 172, '__defaults_set', '1'),
(2378, 172, 'filter', 'raw'),
(2379, 172, 'id_field', 'ID'),
(2380, 173, '__defaults_set', '1'),
(2381, 173, 'filter', 'raw'),
(2382, 173, 'id_field', 'ID'),
(2383, 174, '__defaults_set', '1'),
(2384, 174, 'filter', 'raw'),
(2385, 174, 'id_field', 'ID'),
(2386, 175, '__defaults_set', '1'),
(2387, 175, 'filter', 'raw'),
(2388, 175, 'id_field', 'ID'),
(2389, 176, '__defaults_set', '1'),
(2390, 176, 'filter', 'raw'),
(2391, 176, 'id_field', 'ID'),
(2392, 177, '__defaults_set', '1'),
(2393, 177, 'filter', 'raw'),
(2394, 177, 'id_field', 'ID'),
(2395, 178, '__defaults_set', '1'),
(2396, 178, 'filter', 'raw'),
(2397, 178, 'id_field', 'ID'),
(2398, 179, '__defaults_set', '1'),
(2399, 179, 'filter', 'raw'),
(2400, 179, 'id_field', 'ID'),
(2401, 180, '__defaults_set', '1'),
(2402, 180, 'filter', 'raw'),
(2403, 180, 'id_field', 'ID'),
(2404, 181, '__defaults_set', '1'),
(2405, 181, 'filter', 'raw'),
(2406, 181, 'id_field', 'ID'),
(2407, 182, '__defaults_set', '1'),
(2408, 182, 'filter', 'raw'),
(2409, 182, 'id_field', 'ID'),
(2410, 183, '__defaults_set', '1'),
(2411, 183, 'filter', 'raw'),
(2412, 183, 'id_field', 'ID'),
(2413, 184, '__defaults_set', '1'),
(2414, 184, 'filter', 'raw'),
(2415, 184, 'id_field', 'ID'),
(2416, 169, '__defaults_set', '1'),
(2417, 169, 'filter', 'raw'),
(2418, 169, 'id_field', 'ID'),
(2419, 186, '__defaults_set', '1'),
(2420, 186, 'filter', 'raw'),
(2421, 186, 'id_field', 'ID'),
(2422, 187, '__defaults_set', '1'),
(2423, 187, 'filter', 'raw'),
(2424, 187, 'id_field', 'ID'),
(2431, 189, '__defaults_set', '1'),
(2432, 189, 'filter', 'raw'),
(2433, 189, 'id_field', 'ID'),
(2434, 190, '__defaults_set', '1'),
(2435, 190, 'filter', 'raw'),
(2436, 190, 'id_field', 'ID'),
(2440, 191, '__defaults_set', '1'),
(2441, 191, 'filter', 'raw'),
(2442, 191, 'id_field', 'ID'),
(2443, 192, '__defaults_set', '1'),
(2444, 192, 'filter', 'raw'),
(2445, 192, 'id_field', 'ID'),
(2449, 193, '__defaults_set', '1'),
(2450, 193, 'filter', 'raw'),
(2451, 193, 'id_field', 'ID'),
(2452, 194, '__defaults_set', '1'),
(2453, 194, 'filter', 'raw'),
(2454, 194, 'id_field', 'ID'),
(2458, 195, '__defaults_set', '1'),
(2459, 195, 'filter', 'raw'),
(2460, 195, 'id_field', 'ID'),
(2461, 196, '__defaults_set', '1'),
(2462, 196, 'filter', 'raw'),
(2463, 196, 'id_field', 'ID'),
(2467, 188, '__defaults_set', '1'),
(2468, 188, 'filter', 'raw'),
(2469, 188, 'id_field', 'ID'),
(2470, 197, '__defaults_set', '1'),
(2471, 197, 'filter', 'raw'),
(2472, 197, 'id_field', 'ID'),
(2473, 198, '__defaults_set', '1'),
(2474, 198, 'filter', 'raw'),
(2475, 198, 'id_field', 'ID'),
(2479, 199, '__defaults_set', '1'),
(2480, 199, 'filter', 'raw'),
(2481, 199, 'id_field', 'ID'),
(2482, 200, '__defaults_set', '1'),
(2483, 200, 'filter', 'raw'),
(2484, 200, 'id_field', 'ID'),
(2488, 201, '__defaults_set', '1'),
(2489, 201, 'filter', 'raw'),
(2490, 201, 'id_field', 'ID'),
(2491, 202, '__defaults_set', '1'),
(2492, 202, 'filter', 'raw'),
(2493, 202, 'id_field', 'ID'),
(2497, 203, '__defaults_set', '1'),
(2498, 203, 'filter', 'raw'),
(2499, 203, 'id_field', 'ID'),
(2500, 204, '__defaults_set', '1'),
(2501, 204, 'filter', 'raw'),
(2502, 204, 'id_field', 'ID'),
(2506, 205, '__defaults_set', '1'),
(2507, 205, 'filter', 'raw'),
(2508, 205, 'id_field', 'ID'),
(2509, 206, '__defaults_set', '1'),
(2510, 206, 'filter', 'raw'),
(2511, 206, 'id_field', 'ID'),
(2515, 207, '__defaults_set', '1'),
(2516, 207, 'filter', 'raw'),
(2517, 207, 'id_field', 'ID'),
(2518, 208, '__defaults_set', '1'),
(2519, 208, 'filter', 'raw'),
(2520, 208, 'id_field', 'ID'),
(2524, 209, '__defaults_set', '1'),
(2525, 209, 'filter', 'raw'),
(2526, 209, 'id_field', 'ID'),
(2527, 210, '__defaults_set', '1'),
(2528, 210, 'filter', 'raw'),
(2529, 210, 'id_field', 'ID'),
(2533, 211, '__defaults_set', '1'),
(2534, 211, 'filter', 'raw'),
(2535, 211, 'id_field', 'ID'),
(2536, 212, '__defaults_set', '1'),
(2537, 212, 'filter', 'raw'),
(2538, 212, 'id_field', 'ID'),
(2542, 213, '__defaults_set', '1'),
(2543, 213, 'filter', 'raw'),
(2544, 213, 'id_field', 'ID'),
(2545, 214, '__defaults_set', '1'),
(2546, 214, 'filter', 'raw'),
(2547, 214, 'id_field', 'ID'),
(2551, 215, '__defaults_set', '1'),
(2552, 215, 'filter', 'raw'),
(2553, 215, 'id_field', 'ID'),
(2554, 216, '__defaults_set', '1'),
(2555, 216, 'filter', 'raw'),
(2556, 216, 'id_field', 'ID');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2560, 217, '__defaults_set', '1'),
(2561, 217, 'filter', 'raw'),
(2562, 217, 'id_field', 'ID'),
(2563, 218, '__defaults_set', '1'),
(2564, 218, 'filter', 'raw'),
(2565, 218, 'id_field', 'ID'),
(2569, 219, '__defaults_set', '1'),
(2570, 219, 'filter', 'raw'),
(2571, 219, 'id_field', 'ID'),
(2572, 220, '__defaults_set', '1'),
(2573, 220, 'filter', 'raw'),
(2574, 220, 'id_field', 'ID'),
(2578, 221, '__defaults_set', '1'),
(2579, 221, 'filter', 'raw'),
(2580, 221, 'id_field', 'ID'),
(2581, 222, '__defaults_set', '1'),
(2582, 222, 'filter', 'raw'),
(2583, 222, 'id_field', 'ID'),
(2587, 223, '__defaults_set', '1'),
(2588, 223, 'filter', 'raw'),
(2589, 223, 'id_field', 'ID'),
(2590, 224, '_edit_last', '1'),
(2591, 224, '_edit_lock', '1456680240:1'),
(2594, 227, '_edit_last', '1'),
(2595, 227, '_edit_lock', '1457189915:1'),
(2596, 227, '_wpas_done_all', '1'),
(2597, 227, 'sharing_disabled', '1'),
(2600, 231, '_edit_last', '1'),
(2601, 231, '_edit_lock', '1457554755:1'),
(2602, 231, '_wpas_done_all', '1'),
(2607, 234, '_wp_attached_file', '2016/03/sergio-appartamento-2-27-10-15-027.jpg'),
(2608, 234, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:46:"2016/03/sergio-appartamento-2-27-10-15-027.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-027-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-027-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-027-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:47:"sergio-appartamento-2-27-10-15-027-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:2:"10";s:6:"credit";s:6:"Picasa";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1445948888";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"20";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:6:"0.0125";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(2609, 235, '_wp_attached_file', '2016/03/sergio-appartamento-2-27-10-15-166.jpg'),
(2610, 235, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:683;s:6:"height";i:1024;s:4:"file";s:46:"2016/03/sergio-appartamento-2-27-10-15-166.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-166-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-166-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:47:"sergio-appartamento-2-27-10-15-166-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:2:"10";s:6:"credit";s:6:"Picasa";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1445952328";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"24";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:6:"0.0125";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(2611, 236, '_wp_attached_file', '2016/03/sergio-appartamento-2-27-10-15-360.jpg'),
(2612, 236, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:46:"2016/03/sergio-appartamento-2-27-10-15-360.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-360-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-360-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:46:"sergio-appartamento-2-27-10-15-360-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:47:"sergio-appartamento-2-27-10-15-360-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"7.1";s:6:"credit";s:6:"Picasa";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1445965170";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"20";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:17:"0.076923076923077";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(2613, 237, '_wp_attached_file', '2016/03/sergio-appartamento-2-RR-27-10-15-298.jpg'),
(2614, 237, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:49:"2016/03/sergio-appartamento-2-RR-27-10-15-298.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:49:"sergio-appartamento-2-RR-27-10-15-298-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:49:"sergio-appartamento-2-RR-27-10-15-298-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:49:"sergio-appartamento-2-RR-27-10-15-298-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:50:"sergio-appartamento-2-RR-27-10-15-298-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:2:"10";s:6:"credit";s:6:"Picasa";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1445962829";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"20";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:3:"0.5";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(2615, 238, '_wp_attached_file', '2016/03/sergio-appartamento-3-RR-16-12-15-031.jpg'),
(2616, 238, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:49:"2016/03/sergio-appartamento-3-RR-16-12-15-031.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:49:"sergio-appartamento-3-RR-16-12-15-031-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:49:"sergio-appartamento-3-RR-16-12-15-031-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:49:"sergio-appartamento-3-RR-16-12-15-031-768x512.jpg";s:5:"width";i:768;s:6:"height";i:512;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:50:"sergio-appartamento-3-RR-16-12-15-031-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:2:"14";s:6:"credit";s:6:"Picasa";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1450270078";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"20";s:3:"iso";s:3:"250";s:13:"shutter_speed";s:3:"0.4";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(2617, 108, '__defaults_set', '1'),
(2618, 108, 'filter', 'raw'),
(2619, 108, 'id_field', 'ID'),
(2620, 107, '__defaults_set', '1'),
(2621, 107, 'filter', 'raw'),
(2622, 107, 'id_field', 'ID'),
(2623, 110, '__defaults_set', '1'),
(2624, 110, 'filter', 'raw'),
(2625, 110, 'id_field', 'ID'),
(2626, 112, '__defaults_set', '1'),
(2627, 112, 'filter', 'raw'),
(2628, 112, 'id_field', 'ID'),
(2629, 114, '__defaults_set', '1'),
(2630, 114, 'filter', 'raw'),
(2631, 114, 'id_field', 'ID'),
(2632, 116, '__defaults_set', '1'),
(2633, 116, 'filter', 'raw'),
(2634, 116, 'id_field', 'ID'),
(2635, 118, '__defaults_set', '1'),
(2636, 118, 'filter', 'raw'),
(2637, 118, 'id_field', 'ID'),
(2638, 120, '__defaults_set', '1'),
(2639, 120, 'filter', 'raw'),
(2640, 120, 'id_field', 'ID'),
(2641, 122, '__defaults_set', '1'),
(2642, 122, 'filter', 'raw'),
(2643, 122, 'id_field', 'ID'),
(2644, 124, '__defaults_set', '1'),
(2645, 124, 'filter', 'raw'),
(2646, 124, 'id_field', 'ID'),
(2647, 126, '__defaults_set', '1'),
(2648, 126, 'filter', 'raw'),
(2649, 126, 'id_field', 'ID'),
(2650, 128, '__defaults_set', '1'),
(2651, 128, 'filter', 'raw'),
(2652, 128, 'id_field', 'ID'),
(2653, 130, '__defaults_set', '1'),
(2654, 130, 'filter', 'raw'),
(2655, 130, 'id_field', 'ID'),
(2656, 132, '__defaults_set', '1'),
(2657, 132, 'filter', 'raw'),
(2658, 132, 'id_field', 'ID'),
(2659, 134, '__defaults_set', '1'),
(2660, 134, 'filter', 'raw'),
(2661, 134, 'id_field', 'ID'),
(2662, 136, '__defaults_set', '1'),
(2663, 136, 'filter', 'raw'),
(2664, 136, 'id_field', 'ID'),
(2665, 138, '__defaults_set', '1'),
(2666, 138, 'filter', 'raw'),
(2667, 138, 'id_field', 'ID'),
(2668, 140, '__defaults_set', '1'),
(2669, 140, 'filter', 'raw'),
(2670, 140, 'id_field', 'ID'),
(2671, 142, '__defaults_set', '1'),
(2672, 142, 'filter', 'raw'),
(2673, 142, 'id_field', 'ID');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-02-16 21:13:48', '2016-02-16 20:13:48', 'Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o cancellalo e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'trash', 'open', 'open', '', 'ciao-mondo', '', '', '2016-02-28 15:17:20', '2016-02-28 14:17:20', '', 0, 'http://casarabatti.dev/?p=1', 0, 'post', '', 1),
(2, 1, '2016-02-16 21:13:48', '2016-02-16 20:13:48', 'Questa è una pagina di esempio. Differisce da un articolo di blog per rimane in un solo posto ed appare nel menu di navigazione del sito (questo nella maggior parte dei temi). Molte persone iniziano con una pagina di Info che li introduce ai potenziali visitatori del sito. Tale pagina potrebbe contenere un testo del tipo:\n\n<blockquote>Salve! Sono un pony express di giorno, un aspirante attore di notte e questo è il mio blog. Vivo a Los Angeles, ho un gran bel cane di nome Jack e mi piace la pi&#241;a coladas. (E infradiciarmi sotto la pioggia.)</blockquote>\n\n...o cose di questo genere:\n\n<blockquote>La XYZ Doohickey Company è stata fondata nel 1971, e ha fornito doohickeys di qualità al pubblico fin d''allora. Si trova a Gotham City, XYZ impiega oltre 2,000 persone e produce ogni genere di cose impressionanti per la comunità di Gotham.</blockquote>\n\nDa nuovo utente WordPress puoi andare sulla <a href="http://casarabatti.dev/wp-admin/">tua bacheca</a> per cancellare questa pagina e creare nuove pagine per i tuoi contenuti. Buon divertimento!', 'Pagina di esempio.', '', 'publish', 'closed', 'open', '', 'pagina-di-esempio', '', '', '2016-02-16 21:13:48', '2016-02-16 20:13:48', '', 0, 'http://casarabatti.dev/?page_id=2', 0, 'page', '', 0),
(6, 1, '2016-02-20 02:07:59', '2016-02-20 01:07:59', '', 'slide_01_b', '', 'inherit', 'open', 'closed', '', 'slide_01_b', '', '', '2016-02-20 02:07:59', '2016-02-20 01:07:59', '', 0, 'http://casarabatti.dev/wp-content/uploads/2016/02/slide_01_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(7, 1, '2016-02-20 02:08:06', '2016-02-20 01:08:06', '', 'slide_02_b', '', 'inherit', 'open', 'closed', '', 'slide_02_b', '', '', '2016-02-20 02:08:06', '2016-02-20 01:08:06', '', 0, 'http://casarabatti.dev/wp-content/uploads/2016/02/slide_02_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(8, 1, '2016-02-20 02:08:13', '2016-02-20 01:08:13', '', 'slide_03_b', '', 'inherit', 'open', 'closed', '', 'slide_03_b', '', '', '2016-02-20 02:08:13', '2016-02-20 01:08:13', '', 0, 'http://casarabatti.dev/wp-content/uploads/2016/02/slide_03_b.jpg', 0, 'attachment', 'image/jpeg', 0),
(9, 1, '2016-02-20 02:08:16', '2016-02-20 01:08:16', '', 'slide_05_b-1', '', 'inherit', 'open', 'closed', '', 'slide_05_b-1', '', '', '2016-02-20 02:08:16', '2016-02-20 01:08:16', '', 0, 'http://casarabatti.dev/wp-content/uploads/2016/02/slide_05_b-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(11, 1, '2016-02-26 20:24:56', '2016-02-26 19:24:56', '<p class="p1"><span class="s1">Una gemma preziosa della Firenze rinascimentale che la tradizione di una famiglia fiorentina ha voluto condividere coi i suoi ospiti. Nel cuore della citta’, i profumi del limone, le palme centenarie e l''ombra degli olivi del grazioso<span class="Apple-converted-space">  </span>giardino interno offrono una fuga indimenticabile dal quotidiano.</span></p>\r\n<p class="p1"><span class="s1">Casa Rabatti<span class="Apple-converted-space">  </span>vi aspetta in un antico palazzo,<span class="Apple-converted-space">  </span>trasformato nell''800, ed oggi dotato di tutti i<span class="Apple-converted-space">  </span>comfort per farvi godere una indimenticabile esperienza allietata da un clima familiare e cordiale offrendovi soluzioni ideali<span class="Apple-converted-space">  </span>per soggiorni<span class="Apple-converted-space">  </span>di breve o lungo periodo</span></p>', 'La Struttura', '', 'publish', 'open', 'open', '', 'la-struttura', '', '', '2016-02-28 15:18:58', '2016-02-28 14:18:58', '', 0, 'http://casarabatti.dev/?p=11', 0, 'post', '', 0),
(12, 1, '2016-02-26 20:24:56', '2016-02-26 19:24:56', '', 'La Struttura', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2016-02-26 20:24:56', '2016-02-26 19:24:56', '', 11, 'http://casarabatti.dev/?p=12', 0, 'revision', '', 0),
(13, 1, '2016-02-27 18:29:40', '2016-02-27 17:29:40', '', 'sergio appartamento 2   27-10-15 089', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-089', '', '', '2016-02-27 18:29:40', '2016-02-27 17:29:40', '', 0, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-2-27-10-15-089.jpg', 0, 'attachment', 'image/jpeg', 0),
(14, 1, '2016-02-28 15:17:20', '2016-02-28 14:17:20', 'Benvenuto in WordPress. Questo è il tuo primo articolo. Modificalo o cancellalo e inizia a creare il tuo blog!', 'Ciao mondo!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2016-02-28 15:17:20', '2016-02-28 14:17:20', '', 1, 'http://casarabatti.dev/?p=14', 0, 'revision', '', 0),
(15, 1, '2016-02-28 15:18:58', '2016-02-28 14:18:58', '<p class="p1"><span class="s1">Una gemma preziosa della Firenze rinascimentale che la tradizione di una famiglia fiorentina ha voluto condividere coi i suoi ospiti. Nel cuore della citta’, i profumi del limone, le palme centenarie e l''ombra degli olivi del grazioso<span class="Apple-converted-space">  </span>giardino interno offrono una fuga indimenticabile dal quotidiano.</span></p>\r\n<p class="p1"><span class="s1">Casa Rabatti<span class="Apple-converted-space">  </span>vi aspetta in un antico palazzo,<span class="Apple-converted-space">  </span>trasformato nell''800, ed oggi dotato di tutti i<span class="Apple-converted-space">  </span>comfort per farvi godere una indimenticabile esperienza allietata da un clima familiare e cordiale offrendovi soluzioni ideali<span class="Apple-converted-space">  </span>per soggiorni<span class="Apple-converted-space">  </span>di breve o lungo periodo</span></p>', 'La Struttura', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2016-02-28 15:18:58', '2016-02-28 14:18:58', '', 11, 'http://casarabatti.dev/?p=15', 0, 'revision', '', 0),
(16, 1, '2016-02-28 15:27:45', '2016-02-28 14:27:45', '<p class="p1"><span class="s1">Le famiglie numerose e i gruppi possono trovare la giusta soluzione scegliendo tra camere e appartamenti.</span></p>\r\n<p class="p1"><strong><span class="s1">Spazi comuni </span></strong></p>\r\n<p class="p1"><span class="s1">Le camere si affacciano su un corridoio in comune che porta direttamente in giardino. </span></p>\r\n<p class="p1"><span class="s1">Nel corridoio si può ammirare il pozzo del 1823 riportato<span class="Apple-converted-space">  </span>alla luce durante i recenti lavori di ristrutturazione<span class="Apple-converted-space">  </span>grazie ad un importante recupero architettonico.</span></p>\r\n<p class="p1"></p>\r\n<p class="p1"></p>', 'I Locali', '', 'publish', 'open', 'open', '', 'i-locali', '', '', '2016-02-28 15:27:45', '2016-02-28 14:27:45', '', 0, 'http://casarabatti.dev/?p=16', 0, 'post', '', 0),
(17, 1, '2016-02-28 15:27:45', '2016-02-28 14:27:45', '<p class="p1"><span class="s1">Le famiglie numerose e i gruppi possono trovare la giusta soluzione scegliendo tra camere e appartamenti.</span></p>\r\n<p class="p1"><strong><span class="s1">Spazi comuni </span></strong></p>\r\n<p class="p1"><span class="s1">Le camere si affacciano su un corridoio in comune che porta direttamente in giardino. </span></p>\r\n<p class="p1"><span class="s1">Nel corridoio si può ammirare il pozzo del 1823 riportato<span class="Apple-converted-space">  </span>alla luce durante i recenti lavori di ristrutturazione<span class="Apple-converted-space">  </span>grazie ad un importante recupero architettonico.</span></p>\r\n<p class="p1"></p>\r\n<p class="p1"></p>', 'I Locali', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2016-02-28 15:27:45', '2016-02-28 14:27:45', '', 16, 'http://casarabatti.dev/?p=17', 0, 'revision', '', 0),
(18, 1, '2016-02-28 15:41:56', '2016-02-28 14:41:56', 'Siamo vicini alle più importanti attrazioni di Firenze:<br><br>\r\n\r\nFortezza da basso (Sede Fiere) - 650 metri<br><br>\r\n\r\nPiazza del Duomo - 800 metri<br><br>\r\n\r\nPalazzo dei Congressi - 850 metri<br><br>\r\n\r\nPiazza della Stazione - 750 metri<br><br>\r\n\r\nPiazza della Signoria - 1300 metri<br><br>\r\n\r\nMuseo degli Uffizi - 1500 metri<br><br>\r\n\r\nPiazza Santa Croce - 1700 metri<br><br>\r\n\r\nParco delle Cascine - 1900 metri<br><br>\r\n\r\nPiazzale Michelangelo - 2800 metri<br><br>\r\n\r\n&nbsp;', 'Dove Siamo', '', 'publish', 'open', 'open', '', 'dove-siamo', '', '', '2016-02-28 15:43:54', '2016-02-28 14:43:54', '', 0, 'http://casarabatti.dev/?p=18', 0, 'post', '', 0),
(19, 1, '2016-02-28 15:41:56', '2016-02-28 14:41:56', 'Siamo vicini alle più importanti attrazioni di Firenze:\r\n\r\nFortezza da basso (Sede Fiere) - 650 metri\r\n\r\nPiazza del Duomo - 800 metri\r\n\r\nPalazzo dei Congressi - 850 metri\r\n\r\nPiazza della Stazione - 750 metri\r\n\r\nPiazza della Signoria - 1300 metri\r\n\r\nMuseo degli Uffizi - 1500 metri\r\n\r\nPiazza Santa Croce - 1700 metri\r\n\r\nParco delle Cascine - 1900 metri\r\n\r\nPiazzale Michelangelo - 2800 metri\r\n\r\n&nbsp;', 'Dove Siamo', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2016-02-28 15:41:56', '2016-02-28 14:41:56', '', 18, 'http://casarabatti.dev/?p=19', 0, 'revision', '', 0),
(20, 1, '2016-02-28 15:43:54', '2016-02-28 14:43:54', 'Siamo vicini alle più importanti attrazioni di Firenze:<br><br>\r\n\r\nFortezza da basso (Sede Fiere) - 650 metri<br><br>\r\n\r\nPiazza del Duomo - 800 metri<br><br>\r\n\r\nPalazzo dei Congressi - 850 metri<br><br>\r\n\r\nPiazza della Stazione - 750 metri<br><br>\r\n\r\nPiazza della Signoria - 1300 metri<br><br>\r\n\r\nMuseo degli Uffizi - 1500 metri<br><br>\r\n\r\nPiazza Santa Croce - 1700 metri<br><br>\r\n\r\nParco delle Cascine - 1900 metri<br><br>\r\n\r\nPiazzale Michelangelo - 2800 metri<br><br>\r\n\r\n&nbsp;', 'Dove Siamo', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2016-02-28 15:43:54', '2016-02-28 14:43:54', '', 18, 'http://casarabatti.dev/?p=20', 0, 'revision', '', 0),
(21, 1, '2016-02-28 15:59:28', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNDEiLCJwb3N0X2lkIjoiMjEiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJ0aXRsZSI6Ik5leHRHRU4gTWluaWF0dXJlIEJhc2UiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfZ2FsbGVyeVwvc3RhdGljXC90aHVtYl9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIzIiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7Im92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6IjEiLCJ0aHVtYm5haWxfd2lkdGgiOiI2MjkiLCJ0aHVtYm5haWxfaGVpZ2h0IjoiMjkzIiwidGh1bWJuYWlsX2Nyb3AiOiIxIiwiaW1hZ2VzX3Blcl9wYWdlIjoiMSIsIm51bWJlcl9vZl9jb2x1bW5zIjoiMCIsImFqYXhfcGFnaW5hdGlvbiI6IjAiLCJzaG93X2FsbF9pbl9saWdodGJveCI6IjEiLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6IjAiLCJzaG93X3NsaWRlc2hvd19saW5rIjoiMCIsInNsaWRlc2hvd19saW5rX3RleHQiOiJbTW9zdHJhIHNsaWRlc2hvd10iLCJ0ZW1wbGF0ZSI6IlwvVXNlcnNcL3JvYmVydG9cL2Rldlwvd3d3XC9jYXNhcmFiYXR0aVwvd3AtY29udGVudFwvdGhlbWVzXC9jYXNhcmFiYXR0aVwvbmdnYWxsZXJ5XC9nYWxsZXJ5LWxpbW9uYWlhLnBocCIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfbm9faW1hZ2VzX2Vycm9yIjoxLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsInRodW1ibmFpbF9xdWFsaXR5IjoiMTAwIiwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Miniature Base', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:37', '2016-02-28 16:49:37', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNDEiLCJwb3N0X2lkIjoiMjEiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJ0aXRsZSI6Ik5leHRHRU4gTWluaWF0dXJlIEJhc2UiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfZ2FsbGVyeVwvc3RhdGljXC90aHVtYl9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIzIiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7Im92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6IjEiLCJ0aHVtYm5haWxfd2lkdGgiOiI2MjkiLCJ0aHVtYm5haWxfaGVpZ2h0IjoiMjkzIiwidGh1bWJuYWlsX2Nyb3AiOiIxIiwiaW1hZ2VzX3Blcl9wYWdlIjoiMSIsIm51bWJlcl9vZl9jb2x1bW5zIjoiMCIsImFqYXhfcGFnaW5hdGlvbiI6IjAiLCJzaG93X2FsbF9pbl9saWdodGJveCI6IjEiLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6IjAiLCJzaG93X3NsaWRlc2hvd19saW5rIjoiMCIsInNsaWRlc2hvd19saW5rX3RleHQiOiJbTW9zdHJhIHNsaWRlc2hvd10iLCJ0ZW1wbGF0ZSI6IlwvVXNlcnNcL3JvYmVydG9cL2Rldlwvd3d3XC9jYXNhcmFiYXR0aVwvd3AtY29udGVudFwvdGhlbWVzXC9jYXNhcmFiYXR0aVwvbmdnYWxsZXJ5XC9nYWxsZXJ5LWxpbW9uYWlhLnBocCIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfbm9faW1hZ2VzX2Vycm9yIjoxLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsInRodW1ibmFpbF9xdWFsaXR5IjoiMTAwIiwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=21', 0, 'display_type', '', 0),
(22, 1, '2016-02-28 15:59:28', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNTMiLCJwb3N0X2lkIjoiMjIiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyIsInRpdGxlIjoiTmV4dEdFTiBTbGlkZXNob3cgQmFzZSIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcL25leHRnZW4tZ2FsbGVyeVwvcHJvZHVjdHNcL3Bob3RvY3JhdGlfbmV4dGdlblwvbW9kdWxlc1wvbmV4dGdlbl9iYXNpY19nYWxsZXJ5XC9zdGF0aWNcL3NsaWRlc2hvd19wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMTAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMjMiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsiZ2FsbGVyeV93aWR0aCI6IjYwMCIsImdhbGxlcnlfaGVpZ2h0IjoiNDAwIiwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImN5Y2xlX2ludGVydmFsIjoiMTAiLCJzaG93X3RodW1ibmFpbF9saW5rIjoiMCIsInRodW1ibmFpbF9saW5rX3RleHQiOiJbTW9zdHJhIG1pbmlhdHVyZV0iLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJlZmZlY3RfY29kZSI6ImNsYXNzPVwibmdnLWZhbmN5Ym94XCIgcmVsPVwiJUdBTExFUllfTkFNRSVcIiIsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Slideshow Base', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:37', '2016-02-28 16:49:37', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNTMiLCJwb3N0X2lkIjoiMjIiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyIsInRpdGxlIjoiTmV4dEdFTiBTbGlkZXNob3cgQmFzZSIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcL25leHRnZW4tZ2FsbGVyeVwvcHJvZHVjdHNcL3Bob3RvY3JhdGlfbmV4dGdlblwvbW9kdWxlc1wvbmV4dGdlbl9iYXNpY19nYWxsZXJ5XC9zdGF0aWNcL3NsaWRlc2hvd19wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMTAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMjMiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsiZ2FsbGVyeV93aWR0aCI6IjYwMCIsImdhbGxlcnlfaGVpZ2h0IjoiNDAwIiwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImN5Y2xlX2ludGVydmFsIjoiMTAiLCJzaG93X3RodW1ibmFpbF9saW5rIjoiMCIsInRodW1ibmFpbF9saW5rX3RleHQiOiJbTW9zdHJhIG1pbmlhdHVyZV0iLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJlZmZlY3RfY29kZSI6ImNsYXNzPVwibmdnLWZhbmN5Ym94XCIgcmVsPVwiJUdBTExFUllfTkFNRSVcIiIsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=22', 0, 'display_type', '', 0),
(23, 1, '2016-02-28 15:59:28', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNjUiLCJwb3N0X2lkIjoiMjMiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciIsInRpdGxlIjoiTmV4dEdFTiBJbWFnZUJyb3dzZXIgQmFzZSIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcL25leHRnZW4tZ2FsbGVyeVwvcHJvZHVjdHNcL3Bob3RvY3JhdGlfbmV4dGdlblwvbW9kdWxlc1wvbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXJcL3N0YXRpY1wvcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDIwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIzIiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7ImFqYXhfcGFnaW5hdGlvbiI6IjAiLCJ0ZW1wbGF0ZSI6IiIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN ImageBrowser Base', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:37', '2016-02-28 16:49:37', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNjUiLCJwb3N0X2lkIjoiMjMiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciIsInRpdGxlIjoiTmV4dEdFTiBJbWFnZUJyb3dzZXIgQmFzZSIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcL25leHRnZW4tZ2FsbGVyeVwvcHJvZHVjdHNcL3Bob3RvY3JhdGlfbmV4dGdlblwvbW9kdWxlc1wvbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXJcL3N0YXRpY1wvcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDIwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIzIiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7ImFqYXhfcGFnaW5hdGlvbiI6IjAiLCJ0ZW1wbGF0ZSI6IiIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=23', 0, 'display_type', '', 0),
(24, 1, '2016-02-28 15:59:28', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNzgiLCJwb3N0X2lkIjoiMjQiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyIsInRpdGxlIjoiTmV4dEdFTiBCYXNpYyBTaW5nbGVQaWMiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfc2luZ2xlcGljXC9zdGF0aWNcL3ByZXZpZXcuZ2lmIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDA2MCwiaGlkZGVuX2Zyb21fdWkiOnRydWUsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2luZ2xlcGljIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMjMiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsid2lkdGgiOiIiLCJoZWlnaHQiOiIiLCJsaW5rIjoiIiwibGlua190YXJnZXQiOiJfYmxhbmsiLCJmbG9hdCI6IiIsInF1YWxpdHkiOiIxMDAiLCJjcm9wIjoiMCIsImRpc3BsYXlfd2F0ZXJtYXJrIjoiMCIsImRpc3BsYXlfcmVmbGVjdGlvbiI6IjAiLCJ0ZW1wbGF0ZSI6IiIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIm1vZGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic SinglePic', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:37', '2016-02-28 16:49:37', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNzgiLCJwb3N0X2lkIjoiMjQiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyIsInRpdGxlIjoiTmV4dEdFTiBCYXNpYyBTaW5nbGVQaWMiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfc2luZ2xlcGljXC9zdGF0aWNcL3ByZXZpZXcuZ2lmIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDA2MCwiaGlkZGVuX2Zyb21fdWkiOnRydWUsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2luZ2xlcGljIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMjMiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsid2lkdGgiOiIiLCJoZWlnaHQiOiIiLCJsaW5rIjoiIiwibGlua190YXJnZXQiOiJfYmxhbmsiLCJmbG9hdCI6IiIsInF1YWxpdHkiOiIxMDAiLCJjcm9wIjoiMCIsImRpc3BsYXlfd2F0ZXJtYXJrIjoiMCIsImRpc3BsYXlfcmVmbGVjdGlvbiI6IjAiLCJ0ZW1wbGF0ZSI6IiIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIm1vZGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=24', 0, 'display_type', '', 0),
(25, 1, '2016-02-28 15:59:28', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiODkiLCJwb3N0X2lkIjoiMjUiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RhZ2Nsb3VkIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIFRhZ0Nsb3VkIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX3RhZ2Nsb3VkXC9zdGF0aWNcL3ByZXZpZXcuZ2lmIiwiZGVmYXVsdF9zb3VyY2UiOiJ0YWdzIiwidmlld19vcmRlciI6MTAxMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGFnY2xvdWQiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4yMyIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJudW1iZXIiOiI0NSIsImRpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic TagCloud', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:37', '2016-02-28 16:49:37', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiODkiLCJwb3N0X2lkIjoiMjUiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RhZ2Nsb3VkIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIFRhZ0Nsb3VkIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX3RhZ2Nsb3VkXC9zdGF0aWNcL3ByZXZpZXcuZ2lmIiwiZGVmYXVsdF9zb3VyY2UiOiJ0YWdzIiwidmlld19vcmRlciI6MTAxMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGFnY2xvdWQiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4yMyIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJudW1iZXIiOiI0NSIsImRpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=25', 0, 'display_type', '', 0),
(26, 1, '2016-02-28 15:59:28', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMTAxIiwicG9zdF9pZCI6IjI2IiwibWV0YV9rZXkiOiJuYW1lIiwibWV0YV92YWx1ZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19jb21wYWN0X2FsYnVtIiwidGl0bGUiOiJOZXh0R0VOIEFsYnVtIENvbXBhdHRvIEJhc2UiLCJlbnRpdHlfdHlwZXMiOlsiYWxidW0iLCJnYWxsZXJ5Il0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2FsYnVtXC9zdGF0aWNcL2NvbXBhY3RfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImFsYnVtcyIsInZpZXdfb3JkZXIiOjEwMjAwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4yMyIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOiIwIiwiZW5hYmxlX2JyZWFkY3J1bWJzIjoiMCIsInRlbXBsYXRlIjoiIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjAiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN Album Compatto Base', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:37', '2016-02-28 16:49:37', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMTAxIiwicG9zdF9pZCI6IjI2IiwibWV0YV9rZXkiOiJuYW1lIiwibWV0YV92YWx1ZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19jb21wYWN0X2FsYnVtIiwidGl0bGUiOiJOZXh0R0VOIEFsYnVtIENvbXBhdHRvIEJhc2UiLCJlbnRpdHlfdHlwZXMiOlsiYWxidW0iLCJnYWxsZXJ5Il0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2FsYnVtXC9zdGF0aWNcL2NvbXBhY3RfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImFsYnVtcyIsInZpZXdfb3JkZXIiOjEwMjAwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4yMyIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOiIwIiwiZW5hYmxlX2JyZWFkY3J1bWJzIjoiMCIsInRlbXBsYXRlIjoiIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjAiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=26', 0, 'display_type', '', 0),
(27, 1, '2016-02-28 15:59:29', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMTEzIiwicG9zdF9pZCI6IjI3IiwibWV0YV9rZXkiOiJuYW1lIiwibWV0YV92YWx1ZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19leHRlbmRlZF9hbGJ1bSIsInRpdGxlIjoiTmV4dEdFTiBBbGJ1bSBFc3Rlc28gQmFzZSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfYWxidW1cL3N0YXRpY1wvZXh0ZW5kZWRfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImFsYnVtcyIsInZpZXdfb3JkZXIiOjEwMjEwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMjMiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcmllc19wZXJfcGFnZSI6IjAiLCJlbmFibGVfYnJlYWRjcnVtYnMiOiIwIiwidGVtcGxhdGUiOiIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIwIiwidGh1bWJuYWlsX3dpZHRoIjoiMjQwIiwidGh1bWJuYWlsX2hlaWdodCI6IjE2MCIsInRodW1ibmFpbF9jcm9wIjoiMSIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Album Esteso Base', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:49:38', '2016-02-28 16:49:38', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMTEzIiwicG9zdF9pZCI6IjI3IiwibWV0YV9rZXkiOiJuYW1lIiwibWV0YV92YWx1ZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19leHRlbmRlZF9hbGJ1bSIsInRpdGxlIjoiTmV4dEdFTiBBbGJ1bSBFc3Rlc28gQmFzZSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfYWxidW1cL3N0YXRpY1wvZXh0ZW5kZWRfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImFsYnVtcyIsInZpZXdfb3JkZXIiOjEwMjEwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMjMiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcmllc19wZXJfcGFnZSI6IjAiLCJlbmFibGVfYnJlYWRjcnVtYnMiOiIwIiwidGVtcGxhdGUiOiIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIwIiwidGh1bWJuYWlsX3dpZHRoIjoiMjQwIiwidGh1bWJuYWlsX2hlaWdodCI6IjE2MCIsInRodW1ibmFpbF9jcm9wIjoiMSIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://casarabatti.dev/?post_type=display_type&#038;p=27', 0, 'display_type', '', 0),
(28, 1, '2016-02-28 16:35:59', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:35:59', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=28', 0, 'ngg_gallery', '', 0),
(29, 1, '2016-02-28 16:36:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=29', 0, 'ngg_gallery', '', 0),
(30, 1, '2016-02-28 16:36:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=30', 0, 'ngg_gallery', '', 0),
(31, 1, '2016-02-28 16:36:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=31', 0, 'ngg_gallery', '', 0),
(32, 1, '2016-02-28 16:36:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=32', 0, 'ngg_gallery', '', 0),
(33, 1, '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=33', 0, 'ngg_gallery', '', 0),
(34, 1, '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=34', 0, 'ngg_gallery', '', 0),
(35, 1, '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=35', 0, 'ngg_gallery', '', 0),
(36, 1, '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=36', 0, 'ngg_gallery', '', 0),
(37, 1, '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=37', 0, 'ngg_gallery', '', 0),
(38, 1, '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=38', 0, 'ngg_gallery', '', 0),
(39, 1, '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=39', 0, 'ngg_gallery', '', 0),
(40, 1, '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=40', 0, 'ngg_gallery', '', 0),
(41, 1, '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=41', 0, 'ngg_gallery', '', 0),
(42, 1, '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=42', 0, 'ngg_gallery', '', 0),
(43, 1, '2016-02-28 16:36:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=43', 0, 'ngg_gallery', '', 0),
(44, 1, '2016-02-28 16:36:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=44', 0, 'ngg_gallery', '', 0),
(45, 1, '2016-02-28 16:36:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:36:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=45', 0, 'ngg_gallery', '', 0),
(46, 1, '2016-02-28 16:39:16', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:16', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=46', 0, 'ngg_gallery', '', 0),
(47, 1, '2016-02-28 16:39:16', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTU2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:16', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTU2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=47', 0, 'ngg_pictures', '', 0),
(48, 1, '2016-02-28 16:55:19', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0OTE5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:55:19', '2016-02-28 15:55:19', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0OTE5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=48', 0, 'ngg_pictures', '', 0),
(49, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=49', 0, 'ngg_gallery', '', 0),
(50, 1, '2016-02-28 16:39:22', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTYyLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:22', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTYyLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=50', 0, 'ngg_pictures', '', 0),
(51, 1, '2016-02-28 16:56:46', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc1MDA2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:56:46', '2016-02-28 15:56:46', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc1MDA2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=51', 0, 'ngg_pictures', '', 0),
(52, 1, '2016-02-28 16:39:26', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTY2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:26', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTY2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=52', 0, 'ngg_pictures', '', 0),
(53, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=53', 0, 'ngg_pictures', '', 0),
(54, 1, '2016-02-28 16:39:31', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTcxLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:31', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTcxLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=54', 0, 'ngg_pictures', '', 0),
(55, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=55', 0, 'ngg_pictures', '', 0),
(56, 1, '2016-02-28 16:39:34', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:34', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=56', 0, 'ngg_pictures', '', 0),
(57, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=57', 0, 'ngg_pictures', '', 0),
(58, 1, '2016-02-28 16:39:39', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTc5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:39', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTc5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=58', 0, 'ngg_pictures', '', 0),
(59, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=59', 0, 'ngg_pictures', '', 0),
(60, 1, '2016-02-28 16:39:42', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTgyLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:42', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTgyLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=60', 0, 'ngg_pictures', '', 0),
(61, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=61', 0, 'ngg_pictures', '', 0),
(62, 1, '2016-02-28 16:39:46', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTg2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:46', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTg2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=62', 0, 'ngg_pictures', '', 0),
(63, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=63', 0, 'ngg_pictures', '', 0),
(64, 1, '2016-02-28 16:39:51', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTkxLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:51', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTkxLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=64', 0, 'ngg_pictures', '', 0),
(65, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=65', 0, 'ngg_pictures', '', 0),
(66, 1, '2016-02-28 16:39:55', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTk1LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:55', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTk1LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=66', 0, 'ngg_pictures', '', 0),
(67, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=67', 0, 'ngg_pictures', '', 0),
(68, 1, '2016-02-28 16:39:58', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTk4LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:39:58', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2NjczOTk4LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=68', 0, 'ngg_pictures', '', 0),
(69, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=69', 0, 'ngg_pictures', '', 0),
(70, 1, '2016-02-28 16:40:03', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDAzLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:03', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDAzLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=70', 0, 'ngg_pictures', '', 0),
(71, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=71', 0, 'ngg_pictures', '', 0),
(72, 1, '2016-02-28 16:40:09', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDA5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:09', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDA5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=72', 0, 'ngg_pictures', '', 0),
(73, 1, '2016-02-28 16:47:53', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:53', '2016-02-28 15:47:53', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDczLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=73', 0, 'ngg_pictures', '', 0),
(74, 1, '2016-02-28 16:40:13', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDEzLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:13', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDEzLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=74', 0, 'ngg_pictures', '', 0),
(75, 1, '2016-02-28 16:47:54', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:54', '2016-02-28 15:47:54', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=75', 0, 'ngg_pictures', '', 0),
(76, 1, '2016-02-28 16:40:16', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDE2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:16', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDE2LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=76', 0, 'ngg_pictures', '', 0),
(77, 1, '2016-02-28 16:47:54', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:54', '2016-02-28 15:47:54', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=77', 0, 'ngg_pictures', '', 0),
(78, 1, '2016-02-28 16:40:19', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDE5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:19', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDE5LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=78', 0, 'ngg_pictures', '', 0),
(79, 1, '2016-02-28 16:47:54', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:54', '2016-02-28 15:47:54', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=79', 0, 'ngg_pictures', '', 0),
(80, 1, '2016-02-28 16:40:24', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDI0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:24', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDI0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=80', 0, 'ngg_pictures', '', 0),
(81, 1, '2016-02-28 16:47:54', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:54', '2016-02-28 15:47:54', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=81', 0, 'ngg_pictures', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(82, 1, '2016-02-28 16:40:28', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDI4LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:40:28', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0MDI4LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=82', 0, 'ngg_pictures', '', 0),
(83, 1, '2016-02-28 16:47:54', '0000-00-00 00:00:00', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 16:47:54', '2016-02-28 15:47:54', 'eyJ1cGRhdGVkX2F0IjoxNDU2Njc0NDc0LCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=83', 0, 'ngg_pictures', '', 0),
(85, 1, '2016-02-28 17:23:16', '0000-00-00 00:00:00', '[gallery ids="86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103"]', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-28 17:23:16', '2016-02-28 16:23:16', '', 0, 'http://casarabatti.dev/?page_id=85', 0, 'page', '', 0),
(86, 1, '2016-02-28 17:19:18', '2016-02-28 16:19:18', '', 'sergio appartamento 2   27-10-15 089-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-089-min', '', '', '2016-02-28 17:19:18', '2016-02-28 16:19:18', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-2-27-10-15-089-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(87, 1, '2016-02-28 17:19:24', '2016-02-28 16:19:24', '', 'sergio appartamento 2   27-10-15 094-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-094-min', '', '', '2016-02-28 17:19:24', '2016-02-28 16:19:24', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-2-27-10-15-094-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(88, 1, '2016-02-28 17:19:30', '2016-02-28 16:19:30', '', 'sergio appartamento 2   27-10-15 110-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-110-min', '', '', '2016-02-28 17:19:30', '2016-02-28 16:19:30', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-2-27-10-15-110-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(89, 1, '2016-02-28 17:19:35', '2016-02-28 16:19:35', '', 'sergio appartamento 2   27-10-15 131-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-131-min', '', '', '2016-02-28 17:19:35', '2016-02-28 16:19:35', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-2-27-10-15-131-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(90, 1, '2016-02-28 17:19:41', '2016-02-28 16:19:41', '', 'sergio appartamento 2   27-10-15 137-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-137-min', '', '', '2016-02-28 17:19:41', '2016-02-28 16:19:41', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-2-27-10-15-137-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(91, 1, '2016-02-28 17:19:52', '2016-02-28 16:19:52', '', 'sergio appartamento 3 16-12-15 000-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-000-min', '', '', '2016-02-28 17:19:52', '2016-02-28 16:19:52', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-000-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(92, 1, '2016-02-28 17:20:02', '2016-02-28 16:20:02', '', 'sergio appartamento 3 16-12-15 001-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-001-min', '', '', '2016-02-28 17:20:02', '2016-02-28 16:20:02', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-001-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(93, 1, '2016-02-28 17:20:12', '2016-02-28 16:20:12', '', 'sergio appartamento 3 16-12-15 002-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-002-min', '', '', '2016-02-28 17:20:12', '2016-02-28 16:20:12', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-002-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2016-02-28 17:20:21', '2016-02-28 16:20:21', '', 'sergio appartamento 3 16-12-15 055-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-055-min', '', '', '2016-02-28 17:20:21', '2016-02-28 16:20:21', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-055-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(95, 1, '2016-02-28 17:20:33', '2016-02-28 16:20:33', '', 'sergio appartamento 3 16-12-15 103-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-103-min', '', '', '2016-02-28 17:20:33', '2016-02-28 16:20:33', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-103-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(96, 1, '2016-02-28 17:20:45', '2016-02-28 16:20:45', '', 'sergio appartamento 3 16-12-15 138-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-138-min', '', '', '2016-02-28 17:20:45', '2016-02-28 16:20:45', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-138-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(97, 1, '2016-02-28 17:21:00', '2016-02-28 16:21:00', '', 'sergio appartamento 3 16-12-15 157-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-157-min', '', '', '2016-02-28 17:21:00', '2016-02-28 16:21:00', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-157-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(98, 1, '2016-02-28 17:21:14', '2016-02-28 16:21:14', '', 'sergio appartamento 3 16-12-15 179-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-179-min', '', '', '2016-02-28 17:21:14', '2016-02-28 16:21:14', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-179-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(99, 1, '2016-02-28 17:21:26', '2016-02-28 16:21:26', '', 'sergio appartamento 3 16-12-15 191-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-191-min', '', '', '2016-02-28 17:21:26', '2016-02-28 16:21:26', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-191-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(100, 1, '2016-02-28 17:21:45', '2016-02-28 16:21:45', '', 'sergio appartamento 3 16-12-15 204-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-204-min', '', '', '2016-02-28 17:21:45', '2016-02-28 16:21:45', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-204-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(101, 1, '2016-02-28 17:22:02', '2016-02-28 16:22:02', '', 'sergio appartamento 3 16-12-15 215-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-215-min', '', '', '2016-02-28 17:22:02', '2016-02-28 16:22:02', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-215-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(102, 1, '2016-02-28 17:22:15', '2016-02-28 16:22:15', '', 'sergio appartamento 3 16-12-15 239-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-239-min', '', '', '2016-02-28 17:22:15', '2016-02-28 16:22:15', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-239-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(103, 1, '2016-02-28 17:22:25', '2016-02-28 16:22:25', '', 'sergio appartamento 3 16-12-15 267-min', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-16-12-15-267-min', '', '', '2016-02-28 17:22:25', '2016-02-28 16:22:25', '', 85, 'http://casarabatti.dev/wp-content/uploads/2016/02/sergio-appartamento-3-16-12-15-267-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(105, 1, '2016-02-28 17:28:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:28:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=105', 0, 'ngg_gallery', '', 0),
(106, 1, '2016-02-28 17:28:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:28:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=106', 0, 'ngg_pictures', '', 0),
(107, 1, '2016-03-16 00:23:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:51', '2016-03-15 23:23:51', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=107', 0, 'ngg_pictures', '', 0),
(108, 1, '2016-03-16 00:23:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:51', '2016-03-15 23:23:51', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=108', 0, 'ngg_gallery', '', 0),
(109, 1, '2016-02-28 17:28:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:28:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=109', 0, 'ngg_pictures', '', 0),
(110, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=110', 0, 'ngg_pictures', '', 0),
(111, 1, '2016-02-28 17:28:57', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:28:57', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=111', 0, 'ngg_pictures', '', 0),
(112, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=112', 0, 'ngg_pictures', '', 0),
(113, 1, '2016-02-28 17:29:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=113', 0, 'ngg_pictures', '', 0),
(114, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=114', 0, 'ngg_pictures', '', 0),
(115, 1, '2016-02-28 17:29:09', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:09', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=115', 0, 'ngg_pictures', '', 0),
(116, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=116', 0, 'ngg_pictures', '', 0),
(117, 1, '2016-02-28 17:29:20', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:20', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=117', 0, 'ngg_pictures', '', 0),
(118, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=118', 0, 'ngg_pictures', '', 0),
(119, 1, '2016-02-28 17:29:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=119', 0, 'ngg_pictures', '', 0),
(120, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=120', 0, 'ngg_pictures', '', 0),
(121, 1, '2016-02-28 17:29:31', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:31', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=121', 0, 'ngg_pictures', '', 0),
(122, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=122', 0, 'ngg_pictures', '', 0),
(123, 1, '2016-02-28 17:29:37', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:37', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=123', 0, 'ngg_pictures', '', 0),
(124, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=124', 0, 'ngg_pictures', '', 0),
(125, 1, '2016-02-28 17:29:44', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:44', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=125', 0, 'ngg_pictures', '', 0),
(126, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=126', 0, 'ngg_pictures', '', 0),
(127, 1, '2016-02-28 17:29:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=127', 0, 'ngg_pictures', '', 0),
(128, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=128', 0, 'ngg_pictures', '', 0),
(129, 1, '2016-02-28 17:29:55', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:29:55', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=129', 0, 'ngg_pictures', '', 0),
(130, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=130', 0, 'ngg_pictures', '', 0),
(131, 1, '2016-02-28 17:30:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:30:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=131', 0, 'ngg_pictures', '', 0),
(132, 1, '2016-03-16 00:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:52', '2016-03-15 23:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=132', 0, 'ngg_pictures', '', 0),
(133, 1, '2016-02-28 17:30:05', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:30:05', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=133', 0, 'ngg_pictures', '', 0),
(134, 1, '2016-03-16 00:23:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:53', '2016-03-15 23:23:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=134', 0, 'ngg_pictures', '', 0),
(135, 1, '2016-02-28 17:30:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:30:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=135', 0, 'ngg_pictures', '', 0),
(136, 1, '2016-03-16 00:23:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:53', '2016-03-15 23:23:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=136', 0, 'ngg_pictures', '', 0),
(137, 1, '2016-02-28 17:30:14', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:30:14', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=137', 0, 'ngg_pictures', '', 0),
(138, 1, '2016-03-16 00:23:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:53', '2016-03-15 23:23:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=138', 0, 'ngg_pictures', '', 0),
(139, 1, '2016-02-28 17:30:19', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:30:19', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=139', 0, 'ngg_pictures', '', 0),
(140, 1, '2016-03-16 00:23:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:53', '2016-03-15 23:23:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=140', 0, 'ngg_pictures', '', 0),
(141, 1, '2016-02-28 17:30:25', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:30:25', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=141', 0, 'ngg_pictures', '', 0),
(142, 1, '2016-03-16 00:23:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-03-16 00:23:53', '2016-03-15 23:23:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=142', 0, 'ngg_pictures', '', 0),
(143, 1, '2016-02-28 17:58:45', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:45', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=143', 0, 'ngg_gallery', '', 0),
(144, 1, '2016-02-28 17:58:45', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:45', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=144', 0, 'ngg_pictures', '', 0),
(145, 1, '2016-02-28 18:00:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:00:52', '2016-02-28 17:00:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=145', 0, 'ngg_pictures', '', 0),
(146, 1, '2016-02-28 17:58:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=146', 0, 'ngg_gallery', '', 0),
(147, 1, '2016-02-28 17:58:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=147', 0, 'ngg_pictures', '', 0),
(148, 1, '2016-02-28 17:58:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:51', '2016-02-28 16:58:51', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=148', 0, 'ngg_pictures', '', 0),
(149, 1, '2016-02-28 17:58:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=149', 0, 'ngg_pictures', '', 0),
(150, 1, '2016-02-28 17:58:55', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:55', '2016-02-28 16:58:55', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=150', 0, 'ngg_pictures', '', 0),
(151, 1, '2016-02-28 17:58:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:58:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=151', 0, 'ngg_pictures', '', 0),
(152, 1, '2016-02-28 17:59:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:00', '2016-02-28 16:59:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=152', 0, 'ngg_pictures', '', 0),
(153, 1, '2016-02-28 17:59:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=153', 0, 'ngg_pictures', '', 0),
(154, 1, '2016-02-28 17:59:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:03', '2016-02-28 16:59:03', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=154', 0, 'ngg_pictures', '', 0),
(155, 1, '2016-02-28 17:59:04', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:04', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=155', 0, 'ngg_pictures', '', 0),
(156, 1, '2016-02-28 17:59:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:06', '2016-02-28 16:59:06', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=156', 0, 'ngg_pictures', '', 0),
(157, 1, '2016-02-28 17:59:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=157', 0, 'ngg_pictures', '', 0),
(158, 1, '2016-02-28 17:59:09', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:09', '2016-02-28 16:59:09', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=158', 0, 'ngg_pictures', '', 0),
(159, 1, '2016-02-28 17:59:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=159', 0, 'ngg_pictures', '', 0),
(160, 1, '2016-02-28 17:59:14', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:14', '2016-02-28 16:59:14', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=160', 0, 'ngg_pictures', '', 0),
(161, 1, '2016-02-28 17:59:15', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:15', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=161', 0, 'ngg_pictures', '', 0),
(162, 1, '2016-02-28 17:59:19', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:19', '2016-02-28 16:59:19', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=162', 0, 'ngg_pictures', '', 0),
(163, 1, '2016-02-28 17:59:20', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:20', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=163', 0, 'ngg_pictures', '', 0),
(164, 1, '2016-02-28 17:59:22', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:22', '2016-02-28 16:59:22', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=164', 0, 'ngg_pictures', '', 0),
(165, 1, '2016-02-28 17:59:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=165', 0, 'ngg_pictures', '', 0),
(166, 1, '2016-02-28 17:59:27', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:27', '2016-02-28 16:59:27', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=166', 0, 'ngg_pictures', '', 0),
(167, 1, '2016-02-28 17:59:28', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:28', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=167', 0, 'ngg_pictures', '', 0),
(168, 1, '2016-02-28 17:59:32', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 17:59:32', '2016-02-28 16:59:32', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=168', 0, 'ngg_pictures', '', 0),
(169, 1, '2016-02-28 18:14:40', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:14:40', '2016-02-28 17:14:40', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=169', 0, 'ngg_pictures', '', 0),
(170, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=170', 0, 'ngg_pictures', '', 0),
(171, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=171', 0, 'ngg_pictures', '', 0),
(172, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=172', 0, 'ngg_pictures', '', 0),
(173, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=173', 0, 'ngg_pictures', '', 0),
(174, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=174', 0, 'ngg_pictures', '', 0),
(175, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=175', 0, 'ngg_pictures', '', 0),
(176, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=176', 0, 'ngg_pictures', '', 0),
(177, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=177', 0, 'ngg_pictures', '', 0),
(178, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=178', 0, 'ngg_pictures', '', 0),
(179, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=179', 0, 'ngg_pictures', '', 0),
(180, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=180', 0, 'ngg_pictures', '', 0),
(181, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=181', 0, 'ngg_pictures', '', 0),
(182, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=182', 0, 'ngg_pictures', '', 0),
(183, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=183', 0, 'ngg_pictures', '', 0),
(184, 1, '2016-02-28 18:13:24', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:24', '2016-02-28 17:13:24', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_pictures&#038;p=184', 0, 'ngg_pictures', '', 0),
(185, 1, '2016-02-28 18:13:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:13:23', '2016-02-28 17:13:23', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?post_type=ngg_gallery&#038;p=185', 0, 'ngg_gallery', '', 0),
(186, 1, '2016-02-28 18:22:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=186', 0, 'ngg_gallery', '', 0),
(187, 1, '2016-02-28 18:22:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=187', 0, 'ngg_pictures', '', 0),
(188, 1, '2016-02-28 18:22:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:49', '2016-02-28 17:22:49', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=188', 0, 'ngg_pictures', '', 0),
(189, 1, '2016-02-28 18:22:19', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:19', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=189', 0, 'ngg_gallery', '', 0),
(190, 1, '2016-02-28 18:22:22', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:22', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=190', 0, 'ngg_pictures', '', 0),
(191, 1, '2016-02-28 18:22:28', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:28', '2016-02-28 17:22:28', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=191', 0, 'ngg_pictures', '', 0),
(192, 1, '2016-02-28 18:22:29', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:29', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=192', 0, 'ngg_pictures', '', 0),
(193, 1, '2016-02-28 18:22:34', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:34', '2016-02-28 17:22:34', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=193', 0, 'ngg_pictures', '', 0),
(194, 1, '2016-02-28 18:22:35', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:35', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=194', 0, 'ngg_pictures', '', 0),
(195, 1, '2016-02-28 18:22:45', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:45', '2016-02-28 17:22:45', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=195', 0, 'ngg_pictures', '', 0),
(196, 1, '2016-02-28 18:22:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=196', 0, 'ngg_pictures', '', 0),
(197, 1, '2016-02-28 18:22:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:51', '2016-02-28 17:22:51', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=197', 0, 'ngg_pictures', '', 0),
(198, 1, '2016-02-28 18:22:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=198', 0, 'ngg_pictures', '', 0),
(199, 1, '2016-02-28 18:22:57', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:57', '2016-02-28 17:22:57', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=199', 0, 'ngg_pictures', '', 0),
(200, 1, '2016-02-28 18:22:58', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:22:58', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=200', 0, 'ngg_pictures', '', 0),
(201, 1, '2016-02-28 18:23:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:00', '2016-02-28 17:23:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=201', 0, 'ngg_pictures', '', 0),
(202, 1, '2016-02-28 18:23:02', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:02', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=202', 0, 'ngg_pictures', '', 0),
(203, 1, '2016-02-28 18:23:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:08', '2016-02-28 17:23:08', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=203', 0, 'ngg_pictures', '', 0),
(204, 1, '2016-02-28 18:23:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:10', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=204', 0, 'ngg_pictures', '', 0),
(205, 1, '2016-02-28 18:23:15', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:15', '2016-02-28 17:23:15', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=205', 0, 'ngg_pictures', '', 0),
(206, 1, '2016-02-28 18:23:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=206', 0, 'ngg_pictures', '', 0),
(207, 1, '2016-02-28 18:23:23', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:23', '2016-02-28 17:23:23', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=207', 0, 'ngg_pictures', '', 0),
(208, 1, '2016-02-28 18:23:27', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:27', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=208', 0, 'ngg_pictures', '', 0),
(209, 1, '2016-02-28 18:23:32', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:32', '2016-02-28 17:23:32', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=209', 0, 'ngg_pictures', '', 0),
(210, 1, '2016-02-28 18:23:35', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:35', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=210', 0, 'ngg_pictures', '', 0),
(211, 1, '2016-02-28 18:23:39', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:39', '2016-02-28 17:23:39', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=211', 0, 'ngg_pictures', '', 0),
(212, 1, '2016-02-28 18:23:40', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:40', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=212', 0, 'ngg_pictures', '', 0),
(213, 1, '2016-02-28 18:23:47', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:47', '2016-02-28 17:23:47', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=213', 0, 'ngg_pictures', '', 0),
(214, 1, '2016-02-28 18:23:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=214', 0, 'ngg_pictures', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(215, 1, '2016-02-28 18:23:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:52', '2016-02-28 17:23:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=215', 0, 'ngg_pictures', '', 0),
(216, 1, '2016-02-28 18:23:54', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:23:54', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=216', 0, 'ngg_pictures', '', 0),
(217, 1, '2016-02-28 18:24:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:00', '2016-02-28 17:24:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=217', 0, 'ngg_pictures', '', 0),
(218, 1, '2016-02-28 18:24:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=218', 0, 'ngg_pictures', '', 0),
(219, 1, '2016-02-28 18:24:06', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:06', '2016-02-28 17:24:06', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=219', 0, 'ngg_pictures', '', 0),
(220, 1, '2016-02-28 18:24:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=220', 0, 'ngg_pictures', '', 0),
(221, 1, '2016-02-28 18:24:11', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:11', '2016-02-28 17:24:11', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=221', 0, 'ngg_pictures', '', 0),
(222, 1, '2016-02-28 18:24:12', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:12', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=222', 0, 'ngg_pictures', '', 0),
(223, 1, '2016-02-28 18:24:14', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-02-28 18:24:14', '2016-02-28 17:24:14', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://casarabatti.dev/?p=223', 0, 'ngg_pictures', '', 0),
(224, 1, '2016-02-28 18:25:53', '2016-02-28 17:25:53', 'Per informazioni e prenotazioni, potete chiamarci al nostro numero di telefono, oppure inviandoci una mail al nostro indirizzo, vi risponderemo non appena ci sarà possibile.\r\n\r\n&nbsp;', 'Contattaci', '', 'publish', 'open', 'open', '', 'contattaci', '', '', '2016-02-28 18:25:53', '2016-02-28 17:25:53', '', 0, 'http://casarabatti.dev/?p=224', 0, 'post', '', 0),
(225, 1, '2016-02-28 18:25:53', '2016-02-28 17:25:53', 'Per informazioni e prenotazioni, potete chiamarci al nostro numero di telefono, oppure inviandoci una mail al nostro indirizzo, vi risponderemo non appena ci sarà possibile.\r\n\r\n&nbsp;', 'Contattaci', '', 'inherit', 'closed', 'closed', '', '224-revision-v1', '', '', '2016-02-28 18:25:53', '2016-02-28 17:25:53', '', 224, 'http://casarabatti.dev/?p=225', 0, 'revision', '', 0),
(227, 1, '2016-03-05 15:50:50', '2016-03-05 14:50:50', 'Al fine di rendere più comoda possibile la tua visita al nostro sito web, per la presentazione del nostro assortimento di prodotti utilizziamo dei cookies. Si tratta di piccoli aggregati di testo registrati localmente nella memoria temporanea del tuo browser, e quindi nel tuo computer, per periodi di tempo variabili in funzione dell’esigenza e generalmente compresi tra poche ore e alcuni anni, con l’eccezione dei cookie di profilazione la cui durata massima è di 365 giorni solari.\r\nMediante i cookie è possibile registrare in modo semi-permanente informazioni relative alle tue preferenze e altri dati tecnici che permettono una navigazione più agevole e una maggiore facilità d’uso e efficacia del sito stesso. Ad esempio, i cookies possono essere usati per determinare se è già stata effettuata una connessione fra il tuo computer e i nostri siti per evidenziare le novità o mantenere le informazioni di “login”. A tua garanzia, viene identificato solo il cookie memorizzato sul tuo computer.\r\n\r\nTipologie di Cookie\r\n\r\nQuesto sito fa uso di tre diverse tipologie di cookie:\r\n\r\n1. Cookie tecnici essenziali\r\n\r\nQuesti cookie sono necessari al corretto funzionamento del sito. Consentono la navigazione delle pagine, la condivisione dei nostri contenuti, la memorizzazione delle tue credenziali di accesso per rendere più rapido l’ingresso nel sito e per mantenere attive le tue preferenze e credenziali durante la navigazione. Senza questi cookie non potremmo fornire i servizi per i quali gli utenti accedono al sito.\r\n\r\n2. Cookie statistici e prestazionali\r\n\r\nQuesti cookie ci permettono di sapere in che modo i visitatori utilizzano il sito, per poterne così valutare e migliorare il funzionamento e privilegiare la produzione di contenuti che meglio incontrano i bisogni informativi dei nostri utenti. Ad esempio, consentono di sapere quali sono le pagine più e meno frequentate. Tengono conto, tra le altre cose, del numero di visitatori, del tempo trascorso sul sito dalla media degli utenti e delle modalità di arrivo di questi. In questo modo, possiamo sapere che cosa funziona bene e che cosa migliorare, oltre ad assicurarci che le pagine si carichino velocemente e siano visualizzate correttamente. Tutte le informazioni raccolte da questi cookie sono anonime e non collegate ai dati personali dell’utente. Per eseguire queste funzioni nei nostri siti utilizziamo i servizi di terze parti che anonimizzano i dati rendendoli non riconducibili a singoli individui (cosiddetto “single-in”).\r\n\r\n3. Cookie funzionali e di profilazione di terze parti\r\n\r\nIn questa categoria ricadono cookie erogati da soggetti terzi non direttamente controllati o controllabili.\r\nI cookie provenienti dai terze parti consentono di offrire funzionalità avanzate, nonché maggiori informazioni e funzioni personali. Ciò include la possibilità di condividere contenuti attraverso i social network, di accedere ai servizi di videostreaming e alle reti CDN sulle quali ospitiamo i nostri contenuti. Tali servizi sono principalmente forniti da operatori esterni. Se si dispone di un account o se si utilizzano i servizi di tali soggetti su altri siti Web, questi potrebbero essere in grado di sapere che l’utente ha visitato i nostri siti. L’utilizzo dei dati raccolti da questi operatori esterni tramite cookie è sottoposto alle rispettive politiche sulla privacy e pertanto si identificano tali cookie con i nomi dei rispettivi soggetti riportati nel tool di gestione dei cookie disponibile nell’apposita sezione di questa Informativa. Tra questi si annoverano i cookie registrati dai principali social network che Le consentono di condividere gli articoli dei nostri siti e di manifestare pubblicamente il gradimento per il nostro lavoro.\r\nI cookie sono veicolati da soggetti terzi che hanno modo di intercettare l’utente durante la sua navigazione anche al di fuori del sito. Questi cookie, tipicamente di profilazione, non sono direttamente controllabili da noi che non possiamo quindi garantire in merito all’uso che i terzi titolari fanno delle informazioni raccolte.\r\n\r\nGestione dei cookie\r\n\r\nNel caso in cui tu abbia dubbi o preoccupazioni in merito all’utilizzo dei cookie ti è sempre possibile intervenire per impedirne l’impostazione e la lettura, ad esempio modificando le impostazioni sulla privacy all’interno del tuo browser al fine di bloccarne determinati tipi o utilizzando il tool che ti mettiamo a disposizione in questa Informativa.\r\n\r\nPoiché ciascun browser – e spesso diverse versioni dello stesso browser – differiscono anche sensibilmente le une dalle altre se preferisce agire autonomamente mediante le preferenze del tuo browser puoi trovare informazioni dettagliate sulla procedura necessaria nella guida del tuo browser. Per una panoramica delle modalità di azione per i browser più comuni, puoi visitare l’indirizzo www.cookiepedia.co.uk\r\n\r\nLe società pubblicitarie consentono inoltre di rinunciare alla ricezione di annunci mirati, se lo si desidera. Ciò non impedisce l’impostazione dei cookie, ma interrompe l’utilizzo e la raccolta di alcuni dati da parte di tali società.\r\n\r\nPer maggiori informazioni e possibilità di rinuncia, visitare l’indirizzo www.youronlinechoices.eu\r\n\r\nProseguendo nella navigazione su questo sito chiudendo la fascetta informativa o facendo click in una qualsiasi parte della pagina o scorrendola per evidenziare ulteriore contenuto, si accetta la Cookie Policy e verranno impostati e raccolti i cookie. In caso di mancata accettazione dei cookie mediante abbandono della navigazione, eventuali cookie già registrati localmente nel tuo browser rimarranno ivi registrati ma non saranno più letti né utilizzati fino ad una successiva ed eventuale accettazione della Policy. Avrai sempre la possibilità di rimuovere tali cookie in qualsiasi momento attraverso le modalità di cui ai siti citati nel paragrafo “Gestione dei cookie”.', 'Cookie Policy', '', 'publish', 'closed', 'closed', '', 'cookie-policy', '', '', '2016-03-05 15:54:41', '2016-03-05 14:54:41', '', 0, 'http://www.casarabatti.it/?page_id=227', 0, 'page', '', 0),
(228, 1, '2016-03-05 15:50:50', '2016-03-05 14:50:50', 'Questo sito utilizza cookie tecnici e di profilazione propri e di terze parti per le sue funzionalità e per inviarti pubblicità e servizi in linea con le tue preferenze. Se vuoi saperne di più clicca qui. Chiudendo questo banner, scorrendo questa pagina o cliccando qualunque suo elemento acconsenti all''uso dei cookie.\r\nAl fine di rendere più comoda possibile la tua visita al nostro sito web, per la presentazione del nostro assortimento di prodotti utilizziamo dei cookies. Si tratta di piccoli aggregati di testo registrati localmente nella memoria temporanea del tuo browser, e quindi nel tuo computer, per periodi di tempo variabili in funzione dell’esigenza e generalmente compresi tra poche ore e alcuni anni, con l’eccezione dei cookie di profilazione la cui durata massima è di 365 giorni solari.\r\nMediante i cookie è possibile registrare in modo semi-permanente informazioni relative alle tue preferenze e altri dati tecnici che permettono una navigazione più agevole e una maggiore facilità d’uso e efficacia del sito stesso. Ad esempio, i cookies possono essere usati per determinare se è già stata effettuata una connessione fra il tuo computer e i nostri siti per evidenziare le novità o mantenere le informazioni di “login”. A tua garanzia, viene identificato solo il cookie memorizzato sul tuo computer.\r\n\r\nTipologie di Cookie\r\n\r\nQuesto sito fa uso di tre diverse tipologie di cookie:\r\n\r\n1. Cookie tecnici essenziali\r\n\r\nQuesti cookie sono necessari al corretto funzionamento del sito. Consentono la navigazione delle pagine, la condivisione dei nostri contenuti, la memorizzazione delle tue credenziali di accesso per rendere più rapido l’ingresso nel sito e per mantenere attive le tue preferenze e credenziali durante la navigazione. Senza questi cookie non potremmo fornire i servizi per i quali gli utenti accedono al sito.\r\n\r\n2. Cookie statistici e prestazionali\r\n\r\nQuesti cookie ci permettono di sapere in che modo i visitatori utilizzano il sito, per poterne così valutare e migliorare il funzionamento e privilegiare la produzione di contenuti che meglio incontrano i bisogni informativi dei nostri utenti. Ad esempio, consentono di sapere quali sono le pagine più e meno frequentate. Tengono conto, tra le altre cose, del numero di visitatori, del tempo trascorso sul sito dalla media degli utenti e delle modalità di arrivo di questi. In questo modo, possiamo sapere che cosa funziona bene e che cosa migliorare, oltre ad assicurarci che le pagine si carichino velocemente e siano visualizzate correttamente. Tutte le informazioni raccolte da questi cookie sono anonime e non collegate ai dati personali dell’utente. Per eseguire queste funzioni nei nostri siti utilizziamo i servizi di terze parti che anonimizzano i dati rendendoli non riconducibili a singoli individui (cosiddetto “single-in”).\r\n\r\n3. Cookie funzionali e di profilazione di terze parti\r\n\r\nIn questa categoria ricadono cookie erogati da soggetti terzi non direttamente controllati o controllabili.\r\nI cookie provenienti dai terze parti consentono di offrire funzionalità avanzate, nonché maggiori informazioni e funzioni personali. Ciò include la possibilità di condividere contenuti attraverso i social network, di accedere ai servizi di videostreaming e alle reti CDN sulle quali ospitiamo i nostri contenuti. Tali servizi sono principalmente forniti da operatori esterni. Se si dispone di un account o se si utilizzano i servizi di tali soggetti su altri siti Web, questi potrebbero essere in grado di sapere che l’utente ha visitato i nostri siti. L’utilizzo dei dati raccolti da questi operatori esterni tramite cookie è sottoposto alle rispettive politiche sulla privacy e pertanto si identificano tali cookie con i nomi dei rispettivi soggetti riportati nel tool di gestione dei cookie disponibile nell’apposita sezione di questa Informativa. Tra questi si annoverano i cookie registrati dai principali social network che Le consentono di condividere gli articoli dei nostri siti e di manifestare pubblicamente il gradimento per il nostro lavoro.\r\nI cookie sono veicolati da soggetti terzi che hanno modo di intercettare l’utente durante la sua navigazione anche al di fuori del sito. Questi cookie, tipicamente di profilazione, non sono direttamente controllabili da noi che non possiamo quindi garantire in merito all’uso che i terzi titolari fanno delle informazioni raccolte.\r\n\r\nGestione dei cookie\r\n\r\nNel caso in cui tu abbia dubbi o preoccupazioni in merito all’utilizzo dei cookie ti è sempre possibile intervenire per impedirne l’impostazione e la lettura, ad esempio modificando le impostazioni sulla privacy all’interno del tuo browser al fine di bloccarne determinati tipi o utilizzando il tool che ti mettiamo a disposizione in questa Informativa.\r\n\r\nPoiché ciascun browser – e spesso diverse versioni dello stesso browser – differiscono anche sensibilmente le une dalle altre se preferisce agire autonomamente mediante le preferenze del tuo browser puoi trovare informazioni dettagliate sulla procedura necessaria nella guida del tuo browser. Per una panoramica delle modalità di azione per i browser più comuni, puoi visitare l’indirizzo www.cookiepedia.co.uk\r\n\r\nLe società pubblicitarie consentono inoltre di rinunciare alla ricezione di annunci mirati, se lo si desidera. Ciò non impedisce l’impostazione dei cookie, ma interrompe l’utilizzo e la raccolta di alcuni dati da parte di tali società.\r\n\r\nPer maggiori informazioni e possibilità di rinuncia, visitare l’indirizzo www.youronlinechoices.eu\r\n\r\nProseguendo nella navigazione su questo sito chiudendo la fascetta informativa o facendo click in una qualsiasi parte della pagina o scorrendola per evidenziare ulteriore contenuto, si accetta la Cookie Policy e verranno impostati e raccolti i cookie. In caso di mancata accettazione dei cookie mediante abbandono della navigazione, eventuali cookie già registrati localmente nel tuo browser rimarranno ivi registrati ma non saranno più letti né utilizzati fino ad una successiva ed eventuale accettazione della Policy. Avrai sempre la possibilità di rimuovere tali cookie in qualsiasi momento attraverso le modalità di cui ai siti citati nel paragrafo “Gestione dei cookie”.', 'Cookie Policy', '', 'inherit', 'closed', 'closed', '', '227-revision-v1', '', '', '2016-03-05 15:50:50', '2016-03-05 14:50:50', '', 227, 'http://www.casarabatti.it/?p=228', 0, 'revision', '', 0),
(229, 1, '2016-03-05 15:54:41', '2016-03-05 14:54:41', 'Al fine di rendere più comoda possibile la tua visita al nostro sito web, per la presentazione del nostro assortimento di prodotti utilizziamo dei cookies. Si tratta di piccoli aggregati di testo registrati localmente nella memoria temporanea del tuo browser, e quindi nel tuo computer, per periodi di tempo variabili in funzione dell’esigenza e generalmente compresi tra poche ore e alcuni anni, con l’eccezione dei cookie di profilazione la cui durata massima è di 365 giorni solari.\r\nMediante i cookie è possibile registrare in modo semi-permanente informazioni relative alle tue preferenze e altri dati tecnici che permettono una navigazione più agevole e una maggiore facilità d’uso e efficacia del sito stesso. Ad esempio, i cookies possono essere usati per determinare se è già stata effettuata una connessione fra il tuo computer e i nostri siti per evidenziare le novità o mantenere le informazioni di “login”. A tua garanzia, viene identificato solo il cookie memorizzato sul tuo computer.\r\n\r\nTipologie di Cookie\r\n\r\nQuesto sito fa uso di tre diverse tipologie di cookie:\r\n\r\n1. Cookie tecnici essenziali\r\n\r\nQuesti cookie sono necessari al corretto funzionamento del sito. Consentono la navigazione delle pagine, la condivisione dei nostri contenuti, la memorizzazione delle tue credenziali di accesso per rendere più rapido l’ingresso nel sito e per mantenere attive le tue preferenze e credenziali durante la navigazione. Senza questi cookie non potremmo fornire i servizi per i quali gli utenti accedono al sito.\r\n\r\n2. Cookie statistici e prestazionali\r\n\r\nQuesti cookie ci permettono di sapere in che modo i visitatori utilizzano il sito, per poterne così valutare e migliorare il funzionamento e privilegiare la produzione di contenuti che meglio incontrano i bisogni informativi dei nostri utenti. Ad esempio, consentono di sapere quali sono le pagine più e meno frequentate. Tengono conto, tra le altre cose, del numero di visitatori, del tempo trascorso sul sito dalla media degli utenti e delle modalità di arrivo di questi. In questo modo, possiamo sapere che cosa funziona bene e che cosa migliorare, oltre ad assicurarci che le pagine si carichino velocemente e siano visualizzate correttamente. Tutte le informazioni raccolte da questi cookie sono anonime e non collegate ai dati personali dell’utente. Per eseguire queste funzioni nei nostri siti utilizziamo i servizi di terze parti che anonimizzano i dati rendendoli non riconducibili a singoli individui (cosiddetto “single-in”).\r\n\r\n3. Cookie funzionali e di profilazione di terze parti\r\n\r\nIn questa categoria ricadono cookie erogati da soggetti terzi non direttamente controllati o controllabili.\r\nI cookie provenienti dai terze parti consentono di offrire funzionalità avanzate, nonché maggiori informazioni e funzioni personali. Ciò include la possibilità di condividere contenuti attraverso i social network, di accedere ai servizi di videostreaming e alle reti CDN sulle quali ospitiamo i nostri contenuti. Tali servizi sono principalmente forniti da operatori esterni. Se si dispone di un account o se si utilizzano i servizi di tali soggetti su altri siti Web, questi potrebbero essere in grado di sapere che l’utente ha visitato i nostri siti. L’utilizzo dei dati raccolti da questi operatori esterni tramite cookie è sottoposto alle rispettive politiche sulla privacy e pertanto si identificano tali cookie con i nomi dei rispettivi soggetti riportati nel tool di gestione dei cookie disponibile nell’apposita sezione di questa Informativa. Tra questi si annoverano i cookie registrati dai principali social network che Le consentono di condividere gli articoli dei nostri siti e di manifestare pubblicamente il gradimento per il nostro lavoro.\r\nI cookie sono veicolati da soggetti terzi che hanno modo di intercettare l’utente durante la sua navigazione anche al di fuori del sito. Questi cookie, tipicamente di profilazione, non sono direttamente controllabili da noi che non possiamo quindi garantire in merito all’uso che i terzi titolari fanno delle informazioni raccolte.\r\n\r\nGestione dei cookie\r\n\r\nNel caso in cui tu abbia dubbi o preoccupazioni in merito all’utilizzo dei cookie ti è sempre possibile intervenire per impedirne l’impostazione e la lettura, ad esempio modificando le impostazioni sulla privacy all’interno del tuo browser al fine di bloccarne determinati tipi o utilizzando il tool che ti mettiamo a disposizione in questa Informativa.\r\n\r\nPoiché ciascun browser – e spesso diverse versioni dello stesso browser – differiscono anche sensibilmente le une dalle altre se preferisce agire autonomamente mediante le preferenze del tuo browser puoi trovare informazioni dettagliate sulla procedura necessaria nella guida del tuo browser. Per una panoramica delle modalità di azione per i browser più comuni, puoi visitare l’indirizzo www.cookiepedia.co.uk\r\n\r\nLe società pubblicitarie consentono inoltre di rinunciare alla ricezione di annunci mirati, se lo si desidera. Ciò non impedisce l’impostazione dei cookie, ma interrompe l’utilizzo e la raccolta di alcuni dati da parte di tali società.\r\n\r\nPer maggiori informazioni e possibilità di rinuncia, visitare l’indirizzo www.youronlinechoices.eu\r\n\r\nProseguendo nella navigazione su questo sito chiudendo la fascetta informativa o facendo click in una qualsiasi parte della pagina o scorrendola per evidenziare ulteriore contenuto, si accetta la Cookie Policy e verranno impostati e raccolti i cookie. In caso di mancata accettazione dei cookie mediante abbandono della navigazione, eventuali cookie già registrati localmente nel tuo browser rimarranno ivi registrati ma non saranno più letti né utilizzati fino ad una successiva ed eventuale accettazione della Policy. Avrai sempre la possibilità di rimuovere tali cookie in qualsiasi momento attraverso le modalità di cui ai siti citati nel paragrafo “Gestione dei cookie”.', 'Cookie Policy', '', 'inherit', 'closed', 'closed', '', '227-revision-v1', '', '', '2016-03-05 15:54:41', '2016-03-05 14:54:41', '', 227, 'http://www.casarabatti.it/?p=229', 0, 'revision', '', 0),
(231, 1, '2016-03-09 21:12:48', '2016-03-09 20:12:48', 'I nostro Partners:', 'I Partners', '', 'publish', 'open', 'open', '', 'i-partners', '', '', '2016-03-09 21:17:12', '2016-03-09 20:17:12', '', 0, 'http://www.casarabatti.it/?p=231', 0, 'post', '', 0),
(232, 1, '2016-03-09 21:12:48', '2016-03-09 20:12:48', 'I nostro Partners:', 'I Partners', '', 'inherit', 'closed', 'closed', '', '231-revision-v1', '', '', '2016-03-09 21:12:48', '2016-03-09 20:12:48', '', 231, 'http://www.casarabatti.it/231-revision-v1/', 0, 'revision', '', 0),
(233, 1, '2016-03-13 22:55:21', '0000-00-00 00:00:00', '', 'Bozza automatica', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-03-13 22:55:21', '0000-00-00 00:00:00', '', 0, 'http://www.casarabatti.it/?p=233', 0, 'post', '', 0),
(234, 1, '2016-03-15 20:50:47', '2016-03-15 19:50:47', '', 'sergio appartamento 2   27-10-15 027', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-027', '', '', '2016-03-15 20:50:47', '2016-03-15 19:50:47', '', 0, 'http://www.casarabatti.it/wp-content/uploads/2016/03/sergio-appartamento-2-27-10-15-027.jpg', 0, 'attachment', 'image/jpeg', 0),
(235, 1, '2016-03-15 20:50:51', '2016-03-15 19:50:51', '', 'sergio appartamento 2   27-10-15 166', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-166', '', '', '2016-03-15 20:50:51', '2016-03-15 19:50:51', '', 0, 'http://www.casarabatti.it/wp-content/uploads/2016/03/sergio-appartamento-2-27-10-15-166.jpg', 0, 'attachment', 'image/jpeg', 0),
(236, 1, '2016-03-15 20:50:59', '2016-03-15 19:50:59', '', 'sergio appartamento 2   27-10-15 360', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-27-10-15-360', '', '', '2016-03-15 20:50:59', '2016-03-15 19:50:59', '', 0, 'http://www.casarabatti.it/wp-content/uploads/2016/03/sergio-appartamento-2-27-10-15-360.jpg', 0, 'attachment', 'image/jpeg', 0),
(237, 1, '2016-03-15 20:51:05', '2016-03-15 19:51:05', '', 'sergio appartamento 2 RR 27-10-15 298', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-2-rr-27-10-15-298', '', '', '2016-03-15 20:51:05', '2016-03-15 19:51:05', '', 0, 'http://www.casarabatti.it/wp-content/uploads/2016/03/sergio-appartamento-2-RR-27-10-15-298.jpg', 0, 'attachment', 'image/jpeg', 0),
(238, 1, '2016-03-15 20:51:12', '2016-03-15 19:51:12', '', 'sergio appartamento 3 RR 16-12-15 031', '', 'inherit', 'open', 'closed', '', 'sergio-appartamento-3-rr-16-12-15-031', '', '', '2016-03-15 20:51:12', '2016-03-15 19:51:12', '', 0, 'http://www.casarabatti.it/wp-content/uploads/2016/03/sergio-appartamento-3-RR-16-12-15-031.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Senza categoria', 'senza-categoria', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(11, 1, 0),
(16, 1, 0),
(18, 1, 0),
(224, 1, 0),
(231, 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '0'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '233'),
(16, 1, 'session_tokens', 'a:4:{s:64:"a1afb5f666a68066715ea09039503f837829877a733f364abadc470e177aec6d";a:4:{s:10:"expiration";i:1458763917;s:2:"ip";s:11:"5.88.67.139";s:2:"ua";s:82:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0";s:5:"login";i:1457554317;}s:64:"04d86cfbb400370923f41f24b3099778752556733e150aed332483fdaee5929b";a:4:{s:10:"expiration";i:1459280959;s:2:"ip";s:11:"5.88.67.139";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36";s:5:"login";i:1458071359;}s:64:"c1ccb3612963d9ffbfe51e8f782d88e54397bf4b5ca092435ce32d8f49b45519";a:4:{s:10:"expiration";i:1458662826;s:2:"ip";s:3:"::1";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36";s:5:"login";i:1458490026;}s:64:"a356711d234383a6ae468c294035bb4f5fb8e6c40acdd656a2da3643b43cdbc4";a:4:{s:10:"expiration";i:1458663194;s:2:"ip";s:3:"::1";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36";s:5:"login";i:1458490394;}}'),
(17, 1, 'wp_user-settings', 'libraryContent=browse'),
(18, 1, 'wp_user-settings-time', '1457115588'),
(19, 1000, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(20, 1000, 'wp_user_level', '10');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BeqI9WZ/CXw.UWphCfKjzvaX3XMokK.', 'admin', 'roberto.bani@gmail.com', '', '2016-02-16 20:13:48', '', 1, 'admin'),
(1000, 'roberto', '21232f297a57a5a743894a0e4a801fc3', 'roberto', 'support@wpwhitesecurity.com', '', '0000-00-00 00:00:00', '', 0, 'Temp User');

-- --------------------------------------------------------

--
-- Struttura della tabella `wp_wonderplugin_slider`
--

CREATE TABLE `wp_wonderplugin_slider` (
  `id` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authorid` tinytext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `wp_wonderplugin_slider`
--

INSERT INTO `wp_wonderplugin_slider` (`id`, `name`, `data`, `time`, `authorid`) VALUES
(1, 'Home Page', '{"newestfirst":"false","name":"Home Page","width":840,"height":400,"slides":[{"type":0,"image":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-27-10-15-027.jpg","thumbnail":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-27-10-15-027-150x150.jpg","title":"sergio appartamento 2   27-10-15 027","description":"","altusetitle":"true","alt":"","button":"","buttoncss":"as-btn-blue-medium","buttonlink":"","buttonlinktarget":"","weblink":"","linktarget":"","lightbox":"false","lightboxsize":"false","lightboxwidth":960,"lightboxheight":540},{"type":0,"image":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-27-10-15-166.jpg","thumbnail":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-27-10-15-166-150x150.jpg","title":"sergio appartamento 2   27-10-15 166","description":"","altusetitle":"true","alt":"","button":"","buttoncss":"as-btn-blue-medium","buttonlink":"","buttonlinktarget":"","weblink":"","linktarget":"","lightbox":"false","lightboxsize":"false","lightboxwidth":960,"lightboxheight":540},{"type":0,"image":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-27-10-15-360.jpg","thumbnail":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-27-10-15-360-150x150.jpg","title":"sergio appartamento 2   27-10-15 360","description":"","altusetitle":"true","alt":"","button":"","buttoncss":"as-btn-blue-medium","buttonlink":"","buttonlinktarget":"","weblink":"","linktarget":"","lightbox":"false","lightboxsize":"false","lightboxwidth":960,"lightboxheight":540},{"type":0,"image":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-RR-27-10-15-298.jpg","thumbnail":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-2-RR-27-10-15-298-150x150.jpg","title":"sergio appartamento 2 RR 27-10-15 298","description":"","altusetitle":"true","alt":"","button":"","buttoncss":"as-btn-blue-medium","buttonlink":"","buttonlinktarget":"","weblink":"","linktarget":"","lightbox":"false","lightboxsize":"false","lightboxwidth":960,"lightboxheight":540},{"type":0,"image":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-3-RR-16-12-15-031.jpg","thumbnail":"http:\\/\\/www.casarabatti.it\\/wp-content\\/uploads\\/2016\\/03\\/sergio-appartamento-3-RR-16-12-15-031-150x150.jpg","title":"sergio appartamento 3 RR 16-12-15 031","description":"","altusetitle":"true","alt":"","button":"","buttoncss":"as-btn-blue-medium","buttonlink":"","buttonlinktarget":"","weblink":"","linktarget":"","lightbox":"false","lightboxsize":"false","lightboxwidth":960,"lightboxheight":540}],"transition":"slide","skin":"header","showtext":"false","textformat":"None","paddingleft":0,"paddingright":0,"paddingtop":0,"paddingbottom":0,"titleusealt":"false","fadeduration":1000,"crossfadeduration":1000,"slideduration":2000,"elasticduration":1000,"sliceduration":1500,"blindsduration":1500,"blocksduration":1500,"shuffleduration":1500,"tilesduration":2000,"kenburnsduration":5000,"flipduration":1500,"flipwithzoomduration":2000,"threedduration":1500,"threedhorizontalduration":1500,"threedwithzoomduration":2500,"threedhorizontalwithzoomduration":2200,"threedflipduration":1500,"threedflipwithzoomduration":2000,"threedtilesduration":2000,"threedfallback":"flip","threedhorizontalfallback":"flip","threedwithzoomfallback":"flipwithzoom","threedhorizontalwithzoomfallback":"flipwithzoom","threedflipfallback":"flip","threedflipwithzoomfallback":"flipwithzoom","threedtilesfallback":"tiles","lightboxnogroup":"false","lightboxresponsive":"true","lightboxshownavigation":"false","lightboxshowtitle":"true","lightboxshowdescription":"false","lightboxthumbwidth":90,"lightboxthumbheight":60,"lightboxthumbtopmargin":12,"lightboxthumbbottommargin":4,"lightboxbarheight":64,"lightboxtitlebottomcss":"color:#333; font-size:14px; font-family:Armata,sans-serif,Arial; overflow:hidden; text-align:left;","lightboxdescriptionbottomcss":"color:#333; font-size:12px; font-family:Arial,Helvetica,sans-serif; overflow:hidden; text-align:left; margin:4px 0px 0px; padding: 0px;","lightboxfullscreenmode":"false","lightboxcloseonoverlay":"true","lightboxvideohidecontrols":"false","lightboxtitlestyle":"bottom","lightboximagepercentage":75,"lightboxdefaultvideovolume":1,"lightboxoverlaybgcolor":"#000","lightboxoverlayopacity":0.9,"lightboxbgcolor":"#fff","lightboxtitleprefix":"%NUM \\/ %TOTAL","lightboxtitleinsidecss":"color:#fff; font-size:16px; font-family:Arial,Helvetica,sans-serif; overflow:hidden; text-align:left;","lightboxdescriptioninsidecss":"color:#fff; font-size:12px; font-family:Arial,Helvetica,sans-serif; overflow:hidden; text-align:left; margin:4px 0px 0px; padding: 0px;","lightboxautoslide":"false","lightboxslideinterval":5000,"lightboxshowtimer":"true","lightboxtimerposition":"bottom","lightboxtimerheight":2,"lightboxtimercolor":"#dc572e","lightboxtimeropacity":1,"lightboxshowplaybutton":"true","lightboxalwaysshownavarrows":"false","lightboxbordersize":8,"lightboxshowtitleprefix":"true","lightboxborderradius":0,"donotinit":"false","addinitscript":"false","triggerresize":"false","triggerresizedelay":100,"customcss":"width: 100%;","dataoptions":"","showbottomshadow":"false","navshowpreview":"false","border":0,"autoplay":"true","randomplay":"false","loadimageondemand":"true","transitiononfirstslide":"true","autoplayvideo":"false","isresponsive":"true","arrowstyle":"none","showtimer":"false","loop":0,"slideinterval":8000,"arrowimage":"arrows-32-32-0.png","arrowwidth":32,"arrowheight":32,"arrowtop":50,"arrowmargin":8,"navstyle":"none","navimage":"bullet-24-24-0.png","navwidth":24,"navheight":24,"navspacing":8,"navmarginx":16,"navmarginy":16,"navposition":"bottom","playvideoimage":"playvideo-64-64-0.png","playvideoimagewidth":64,"playvideoimageheight":64,"scalemode":"fill","arrowimagemode":"defined","navimagemode":"defined","fullwidth":"true","isfullscreen":"true","textcss":"display:block; padding:12px; text-align:left;","textbgcss":"display:block; position:absolute; top:0px; left:0px; width:100%; height:100%; background-color:#333333; opacity:0.6; filter:alpha(opacity=60);","titlecss":"display:block; position:relative; font:bold 14px \\"Lucida Sans Unicode\\",\\"Lucida Grande\\",sans-serif,Arial; color:#fff;","descriptioncss":"display:block; position:relative; font:12px \\"Lucida Sans Unicode\\",\\"Lucida Grande\\",sans-serif,Arial; color:#fff; margin-top:8px;","buttoncss":"display:block; position:relative; margin-top:8px;","texteffectresponsive":"true","texteffectresponsivesize":640,"titlecssresponsive":"font-size:12px;","descriptioncssresponsive":"display:none !important;","buttoncssresponsive":"","textpositionstatic":"bottom","textpositiondynamic":"bottomleft","textautohide":"true","ratioresponsive":"false","ratiomediumscreen":800,"ratiomediumheight":1.2,"ratiosmallscreen":480,"ratiosmallheight":1.6}', '2016-03-16 01:05:13', '1');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cal_ambienti`
--
ALTER TABLE `cal_ambienti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `cal_calendario`
--
ALTER TABLE `cal_calendario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cal_ambienti_cal_calendario` (`ambiente`),
  ADD KEY `fk_cal_clienti_cal_calendario` (`cliente`);

--
-- Indici per le tabelle `cal_clienti`
--
ALTER TABLE `cal_clienti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indici per le tabelle `interessi`
--
ALTER TABLE `interessi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `interessi_soci`
--
ALTER TABLE `interessi_soci`
  ADD UNIQUE KEY `id_socio` (`id_socio`,`id_interesse`);

--
-- Indici per le tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indici per le tabelle `soci`
--
ALTER TABLE `soci`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tmpdoc`
--
ALTER TABLE `tmpdoc`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tmpimg`
--
ALTER TABLE `tmpimg`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tmpmail`
--
ALTER TABLE `tmpmail`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_album`
--
ALTER TABLE `wp_bwg_album`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_album_gallery`
--
ALTER TABLE `wp_bwg_album_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_gallery`
--
ALTER TABLE `wp_bwg_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_image`
--
ALTER TABLE `wp_bwg_image`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_image_comment`
--
ALTER TABLE `wp_bwg_image_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_image_rate`
--
ALTER TABLE `wp_bwg_image_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_image_tag`
--
ALTER TABLE `wp_bwg_image_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_option`
--
ALTER TABLE `wp_bwg_option`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_shortcode`
--
ALTER TABLE `wp_bwg_shortcode`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_bwg_theme`
--
ALTER TABLE `wp_bwg_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indici per le tabelle `wp_g_circles`
--
ALTER TABLE `wp_g_circles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_g_maps`
--
ALTER TABLE `wp_g_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_g_markers`
--
ALTER TABLE `wp_g_markers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_g_polygones`
--
ALTER TABLE `wp_g_polygones`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_g_polylines`
--
ALTER TABLE `wp_g_polylines`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indici per le tabelle `wp_masterslider_options`
--
ALTER TABLE `wp_masterslider_options`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indici per le tabelle `wp_masterslider_sliders`
--
ALTER TABLE `wp_masterslider_sliders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `date_created` (`date_created`);

--
-- Indici per le tabelle `wp_ngg_album`
--
ALTER TABLE `wp_ngg_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indici per le tabelle `wp_ngg_gallery`
--
ALTER TABLE `wp_ngg_gallery`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indici per le tabelle `wp_ngg_pictures`
--
ALTER TABLE `wp_ngg_pictures`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indici per le tabelle `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indici per le tabelle `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indici per le tabelle `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indici per le tabelle `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indici per le tabelle `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indici per le tabelle `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indici per le tabelle `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- Indici per le tabelle `wp_wonderplugin_slider`
--
ALTER TABLE `wp_wonderplugin_slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cal_ambienti`
--
ALTER TABLE `cal_ambienti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `cal_calendario`
--
ALTER TABLE `cal_calendario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT per la tabella `cal_clienti`
--
ALTER TABLE `cal_clienti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `interessi`
--
ALTER TABLE `interessi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `soci`
--
ALTER TABLE `soci`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `tmpdoc`
--
ALTER TABLE `tmpdoc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT per la tabella `tmpimg`
--
ALTER TABLE `tmpimg`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT per la tabella `tmpmail`
--
ALTER TABLE `tmpmail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18660;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_album`
--
ALTER TABLE `wp_bwg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_album_gallery`
--
ALTER TABLE `wp_bwg_album_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_gallery`
--
ALTER TABLE `wp_bwg_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_image`
--
ALTER TABLE `wp_bwg_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_image_comment`
--
ALTER TABLE `wp_bwg_image_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_image_rate`
--
ALTER TABLE `wp_bwg_image_rate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_image_tag`
--
ALTER TABLE `wp_bwg_image_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_option`
--
ALTER TABLE `wp_bwg_option`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_bwg_theme`
--
ALTER TABLE `wp_bwg_theme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_g_circles`
--
ALTER TABLE `wp_g_circles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_g_maps`
--
ALTER TABLE `wp_g_maps`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_g_markers`
--
ALTER TABLE `wp_g_markers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `wp_g_polygones`
--
ALTER TABLE `wp_g_polygones`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_g_polylines`
--
ALTER TABLE `wp_g_polylines`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_masterslider_options`
--
ALTER TABLE `wp_masterslider_options`
  MODIFY `ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_masterslider_sliders`
--
ALTER TABLE `wp_masterslider_sliders`
  MODIFY `ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_ngg_album`
--
ALTER TABLE `wp_ngg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_ngg_gallery`
--
ALTER TABLE `wp_ngg_gallery`
  MODIFY `gid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT per la tabella `wp_ngg_pictures`
--
ALTER TABLE `wp_ngg_pictures`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT per la tabella `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4132;
--
-- AUTO_INCREMENT per la tabella `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2674;
--
-- AUTO_INCREMENT per la tabella `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT per la tabella `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;
--
-- AUTO_INCREMENT per la tabella `wp_wonderplugin_slider`
--
ALTER TABLE `wp_wonderplugin_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
