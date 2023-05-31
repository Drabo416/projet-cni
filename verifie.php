<?php
function verifyFields($requiredFields, $postData) {
    foreach ($requiredFields as $field) {
        if (!isset($postData[$field]) || empty($postData[$field])) {
            echo $field;
            return false;
        }
    }

    return true;
}
?>