<?php
   session_start();
   require('connection.php');
   if(!isset($_SESSION['adminId'])){
      header('Location: index.php');
   }
   $bd = connexion();
  $sexe = $bd->query('select * from sexe');
  $profession = $bd->query("select * from professsion");
  $nationalite = $bd->query("select * from nationalite");
   $bd = connexion();
   $sql = 'SELECT * from individu
   inner join mere on mere.idmere=individu.idmere
   inner join nationalite on nationalite.codepays=individu.codepays
   inner join pere on pere.idpere = individu.idpere
   inner join professsion on professsion.idprofession =individu.idprofession
   inner join sexe on sexe.idsexe = individu.idsexe 
   where 1';
   $executeArray=[];
    if(isset($_POST['idprofession']) AND !empty($_POST['idprofession'])){
      $sql =$sql.' and professsion.idprofession=:idprofession';
      $executeArray=array_merge($executeArray, ['idprofession'=>$_POST['idprofession']]);
    }
    if(isset($_POST['idsexe']) AND !empty($_POST['idsexe'])){
      $sql =$sql.' and sexe.idsexe=:idsexe';
      $executeArray=array_merge($executeArray, ['idsexe'=>$_POST['idsexe']]);
    }
    if(isset($_POST['codepays']) AND !empty($_POST['codepays'])){
      $sql =$sql.' and nationalite.codepays=:codepays';
      $executeArray=array_merge($executeArray, ['codepays'=>$_POST['codepays']]);
    }

   $query = $bd->prepare($sql);
   if(count($executeArray)){
    $query->execute($executeArray);
   }else{
    $query->execute($executeArray);
   }
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
    <div class="w-75 mx-auto mt-3" >
    <div class="d-flex align-items-center" >
    <a class="w-100 mx-3" href="signin.php"><button class="btn btn-primary w-100 my-2" type="submit">Inscrire un individu</button></a>
    <a class="w-100  mx-3" href="deconnecter.php"><Button class="btn btn-primary w-100 ">Déconnexion</Button></a></div>
    <form action="" method="POST">
    <div class="w-100 my-2">
        <div class="d-flex" >
        <div class="form-group mx-2" style="width:200px" >
                  <label for="sexe">Profession :</label>
                  <select class="form-select" name="idprofession" id="">
                  <option  value=""></option>
                  <?php 
                      $profData =[];
                      while($data = $profession->fetch()){
                        array_push( $profData, $data);
                        ?>
                        <option <?php if(isset($_POST['idprofession']) AND !empty($_POST['idprofession'] )AND $data['idprofession']==$_POST['idprofession']) echo "selected"?> value="<?php echo $data['idprofession'] ?>"><?php echo $data['libprofession'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
              <div class="form-group mx-2" style="width:200px" >
                  <label for="sexe">Sexe :</label>
                  <select class="form-select" name="idsexe" id="">
                  <option  value=""></option>
                  <?php 
                      while($data = $sexe->fetch()){
                        ?>
                        <option <?php if(isset($_POST['idsexe']) AND !empty($_POST['idsexe'] )AND $data['idsexe']==$_POST['idsexe']) echo "selected"?> value="<?php echo $data['idsexe'] ?>"><?php echo $data['libsexe'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
              <div class="form-group mx-2" style="width:200px" >
                  <label for="sexe">Nationalité :</label>
                  <select class="form-select" name="codepays" id="">
                  <option  value=""></option>
                  <?php 
                      while($data = $nationalite->fetch()){
                        ?>
                        <option <?php if(isset($_POST['codepays']) AND !empty($_POST['codepays'] )AND $data['codepays']==$_POST['codepays']) echo "selected"?> value="<?php echo $data['codepays'] ?>"><?php echo $data['libpays'] ?></option>
                        <?php
                      }
                    ?>
                  </select>
              </div>
        </div>
        <Button type="submit" class="btn btn-primary mt-2 mx-auto">Rechercher</Button>
    </div>

    </form>
        <table class="table">
            <thead class="thead-dark">
              <tr>
                <th scope="col">NumCNI</th>
                <th scope="col">Nom</th>
                <th scope="col">Prenom</th>
                <th scope="col">Sexe</th>
                <th scope="col">Taille</th>
                <th scope="col">Profession</th>
                <th scope="col">Nationalité</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              
              <?php
                while($data = $query->fetch()){
                  ?>
                  <tr>
                    <th scope="row"><?php echo $data["numCNI"] ?></th>
                    <td><?php echo $data["nom"] ?></td>
                    <td><?php echo $data["prenom"] ?></td>
                    <td><?php echo $data["libsexe"] ?></td>
                    <td><?php echo $data["taille"] ?></td>
                    <td><?php echo $data["libprofession"] ?></td>
                    <td><?php echo $data["libpays"] ?></td>
                    <td> <a href="voir-carte.php?numCNI=<?php echo $data["numCNI"]?>"><Button class="btn btn-primary">Voir plus</Button></a></td>
                  </tr>
                  <?php
                }
              ?>
            </tbody>
          </table>
    </div>
      
    
</body>
</html>