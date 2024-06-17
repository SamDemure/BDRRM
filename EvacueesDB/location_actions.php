<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "famdb";
    $table = "Locations";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if('CREATE_TABLE' == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table (
            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            loc_region VARCHAR(30) NOT NULL,
            loc_province VARCHAR(30) NOT NULL,
            loc_district VARCHAR(30) NOT NULL,
            loc_barangay VARCHAR(30) NOT NULL,
            loc_municipality VARCHAR(30) NOT NULL,
            loc_evacuationsite VARCHAR(30) NOT NULL,
            loc_evacuationsiteHead VARCHAR(30) NOT NULL
            )";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT id, loc_region, loc_province, loc_district, loc_barangay, loc_municipality, loc_evacuationsite FROM $table ORDER BY id DESC";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            echo json_encode($dbdata);
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('ADD_LOC' == $action){
        $loc_region = $_POST['loc_region'];
        $loc_province = $_POST['loc_province'];
        $loc_district = $_POST['loc_district'];
        $loc_barangay = $_POST['loc_barangay'];
        $loc_municipality = $_POST['loc_municipality'];
        $loc_evacuationsite = $_POST['loc_evacuationsite'];
        $loc_evacuationsiteHead = $_POST['loc_evacuationsiteHead'];
        $sql = "INSERT INTO $table (loc_region, loc_province, loc_district, loc_barangay, loc_municipality, loc_evacuationsite, loc_evacuationsiteHead)
        VALUES('$loc_region', '$loc_province', '$loc_district', '$loc_barangay', '$loc_municipality', '$loc_evacuationsite','$loc_evacuationsiteHead')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_LOC' == $action){
        $loc_id = $_POST['loc_id'];
        $loc_region = $_POST['loc_region'];
        $loc_province = $_POST['loc_province'];
        $loc_district = $_POST['loc_district'];
        $loc_barangay = $_POST['loc_barangay'];
        $loc_municipality = $_POST['loc_municipality'];
        $loc_evacuationsite = $_POST['loc_evacuationsite'];
        $loc_evacuationsiteHead = $_POST['loc_evacuationsiteHead'];
        $sql = "UPDATE $table SET loc_region = '$loc_region', loc_province = '$loc_province', loc_district = '$loc_district', loc_barangay = '$loc_barangay', loc_municipality = '$loc_municipality', loc_evacuationsite = '$loc_evacuationsite', loc_evacuationsiteHead = '$loc_evacuationsiteHead' WHERE id = $loc_id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_LOC' == $action){
        $loc_id = $_POST['loc_id'];
        $sql = "DELETE FROM $table WHERE id = $loc_id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";     
        }
        $conn->close();
        return;
    }
    
?>
