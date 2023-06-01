<?php
  require("connection.php");
  $bd = connexion();
  $sexe = $bd->query('select * from sexe');
  $profession = $bd->query("select * from professsion");
  $nationalite = $bd->query("select * from nationalite");
  $requestMethod = $_SERVER['REQUEST_METHOD'];
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
      <form action="sigin-op.php" enctype="multipart/form-data" method="post">
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
                <input type="text" id="nom" name="nom">
              </div>
              <div class="form-group">
                <label for="prenom">Prénom :</label>
                <input type="text" id="prenom" name="prenom">
              </div>
              <div class="form-group">
                  <label for="sexe">Sexe :</label>
                  <select name="idsexe" id="">
                    <?php 
                      while($data = $sexe->fetch()){
                        ?>
                        <option value="<?php echo $data['idsexe'] ?>"><?php echo $data['libsexe'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
              <div class="form-group">
                  <label for="sexe">Profession :</label>
                  <select name="idprofession" id="">
                  <?php 
                      $profData =[];
                      while($data = $profession->fetch()){
                        array_push( $profData, $data);
                        ?>
                        <option value="<?php echo $data['idprofession'] ?>"><?php echo $data['libprofession'] ?></option>
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
                        <option value="<?php echo $data['codepays'] ?>"><?php echo $data['libpays'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
                <div class="form-group">
                  <label for="lieu">Lieu de naissance :</label>
                  <input type="text" id="lieu" name="lieunaiss">
                </div>
              <div class="form-group">
                  <label for="date">Date de naissance :</label>
                  <input type="date" id="date" name="datenaiss">
              </div> 
              <div class="form-group">
                <label for="heure">Heure de naissance :</label>
                <input type="time" id="heure" name="heurenaiss">
              </div>
              <div class="form-group">
                  <label for="telephone">Telephone</label>
                  <input type="tel" id="telephone" name="telephone">
              </div>
              <div class="form-group">
                  <label for="telephone">Taille(M)</label>
                  <input type="number" id="telephone" name="taille">
              </div>
              <div class="form-group">
                  <label for="telephone">Photo</label>
                  <input type='file' id="telephone" name="lieuphoto">
              </div>
              <div class="form-group">
                  <label for="telephone">Signature</label>
                  <input type='file' id="telephone" name="lieusignature">
              </div>
      </div>
        <div class="content-block">
        <p class="form-group-title">Informations du père</p>
        <div class="form-group">
            <label for="telephone">Nom</label>
            <input type='text' id="telephone" name="nompere">
        </div>
        <div class="form-group">
            <label for="telephone">prénoms</label>
            <input type='text' id="telephone" name="prenompere">
        </div>
        <div class="form-group">
            <label for="telephone">Date de naissance</label>
            <input type='date' id="telephone" name="datenaisspere">
        </div>
        <div class="form-group">
            <label for="telephone">Lieu de naissance</label>
            <input type='text' id="telephone" name="lieunaisspere">
        </div>
        <div class="form-group">
            <label for="sexe">Profession :</label>
            <select name="idprofessionPere" id="">
            <?php 
                     for($i=0; $i<count($profData);$i++){
                        ?>
                        <option value="<?php echo $profData[$i]['idprofession'] ?>"><?php echo $profData[$i]['libprofession'] ?></option>
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
            <input type='text' id="telephone" name="nommere">
        </div>
        <div class="form-group">
            <label for="telephone">prénoms</label>
            <input type='text' id="telephone" name="prenommere">
        </div>
        <div class="form-group">
            <label for="telephone">Date de naissance</label>
            <input type='date' id="telephone" name="datenaissmere">
        </div>
        <div class="form-group">
            <label for="telephone">Lieu de naissance</label>
            <input type='text' id="telephone" name="lieunaissmere">
        </div>
        <div class="form-group">
            <label for="sexe">Profession :</label>
            <select name="idprofessionMere" id="">
            <?php 
                     for($i=0; $i<count($profData);$i++){
                        ?>
                        <option value="<?php echo $profData[$i]['idprofession'] ?>"><?php echo $profData[$i]['libprofession'] ?></option>
                        <?php
                      }
                    ?>
            </select>
        </div>
       </div>
        <div class="button-container">
          <button type="reset" class="button button-reset">Annuler</button>
          <button type="submit" class="button button-submit">Suivant</button>
        </div>
      </form>
    </div>
    <script src="script.js" ></script>
</body>
</html>