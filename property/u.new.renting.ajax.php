<?php 
require_once('../assets/config/database.php');
require_once('../function.php');
session_start();

$action = isset($_POST['action']) && $_POST['action'] !="" ? $_POST['action'] : ""; 
$filter = isset($_POST['filter']) ? $_POST['filter'] : "";
$year = isset($_POST['year']) ? $_POST['year'] : date('Y');
$id = isset($_POST['id']) ? $_POST['id'] : "";
$data = isset($_POST['data']) ? $_POST['data'] : "";
$database = isset($_POST['database']) ? $_POST['database'] : "";

if( $action != "" ){
    switch ($action){
        case 'retrieve_account':
            retrieve_account($id);
            break;
            
        case 'delete_account':
            delete_account($id);
            break;
        case 'update_account':
            update_account($data);
            break;
            
        case 'add_new_account':
            add_new_account($data);
            break;
            
        case 'retrieve_account_details':
            retrieve_account_details($id);
            break;
            
        case 'delete_account_details':
            delete_account_details($id, $database);
            break;

        case 'delete_image':
            delete_image($id, $database);
            break;

       

        default:
            break;
    }
}




function delete_image($id, $database){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "DELETE FROM $database WHERE id='$id'";
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }
}


function delete_account_details($id, $database){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "DELETE FROM $database WHERE id='$id'";
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }
}

function retrieve_account_details($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "SELECT * FROM u_management_fee WHERE id='$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
}

function add_new_account($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
       // $company = isset($param['company']) ? $param['company'] :"";
        $address= isset($param['address']) ? $param['address'] :"";
		$renter_name = isset ($param['renter_name']) ? $param['renter_name'] :"";
		$tenant_remark = isset($param['tenant_remark']) ? $param['tenant_remark']:"";
		$tenant_demise = isset($param['tenant_demise']) ? $param['tenant_demise']: "";
        $insurance_date = isset($param['insurance_date']) ? $param['insurance_date']: "";
        $priority = isset($param['priority']) ? $param['priority']: "";
       
        
        $query = "INSERT INTO u_renter
                    SET 
                    address_id='$address',
					tenant_id='$renter_name',
                    insurance_date = '".dateFormat($insurance_date)."',
					ur_demise='$tenant_demise',
                    priority='$priority',
                    date_added=now(),
                    ur_remark='$tenant_remark'";
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        
        echo json_encode($result);
    }
}

function update_account($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data       

        $ur_id = $param['ur_id'];
	
        $insurance_date = isset($param['insurance_date_edit']) ? $param['insurance_date_edit']: "";
        $priority = isset($param['priority_edit']) ? $param['priority_edit']: "";
        $tenant_name = isset($param['tenant_name_edit']) ? $param['tenant_name_edit']: "";
        
       
        $query = "UPDATE u_renter INNER JOIN u_tenant ON u_tenant.id = u_renter.tenant_id
                     SET 
					
                    insurance_date = '".dateFormat($insurance_date)."',
                    tenant_name = '$tenant_name',
                    priority = '$priority' WHERE ur_id='$ur_id'" ;
					
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        
        echo json_encode($result);
    }
}

function delete_account($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "UPDATE u_renter SET status_1 = 0 WHERE ur_id = '".$id."' ";
        $result = mysqli_query($conn_admin_db, $query);
        echo json_encode($result);
    }
}

function retrieve_account($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "SELECT * FROM u_renter ur
        INNER JOIN u_tenant ut ON ut.id = ur.tenant_id
        INNER JOIN u_property up ON up.up_id = ur.address_id
         WHERE ur.ur_id='$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }   
}



?>