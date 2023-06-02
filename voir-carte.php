<?php
session_start();
if($_GET['numCNI']){
    $_SESSION['individuNumCni'] = $_GET['numCNI'];
    header("Location: carte.php");
}else{
    header("Location: list-carte.php");
}
?>