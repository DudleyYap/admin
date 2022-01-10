<?php
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
	session_start();
	global $conn_admin_db;

    if(isset($_POST['save'])){

	    $location_name= $_POST['location_name'];
		$company_id_1 = $_POST['company'];
		$size = $_POST['size'];
	    $property_address= $_POST['property_address'];
	    $property_remark = $_POST['property_remark'];
        $floor1 = $_POST['floor1'];
        $floor2 = $_POST['floor2'];
        
		
            $sql_insert = mysqli_query($conn_admin_db, "INSERT INTO u_property SET
                                                up_location = '".$location_name."',
												company_id_1 = '".$company_id_1."',
                                                up_size = '".$size."',
                                                floor1 = '".$floor1."',
                                                floor2 = '".$floor2."',
                                                up_address = '".$property_address."',
                                                up_remark = '".$property_remark."',
                                                up_date_added = now()") or die (mysqli_error($conn_admin_db));
            
            if($sql_insert){
                alert ("Added successfully", "addnew_property.php");
            } 
          
    }
?>