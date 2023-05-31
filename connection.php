<?php 
    function connexion(){
        try
{
	$db = new PDO('mysql:host=localhost;dbname=carte;charset=utf8', 'mohamed', 'Drabo@mohamed5985',  [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    return $db;
}
catch (Exception $e)
{
        die('Erreur : ' . $e->getMessage());
}
    }

?>