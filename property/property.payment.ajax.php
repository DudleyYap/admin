<?php 
    require_once('../assets/config/database.php');
    require_once('../function.php');
    global $conn_admin_db;
    session_start();
    
    $action = isset($_POST['action']) && $_POST['action'] !="" ? $_POST['action'] : "";  
    $data = isset($_POST['data']) ? $_POST['data'] : "";
    $id = isset($_POST['id']) ? $_POST['id'] : "";

    if( $action != "" ){
        switch ($action){
            case 'add_new_payment':
                add_new_payment($data);
                break;
                
            case 'update_company':
                update_company($data);
                break;
                
            case 'retrieve_company':
                retrieve_company($id);
                break;
                
            case 'delete_company':
                delete_company($id);
                break;
                
            default:
                break;
        }
    }
    
    function update_company($data){
        global $conn_admin_db;
        if (!empty($data)) {
            $param = array();
            parse_str($_POST['data'], $param); //unserialize jquery string data
            
            $id = $param['id'];
            $code = mysqli_real_escape_string( $conn_admin_db,$param['code'] );
            $name = mysqli_real_escape_string( $conn_admin_db, $param['name'] );
            $reg_no = mysqli_real_escape_string( $conn_admin_db, $param['reg_no'] );
            
            $query = "UPDATE company
                SET code = '$code',
                name = '$name',
                registration_no = '$reg_no'
                WHERE id='".$id."'";

            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        }
    }
    
    function retrieve_company($id){
        global $conn_admin_db;
        
        $query = "SELECT * FROM company WHERE id = '$id'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
    
    function delete_company($id){
        global $conn_admin_db;
        if (!empty($id)) {
            $query = "UPDATE company SET status = 0 WHERE id = '".$id."' ";
            $result = mysqli_query($conn_admin_db, $query);
            if ($result) {
                alert ("Deleted successfully", "company.php");
            }
        }        
    }
    
    function add_new_payment($data){
        global $conn_admin_db;
        if (!empty($data)) {
            $param = array();
            parse_str($_POST['data'], $param); //unserialize jquery string data
            
            $water_bill = $param['water_bill'];
            $e_bill = $param['e_bill'];
            $management_bill = $param['management_bill'];

            $query = "INSERT INTO p_payment SET
                e_bill = '".$e_bill."',
                water_bill = '".$water_bill."',
                management_bill = '".$management_bill."'";
            
            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
            alert("Successfully added!", "property_payment.php");
//             if ($result) {
//                 alert("Successfully added!", "company.php");
//             }
            
        }        
    }
?>