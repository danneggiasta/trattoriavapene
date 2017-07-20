<?php

namespace App\Controllers;

use \Core\View;
use App\Models\Menu;
use App\Models\Image;
use App\Flash;

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

    public function imagesAction()
    {
        $img = new Image();

        $image = $img->getImages();

        View::renderTemplate('Admin/images.html', [
            'image' => $image
        ]);
    }

    public function uploadImagesAction()
    {
        $target_dir = dirname(dirname(__DIR__)) . "/public/assets/img/owl/";
        $uploadOk = 1;
        $target_file = $target_dir . basename($_FILES['image']['name']);
        $image_file_type = pathinfo($target_file, PATHINFO_EXTENSION);

        // Check if image file is a actual image or fake
        if(isset($_POST['upload'])) {
        
            // Check file size
            if ($_FILES["image"]["size"] > 700000) {
                Flash::addMessage('Sorry, your file is too large');
                $uploadOk = 0;
                $this->redirect('/images');
            }
            // Allow certain file formats
            if($image_file_type != "jpg" && $image_file_type != "png" && $image_file_type != "jpeg") {
                Flash::addMessage('Sorry, only JPG, JPEG & PNG files are allowed.');
                $uploadOk = 0;
                $this->redirect('/images');
            }

            if(exif_imagetype($_FILES['image']['tmp_name']) !== false) {
                $uploadOk = 1;
            } else {
                Flash::addMessage('File is not an image.');
                $uploadOk = 0;
                $this->redirect('/images');
            }
            // Check if $uploadOk is set to 0 by an error
            if ($uploadOk == 0) {
                Flash::addMessage('Sorry, your file was not uploaded.');
                $this->redirect('/images');
            // if everything is ok, try to upload file
            } else {

                $img = new Image();

                $imgname = "owl" . rand(20, 10000) . "." . $image_file_type;

                if($img->checkImageExists($imgname)) {

                    Flash::addMessage('Image with this name already exists please try again');
                    $this->redirect('/images');
                } else {
                    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_dir.$imgname)) {
                        
                        $img->uploadImage($imgname);

                        Flash::addMessage("The file ". basename( $_FILES["image"]["name"]). " has been uploaded.");

                        $this->redirect('/images'); 
                    
                    } else {

                        Flash::addMessage('Sorry, there was an error uploading your file.');
                        $this->redirect('/images');
                    }
                }
            }
        }
    
        $this->redirect('/admin');
    }

    public function deleteImageAction()
    {
        $id = $this->route_params['id'];

        if(isset($id)) {
            $delete = new Image();

            $d = $delete->getImageId($id);

            unlink(dirname(dirname(__DIR__)) . "/public/assets/img/owl/" . $d->image);

            $delete->deleteImage($id);
        }

        $this->redirect('/images');
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
