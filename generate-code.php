<?php
function generateUniqueCode() {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $code = '';

    for ($i = 0; $i < 6; $i++) {
        // Générer un chiffre aléatoire
        if ($i < 3) {
            $randomIndex = mt_rand(0, 9);
            $code .= $characters[$randomIndex];
        }
        // Générer une lettre aléatoire
        else {
            $randomIndex = mt_rand(10, 35);
            $code .= $characters[$randomIndex];
        }
    }

    // Ajouter un suffixe basé sur le timestamp actuel
    $timestampSuffix = time();
    $code .= $timestampSuffix;

    return $code;
}
?>