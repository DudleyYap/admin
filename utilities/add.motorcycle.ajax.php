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

$action = isset($_POST['action']) ? $_POST['action'] : "";
$data = isset($_POST['data']) ? $_POST['data'] : ""; 
$id = isset($_POST['id']) ? $_POST['id'] : "";
$date_start = isset($_POST['date_start']) ? $_POST['date_start'] : date('01-m-Y');
$date_end = isset($_POST['date_end']) ? $_POST['date_end'] : date('t-m-Y');
$company = isset($_POST['select_company']) ? $_POST['select_company'] : "";
$motorcycle = isset($_POST['select_motor']) ? $_POST['select_motor'] : "";





if( $action != "" ){
    switch ($action){
        case 'add_new_motor':
            add_new_motor($data);
            break;
            
        case 'retrieve_motor':
            retrieve_motor($id);
            break;
            
        case 'delete_motor':
            delete_motor($id);
            break;
               
        case 'update_motor':
            update_motor($data);
            break;

        case 'display_motor':
            display_motor($date_start, $date_end, $company, $motorcycle);

        case 'add_motor_name':
            add_motor_name($data);
            break;
     
        default:
            break;
    }
}

function add_motor_name($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        
        $motor_name = mysqli_real_escape_string( $conn_admin_db, $param['motor_name']);
      
       
        $query = "INSERT INTO u_add_motorcycle
                    SET motor_name='$motor_name'";

        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    }
}


function add_new_motor($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        
        $motor_name = mysqli_real_escape_string( $conn_admin_db, $param['motor_name']);
        $maintenance =  mysqli_real_escape_string( $conn_admin_db,$param['maintenance']);
        $budget =  mysqli_real_escape_string( $conn_admin_db,$param['budget']);
        $motor_date =  mysqli_real_escape_string( $conn_admin_db,$param['motor_date']);    
        $workshop =  mysqli_real_escape_string( $conn_admin_db,$param['workshop']);     
        $company =  mysqli_real_escape_string( $conn_admin_db,$param['company']);      
       
        $query = "INSERT INTO u_motorcycle
                    SET motor_id='$motor_name',
                    maintenance='$maintenance',
                    budget='$budget',
                    workshop='$workshop',
                    company_id='$company',
                    motor_date = '".dateFormat($motor_date)."'";
                  
                   

        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    }
}

function update_motor($data){
    
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $id = $param['id'];
        $motor =  mysqli_real_escape_string( $conn_admin_db,$param['motor_name_edit']);
        $budget =  mysqli_real_escape_string( $conn_admin_db,$param['budget_edit']);
        $maintenance =  mysqli_real_escape_string( $conn_admin_db,$param['maintenance_edit']);
        $motor_date =  mysqli_real_escape_string( $conn_admin_db,$param['motor_date_edit']);
        $workshop =  mysqli_real_escape_string( $conn_admin_db,$param['workshop_edit']);
        $company =  mysqli_real_escape_string( $conn_admin_db,$param['company_edit']);
       
        
        $query = "UPDATE u_motorcycle
                    SET motor_id='$motor',
                    budget='$budget',
                    company_id='$company',
                    maintenance='$maintenance',
                    workshop='$workshop',
                    motor_date = '".dateFormat($motor_date)."'
                    WHERE id='$id'";

        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        
        echo json_encode($result);
    }
}



function retrieve_motor($id){
    global $conn_admin_db;
    if (!empty($id)) {        
        $query = "SELECT * FROM u_motorcycle um
                  LEFT JOIN u_add_motorcycle uam ON um.id = uam.uam_id
                  WHERE um.id = '$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
}

function delete_motor($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "UPDATE u_motorcycle SET status = 0 WHERE id = '".$id."' ";
        $result = mysqli_query($conn_admin_db, $query);
        if ($result) {
            alert ("Deleted successfully", "add_motorcycle.php");
        }
    }
}

function display_motorcycle( $date_start, $date_end, $company, $motorcycle){
    global $conn_admin_db;        
    $sql_query = "SELECT * FROM u_motorcycle WHERE status='1'";
   
    
    if(!empty($company)){
        $sql_query .= " AND company_id='".$company."' ";
    }

    if(!empty($motorcycle)){
        $sql_query .= " AND motor_id='".$motorcycle."'";
    }
    
    $rst  = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
    
    $arr_result = array(
        'sEcho' => 0,
        'iTotalRecords' => 0,
        'iTotalDisplayRecords' => 0,
        'aaData' => array()
    );
    $arr_data = array();
    $total_found_rows = 0;
    if ( mysqli_num_rows($rst) ){
        $count = 0;
        while( $row = mysqli_fetch_assoc( $rst ) ){
            $row_found = mysqli_fetch_row(mysqli_query($conn_admin_db,"SELECT FOUND_ROWS()"));
            $total_found_rows = $row_found[0];
            $count++;
       
            $action = '<span id='.$row['id'].' data-toggle="modal"  class="edit_data" data-target="#editItem" onclick="editFunction('.$row['id'].', '."'".$row['task']."'".')"><i class="menu-icon fa fa-edit"></i>
                    </span>';
            $data = array(
                $count.".",
                dateFormatRev($row['motor_date']),
                $row['motorcycle_id'],
                $row['maintenance'],
                $row['budget'],
                $row['workshop'],
                $action
                
            );
            $arr_data[] = $data;
        }
    }
    $arr_result = array(
        'sEcho' => 0,
        'iTotalRecords' => $total_found_rows,
        'iTotalDisplayRecords' => $total_found_rows,
        'aaData' => $arr_data
    );
    
    echo json_encode($arr_result);
    
}


//to round up0.05
function round_up($x){
    return round($x * 2, 1) / 2;
}

?>