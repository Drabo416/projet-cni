<?php
    session_destroy();
    session_start();
    require("connection.php");
    if(!isset($_POST['numCNI']) OR empty( $_POST['numCNI'])){
        header('Location: login.php');
    }else{
        $bd=connexion();
        $query = $bd->prepare("select * from individu where numCNI=:numCNI ");
        $query->execute(array('numCNI'=>$_POST['numCNI']));
        $individu = $query->fetch();
        if($individu){
            $_SESSION['individuNumCni']=$individu['numCNI'];
            header("Location: carte.php");
        }else{
            header('Location: login.php');
        }
    }
?>