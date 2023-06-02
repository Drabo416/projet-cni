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
    'idprofessionMere',
    'idmere',
    'idpere'
);

    $postData = $_POST;
    $areAllFieldsPresent = verifyFields($requiredFields, $postData);
if (!$areAllFieldsPresent) {
    header('Location: signin.php?edit=ok&&error=ok');
}else{
    $pereQuery = $bd->prepare("UPDATE pere set nompere=:nompere, prenompere=:prenompere, datenaisspere=:datenaisspere, lieunaisspere=:lieunaisspere, idprofession=:idprofession where idpere=:idpere");
    $pereQuery->execute(array('nompere'=>$_POST["nompere"], "prenompere"=>$_POST['prenompere'], "datenaisspere"=>$_POST['datenaisspere'], "lieunaisspere"=>$_POST['lieunaisspere'], 'idprofession'=>$_POST["idprofessionPere"], 'idpere'=>$_POST['idpere']));
    $pereId = $bd->lastInsertId();

    $mereQuery = $bd->prepare("UPDATE mere set  nommere=:nommere, prenommere=:prenommere, datenaissmere=:datenaissmere, lieunaissmere=:lieunaissmere, idprofession=:idprofessionMere where idmere=:idmere");
    $mereQuery->execute(array('nommere'=>$_POST["nommere"], "prenommere"=>$_POST['prenommere'],
     "datenaissmere"=>$_POST['datenaissmere'], "lieunaissmere"=>$_POST['lieunaissmere'], 'idprofessionMere'=>$_POST["idprofessionMere"], 'idmere'=>$_POST['idmere']));
     $mereId = $bd->lastInsertId();

    $query = $bd->prepare("UPDATE  individu set
         nom=:nom, prenom=:prenom, datenaiss=:datenaiss, lieunaiss=:lieunaiss, heurenaiss=:heurenaiss, telephone=:telephone, taille=:taille,idprofession=:idprofession, idsexe=:idsexe, codepays=:codepays where numCNI=:numCNI ");
    $numCNI=$_SESSION['individuNumCni'];
    $query->execute(array('numCNI'=>$numCNI, 'nom'=>$_POST['nom'], 'prenom'=>$_POST['prenom'], 'idsexe'=>$_POST["idsexe"], 'idprofession'=>$_POST['idprofession'], 'codepays'=>$_POST['codepays'], 'lieunaiss'=>$_POST['lieunaiss'], 'datenaiss'=>$_POST['datenaiss'], 'heurenaiss'=>$_POST['heurenaiss'], 'telephone'=>$_POST['telephone'], 'taille'=>$_POST['taille']));
    header("Location: carte.php");
}
?>