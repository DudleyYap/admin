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
$company = isset($_POST['company']) ? $_POST['company'] : "";
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
            
        case 'add_new_bill':
            add_new_bill($data);
            break;
            
        case 'update_account':
            update_account($data);
            break;
            
        case 'get_location':
            get_location($company);
            break;
            
        case 'delete_account_details_item':
            delete_account_details_item($id);
            break;
            
        case 'retrieve_account_details':
            retrieve_account_details($id);
            break;
            
        case 'update_account_details':
            update_account_details($data);
            break;
            
        case 'compare_data':
            compare_data($data,$count);
            break;
        default:
            break;
    }
}

function get_ja_data_monthly_compare($year, $company, $location){
    global $conn_admin_db;
    global $month_map;
    $month = 12;
    $query = "SELECT * FROM bill_jabatan_air_account
    INNER JOIN bill_jabatan_air ON bill_jabatan_air_account.id = bill_jabatan_air.acc_id
    WHERE YEAR(date_end)='$year'";
    
    if(!empty($company)){
        $query .=" AND company_id='$company'";
    }
    if(!empty($location)){
        $query .=" AND bill_jabatan_air_account.id = '$location'";
    }
    
    $query .= " ORDER BY date_end ASC";

    $sql_result = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
    $arr_data_ja = []; //show all company
    $data_monthly = [];
    $month = 12;
    while($row = mysqli_fetch_assoc($sql_result)){
        //monthly
        $arr_data_ja[$row['company_id']][] = $row;
    } 
    foreach ($arr_data_ja as $key => $val){
        $code = itemName("SELECT code FROM company WHERE id='$key'");
        foreach ($val as $v){
            $loc = $v['location'];
            $date_end = $v['date_end'];
            $ja_month = date_parse_from_format("Y-m-d", $date_end);
            $ja_m = $ja_month["month"];
            for ( $m=1; $m<=$month; $m++ ){
                if($m == $ja_m){
                    if(!empty($location)){
                        if (isset($data_monthly[$code."-".$year][$loc][$m])){
                            $data_monthly[$code."-".$year][$loc][$m] += (double)$v['amount'];
                        }else{
                            $data_monthly[$code."-".$year][$loc][$m] = (double)$v['amount'];
                        }
                    }else{
                        if (isset($data_monthly[$code."-".$year][$m])){
                            $data_monthly[$code."-".$year][$m] += (double)$v['amount'];
                        }else{
                            $data_monthly[$code."-".$year][$m] = (double)$v['amount'];
                        }
                    }
                    
                }
            }
        }
    }
    if (!empty($data_monthly)) {
        foreach ($data_monthly as $code => $data){
            if(!empty($location)){
                foreach ($data as $location => $val){
                    $month_data = array_replace($month_map, $val);
                    $datasets_ja_monthly = array(
                        'label' => $location,
                        'backgroundColor' => 'transparent',
                        'borderColor' => randomColor(),
                        'lineTension' => 0,
                        'borderWidth' => 3,
                        'data' => array_values($month_data)
                    );
                }
            }
            else{
                $month_data = array_replace($month_map, $data);
                $datasets_ja_monthly = array(
                    'label' => $code,
                    'backgroundColor' => 'transparent',
                    'borderColor' => randomColor(),
                    'lineTension' => 0,
                    'borderWidth' => 3,
                    'data' => array_values($month_data)
                );
            }
        }
        return $datasets_ja_monthly;
    }
}

function compare_data($data, $count){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $year = $param['year_select'];
        $company = $param['company'];
        $location = $param['location'];
        $count = count($year); //get the array count        
        for($i=1; $i<=$count; $i++){  
            $result = get_ja_data_monthly_compare($year[$i], $company[$i], $location[$i]);
            if(!empty($result) && $result != NULL){
                $arr_data[] = $result;
            }
            
        }
    } 
    echo json_encode($arr_data);
}

function update_account_details($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
           parse_str($data, $param); //unserialize jquery string data
		$id = $param['id'];
		$main_business = isset($param['main_business_edit']) ? $param['main_business_edit'] : "";
        $address = isset($param['address_edit']) ? $param['address_edit'] : "";
        $process_fee = isset($param['process_fee_edit']) ? $param['process_fee_edit'] : 0;
        $add_payment = isset($param['add_payment_edit']) ? $param['add_payment_edit'] : 0;
		$area = isset($param['area_edit']) ? $param['area_edit'] : "";
        $total = number_format(($process_fee + $add_payment), 2);

        
        
        $query = "UPDATE u_tl_details SET
                        main_business = '$main_business',
                        address = '$address',
                        total = '$total',
                        area = '$area',
                        process_fee = '$process_fee',
                        add_payment = '$add_payment' WHERE id='$id' ";       
						
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }
}

function retrieve_account_details($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "SELECT * FROM u_tl_details WHERE id = '$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
}

function delete_account_details_item($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "DELETE FROM u_tl_details WHERE id = '".$id."' ";
        $result = mysqli_query($conn_admin_db, $query);
        if ($result) {
            alert ("Deleted successfully", "sabah_electric_setup.php");
        }
    }
}

function get_location($company){
    global $conn_admin_db;
    $query = "SELECT id,UPPER(location) AS location_name FROM u_trading_license WHERE company_id='$company' AND status='1'";
    $result = mysqli_query($conn_admin_db, $query);
    $location_arr = array();
    $location_list = [];
    if(mysqli_num_rows($result) > 0){
        while( $row = mysqli_fetch_array($result) ){
            $location_arr[$row['id']] = $row['location_name'];
            $location_list = $location_arr;
        }
        $arr_result[$company] = $location_list;
    }
    
    $result = array(
        'result' => $arr_result
    );
    
    // encoding array to json format
    echo json_encode($result);
}

function add_new_bill($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $main_business = isset($param['main_business']) ? $param['main_business'] : "";
		$acc_id = isset($param['acc_id']) ? $param['acc_id'] : "";
        $address = isset($param['address']) ? $param['address'] : "";
        $process_fee = isset($param['process_fee']) ? $param['process_fee'] : 0;
        $add_payment = isset($param['add_payment']) ? $param['add_payment'] : 0;
		$area = isset($param['area']) ? $param['area'] : "";
        $total = number_format(($process_fee + $add_payment), 2);

        
        
        $query_insert_sesb = "INSERT INTO u_tl_details
                        SET acc_id = '$acc_id',
                        main_business = '$main_business',
                        address = '$address',
                        total = '$total',
                        area = '$area',
                        process_fee = '$process_fee',
                        add_payment = '$add_payment' ";     
						
        mysqli_query($conn_admin_db, $query_insert_sesb) or die(mysqli_error($conn_admin_db));
    }
}


function add_new_account($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        
        $company =  mysqli_real_escape_string( $conn_admin_db,$param['company']);
        $no_register=  mysqli_real_escape_string( $conn_admin_db,$param['no_register']);
        $owner =  mysqli_real_escape_string( $conn_admin_db,$param['owner']);      
		$reference_no = mysqli_real_escape_string( $conn_admin_db, $param['reference_no']);
        $remark =  mysqli_real_escape_string( $conn_admin_db,$param['remark']);

        
        $query = "INSERT INTO u_trading_license
                    SET company_id='$company',
                    no_register='$no_register',
					reference_no='$reference_no',
                    owner='$owner',
                    remark='$remark'";            
                    

        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    }
}

function update_account($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $id = $param['id'];
        $company = isset($param['company_edit']) ? $param['company_edit'] :"";
        $no_register = isset($param['no_register_edit']) ? $param['no_register_edit'] :"";
        $owner = isset($param['owner_edit']) ? $param['owner_edit']: "";
        $remark = isset($param['remark_edit']) ? $param['remark_edit']:"";
		$reference_no = isset($param['reference_no_edit']) ? $param['reference_no_edit']: "";
		
		
        $query = "UPDATE u_trading_license
                    SET company_id='$company',
                    no_register='$no_register',
                    owner='$owner',
					reference_no = '$reference_no',
                    remark='$remark'";
;
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        
        echo json_encode($result);
    }
}

function retrieve_account($id){
    global $conn_admin_db;
    if (!empty($id)) {        
        $query = "SELECT * FROM u_trading_license WHERE id = '$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
}

function delete_account($id){
    global $conn_admin_db;
    if (!empty($id)) {
        $query = "UPDATE u_trading_license SET status = 0 WHERE id = '".$id."' ";
        $result = mysqli_query($conn_admin_db, $query);
        if ($result) {
            alert ("Deleted successfully", "sabah_electric_setup.php");
        }
    }
}

//to round up0.05
function round_up($x){
    return round($x * 2, 1) / 2;
}
?>