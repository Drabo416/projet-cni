<?php
  session_start();
  require("connection.php");
  $bd = connexion();
  $sexe = $bd->query('select * from sexe');
  $profession = $bd->query("select * from professsion");
  $nationalite = $bd->query("select * from nationalite");
  $requestMethod = $_SERVER['REQUEST_METHOD'];
  $isUpdate = false;
  if(isset($_GET ['edit']) &&$_GET['edit']=='ok'){
    $isUpdate=true;
  }
  if(!isset($_SESSION['individuNumCni'])&&$isUpdate){
    header("Location: index.php");
}
  $result;
  if($isUpdate){
    $individuNumCni = $_SESSION['individuNumCni'];
    $query = $bd->prepare('SELECT *, pere.idprofession as pereprof, mere.idprofession as mereprof from individu
     inner join mere on mere.idmere=individu.idmere
     inner join nationalite on nationalite.codepays=individu.codepays
     inner join pere on pere.idpere = individu.idpere
     inner join professsion on professsion.idprofession =individu.idprofession
     inner join sexe on sexe.idsexe = individu.idsexe 
     where individu.numCNI=:numCni
     ');
    $query->execute(array('numCni'=>$individuNumCni));
    $result =$query->fetch();

  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="signin.css">
</head>
<body>
<div class="container">
      <form action="<?php if($isUpdate) echo "update-op.php"; else echo "sigin-op.php"?>" enctype="multipart/form-data" method="post">
     <?php
        if(isset($_GET['error'])&&$_GET['error']){
          ?>
           <div class="status-content">
           Veuillez remplir ton les champs
      </div>
      <?php
        }
     ?>
      <h3>Enregistrer Utilisateur</h3>
      <div class="content-block">
              <p class="form-group-title">Informations du demandeur</p>
              <div class="form-group">
                <label for="nom">Nom :</label>
                <input type="text" value="<?php if($isUpdate)echo $result['nom'] ?>" id="nom" name="nom">
              </div>
              <div class="form-group">
                <label for="prenom">Prénom :</label>
                <input type="text" value="<?php if($isUpdate)echo $result['prenom'] ?>" id="prenom" name="prenom">
              </div>
              <div class="form-group">
                  <label for="sexe">Sexe :</label>
                  <select name="idsexe" id="">
                    <?php 
                      while($data = $sexe->fetch()){
                        ?>
                        <option <?php if($isUpdate&&$data['idsexe']==$result['idsexe'])echo "selected" ?> name="idsexe" value="<?php echo $data['idsexe'] ?>"><?php echo $data['libsexe'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
              <div class="form-group">
                  <label for="sexe">Profession :</label>
                  <select value="3" name="idprofession" id="">
                  <?php 
                      $profData =[];
                      while($data = $profession->fetch()){
                        array_push( $profData, $data);
                        ?>
                        <option <?php if($isUpdate&&$data['idprofession']==$result['idprofession'])echo "selected" ?> value="<?php echo $data['idprofession'] ?>"><?php echo $data['libprofession'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
              <div class="form-group">
                  <label for="sexe">Nationalité :</label>
                  <select name="codepays" id="">
                  <?php 
                      while($data = $nationalite->fetch()){
                        ?>
                        <option <?php if($isUpdate&&$data['codepays']==$result['codepays'])echo "selected" ?> value="<?php echo $data['codepays'] ?>"><?php echo $data['libpays'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
                <div class="form-group">
                  <label for="lieu">Lieu de naissance :</label>
                  <input value="<?php if($isUpdate) echo $result['lieunaiss'] ?>" type="text" id="lieu" name="lieunaiss">
                </div>
              <div class="form-group">
                  <label for="date">Date de naissance :</label>
                  <input value="<?php if($isUpdate) echo $result['datenaiss'] ?>" type="date" id="date" name="datenaiss">
              </div> 
              <div class="form-group">
                <label for="heure">Heure de naissance :</label>
                <input value="<?php if($isUpdate) echo  $result['heurenaiss'] ?>" type="time" id="heure" name="heurenaiss">
              </div>
              <div class="form-group">
                  <label for="telephone">Telephone</label>
                  <input  value="<?php if($isUpdate) echo $result['telephone'] ?>" type="tel" id="telephone" name="telephone">
              </div>
              <div class="form-group">
                  <label for="telephone">Taille(M)</label>
                  <input step="any"  value="<?php if($isUpdate) echo $result['taille'] ?>" type="number" id="telephone" name="taille">
              </div>
              <?php
                if(!$isUpdate){
                  ?>
                  <div class="form-group" >
                <label for="telephone">Photo</label>
                <input type="file" name="lieuphoto">
              </div>
              <div class="form-group" >
                <label for="telephone">Signature</label>
                <input type="file" name="lieusignature">
              </div>
              <div class="form-group" >
                <label for="telephone">Empreinte</label>
                <input type="file" name="lieuempreinte">
              </div>
              <?php
                }
              ?>
      </div>
        <div class="content-block">
        <p class="form-group-title">Informations du père</p>
        <div class="form-group">
            <label for="telephone">Nom</label>
            <input value="<?php if($isUpdate) echo $result['nompere'] ?>" type='text' id="telephone" name="nompere">
        </div>
        <div class="form-group">
            <label for="telephone">prénoms</label>
            <input value="<?php if($isUpdate) echo $result['prenompere'] ?>" type='text' id="telephone" name="prenompere">
        </div>
        <div class="form-group">
            <label for="telephone">Date de naissance</label>
            <input value="<?php if($isUpdate) echo $result['datenaisspere'] ?>" type='date' id="telephone" name="datenaisspere">
        </div>
        <div class="form-group">
            <label for="telephone">Lieu de naissance</label>
            <input value="<?php if($isUpdate) echo $result['lieunaisspere'] ?>" type='text' id="telephone" name="lieunaisspere">
        </div>
        <div class="form-group">
            <label for="sexe">Profession :</label>
            <select name="idprofessionPere" id="">
            <?php 
                     for($i=0; $i<count($profData);$i++){
                        ?>
                        <option <?php if($isUpdate&&$profData[$i]['idprofession']==$result['pereprof'])echo "selected" ?> value="<?php echo $profData[$i]['idprofession'] ?>"><?php echo $profData[$i]['libprofession'] ?></option>
                        <?php
                      }
                    ?>
            </select>
        </div>
        </div>
       <div class="content-block">
       <p class="form-group-title">Informations de la  mère</p>
        <div class="form-group">
            <label for="telephone">Nom</label>
            <input  value="<?php if($isUpdate) echo $result['nommere'] ?>" type='text' id="telephone" name="nommere">
        </div>
        <div class="form-group">
            <label for="telephone">prénoms</label>
            <input  value="<?php if($isUpdate) echo $result['prenommere'] ?>" type='text' id="telephone" name="prenommere">
        </div>
        <div class="form-group">
            <label for="telephone">Date de naissance</label>
            <input  value="<?php if($isUpdate) echo $result['datenaissmere'] ?>" type='date' id="telephone" name="datenaissmere">
        </div>
        <div class="form-group">
            <label for="telephone">Lieu de naissance</label>
            <input  value="<?php if($isUpdate) echo $result['lieunaissmere'] ?>" type='text' id="telephone" name="lieunaissmere">
        </div>
        <div class="form-group">
            <label for="sexe">Profession :</label>
            <select name="idprofessionMere" id="">
            <?php 
                     for($i=0; $i<count($profData);$i++){
                        ?>
                        <option <?php if($isUpdate&&$profData[$i]['idprofession']==$result['mereprof'])echo "selected" ?> value="<?php echo $profData[$i]['idprofession'] ?>"><?php echo $profData[$i]['libprofession'] ?></option>
                        <?php
                      }
                    ?>
            </select>
        </div>
       </div>
       <?php
        if($isUpdate){
          ?>
          <input type="text" name="idpere" value="<?php if($isUpdate) echo $result['idpere'] ?>" hidden >
          <input type="text" name="idmere" value="<?php if($isUpdate) echo $result['idmere'] ?>" hidden >
       <?php
        }
       ?>
        <div class="button-container">
          <button type="reset" class="button button-reset">Annuler</button>
          <button type="submit" class="button button-submit">Suivant</button>
        </div>
      </form>
    </div>
    <script src="script.js" ></script>
</body>
</html>