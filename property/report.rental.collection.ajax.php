<?php 
    require_once('../assets/config/database.php');
    require_once('../function.php');
    global $conn_admin_db;
    session_start();

    header('Content-type: text/css; charset:UTF-8');
    
    $date_from = isset($_POST['date_from']) ? $_POST['date_from'] : date('01-m-Y');
    $date_until = isset($_POST['date_until']) ? $_POST['date_until'] : date('t-m-Y');
    $id = isset($_POST['id']) ? $_POST['id'] : "";
    $task = isset($_POST['task']) ? $_POST['task'] : "";    
    $action = isset($_POST['action']) ? $_POST['action'] : "";
    $data = isset($_POST['data']) ? $_POST['data'] : "";
    $select_company = isset($_POST['select_company']) ? $_POST['select_company'] : "";
    
    if( $action != "" ){
        switch ($action){            
            case 'display_rental_report':
                display_rental_report($date_from, $date_until, $select_company. $id);
                break;
                
            case 'update_renewal_status':
                update_renewal_status($_POST);
                break;
                
            case 'retrieve_rental':
                retrieve_rental($id);
                break;

            case 'update_rental':                
                update_rental($data); 
                break;

            case 'delete_rental': 
                delete_rental($id);                
                break;
                
            default:
                break;
        }
    }
   
    function delete_rental($id){
        global $conn_admin_db;
        if (!empty($id)) {
            $query = "UPDATE u_renter SET status_1 = 0 WHERE ur_id = '".$id."' ";
            $result = mysqli_query($conn_admin_db, $query);
            echo json_encode($result);
        }
    }


    function retrieve_rental($id){
        global $conn_admin_db;
        if (!empty($id)) {
            $query = "SELECT * FROM u_renter ur
            LEFT JOIN u_property up ON up.up_id = ur.address_id
        LEFT JOIN u_tenant ut ON ut.id = ur.tenant_id
        LEFT JOIN u_bill_under ubu ON ubu.acc_id = ur.ur_id  
        LEFT JOIN u_renting_extend ure ON ure.acc_id = ur.ur_id
        LEFT JOIN u_renting_date urd ON urd.acc_id = ur.ur_id

             WHERE ur.ur_id='$id'";
            $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));        
            $row = mysqli_fetch_assoc($rst);
            echo json_encode($row);
        }   
        
    }    



    function display_rental_report( $date_from, $date_until, $select_company){
        global $conn_admin_db;

        $sql_query = "SELECT * FROM u_renter ur
        LEFT JOIN u_property up ON up.up_id = ur.address_id
        LEFT JOIN u_tenant ut ON ut.id = ur.tenant_id
        LEFT JOIN u_bill_under ubu ON ubu.acc_id = ur.ur_id  
        LEFT JOIN u_renting_extend ure ON ure.acc_id = ur.ur_id
        LEFT JOIN u_renting_date urd ON urd.acc_id = ur.ur_id
        /* INNER JOIN company c ON c.company.id = u_property.company_id_1 */

        WHERE ur.status_1='1' ORDER BY ur.priority ASC ";

if(!empty($select_company)){
    $sql_query = " SELECT * FROM u_renter ur
    LEFT JOIN u_property up ON up.up_id = ur.address_id
    LEFT JOIN u_tenant ut ON ut.id = ur.tenant_id
    LEFT JOIN u_bill_under ubu ON ubu.acc_id = ur.ur_id  
        LEFT JOIN u_renting_extend ure ON ure.acc_id = ur.ur_id
        LEFT JOIN u_renting_date urd ON urd.acc_id = ur.ur_id
                    WHERE company_id_1= '$select_company' AND ur.status_1='1' ORDER BY ur.priority ASC ";
}

$rst  = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));

$arr_result = array(
    'sEcho' => 0,
    'iTotalRecords' => 0,
    'iTotalDisplayRecords' => 0,
    'aaData' => array()
);
$total_found_rows = 0;
$arr_data = array();
if ( mysqli_num_rows($rst) ){
$count = 0;
while( $row = mysqli_fetch_assoc( $rst ) ){
    $row_found = mysqli_fetch_row(mysqli_query($conn_admin_db,"SELECT FOUND_ROWS()"));
    $total_found_rows = $row_found[0];
    $count++;
    
// 			$year = !empty($row['vrt_roadtaxPeriodYear']) ? $row['vrt_roadtaxPeriodYear'] ." Year(s)" : "";
// 			$month = !empty($row['vrt_roadtaxPeriodMonth']) ? $row['vrt_roadtaxPeriodMonth'] ." Month(s)" : "";
// 			$days = !empty($row['vrt_roadtaxPeriodDay']) ? $row['vrt_roadtaxPeriodDay'] ." Day(s)" : "";
// 			$period = $year ." ". $month ." ".$days;
    
$action = '<span id='.$row['ur_id'].' data-toggle="modal" class="edit_data" data-target="#editItem"><i class="fa fa-edit fa-2x "></i></span>
<br><br><span id='.$row['ur_id'].' data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt fa-2x"></i></span>';

$comp_name = itemName("SELECT name FROM company WHERE id='".$row['company_id_1']."'");
$area_name = itemName("SELECT up_location FROM u_property WHERE up_id='".$row['address_id']."'");
$payment_details = "<span><b>Tax Invoice</b> : ".$row['mark1']."</span><br><br>
                    <span><b>Official Receipt</b> : ".$row['mark2']."</span><br>";
$address_name = itemName("SELECT up_address FROM u_property WHERE up_id='".$row['address_id']."'");
$floorType = "<span>".$row['floor1']."</span><br><br>
<span>".$row['floor2']."</span><br>";

$tenantName = itemName("SELECT tenant_name FROM u_tenant WHERE id= '".$row['tenant_id']."'");

if(strlen($tenantName) < 4){
    $tenant= "<span style='font-size:30px'><b>".$row['tenant_name']."<b></span><br><br>";
}
else {
    $tenant = "<span>".$row['tenant_name']."</span><br><br>";
    
}

$date = $row['insurance_date'];
$curdate = '1980-01-01';

if($curdate > $date){
    $insuranceDate ="<span>-</span><br><br>";
} else{
    $insuranceDate = "<span>".dateFormatRev($row['insurance_date'])."</span><br><br>";
}

    $data = array(
                $count,
                strtoupper($area_name),
                strtoupper($comp_name),	
                strtoupper($address_name),
                strtoupper($floorType),
                $row['up_size'],
                $tenant,			
                $row['electric_bill'], 
                $row['water_bill'],
                $row['maintenance_cost'],
                $row['ur_monthly_rental'],
                $row['date_from'] != NULL ? dateFormatRev($row['date_from']) : "-", 
                $row['date_until'] != NULL ? dateFormatRev($row['date_until']) : "-", 
                $insuranceDate,
                $payment_details,
              //  $row['ure_remark'],
                $action,
               
                
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

    function update_rental($data){
        global $conn_admin_db;
        if (!empty($data)) {
            $param = array();
            parse_str($data, $param); //unserialize jquery string data       
    
            $ur_id = $param['ur_id'];
        
            //u_renter table
            $insurance_date = isset($param['insurance_date']) ? $param['insurance_date']: "";
            $priority = isset($param['priority']) ? $param['priority']: "";

            //u_tenant table
            $tenant_name = isset($param['tenant_name']) ? $param['tenant_name']: "";

            //u_property table
            $area = isset($param['area']) ? $param['area']: "";
            $address = isset($param['address']) ? $param['address']: "";
            $size = isset($param['size']) ? $param['size']: "";
            $floor1 = isset($param['floor1']) ? $param['floor1']: "";
            $floor2 = isset($param['floor2']) ? $param['floor2']: "";

            //u_bill_under table
            $manangement_bill = isset($param['management_bill']) ? $param['management_bill']: ""; 
            $e_bill = isset($param['e_bill']) ? $param['e_bill']: "";
            $water_bill = isset($param['water_bill']) ? $param['water_bill']: "";
            
            //u_rentind_extend table
            $date_from = isset($param['date_from']) ? $param['date_from']: "";
            $date_until = isset($param['date_until']) ? $param['date_until']: "";
            $rental = isset($param['rental']) ? $param['rental']: "";
           

            $query = "UPDATE u_renter ur
                        LEFT JOIN u_tenant ut ON ut.id = ur.tenant_id
                       LEFT JOIN u_property up ON up.up_id = ur.address_id
                        LEFT JOIN u_bill_under ubu ON ubu.acc_id = ur.ur_id  
                        LEFT JOIN u_renting_extend ure ON ure.acc_id = ur.ur_id
                        LEFT JOIN u_renting_date urd ON urd.acc_id = ur.ur_id 
                         
                         
                         SET 
                        up_location = '$area',
                        up_size = '$size',
                        up_address = '$address',
                        floor1 = '$floor1',
                        floor2 = '$floor2',

                        date_from = '".dateFormat($date_from)."',
                        date_until = '".dateFormat($date_until)."',
                        ur_monthly_rental = '$rental',

                        maintenance_cost = '$management_bill',
                        electric_bill = '$e_bill',
                        water_bill = '$water_bill',  

                        tenant_name = '$tenant_name',

                        insurance_date = '".dateFormat($insurance_date)."',
                        priority = '$priority' WHERE ur_id='$ur_id'" ;
                        
            
            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
            
            echo json_encode($result);
            alert("Successfully updated!");
        }
    }
    
	
?>

