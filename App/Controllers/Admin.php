<?php

namespace App\Controllers;

use \Core\View;
use App\Models\Menu;

/**
 * Admin controller (example)
 *
 * PHP version 7.0
 */
//class Admin extends \Core\Controller
class Admin extends Authenticated
{
    /**
     * Admin index
     *
     * @return void
     */
    public function indexAction()
    {
        $dat = new Menu();

        $data = $dat->getVrsta();

        View::renderTemplate('Admin/index.html', [
                'jelovnik' => $data
        ]);
    }

    public function addJeloAction()
    {
        if(isset($_POST['submit'])) {

            $vrsta = trim(htmlentities($_POST['vrsta'],ENT_QUOTES,'UTF-8'));
            $jelo  = trim(htmlentities($_POST['jelo'],ENT_QUOTES,'UTF-8'));
            $opis  = trim(htmlentities($_POST['opis'],ENT_QUOTES,'UTF-8'));
            $cena  = trim(htmlentities($_POST['cena'],ENT_QUOTES,'UTF-8'));
            
            $add = new Menu();

            $add->add($vrsta, $jelo, $opis, $cena);            
        }
        $this->redirect('/admin');
    }

    public function deleteJeloAction()
    {
        $id = $this->route_params['id'];

        if(isset($id)) {
            $delete = new Menu();

            $delete->delete($id);
        }

        $this->redirect('/admin');
    }

    public function editJeloAction()
    {
        $id = $this->route_params['id'];

        if(isset($id))
        {
            $data = new Menu();
            $data = $data->getJelo($id);

            View::renderTemplate('Admin/edit.html', ['jelovnik' => $data]);
        } else {
            $this->redirect('/admin');
        }
    }

    public function updateJeloAction()
    {
        if(isset($_POST['submit'])) {
            $id = trim(htmlentities($_POST['id'],ENT_QUOTES,'UTF-8'));
            $vrsta = trim(htmlentities($_POST['vrsta'],ENT_QUOTES,'UTF-8'));
            $jelo  = trim(htmlentities($_POST['jelo'],ENT_QUOTES,'UTF-8'));
            $opis  = trim(htmlentities($_POST['opis'],ENT_QUOTES,'UTF-8'));
            $cena  = trim(htmlentities($_POST['cena'],ENT_QUOTES,'UTF-8'));

            $update = new Menu();
            $update->update($id, $vrsta, $jelo, $opis, $cena);
        }
        $this->redirect('/admin');
    }
}
