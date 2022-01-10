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
                
            case 'update_tenant':
                update_tenant($data);
                break;
                
            case 'retrieve_tenant':
                retrieve_tenant($id);
                break;
                
            case 'delete_tenant':
                delete_tenant($id);
                break;
                
            default:
                break;
        }
    }
    
    function update_tenant($data){
        global $conn_admin_db;
        if (!empty($data)) {
            $param = array();
            parse_str($_POST['data'], $param); //unserialize jquery string data
			 
            $id = $param['id'];
            $tenant_name = mysqli_real_escape_string( $conn_admin_db,$param['tenant_name'] );
            $ic = mysqli_real_escape_string( $conn_admin_db, $param['ic'] );
            $contact_no = mysqli_real_escape_string( $conn_admin_db, $param['contact_no'] );
            $tenant_email = mysqli_real_escape_string( $conn_admin_db, $param['tenant_email'] );
            $tenant_remark = mysqli_real_escape_string( $conn_admin_db, $param['tenant_remark'] );
			
            $query = "UPDATE u_tenant
                SET tenant_name = '$tenant_name',
                tenant_email = '$tenant_email',
                tenant_remark = '$tenant_remark',
				contact_no = '$contact_no',
                ic = '$ic'
                WHERE id='".$id."'";

            $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
        }
    }
    
    function retrieve_tenant($id){
        global $conn_admin_db;
        
        $query = "SELECT * FROM u_tenant WHERE id = '".$id."'";
        $rst  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
        
        $row = mysqli_fetch_assoc($rst);
        echo json_encode($row);
    }
    
    function delete_tenant($id){
        global $conn_admin_db;
        if (!empty($id)) {
            $query = "UPDATE u_tenant SET status = 0 WHERE id = '".$id."' ";
            $result = mysqli_query($conn_admin_db, $query);
            if ($result) {
                alert ("Deleted successfully", "tenant_list.php");
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