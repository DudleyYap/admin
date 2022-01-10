<?php 
    require_once('../assets/config/database.php');
    require_once('../function.php');    
    session_start();

    $action = isset($_POST['action']) && $_POST['action'] !="" ? $_POST['action'] : "";    
    $date_start = isset($_POST['date_start']) ? $_POST['date_start'] : date('01-m-Y');
    $date_end = isset($_POST['date_end']) ? $_POST['date_end'] : date('t-m-Y');  
    $data = isset($_POST['data']) ? $_POST['data'] : "";
    $id = isset($_POST['id']) ? $_POST['id'] : "";
    if( $action != "" ){
        switch ($action){
            
                        
            case 'delete_rental_collection_report': 
                delete_rental_collection_report($id);                
                break;
                
            case 'display_rental_collection_report':
                display_rental_collection_report($date_start, $date_end);
                break;
                
            case 'retrieve_rental_collection_report':
                retrieve_rental_collection_report($id);
                break;
         
            default:
                break;
        }
    }
    
     
    function retrieve_rental_collection_report($id){
        global $conn_admin_db;
        if(!empty($id)){           
            $query = "SELECT * FROM u_renter WHERE id = '".$id."'";            
            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
            $row = mysqli_fetch_assoc($result);
            echo json_encode($row);
        }
    }
    
    function display_rental_collection_report($date_start, $date_end){
        global $conn_admin_db;

        
        $sql_query = "SELECT * FROM u_renter
                                    INNER JOIN u_property ON u_renter.address_id = u_property.up_id
                                    INNER JOIN company ON company.id = u_renter.company_id
                                    WHERE u_renter.status='1'";
        
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
                $action = '<span id='.$row['ur_id'].' data-toggle="modal" class="edit_data" data-target="#editItem"><i class="menu-icon fa fa-edit"></i>
                                </span>&nbsp;&nbsp;&nbsp;&nbsp;
                                <span id='.$row['ur_id'].' data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="menu-icon fa fa-trash-alt"></i>
                                </span>';
                $data = array(
                    $count.".",
                    $row['ur_name'],
					$row['ur_remark'],
					$row['ur_water_bill'],
                    dateFormatRev($row['ur_tenure_startdate']),
                    dateFormatRev($row['ur_tenure_enddate']),
                    $row['ur_rental_deposit'],
					$row['ur_monthly_rental'],
					$row['ur_utility_deposit'],
					$row['ur_e_bill'],
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
    
    function delete_rental_collection_report($id){
        global $conn_admin_db;
        if(!empty($id)){
            $query = "UPDATE u_renter SET status = 0 WHERE ur_id = '".$id."' ";
            $result = mysqli_query($conn_admin_db, $query);
            if ($result) {
                alert ("Deleted successfully", "rental_collection_report.php");
            }            
        }
    }
    
?>