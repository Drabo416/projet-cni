<?php
    function saveFile($label){
        $file = $_FILES[$label]; // Assuming 'file' is the name of the file input field
        $targetDirectory = 'upload'; // Replace with the desired target directory
        $extension = pathinfo($file['name'], PATHINFO_EXTENSION); // Get the file extension

        // Generate a unique filename
        $uniqueFilename = time() . '_' . uniqid() . '.' . $extension;
        $targetFile = $targetDirectory . $uniqueFilename;

        if (move_uploaded_file($file['tmp_name'],$targetDirectory."/". $targetFile)) {
            return "/".$targetDirectory."/". $targetFile;
        } else {
            return false;
        }

    }
?>