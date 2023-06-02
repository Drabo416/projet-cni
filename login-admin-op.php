<?php
    session_destroy();
    session_start();
    require("connection.php");
    require('verifie.php');
    $requiredFields = array('email', 'password');
    $postData = $_POST;
    $areAllFieldsPresent = verifyFields($requiredFields, $postData);
    if(!$areAllFieldsPresent){
        header('Location: login.php');
    }else{
        $bd=connexion();
        $query = $bd->prepare("select * from admin where email=:email ");
        $query->execute(array('email'=>$_POST['email']));
        $individu = $query->fetch();
        if($individu){
            $_SESSION['adminId']=$individu['id'];
            header("Location: list-carte.php");
        }else{
            header('Location: login.php');
        }
    }
?>