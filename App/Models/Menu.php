<?php

namespace App\Models;

use PDO;
use App\Core\Model;

/**
 * Post Model
 *
 * PHP 7.1
 */
class Menu extends \Core\Model
{
	public function getVrsta()
	{
		$sql = 'SELECT * FROM jelovnik';

		$db = static::getDB();
		
		$stmt = $db->prepare($sql);

		$stmt->execute();
		$result = $stmt->fetchAll(PDO::FETCH_OBJ);

		foreach($result as $key => $value) {
			$menu[$key] = $value;
		}

		return $menu;
	}

	public function getJelo($id)
	{
		$sql = 'SELECT * FROM jelovnik WHERE id = :id LIMIT 1';

		$db = static::getDB();
		$stmt = $db->prepare($sql);
		$stmt->bindValue(':id', $id, PDO::PARAM_INT);

		$stmt->execute();

		$jelo = $stmt->fetch();

		return $jelo;

	}

	public function add($vrsta, $jelo, $opis, $cena)
	{
		$sql = 'INSERT INTO jelovnik (vrsta, jelo, opis, cena)
				VALUES (:vrsta, :jelo, :opis, :cena)';

		$db = static::getDB();

		$stmt = $db->prepare($sql);

		$stmt->bindValue(':vrsta', $vrsta, PDO::PARAM_STR);
		$stmt->bindValue(':jelo', $jelo, PDO::PARAM_STR);
		$stmt->bindValue(':opis', $opis, PDO::PARAM_STR);
		$stmt->bindValue(':cena', $cena, PDO::PARAM_STR);

		return $stmt->execute();
	}

	public function delete($id)
	{
		$sql = 'DELETE FROM jelovnik WHERE id = :id';

		$db = static::getDB();

		$stmt = $db->prepare($sql);

		$stmt->bindValue(':id', $id, PDO::PARAM_INT);

		return $stmt->execute();
	}

	public function update($id, $vrsta, $jelo, $opis, $cena)
	{
		$sql = 'UPDATE jelovnik SET vrsta = :vrsta, jelo = :jelo, opis = :opis, cena = :cena WHERE id = :id';

		$db = static::getDB();

		$stmt = $db->prepare($sql);

		$stmt->bindValue(':id', $id, PDO::PARAM_INT);
		$stmt->bindValue(':vrsta', $vrsta, PDO::PARAM_STR);
		$stmt->bindValue(':jelo', $jelo, PDO::PARAM_STR);
		$stmt->bindValue(':opis', $opis, PDO::PARAM_STR);
		$stmt->bindValue(':cena', $cena, PDO::PARAM_STR);

		return $stmt->execute();
	}
}