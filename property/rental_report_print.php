<?php
	require_once('../assets/config/database.php');
	require_once('../function.php');	
	require_once('../check_login.php');
	global $conn_admin_db;

	$select_company = isset($_GET['company']) ? $_GET['company'] : "";
	
?>


<!doctype html><html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Property</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
   @media print{
   
    @page {size: landscape}
       .button_search{
            display:none
       }
   }

   #rental_table {
    padding: 12px 10px 12px 40px;
  border: 2px solid #ddd;
  margin-bottom: 12px;
 
 
  width: 100%;
   }

   </style>
</head>

<body>
<div class="card-body">
	<div class="col-sm-12" style="text-align: center;">                                    	
    	<button type="button" class="btn btn-primary button_search" onClick="window.print();window.close();">Print</button>
    </div>
    <br>
    <table id="rental_table" border="1" style="border-collapse:collapse;text-align:center;width:100%;">
    <thead>
                                        <tr>
                                        	<th rowspan="2">No.</th>
											<th rowspan="2">Area</th>
                                            <th rowspan="2">Owner</th>
											<th rowspan="2">Address</th>	
                                            <th rowspan="2">Floor</th>
                                            <th rowspan="2">Size</th>										
											<th rowspan="2">Tenant</th>
                                            <th colspan="3" style="text-align: center">Borne By</th>   
											<th rowspan="2">Rental</th>
                                            <th colspan="2" style="text-align: center">Tenure</th>   
											<th rowspan="2">Insurance</th>
                                              
                                           
                                        </tr>
                                        <tr>
                                            <th>Electricity</th>
											<th>Water</th>
											<th>MGNT Fee</th>
                                            <th>From</th>
											<th>To</th>
											
                                        </tr>
                                    </thead>
        <tbody>

        <?php 
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
            
            if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                $count = 0;
                $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                    while($row = mysqli_fetch_array($sql_result)){ 
                        $count++;
                       
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
$from =  $row['date_from'] != NULL ? dateFormatRev($row['date_from']) : "-";
$until = $row['date_until'] != NULL ? dateFormatRev($row['date_until']) : "-";
$date = $row['insurance_date'];
$curdate = '1980-01-01';

if($curdate > $date){
    $insuranceDate ="<span>-</span><br><br>";
} else{
    $insuranceDate = "<span>".dateFormatRev($row['insurance_date'])."</span><br><br>";
}
                        ?>
                        <tr>
                            <td><?=$count?>.</td>
                            <td><?=strtoupper($area_name)?></td>
                            <td><?=strtoupper($comp_name)?></td>
                            <td><?=strtoupper($address_name)?></td>
                            <td><?=strtoupper($floorType)?></td>
                            <td><?=$row['up_size']?></td>
                            <td><?=$tenant?></td>
                            <td><?= $row['electric_bill']?></td>
                            <td><?= $row['water_bill']?></td>
                            <td><?= $row['maintenance_cost']?></td>
                            <td><?= $row['ur_monthly_rental']?></td>
                            <td><?=$from?></td>
                            <td><?=$until?></td>
                            <td><?=  $insuranceDate?></td>
                                                    
                        </tr>
        <?php
                    }
                }
        ?>
        </tbody>
    </table>
</div>
</body>
</html>
