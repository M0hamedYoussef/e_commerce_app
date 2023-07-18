<?php

define("MB", 1048576);
// date_default_timezone_set('TIMEZONE HERE');

function filterRequest($requestname)
{
    return htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getAllData($table, $where = null, $orderBy = null, $values = null, $json = true, )
{
    global $con;
    $data = array();
    if ($where == null) {
        $stmt = $con->prepare("SELECT  * FROM $table");
    } else {
        if ($orderBy == null) {
            $stmt = $con->prepare("SELECT  * FROM $table WHERE $where ");
        } else {
            $stmt = $con->prepare("SELECT  * FROM $table WHERE $where ORDER BY $orderBy ");
        }
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "$table" => $data, "count" => $count));
        } else {
            echo json_encode(array("status" => "failure", "$table" => 'No Data'));
        }
        return $count;
    } else if ($json == false) {
        if ($count > 0) {
            return $data;
        } else {
            $data = array("No Data");

            return $data;
        }
    }
}

function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql); foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }

    return $count;
}


function updateData($table, $where, $data, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function imageUpload($dir, $imageRequest)
{
    global $msgError;
    if (isset($_FILES[$imageRequest])) {
        $imagename = rand(1, 999999999999999999) . $_FILES[$imageRequest]['name'];
        $imagetmp = $_FILES[$imageRequest]['tmp_name'];
        $imagesize = $_FILES[$imageRequest]['size'];
        $allowExt = array("jpg", "png", "gif", "mp3", "pdf");
        $strToArray = explode(".", $imagename);
        $ext = end($strToArray);
        $ext = strtolower($ext);

        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError = "EXT";
        }
        if ($imagesize > 2 * MB) {
            $msgError = "size";
        }
        if (empty($msgError)) {
            move_uploaded_file($imagetmp, $dir . '/' . $imagename);
            return $imagename;
        } else {
            return "fail";
        }
    } else {
        return "empty";
    }

}



function deleteFile($dir, $file)
{
    if (file_exists($dir . "/" . $file)) {
        unlink($dir . "/" . $file);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" || $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

}


function sendMail(
    $to,
    $subject,
    $message,
    $header = 'from senpai'
) {
    mail($to, $subject, $message, $header);

}
function sendNotification($title, $message, $topic)
{
    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,
        'notification' => array(
            "body" => $message,
            "title" => $title,
            "sound" => "default",
        ),
    );

    $fields = json_encode($fields);

    $headers = array(
        'Authorization: key=' . "my_api_key",
        'Content-Type: application/json'
    );

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_POST, true);

    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    curl_exec($ch);

    curl_close($ch);

}

?>