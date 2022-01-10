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
        default:
            break;
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
        $company = isset($param['company']) ? $param['company'] :"";
        $address= isset($param['address']) ? $param['address'] :"";
		$renter_name = isset ($param['renter_name']) ? $param['renter_name'] :"";
		$tenant_remark = isset($param['tenant_remark']) ? $param['tenant_remark']:"";
		$reference_no = isset($param['reference_no']) ? $param['reference_no']: "";
		$tenant_demise = isset($param['tenant_demise']) ? $param['tenant_demise']: "";
        
        $query = "INSERT INTO u_renter
                    SET company_id='$company',
                    address_edit='$address',
					ur_name='$renter_name',
					reference_no='$reference_no',
					ur_demise='$tenant_demise',
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
		$company = $param['company_edit'];
		$address = $param['address_edit'];
		$renter_name = $param['renter_name_edit'];
		$tenant_remark = $param['tenant_remark_edit'];
		$tenant_demise = $param['tenant_demise_edit'];

        
        $query = "UPDATE u_renter SET 
					company_id='$company',
					address_edit='$address',
					ur_name='$renter_name',
					ur_demise='$tenant_demise',
					ur_remark='$tenant_remark' WHERE ur_id='$ur_id'" ;
					
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        
        echo json_encode($result);
    }
}

function delete_account($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "UPDATE u_renter SET status = 0 WHERE ur_id = '".$id."' ";
        $result = mysqli_query($conn_admin_db, $query);
        echo json_encode($result);
    }
}

function retrieve_account($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "SELECT * FROM u_renter WHERE ur_id='$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }   
}

?>