<?php

namespace App\Controllers;

use \Core\View;
use \App\Auth;
use App\Models\Menu;
use App\Models\Image;

/**
 * Home controller
 *
 * PHP version 7.0
 */
class Home extends \Core\Controller
{

    /**
     * Show the index page
     *
     * @return void
     */
    public function indexAction()
    {
        $menu = new Menu();
        $gal = new Image();

        $gallery = $gal->getImages();

        $meni = $menu->getVrsta();
        View::renderTemplate('Home/index.html', [
            'meni' => $meni,
            'gallery' => $gallery
        ]);
    }
}
