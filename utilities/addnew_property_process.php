<?php
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
	session_start();
	global $conn_admin_db;

    if(isset($_POST['save'])){

	    $location_name= $_POST['location_name'];
		$company_id = $_POST['company'];
		$size = $_POST['size'];
	    $property_address= $_POST['property_address'];
	    $property_remark = $_POST['property_remark'];
		
            $sql_insert = mysqli_query($conn_admin_db, "INSERT INTO u_property SET
                                                up_location = '".$location_name."',
												company_id = '".$company_id."',
                                                up_size = '".$size."',
                                                up_address = '".$property_address."',
                                                up_remark = '".$property_remark."',
                                                up_date_added = now()") or die (mysqli_error($conn_admin_db));
            
            if($sql_insert){
                alert ("Added successfully", "addnew_property.php");
            } 
          
    }
?>