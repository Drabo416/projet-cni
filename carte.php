<?php
    session_start();
    if(!isset($_SESSION['individuNumCni'])){
        header("Location: signin.php");
    }
    require('connection.php');
    $individuNumCni = $_SESSION['individuNumCni'];
    $bd = connexion();
    $query = $bd->prepare('SELECT * from individu
     inner join mere on mere.idmere=individu.idmere
     inner join nationalite on nationalite.codepays=individu.codepays
     inner join pere on pere.idpere = individu.idpere
     inner join professsion on professsion.idprofession =individu.idprofession
     inner join sexe on sexe.idsexe = individu.idsexe 
     where individu.numCNI=:numCni
     ');
    $query->execute(array('numCni'=>$individuNumCni));
    $result =$query->fetch();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <div class="d-flex flex-column justify-content-center" style="height: 100vh;">
    <section class="d-flex justify-content-center my-3" style=" box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 50px;width: 60%;height: 400px; margin:auto;" >
        <div class="rounded-1 d-flex my-3 mx-3 flex-column" style="width: 85.60mm; height: 53.98mm; background-color: #30A2FF; " >
            <div class="p-2" style="flex: 1;">
                <div class="d-flex">
                    <img width="30" height="30" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_C%C3%B4te_d%27Ivoire.svg/langfr-225px-Flag_of_C%C3%B4te_d%27Ivoire.svg.png" alt="">
                    <p class="mx-3">COTE D'IVOIRE</p>
                </div>
                <div class="d-flex" style="flex: 1; align-items: center;" >
                    <div style="width: 70px;height: 80px;" ><img src="<?php echo $result['lieuphoto'] ?>" width="70" alt=""></div>
                    <div class="flex-1 mx-4">
                    <div class="d-flex align-items-center "><p style="font-size: 13px;">NumCNI:</p><p class="mx-2" ><?php echo $result['numCNI'] ?></p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Nom:</p><p class="mx-2" ><?php echo $result['nom'] ?></p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Prenom:</p><p class="mx-2" ><?php echo $result['prenom'] ?></p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Sexe:</p><p class="mx-2" ><?php echo $result['libsexe'] ?></p></div>
                        <!-- <div class="d-flex align-items-center "><p style="font-size: 13px;">Professsion:</p><p class="mx-2" ><?php echo $result['libprofession'] ?></p></div> -->
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Taille:</p><p class="mx-2" ><?php echo $result['taille'] ?> M</p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">telephone:</p><p class="mx-2" ><?php echo $result['telephone'] ?></p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Né à:</p><p class="mx-2" ><?php echo $result['lieunaiss'] ?></p></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="rounded-1 d-flex my-3 mx-3 flex-column" style="width: 85.60mm; height: 53.98mm; background-color: #00C4FF;" >
            <div class="p-2" style="flex: 1;">
                <div class="d-flex">
                    <img width="30" height="30" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_C%C3%B4te_d%27Ivoire.svg/langfr-225px-Flag_of_C%C3%B4te_d%27Ivoire.svg.png" alt="">
                    <p class="mx-3">COTE D'IVOIRE</p>
                </div>
                <div class="d-flex align-content-center " style="flex: 1;" >
                    <div class="flex-1 mx-2">
                    <div class="d-flex align-items-center mt-1 "><p style="font-size: 13px;">Profession:</p><p class="mx-2" ><?php echo $result['libprofession'] ?></p></div>
                        <p class="info-parent my-1" >Informations père:</p>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Nom:</p><p class="mx-2" ><?php echo $result['nompere'] ?></p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Prenom:</p><p class="mx-2" ><?php echo $result['prenompere'] ?></p></div>
                        <p class="info-parent my-1" >Informations mère:</p>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Nom:</p><p class="mx-2" ><?php echo $result['nommere'] ?></p></p></div>
                        <div class="d-flex align-items-center "><p style="font-size: 13px;">Nom:</p><p class="mx-2" ><?php echo $result['prenommere'] ?></p></div>
                    </div>
                    <div class="d-flex flex-column justify-content-end py-2" style="flex: 1;" >
                            <img width="80" src="<?php echo $result['lieusignature'] ?>" alt="">
                    </div>
                </div>
            </div>
        </div>
</section>
</div>
<style>
    p{
        margin: 0;
        font-size: 14px;
    }
    .info-parent{
        text-align: center;
        text-decoration:underline;
        font-size: 12px;
    }
</style>
</body>
</html> 