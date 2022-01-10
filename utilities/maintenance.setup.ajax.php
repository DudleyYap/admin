<?php 
require_once('../assets/config/database.php');
require_once('../function.php');
global $conn_admin_db;
session_start();
//initialise monthly value
$month_map = array(
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 0,
    6 => 0,
    7 => 0,
    8 => 0,
    9 => 0,
    10 => 0,
    11 => 0,
    12 => 0
);

$action = isset($_POST['action']) && $_POST['action'] !="" ? $_POST['action'] : ""; 
$data = isset($_POST['data']) ? $_POST['data'] : ""; 
$id = isset($_POST['id']) ? $_POST['id'] : "";

$count = isset($_POST['count']) ? $_POST['count'] : 0;

if( $action != "" ){
    switch ($action){
        case 'add_new_account':
            add_new_account($data);
            break;
            
        case 'retrieve_account':
            retrieve_account($id);
            break;
            
        case 'delete_account':
            delete_account($id);
            break;
               
        case 'update_account':
            update_account($data);
            break;
     
        default:
            break;
    }
}



function add_new_account($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        
        $address = mysqli_real_escape_string( $conn_admin_db, $param['address']);
        $maintenance =  mysqli_real_escape_string( $conn_admin_db,$param['maintenance']);
        $budget =  mysqli_real_escape_string( $conn_admin_db,$param['budget']);
        $from_date =  mysqli_real_escape_string( $conn_admin_db,$param['from_date']);        
       
        $query = "INSERT INTO u_maintenance
                    SET property_id='$address',
                    maintenance='$maintenance',
                    budget='$budget',
                    from_date = '".dateFormat($from_date)."'";
                  
                   

        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    }
}

function update_account($data){
    
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $id = $param['id'];
        $address =  mysqli_real_escape_string( $conn_admin_db,$param['address_edit']);
        $budget =  mysqli_real_escape_string( $conn_admin_db,$param['budget_edit']);
        $maintenance =  mysqli_real_escape_string( $conn_admin_db,$param['maintenance_edit']);
        $from_date =  mysqli_real_escape_string( $conn_admin_db,$param['from_date_edit']);
       
        
        $query = "UPDATE u_maintenance
                    SET property_id='$address',
                    budget='$budget',
                    maintenance='$maintenance',
                    from_date = '".dateFormat($from_date)."'
                    WHERE id='$id'";

        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        
        echo json_encode($result);
    }
}



function retrieve_account($id){
    global $conn_admin_db;
    if (!empty($id)) {        
        $query = "SELECT * FROM u_maintenance WHERE id = '$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
}

function delete_account($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "UPDATE u_maintenance SET um_status = 0 WHERE id = '".$id."' ";
        $result = mysqli_query($conn_admin_db, $query);
        if ($result) {
            alert ("Deleted successfully", "maintenance.php");
        }
    }
}

//to round up0.05
function round_up($x){
    return round($x * 2, 1) / 2;
}

?>