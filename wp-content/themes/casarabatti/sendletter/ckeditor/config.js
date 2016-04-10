/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

    config.extraPlugins = 'link';
    config.extraPlugins = 'attach';
    config.extraPlugins = 'uploadimage';
    config.uploadUrl = '../wp-content/themes/casarabatti/sendletter/upload.php';
};

