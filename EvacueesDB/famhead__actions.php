<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "famdb";
$table = "HeadofFam";

$action = $_POST['action'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ('CREATE_TABLE' == $action) {
    $sql = "CREATE TABLE IF NOT EXISTS $table (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        head_lastname VARCHAR(30) NOT NULL,
        head_firstname VARCHAR(30) NOT NULL,
        head_middlename VARCHAR(30) NOT NULL,
        head_nameExt VARCHAR(30),
        head_age INT(2),
        head_birthdate DATE,
        head_birthplace VARCHAR(100),
        head_gender VARCHAR(10),
        head_mothersmaiden VARCHAR(100),
        head_monthlyincome INT,
        head_occupation VARCHAR(50),
        head_contactNumber VARCHAR(20),
        head_idpresented VARCHAR(50),
        head_idcardNumber VARCHAR(50),
        head_4psBeneficiary BOOLEAN
    )";
    if ($conn->query($sql) === TRUE) {
        echo "success";
    } else {
        echo "error: " . $conn->error;
    }
    $conn->close();
    return;
}

if ('GET_ALL' == $action) {
    $dbdata = array();
    $sql = "SELECT * FROM $table ORDER BY id DESC";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $dbdata[] = $row;
        }
        echo json_encode($dbdata);
    } else {
        echo "error";
    }
    $conn->close();
    return;
}

if ('ADD_FAMHEAD' == $action) {
    $head_lastname = $_POST['head_lastname'];
    $head_firstname = $_POST['head_firstname'];
    $head_middlename = $_POST['head_middlename'];
    $head_nameExt = $_POST['head_nameExt'];
    $head_age = $_POST['head_age'];
    $head_birthdate = $_POST['head_birthdate'];
    $head_birthplace = $_POST['head_birthplace'];
    $head_gender = $_POST['head_gender'];
    $head_mothersmaiden = $_POST['head_mothersmaiden'];
    $head_monthlyincome = $_POST['head_monthlyincome'];
    $head_occupation = $_POST['head_occupation'];
    $head_contactNumber = $_POST['head_contactNumber'];
    $head_idpresented = $_POST['head_idpresented'];
    $head_idcardNumber = $_POST['head_idcardNumber'];
    $head_4psBeneficiary = $_POST['head_4psBeneficiary'] == 'true' ? 1 : 0;
    $sql = "INSERT INTO $table (head_lastname, head_firstname, head_middlename, head_nameExt, head_age, head_birthdate, head_birthplace, head_gender, head_mothersmaiden, head_monthlyincome, head_occupation, head_contactNumber, head_idpresented, head_idcardNumber, head_4psBeneficiary)
            VALUES('$head_lastname', '$head_firstname', '$head_middlename', '$head_nameExt', '$head_age', '$head_birthdate','$head_birthplace', '$head_gender', '$head_mothersmaiden', '$head_monthlyincome', '$head_occupation', '$head_contactNumber', '$head_idpresented', '$head_idcardNumber', '$head_4psBeneficiary')";
    if ($conn->query($sql) === TRUE) {
        echo "success";
    } else {
        echo "error: " . $conn->error;
    }
    $conn->close();
    return;
}

if ('UPDATE_FAMHEAD' == $action) {
    $head_id = $_POST['head_id'];
    $head_lastname = $_POST['head_lastname'];
    $head_firstname = $_POST['head_firstname'];
    $head_middlename = $_POST['head_middlename'];
    $head_nameExt = $_POST['head_nameExt'];
    $head_age = $_POST['head_age'];
    $head_birthdate = $_POST['head_birthdate'];
    $head_birthplace = $_POST['head_birthplace'];
    $head_gender = $_POST['head_gender'];
    $head_mothersmaiden = $_POST['head_mothersmaiden'];
    $head_monthlyincome = $_POST['head_monthlyincome'];
    $head_occupation = $_POST['head_occupation'];
    $head_contactNumber = $_POST['head_contactNumber'];
    $head_idpresented = $_POST['head_idpresented'];
    $head_idcardNumber = $_POST['head_idcardNumber'];
    $head_4psBeneficiary = $_POST['head_4psBeneficiary'] == 'true' ? 1 : 0;
    $sql = "UPDATE $table SET
            head_lastname = '$head_lastname',
            head_firstname = '$head_firstname',
            head_middlename = '$head_middlename',
            head_nameExt = '$head_nameExt',
            head_age = '$head_age',
            head_birthdate = '$head_birthdate',
            head_birthplace = '$head_birthplace',
            head_gender = '$head_gender',
            head_mothersmaiden = '$head_mothersmaiden',
            head_monthlyincome = '$head_monthlyincome',
            head_occupation = '$head_occupation',
            head_contactNumber = '$head_contactNumber',
            head_idpresented = '$head_idpresented',
            head_idcardNumber = '$head_idcardNumber',
            head_4psBeneficiary = '$head_4psBeneficiary'
            WHERE id = $head_id";
    if ($conn->query($sql) === TRUE) {
        echo "success";
    } else {
        echo "error: " . $conn->error;
    }
    $conn->close();
    return;
}

if ('DELETE_FAMHEAD' == $action) {
    $head_id = $_POST['head_id'];
    $sql = "DELETE FROM $table WHERE id = $head_id";
    if ($conn->query($sql) === TRUE) {
        echo "success";
    } else {
        echo "error: " . $conn->error;
    }
    $conn->close();
    return;
}
?>
