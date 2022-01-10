<?php
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
	session_start();
	global $conn_admin_db;

    if(isset($_POST['save'])){

	    $renter_name= $_POST['renter_name'];
		$company_id = $_POST['company'];
		$address_id = $_POST['u_property'];
		$tenure_startdate = $_POST['tenure_startdate'];
	    $tenure_enddate = $_POST['tenure_enddate'];
	    $m_rental = $_POST['m_rental'];
	    $w_bill = $_POST['w_bill'];
	    $e_bill = $_POST['e_bill'];
	    $managementbill = $_POST['managementbill'];
	    $r_deposit = $_POST['r_deposit'];
	    $u_deposit =  $_POST['u_deposit'];
	    $tenant_remark = $_POST['tenant_remark'];
		$rental_TaxInv = $_POST['rental_TaxInv'];

		
            $sql_insert = mysqli_query($conn_admin_db, "INSERT INTO u_renter SET
                                                ur_name = '".$renter_name."',
												company_id = '".$company_id."',
												address_id = '".$address_id."',
												ur_tenure_startdate = '".dateFormat($tenure_startdate)."',
												ur_tenure_enddate = '".dateFormat($tenure_enddate)."',
                                                ur_monthly_rental = '".$m_rental."',
                                                ur_water_bill= '".$w_bill."',
                                                ur_e_bill= '".$e_bill."',
                                                ur_management_bill= '".$managementbill."',
                                                ur_rental_deposit= '".$r_deposit."',
                                                ur_utility_deposit= '".$u_deposit."',
                                                ur_remark= '".$tenant_remark."',
												ur_rental_TaxInv = '".$rental_TaxInv."',
                                                ur_date_added = now()") or die (mysqli_error($conn_admin_db));
            
            if($sql_insert){
                alert ("Added successfully","rental_collection_report.php");
            } 
          
    }
?>