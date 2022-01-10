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
            case 'add_new_company':
                add_new_company($data);
                break;
                
            case 'update_property':
                update_property($data);
                break;
                
            case 'retrieve_property':
                retrieve_property($id);
                break;
                
            case 'delete_property':
                delete_property($id);
                break;
                
            default:
                break;
        }
    }
    
    function update_property($data){
        global $conn_admin_db;
        if (!empty($data)) {
            $param = array();
            parse_str($_POST['data'], $param); //unserialize jquery string data
			 
            $id = $param['id'];
            $location_name = mysqli_real_escape_string( $conn_admin_db,$param['location_name'] );
            $property_address = mysqli_real_escape_string( $conn_admin_db, $param['property_address'] );
            $property_remark = mysqli_real_escape_string( $conn_admin_db, $param['property_remark'] );
            $size = mysqli_real_escape_string( $conn_admin_db, $param['size'] );
            $floor1 = mysqli_real_escape_string( $conn_admin_db, $param['floor1'] );
            $floor2 = mysqli_real_escape_string( $conn_admin_db, $param['floor2'] );
           
			
            $query = "UPDATE u_property
                SET up_location = '$location_name',
                up_size = '$size',
                floor1 = '$floor1',
                floor2 = '$floor2',
				up_remark = '$property_remark',
                up_address = '$property_address'
                WHERE up_id='".$id."'";

            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        }
    }
    
    function retrieve_property($id){
        global $conn_admin_db;
        
        $query = "SELECT * FROM u_property WHERE up_id = '".$id."'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
    
    function delete_property($id){
        global $conn_admin_db;
        if (!empty($id)) {
            $query = "UPDATE u_property SET status = 0 WHERE up_id = '".$id."' ";
            $result = mysqli_query($conn_admin_db, $query);
            if ($result) {
                alert ("Deleted successfully", "property_list.php");
            }
        }        
    }
    
    function add_new_company($data){
        global $conn_admin_db;
        if (!empty($data)) {
            $param = array();
            parse_str($_POST['data'], $param); //unserialize jquery string data
            
            $code = mysqli_real_escape_string( $conn_admin_db,$param['company_code'] );
            $name = mysqli_real_escape_string( $conn_admin_db, $param['company_name'] );
            $reg_no = mysqli_real_escape_string( $conn_admin_db, $param['company_reg_no'] );
            
            $query = "INSERT INTO company SET
                code = '".$code."',
                name = '".$name."',
                registration_no = '".$reg_no."'";
            
            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
            alert("Successfully added!", "company.php");
//             if ($result) {
//                 alert("Successfully added!", "company.php");
//             }
            
        }        
    }
?>