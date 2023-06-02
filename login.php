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
    <div class="w-100 d-flex justify-content-center align-items-center" style="height: 100vh;" >
                <div class="w-25 h-50 px-2 d-flex flex-column justify-content-center align-items-center" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" >
                    <p class="h1 center">Login</p>
                    <form action="login-op.php" method='POST'>
                        <input type="text" class="form-control my-3" name='numCNI' aria-label="Small" placeholder="Numéro CNI" aria-describedby="inputGroup-sizing-sm">
                        <button class="btn btn-primary" type="submit">Connexion</button>
                    </form>
                </div>
    </div>
</body>
</html>