<?php
try {

    $cartella = 'files/';
    $larghezza = 1000;
    $status = 0;
    $imgdate = $date = date("YmdHis");

    $thumbnail = "";

    $validator = array();
    if (isset($_FILES["upload"])) {
        //Filter the file types , if you want.
        if ($_FILES["upload"]["error"] > 0) {
            $status = "0";
            $msg = "Errore: " . $_FILES["upload"]["error"] . "<br>";
            throw Exception;
        } else {
            $img = $_FILES["upload"]['name'];
            if ($img != "") {
                //    U   P   L   O   A   D
                $percorso = $_FILES["upload"]['tmp_name'];
                list($width, $height, $type, $attr) = getimagesize($percorso) or die("errore");
                switch ($type) {
                    case IMAGETYPE_GIF:
                        $image = imagecreatefromgif($percorso);
                        $ext = '.gif';
                        break;
                    case IMAGETYPE_JPEG:
                        $image = imagecreatefromjpeg($percorso);
                        $ext = '.jpg';
                        break;
                    case IMAGETYPE_PNG:
                        $image = imagecreatefrompng($percorso);
                        $ext = '.png';
                        break;
                    default:
                        break;
                }
                $nome = "img_" . $imgdate . "_" . uniqid() . $ext;
                $dir = $cartella . $nome;
                $altezza = floor($larghezza * $height / $width);
                // Creo la versione 300*200 dell'immagine (thumbnail)
                $thumb = imagecreatetruecolor($larghezza, $altezza);
                imagecopyresized($thumb, $image, 0, 0, 0, 0, $larghezza, $altezza, $width, $height);
                switch ($type) {
                    case IMAGETYPE_GIF:
                        imagegif($thumb, $dir);
                        break;
                    case IMAGETYPE_JPEG:
                        imagejpeg($thumb, $dir);
                        break;
                    case IMAGETYPE_PNG:
                        imagepng($thumb, $dir);
                        break;
                    default:
                        $source = false;
                        break;
                }

                $msg = $dir;
                $status = "1";
            }
        }
    }
} catch (Exception $e) {
    $result = array(
        "uploaded" => $status,
        "fileName" => "",
        "url" => ""
    );
    $result['errors']['message'] = $e->getMessage();
}

if (isset($status)  && $status != "0") {
    $result = array(
        "uploaded" => $status,
        "fileName" => $nome,
        "url" => ("http://" . $_SERVER[HTTP_HOST] . "/wp-content/themes/casarabatti/sendletter/files/".$nome)
    );
}

echo json_encode($result);
?>