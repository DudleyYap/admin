<?php 
require_once('../assets/config/database.php');
require_once('../function.php');
global $conn_admin_db;
session_start();

$action = isset($_POST['action']) && $_POST['action'] !="" ? $_POST['action'] : ""; 
$data = isset($_POST['data']) ? $_POST['data'] : ""; 
$telefon_list = isset($_POST['telefon_list']) ? $_POST['telefon_list'] : "";

if( $action != "" ){
    switch ($action){
        case 'add_rent':            
                add_new_rent($data);
            break;
        case 'update_rent':
            update_rent($data);
            break;
            
        case 'add_date':
                add_date($data);
            break;
            
        case 'update_date':
            update_date($data);
            break;
			
		case 'add_bill_under':
                add_bill_under($data);
            break;
			
        case 'update_bill_under':
            update_bill_under($data);
            break;
        
        case 'add_image':            
            add_new_image($data);

        default:
            break;
    }
}



function update_rent($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $id = $param['item_id'];
        $rental_deposit = $param['rental_deposit'];
        $utility_deposit = $param['utility_deposit'];
        $remark = $param['remark'];
        $rental_monthly = $param['rental_monthly'];
        $rental_per_taxinv = $param['rental_per_taxinv'];
        $date_from = $param['date_from'];
        $date_until = $param['date_until'];
		$ur_gst = $param['ur_gst'];
        
        $query = "UPDATE u_renting_extend SET
              ur_rental_deposit = '$rental_deposit',
            ur_utility_deposit = '$utility_deposit',
            ure_remark = '$remark',
            ur_monthly_rental = '$rental_monthly',
            ur_rental_taxinv = '$rental_per_taxinv',
            ur_gst = '$ur_gst',
            date_from = '".dateFormat($date_from)."',
            date_until = '".dateFormat($date_until)."'  WHERE id='$id'";
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }
}

function update_date($data){
    global $conn_admin_db;
    $param = array();
    if(!empty($data)){
        parse_str($data, $param); //unserialize jquery string data
        $item_id = $param['item_id'];
		$tax_invoice = $param['tax_invoice'];       
        $date_received = $param['date_received'];
        $mark2 = $param['mark2'];   
        $mark1 = $param['mark1'];
        $official_receipt= $param['official_receipt'];
        
        
        $query = "UPDATE u_renting_date SET
                tax_invoice = '$tax_invoice',
                mark2 = '$mark2',
                mark1 = '$mark1',
                official_receipt= '$official_receipt',
                date_received = '".dateFormat($date_received)."' WHERE id='$item_id'";
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }
}

function add_date($data){
    global $conn_admin_db;
    $param = array();
    if(!empty($data)){
        parse_str($data, $param); //unserialize jquery string data  
        $acc_id = $param['acc_id'];
        $tax_invoice = $param['tax_invoice'];       
        $date_received = $param['date_received'];
        $mark2 = $param['mark2'];   
        $mark1 = $param['mark1'];
        $official_receipt= $param['official_receipt'];

        
        $query = "INSERT INTO u_renting_date SET 
                acc_id = '".$acc_id."',
                tax_invoice = '$tax_invoice',
                mark2 = '$mark2',
                mark1 = '$mark1',
                official_receipt= '$official_receipt',
                date_received = '".dateFormat($date_received)."'";
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }
}

function add_new_rent($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data        
        $acc_id = $param['acc_id'];
        $rental_deposit = $param['rental_deposit'];
        $utility_deposit = $param['utility_deposit'];
        $remark = $param['remark'];
        $rental_monthly = $param['rental_monthly'];
        $rental_per_taxinv = $param['rental_per_taxinv'];
        $date_from = $param['date_from'];
        $date_until = $param['date_until'];
		$ur_gst = $param['ur_gst'];
		
		
        
        $query = "INSERT INTO u_renting_extend SET acc_id = '$acc_id',
            ur_rental_deposit = '$rental_deposit',
            ur_utility_deposit = '$utility_deposit',
            ure_remark = '$remark',
            ur_monthly_rental = '$rental_monthly',
            ur_rental_taxinv = '$rental_per_taxinv',
            ur_gst = '$ur_gst',
            date_from = '".dateFormat($date_from)."',
            date_until = '".dateFormat($date_until)."' ";
        
        $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        echo json_encode($result);
    }       
}


function insert_billing_jabatan_air($param){
    global $conn_admin_db;
    $cheque_no = $param['cheque_no'];
    $from_date = $param['from_date'];
    $to_date = $param['to_date'];
    $paid_date = $param['paid_date'];
    $due_date = $param['due_date'];
    $sel_account = $param['sel_account'];
    $read_from = $param['read_from'];
    $read_to = $param['read_to'];
    $usage_1 = $param['usage_1'];
    $usage_2 = $param['usage_2'];
    $credit = $param['credit'];
    $rate_70 = $usage_1 * 1.60;
    $rate_71 = $usage_2 * 2.00;
    $amount = $rate_70 + $rate_71;
    $rounded = round_up($amount);
    $adjustment = number_format(($rounded-$amount), 2);
    $total_amt = $amount + $adjustment;
    
    $query_insert_ja = "INSERT INTO bill_jabatan_air
                    SET acc_id = '$sel_account',
                    meter_reading_from = '$read_from',
                    meter_reading_to = '$read_to',
                    usage_70 = '$usage_1',
                    usage_71 = '$usage_2',
                    rate_70 = '$rate_70',
                    rate_71 = '$rate_71',
                    credit_adjustment = '$credit',
                    amount = '$total_amt',
                    adjustment = '$adjustment',
                    cheque_no = '$cheque_no',
                    date_start = '".dateFormat($from_date)."',
                    date_end = '".dateFormat($to_date)."',
                    paid_date = '".dateFormat($paid_date)."',
                    due_date = '".dateFormat($due_date)."'";
    
    mysqli_query($conn_admin_db, $query_insert_ja) or die(mysqli_error($conn_admin_db));
    
}


function add_bill_under($data){
    global $conn_admin_db;
    $param = array();
    parse_str($data, $param); //unserialize jquery string data
    $acc_id = $param['acc_id'];
    $electric_bill = $param['electric_bill'];
    $water_bill = $param['water_bill'];
    $maintenance_cost = $param['maintenance_cost'];
    
    $query = "INSERT INTO u_bill_under SET
            acc_id = '".$acc_id."',
            maintenance_cost = '$maintenance_cost',
            electric_bill = '$electric_bill',
            water_bill = '$water_bill'";
    
    $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    echo json_encode($result);
}

function update_bill_under($data){
    global $conn_admin_db;
    $param = array();
    parse_str($data, $param); //unserialize jquery string data
    $id = $param['item_id'];
    $electric_bill = $param['electric_bill'];
    $water_bill = $param['water_bill'];
    $maintenance_cost = $param['maintenance_cost'];
    
    $query = "UPDATE u_bill_under SET
             maintenance_cost = '$maintenance_cost',
            electric_bill = '$electric_bill',
            water_bill = '$water_bill' WHERE id='$id'";
    
    $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    echo json_encode($result);
}


function add_new_image($data){
    global $conn_admin_db;
    if (!empty($data)) {
        $param = array();
        parse_str($data, $param); //unserialize jquery string data
        $image = $_FILES['image']['name'];

        // image file directory
        $target = "uploads/".basename($image);
       
        
        $sql = "INSERT INTO u_image (image, acc_id) VALUES ('$image', '$acc_id')";

        mysqli_query($conn_admin_db, $sql);

           
  	if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
        echo "success";
      
  	}else{
  		echo "Failed to upload image";
  	}
        
      $result = mysqli_query($conn_admin_db, "SELECT * FROM u_image");
        
        echo json_encode($result);
    }
}




//to round up0.05
function round_up($x){
    return round($x * 2, 1) / 2;
}
?>