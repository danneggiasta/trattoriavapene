<?php

namespace App\Controllers;

use \Core\View;
use \App\Auth;
use App\Models\Menu;

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

        $meni = $menu->getVrsta();
        View::renderTemplate('Home/index.html', [
            'meni' => $meni
        ]);
    }
}
