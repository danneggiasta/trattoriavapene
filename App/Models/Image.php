<?php

namespace App\Models;

use PDO;
use App\Core\Model;
use \App\Flash;

/**
 * Post Model
 *
 * PHP 7.1
 */
class Image extends \Core\Model
{
	public function uploadImage($imgname)
	{
		$db = static::getDB();

		$sql = 'INSERT INTO image_upload (image) VALUES (:image)';

		$stmt = $db->prepare($sql);
		$stmt->bindValue(':image', $imgname, PDO::PARAM_STR);
		$stmt->execute();
	}

	public function checkImageExists($imgname)
	{
		$db = static::getDB();

		$sql = 'SELECT image FROM image_upload WHERE image = :image';

		$stmt = $db->prepare($sql);
		$stmt->bindValue(':image', $imgname, PDO::PARAM_STR);
		$stmt->execute();

		if($r = $stmt->fetch()) {
			return true;
		} else {
			return false;
		}
	}

	public function getImages()
	{
		$db = static::getDB();

		$sql = 'SELECT id, image FROM image_upload ORDER BY id DESC';

		$stmt = $db->query($sql);

		$result = $stmt->fetchAll(PDO::FETCH_OBJ);

		return $result;
	}

	public function getImageId($id)
	{
		$db = static::getDB();

		$sql = 'SELECT id, image FROM image_upload WHERE id = :id LIMIT 1';

		$stmt = $db->prepare($sql);
		$stmt->bindValue(':id', $id, PDO::PARAM_INT);

		$stmt->setFetchMode(PDO::FETCH_CLASS, get_called_class());

        $stmt->execute();

        return $stmt->fetch();
	}

		public function deleteImage($id)
	{
		$sql = 'DELETE FROM image_upload WHERE id = :id';

		$db = static::getDB();

		$stmt = $db->prepare($sql);

		$stmt->bindValue(':id', $id, PDO::PARAM_INT);

		return $stmt->execute();
	}
}