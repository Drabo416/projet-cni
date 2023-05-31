<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire Multi-Étapes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <form id="multi-step-form">
                <div class="form-group">
                    <label for="name">Nom</label>
                    <input type="text" class="form-control" id="name" placeholder="Entrez votre nom">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Entrez votre email">
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe">
                </div>
                <div class="form-group">
                    <label for="confirm-password">Confirmer le mot de passe</label>
                    <input type="password" class="form-control" id="confirm-password" placeholder="Confirmez votre mot de passe">
                </div>
                <div class="form-group">
                    <label for="address">Adresse</label>
                    <input type="text" class="form-control" id="address" placeholder="Entrez votre adresse">
                </div>
                <button type="button" class="btn btn-primary" onclick="nextStep()">Suivant</button>
                <button type="button" class="btn btn-secondary" onclick="prevStep()">Précédent</button>
                <button type="submit" class="btn btn-success" onclick="submitForm()">Soumettre</button>
            </form>
        </div>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    // Fonction pour passer à l'étape suivante
    function nextStep() {
        var currentStep = $(".form-step.active");
        currentStep.removeClass("active");
        currentStep.next().addClass("active");
    }

    // Fonction pour revenir à l'étape précédente
    function prevStep() {
        var currentStep = $(".form-step.active");
        currentStep.removeClass("active");
        currentStep.prev().addClass("active");
    }

    // Fonction pour soumettre le formulaire
    function submitForm() {
        // Faites quelque chose avec les données du formulaire
        alert("Formulaire soumis avec succès !");
    }
</script>
</body>
</html>
