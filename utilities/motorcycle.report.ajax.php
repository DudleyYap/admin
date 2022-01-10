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
    
    $date_start = isset($_POST['date_start']) ? $_POST['date_start'] : date('01-m-Y');
    $date_end = isset($_POST['date_end']) ? $_POST['date_end'] : date('t-m-Y');
    $id = isset($_POST['id']) ? $_POST['id'] : "";
    $task = isset($_POST['task']) ? $_POST['task'] : "";    
    $action = isset($_POST['action']) ? $_POST['action'] : "";
    $select_company = isset($_POST['select_company']) ? $_POST['select_company'] : "";
    $select_motor = isset($_POST['select_motor']) ? $_POST['select_motor'] : "";
    $data = isset($_POST['data']) ? $_POST['data'] : ""; 
   $company = isset($_POST['company']) ? $_POST['company'] : "";
    
    if( $action != "" ){
        switch ($action){            
            case 'display_motorcycle':
                display_motorcycle($date_start, $date_end, $select_company ,$select_motor, $task, $id);
                break;
                
            case 'update_renewal_status':
                update_renewal_status($_POST);
                break;
                
                case 'display_maintenance':
                    display_maintenance($date_start, $date_end, $select_company, $task, $id);
                    break;

                    case 'get_motor':
                        get_motor($company);
                        break;
                        
             case 'compare_data':
                 compare_data($data);
                        break;
                        
                
            default:
                break;
        }
    }
   
    function get_motor($company){
        global $conn_admin_db;
        $query = "SELECT um.id, uam.motor_name AS motor_list FROM u_motorcycle um
                INNER JOIN  u_add_motorcycle uam ON um.motor_id = uam.uam_id 
                WHERE um.company_id='$company' AND um.status='1'";
        $result = mysqli_query($conn_admin_db, $query);
        $motor_arr = array();
        $motor_list = [];
        if(mysqli_num_rows($result) > 0){
            while( $row = mysqli_fetch_array($result) ){
                $motor_arr[$row['id']] = $row['motor_list'];
                $motor_list = $motor_arr;
            }        
            $arr_result[$company] = $motor_list;
        }
        
        $result = array(
            'result' => $arr_result
        );
        
        // encoding array to json format
        echo json_encode($result);
    }

    
    function compare_data($data){
        global $conn_admin_db;
        $arr_data = [];
        if (!empty($data)) {
            $param = array();
            parse_str($data, $param); //unserialize jquery string data
            $year = $param['year_select'];
            $company = $param['company'];
            $location = $param['motor'];
            $count = count($year); //get the array count
            
            for($i=1; $i<=$count; $i++){
                $result = get_motor_data_monthly_compare($year[$i], $company[$i], $location[$i]);
                if(!empty($result) && $result != NULL){
                    $arr_data[] = $result;
                }            
            } 
        }
    
        echo json_encode($arr_data);
    }

    function get_motor_data_monthly_compare($year, $company, $location){
        global $conn_admin_db;
        global $month_map;
        $month = 12;
        $query = "SELECT u_motorcycle.id,company_id, motor_id, motor_date, budget FROM u_motorcycle
       /* INNER JOIN u_add_motorcycle ON u_motorcycle.id = u_add_motorcycle.uam_id */
        WHERE YEAR(motor_date)='$year'";
        
        if(!empty($company)){
            $query .=" AND company_id='$company'";
        }
        if(!empty($location)){
            $query .=" AND u_motorcycle.id = '$location'";
        }   
        $query .= " ORDER BY motor_date ASC";
    
        $sql_result = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        $data_monthly = []; //show all company    
        $arr_data_motor = [];
        $month = 12;
        while($row = mysqli_fetch_assoc($sql_result)){        
            //monthly
            $arr_data_motor[$row['company_id']][] = $row;
        }    
        foreach ($arr_data_motor as $key => $val){
            $code = itemName("SELECT code FROM company WHERE id='$key'");
            foreach ($val as $v){           
                $motor = $v['motor_name'];
                $date_end = $v['motor_date'];
                $motor_month = date_parse_from_format("Y-m-d", $date_end);
                $motor_m = $motor_month["month"];
                for ( $m=1; $m<=$month; $m++ ){
                    if($m == $motor_m){
                        if(!empty($location)){
                            if (isset($data_monthly[$code."-".$year][$motor][$m])){
                                $data_monthly[$code."-".$year][$motor][$m] += (double)$v['budget'];
                            }else{
                                $data_monthly[$code."-".$year][$motor][$m] = (double)$v['budget'];
                            }
                        }else{
                            if (isset($data_monthly[$code."-".$year][$m])){
                                $data_monthly[$code."-".$year][$m] += (double)$v['budget'];
                            }else{
                                $data_monthly[$code."-".$year][$m] = (double)$v['budget'];
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
                        $datasets_motor_monthly = array(
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
                    $datasets_motor_monthly = array(
                        'label' => $code,
                        'backgroundColor' => 'transparent',
                        'borderColor' => randomColor(),
                        'lineTension' => 0,
                        'borderWidth' => 3,
                        'data' => array_values($month_data)
                    );                
                }            
            }
            return $datasets_motor_monthly;
        }    
    }




     
    function display_motorcycle( $date_start, $date_end, $company, $motorcycle, $task, $id){
        global $conn_admin_db;        
        $sql_query = "SELECT * FROM u_motorcycle um
                      INNER JOIN company c on um.id=c.id
                     LEFT JOIN u_add_motorcycle uam ON um.id = uam.uam_id
                     WHERE um.status='1' AND um.motor_date BETWEEN '".dateFormat($date_start)."' AND '".dateFormat($date_end)."' ";
       
        
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
  
                $company = itemName("SELECT name FROM company WHERE id='".$row['company_id']."'");
                $motor = itemName("SELECT motor_name FROM u_add_motorcycle WHERE uam_id='".$row['motor_id']."' ");
                $motorcycle = "<span><b>".$motor."</b> - ".$company."</span><br>";
                $action = '<span id='.$row['id'].' data-toggle="modal"  class="edit_data" data-target="#editItem" onclick="editFunction('.$row['id'].', '."'".$row['task']."'".')"><i class="menu-icon fa fa-edit"></i>
                        </span>';
                $data = array(
                    $count.".",
                    dateFormatRev($row['motor_date']),
                    $motorcycle,
                    $row['maintenance'],
                    $row['budget'],
                    $row['workshop'],
                  
                    
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




    
    function display_maintenance( $date_start, $date_end, $company, $task, $id){
        global $conn_admin_db;        
        $sql_query = "SELECT * FROM u_maintenance um
                     INNER JOIN u_property up ON um.property_id = up.up_id
                     WHERE um.um_status= '1' ";
       
        
        if(!empty($company)){
            $sql_query .= " AND company_id='".$company."' ";
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
                
                $comp_name = itemName("SELECT name FROM company WHERE id='".$row['company_id_1']."'");
                $area_name = itemName("SELECT up_location FROM u_property WHERE up_id='".$row['property_id']."'");
                $address_name = itemName("SELECT up_address FROM u_property WHERE up_id='".$row['property_id']."'");
            
                
                
                $motorcycle = "<span>".$row['motorcycle_id']." - ".$company."</span><br>";
                $action = '<span id='.$row['id'].' data-toggle="modal"  class="edit_data" data-target="#editItem" onclick="editFunction('.$row['id'].', '."'".$row['task']."'".')"><i class="menu-icon fa fa-edit"></i>
                        </span>';
                $data = array(
                    $count.".",
                    dateFormatRev($row['from_date']),
                    $comp_name,
                    $area_name,
                    $address_name,
                    $row['maintenance'],
                    $row['budget']
                  
                    
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


    function update_renewal_status($params) {
        //unserialize jquery string data
        $param = array();
        parse_str($params['data'], $param);  
        var_dump($param);
        if( !empty($param)){
            $id = isset($param['id']) ? $param['id'] : "";
            $task = isset($param['task']) ? $param['task'] : "";
            $remark = isset($param['remark']) ? $param['remark'] : "";
            $action = isset($param['action']) ? $param['action'] : "";            
            switch ($task) {
                case 'Road Tax':
                    updateRoadTax($id, $remark, $action);
                    break;
                case 'Insurance':
                    updateInsurance($id, $remark, $action);
                    break;
                case 'Fitness Test':
                    updateFitnessTest($id, $remark, $action);
                    break;
                default:
                    break;
            }
        }
    }
    
    function updateRoadTax($id, $remark, $action){
        global $conn_admin_db;
        $sql_query = "UPDATE vehicle_roadtax SET vrt_remark='".$remark."', vrt_renewal_status='$action' WHERE vrt_id='".$id."'";
        
        $result = mysqli_query($conn_admin_db, $sql_query) or die(mysqli_error($conn_admin_db));
        if ($result) {
            alert ("Updated successfully","renewing_vehicle_schedule_report.php");
        }
        
    }
    
    function updateInsurance($id, $remark, $action){
        global $conn_admin_db;
        $sql_query = "UPDATE vehicle_insurance SET vi_remark='$remark', vi_renewal_status='$action' WHERE vi_id='".$id."'";
        
        $result = mysqli_query($conn_admin_db, $sql_query) or die(mysqli_error($conn_admin_db));
        if ($result) {
            alert ("Updated successfully","renewing_vehicle_schedule_report.php");
        }
    }
    
    function updateFitnessTest($id, $remark, $action){
        global $conn_admin_db;
        $sql_query = "UPDATE vehicle_puspakom SET vp_remark='$remark', vp_renewal_status='$action' WHERE vp_id='".$id."'";
        $result = mysqli_query($conn_admin_db, $sql_query) or die(mysqli_error($conn_admin_db));
        if ($result) {
            alert ("Updated successfully","renewing_vehicle_schedule_report.php");
        }
        
    }

	
?>