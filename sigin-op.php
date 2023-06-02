<?php
    session_start();
    require('verifie.php');
    require("connection.php");
    require('generate-code.php');
    require('save-file.php');
    $bd = connexion();
    $requiredFields = array(
    'nom',
    'prenom',
    'idsexe',
    'idprofession',
    'codepays',
    'lieunaiss',
    'datenaiss',
    'heurenaiss',
    'telephone',
    'taille',
    'nompere',
    'prenompere',
    'datenaisspere',
    'lieunaisspere',
    'idprofessionPere',
    'nommere',
    'prenommere',
    'datenaissmere',
    'lieunaissmere',
    'idprofessionMere'
);

    $postData = $_POST;
    $areAllFieldsPresent = verifyFields($requiredFields, $postData);
if (!$areAllFieldsPresent) {
    header('Location: signin.php?error=ok');
}else{
    $profile= saveFile("lieuphoto");
    $signature = saveFile("lieusignature");
    $signature = saveFile("lieuempreinte");
    $pereQuery = $bd->prepare("INSERT INTO  pere (nompere, prenompere, datenaisspere, lieunaisspere, idprofession)
    values(:nompere, :prenompere, :datenaisspere, :lieunaisspere, :idprofession)
    ");
    $pereQuery->execute(array('nompere'=>$_POST["nompere"], "prenompere"=>$_POST['prenompere'], "datenaisspere"=>$_POST['datenaisspere'], "lieunaisspere"=>$_POST['lieunaisspere'], 'idprofession'=>$_POST["idprofessionPere"]));
    $pereId = $bd->lastInsertId();

    $mereQuery = $bd->prepare("INSERT INTO  mere (nommere, prenommere, datenaissmere, lieunaissmere, idprofession)
    values(:nommere, :prenommere, :datenaissmere, :lieunaissmere, :idprofessionMere)");
    $mereQuery->execute(array('nommere'=>$_POST["nommere"], "prenommere"=>$_POST['prenommere'],
     "datenaissmere"=>$_POST['datenaissmere'], "lieunaissmere"=>$_POST['lieunaissmere'], 'idprofessionMere'=>$_POST["idprofessionMere"]));
     $mereId = $bd->lastInsertId();

    $query = $bd->prepare("INSERT INTO individu (
        numCNI , nom, prenom, datenaiss, lieunaiss, heurenaiss, telephone, lieuphoto, lieusignature, taille, dateenrollement, dateemission, dateexpiration, idprofession, idsexe, codepays, idmere, idpere)
        values(:numCNI, :nom, :prenom, :datenaiss, :lieunaiss, :heurenaiss, :telephone, :lieuphoto, :lieusignature, :taille, Now(), Now(), DATE_ADD(NOW(), INTERVAL 10 month), :idprofession, :idsexe, :codepays, :idmere, :idpere)");
    $numCNI=generateUniqueCode();
    $query->execute(array('numCNI'=>$numCNI, 'nom'=>$_POST['nom'], 'prenom'=>$_POST['prenom'], 'idsexe'=>$_POST["idsexe"], 'idprofession'=>$_POST['idprofession'], 'codepays'=>$_POST['codepays'], 'lieunaiss'=>$_POST['lieunaiss'], 'datenaiss'=>$_POST['datenaiss'], 'heurenaiss'=>$_POST['heurenaiss'], 'telephone'=>$_POST['telephone'], 'taille'=>$_POST['taille'], 'lieuphoto'=>$profile, 'lieusignature'=>$signature, 'idmere'=>$mereId, 'idpere'=>$pereId));
    $lastIdQuery = "SELECT numCNI FROM individu ORDER BY dateemission DESC LIMIT 1";
    $lastIdStmt = $bd->query($lastIdQuery);
    $lastId = $lastIdStmt->fetchColumn();
    $_SESSION['individuNumCni'] = $lastId;
    header("Location: carte.php");
}
?>