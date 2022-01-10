<?php 
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
    global $conn_admin_db;
    
    $id = isset($_GET['id']) ? $_GET['id'] : "";
    $year_select = isset($_POST['year_select']) ? $_POST['year_select'] : date('Y');
    ob_start();
    selectYear('year_select',$year_select,'submit()','','form-control form-control-sm','','');
    $html_year_select = ob_get_clean();
    
    $query = "SELECT * FROM u_renter
																		INNER JOIN u_property ON u_renter.address_id = u_property.up_id
																		INNER JOIN company ON company.id = u_renter.company_id
																		WHERE u_renter.ur_id = '$id'";
    
    $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    $row = mysqli_fetch_assoc($result);

    $acc_id = $row['ur_id'];
    $company = $row['name'];
    $renter_name = $row['ur_name'];
    $tenant_remark = $row['ur_remark'];
    $address = $row['up_address'];

    
    
    //report renting
    $details_query = "SELECT MONTHNAME(date_from) AS month_name,u_renting_extend.* FROM u_renting_extend WHERE acc_id = '$acc_id' AND YEAR(date_from) = '$year_select' ORDER BY date_from";
    $result_mf = mysqli_query($conn_admin_db, $details_query) or die(mysqli_error($conn_admin_db));
    $arr_data_mf = [];
    while ($rows = mysqli_fetch_assoc($result_mf)){
        $arr_data_mf[] = $rows;
    }
    
    //Date
    $wb_query = "SELECT MONTHNAME(date_received) AS month_name, u_renting_date.* FROM u_renting_date WHERE acc_id = '$acc_id' AND YEAR(date_received) = '$year_select' ORDER BY date_received";
    $result_wb = mysqli_query($conn_admin_db, $wb_query) or die(mysqli_error($conn_admin_db));
    $arr_data_wb = [];
    while ($rows = mysqli_fetch_assoc($result_wb)){
        $arr_data_wb[] = $rows;
    }
	
	 //Late interest charge 
    $li_query = "SELECT * FROM u_bill_under WHERE acc_id = '$acc_id' ";
    $result_li = mysqli_query($conn_admin_db, $li_query) or die(mysqli_error($conn_admin_db));
    $arr_data_li = [];
    while ($rows = mysqli_fetch_assoc($result_li)){
        $arr_data_li[] = $rows;
    }

    
?>

<!doctype html><html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Vehicle</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
    .select2-selection__rendered {
      margin: 5px;
    }
    .select2-selection__arrow {
      margin: 5px;
    }
    .select2-container{ 
        width: 100% !important; 
    }
    .button_add{
        position: absolute;
        left:    0;
        bottom:   0;
    }
    .hideBorder {
        border: 0px;
        background-color: transparent;        
    }
    .hideBorder:hover {
        background: transparent;
        border: 1px solid #dee2e6;
    }
    
   </style>
</head>

<body>
    <!--Left Panel -->
	<?php include('../assets/nav/leftNav.php')?>
    <!-- Right Panel -->
    <?php include('../assets/nav/rightNav.php')?>
    <!-- /#header -->
    <!-- Content -->
        <div id="right-panel" class="right-panel">
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                	<div class="col-md-12">
                        <div class="card" id="printableArea">
                            <div class="card-header">                            
                                <strong class="card-title"><a href="u_new_renting.php">Rental Collection</a> > Account Details</strong>
                            </div>     
                            <div class="card-body">                                       
                                <div class="col-sm-12">
                                    <label class=" form-control-label"><small class="form-text text-muted">Lesse : <?=$renter_name?></small></label>                                        
                                </div>                                
                                <div class="col-sm-12">
                                	<label class=" form-control-label"><small class="form-text text-muted">Land Lot: <?=$address?></small></label>                                    	
                                </div>
                                <div class="col-sm-12">
                                	<label class=" form-control-label"><small class="form-text text-muted">Purpose and Use: <?=$tenant_remark?></small></label>                                    
                                </div>
                                <div class="col-sm-12">
                                	<label class=" form-control-label"><small class="form-text text-muted">Company : <?=$company?></small></label>                                    
                                </div>                                                                                                    
                            	<hr>
                            	<form action="" method="post">
                                	<div class="form-group row col-sm-12">           
                                    	<div class="col-sm-4">
                                    		<b>Extension</b>
                                    	</div>                                    	
                                    	<div class="col-sm-4">
                                    		<?=$html_year_select?>
                                    	</div>
                                    	<div class="col-sm-4">
                                    		<button type="button" class="btn btn-sm btn btn-info" onClick="window.close();">Back</button>
                                    	</div>
                                	</div>
                            	</form> 
                            	<div class="tabs">
                                    <ul class="tab-links">
                                        <li id="t1"><a href="#tab1" class="tab1a">Report</a></li>
                                        <li id="t2"><a href="#tab2" class="tab2a">Date</a></li>
										<li id="t3"><a href="#tab3" class="tab3a">Bill Under</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab active" id="tab1">
                                            <table id="table-report" class="table table-striped table-bordered">                                               
                                                <thead>                                            
                                                   <tr>
														<th>Description</th>
                                                    	<th>Date From</th>
														<th>Date Until</th>
                                                    	<th>Rental Deposit</th>
                                                    	<th>Utility Deposit</th>
                                                    	<th>Rental/Month</th>
														<th>GST (6%)</th>
                                                    	<th>Rental as Per Tax Inv</th>    
                                                    	<th>Remarks</th>      
                                                    	<th>Action</th>                                          	                               	
                                                    </tr>
													
                                            	</thead>   
                                            	<tbody>
												<?php 
												$total_mf = 0;
                                            	foreach ($arr_data_mf as $data){
                                            	    $total_mf += $data['payment_amount'];
                                            	    ?>
                                            	<tr>
                                                    <td class="text-left"><?=$data['month_name']?></td>
													<td class="text-center"><?=dateFormatRev($data['date_from'])?></td> 
													<td class="text-center"><?=dateFormatRev($data['date_until'])?></td> 
                                                    <td class="text-left"><?=number_format($data['ur_rental_deposit'],2)?></td>
        											<td class="text-left"><?=number_format($data['ur_utility_deposit'],2)?></td>
													<td class="text-left"><?=number_format($data['ur_monthly_rental'],2)?></td>
                                                    <td class="text-right"><?=number_format($data['ur_gst'],2)?></td> 
													<td class="text-right"><?=number_format($data['ur_rental_taxinv'],2)?></td> 
                                                    <td class="text-center"><?=$data['ur_remark']?></td>    
                                                    <td class="text-center">
                                                    	<span onclick="window.open('add_renting_report.php?id=<?=$acc_id?>&item_id=<?=$data['id']?>')"><i class="fa fa-edit"></i></span>
                                                    	<span id="<?=$data['id']?>" data-toggle="modal" data="u_renting_extend" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt"></i></span>
                                                    </td>                                         
                                                </tr>
                                            	<?php }?>
                                            	</tbody>  
                                            	<tfoot>
                                            	<?php if(!empty($arr_data_mf)){?>
                                                	<tr>
                                                        <th class="text-center" colspan="3">TOTAL</th>                                                    
                                                        <th class="text-right"><?=number_format($total_mf,2)?></th>
                                                        <th class="text-center">&nbsp;</th>
                                                        <th class="text-center">&nbsp;</th>
                                                        <th class="text-right">&nbsp;</th>
                                                        <th class="text-center">&nbsp;</th>   
                                                        <th class="text-center">&nbsp;</th>    
                                                        <th class="text-center">&nbsp;</th>                                                                                    
                                                    </tr>
                                            	<?php }?>
                                            	</tfoot>                                             	                                                                                                       
                                            </table>
                                        </div>
                                        <div class="tab" id="tab2">                                            
                                            <table id="table-date" class="table table-striped table-bordered">                                                
                                            <thead> 
                                            	<tr>
                                            		<th>Month</th>
                                            		<th>Tax Invoice</th>
                                            		<th>Mark</th>
                                            		<th>Official Receipt</th>
                                            		<th>Mark</th>
													<th>Date</th>
                                            		<th>Action</th>
                                            	</tr>                                           
                                               									
                                        	</thead>   
                                        	<tbody>
                                        	<?php 
                                        	$total_consume = 0;
                                        	$total_amount = 0;
                                        	if(!empty($arr_data_wb)){
                                        	    foreach ($arr_data_wb as $data){
                                        	        $total_consume +=$data['total_consume'];
                                        	        $total_amount +=$data['total'];
                                        	        ?>
                                        	<tr>
                                                <td class="text-left"><?=$data['month_name']?></td>
                                                <td class="text-left"><?=$data['tax_invoice']?></td>
												<td class="text-center"><?=strtoupper($data['mark1'])?></td> 
    											<td class="text-left"><?=$data['official_receipt']?></td>
												<td class="text-center"><?=strtoupper($data['mark2'])?></td>         
                                                <td class="text-center"><?=dateFormatRev($data['date_received'])?></td> 
                                                <td class="text-center">
                                                	<span onclick="window.open('add_date_record.php?id=<?=$acc_id?>&item_id=<?=$data['id']?>')"><i class="fa fa-edit"></i></span>
                                                	<span id="<?=$data['id']?>" data-toggle="modal" data="u_renting_date" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt"></i></span>
                                                </td>
                                                                                            
                                            </tr>
                                        	<?php }
                                        	}?>
                                        	</tbody>  
                                        	<tfoot>
                                        	</tfoot>     
                                        </table>
									</div>
										<div class="tab" id="tab3">                                        	
                                            <table id="table-bill-under" class="table table-striped table-bordered">                                                
                                            <thead>                                            
                                                <tr>
                                                	<th>Maintenance Cost</th>
                                                	<th>Electric Bill</th>
                                                	<th>Water Bill</th>    
                                                	<th>Action</th>                                     	                                             	                               	
                                                </tr>										
                                        	</thead>   
                                        	<tbody>
                                        	<?php 
                                        	$li_total = 0;
                                        	if(!empty($arr_data_li)){
                                        	    foreach ($arr_data_li as $data){
                                        	        $li_total += $data['amount'];
                                        	        ?>
                                        	<tr>
                                                <td class="text-left"><?=$data['maintenance_cost']?></td>
                                                <td class="text-left"><?=$data['electric_bill']?></td>                                          
                                                <td class="text-left"><?=$data['water_bill']?></td> 
                                                <td class="text-center">
                                                	<span onclick="window.open('add_bill_under.php?id=<?=$acc_id?>&item_id=<?=$data['id']?>')"><i class="fa fa-edit"></i></span>
                                                	<span id="<?=$data['id']?>" data-toggle="modal" data="u_bill_under" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt"></i></span>
                                                </td>                                                                                                       
                                            </tr>
                                        	<?php }
                                        	}?>
                                        	</tbody>  
                                        	<tfoot>
                                        	
                                        	</tfoot>     
                                        </table>
									</div>
									
								
         
								</div>
                                </div>                           	                            	                                                                                                                                      	 
                           	</div> 
                           	<br>                      
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        </div>
        <div class="modal fade" id="deleteItem">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticModalLabel">Delete Item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                       Are you sure you want to delete?
                   </p>
               </div>
               <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" id="delete_record" class="btn btn-primary">Confirm</button>
            	</div>
        	</div>
    	</div>
    </div>
    <div class="clearfix"></div>
    <!-- Footer -->
    <?PHP include('../footer.php')?>
        <!-- /.site-footer -->
    <!-- /#right-panel -->

    <!-- link to the script-->
	<?php include ('../allScript2.php')?>
	<!-- Datatables -->
	<script src="../assets/js/lib/data-table/datatables.min.js"></script>
    <script src="../assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="../assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="../assets/js/lib/data-table/jszip.min.js"></script>
    <script src="../assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="../assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="../assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="../assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="../assets/js/init/datatables-init.js"></script>
    <script src="../assets/js/script/bootstrap-datepicker.min.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/select2.min.js"></script>
	
	<script type="text/javascript">
    $(document).ready(function() {		
		var acc_id = '<?=$id?>';			
        $('#table-report').DataTable({
            "bInfo" : false,
            "bLengthChange": false,
            "searching": false,
            "dom": "lBtipr",
            "buttons": {
              "buttons": [
                {
                  text: "Add New Record",
                  action: function(e, dt, node, config) {
                    //trigger the bootstrap modal
                      window.open('add_renting_report.php?id=<?=$acc_id?>');
                  }
                }
              ],
              "dom": {
                "button": {
                  tag: "button",
                  className: "btn btn-primary"
                },
                "buttonLiner": {
                  tag: null
                }
              }
            }
        });
        $('#table-date').DataTable({
            "bInfo" : false,
            "bLengthChange": false,
            "searching": false,
            "dom": "lBtipr",
            "buttons": {
              "buttons": [
                {
                  text: "Add New Record",
                  action: function(e, dt, node, config) {
                    //trigger the bootstrap modal
                      window.open('add_date_record.php?id=<?=$acc_id?>');
                  }
                }
              ],
              "dom": {
                "button": {
                  tag: "button",
                  className: "btn btn-primary"
                },
                "buttonLiner": {
                  tag: null
                }
              }
            }
        });
		
		$('#table-bill-under').DataTable({
            "bInfo" : false,
            "bLengthChange": false,
            "searching": false,
            "dom": "lBtipr",
            "buttons": {
              "buttons": [
                {
                  text: "Add New Record",
                  action: function(e, dt, node, config) {
                    //trigger the bootstrap modal
                      window.open('add_bill_under.php?id=<?=$acc_id?>');
                  }
                }
              ],
              "dom": {
                "button": {
                  tag: "button",
                  className: "btn btn-primary"
                },
                "buttonLiner": {
                  tag: null
                }
              }
            }
        });
       
        $(document).on('click', '.delete_data', function(){
        	var id = $(this).attr("id");
        	var database = $(this).attr("data");
        	
        	$('#delete_record').data('id', id); //set the data attribute on the modal button
        	$('#delete_record').data('database', database);
        
        });
      	
    	$( "#delete_record" ).click( function() {
    		var ID = $(this).data('id');
    		var DB = $(this).data('database');
    		$.ajax({
    			url:"u.new.renting.ajax.php",
    			method:"POST",    
    			data:{action:'delete_account_details', id:ID, database:DB},
    			success:function(data){	
        			if(data){
        				$('#deleteItem').modal('hide');		
        				location.reload();		
            		}  						    				
    			}
    		});
    	});

        $('#payment_date_mf, #received_date_mf, #paid_date, #due_date').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
        });

        $(".tabs").tabs();
        var currentTab = $('.ui-state-active a').index();
        if(localStorage.getItem('activeTab') != null){
        	 $('.tabs > ul > li:nth-child('+ (parseInt(localStorage.getItem('activeTab')) + 1)  +')').find('a').click();
        }

         $('.tabs > ul > li > a').click(function(e) {
          var curTab = $('.ui-tabs-active');         
          curTabIndex = curTab.index();          
          localStorage.setItem('activeTab', curTabIndex);
         });
      	
        function isNumberKey(evt){
        	var charCode = (evt.which) ? evt.which : evt.keyCode;
        	if (charCode != 46 && charCode > 31 
        	&& (charCode < 48 || charCode > 57))
        	return false;
        	return true;
        }  
        
        function isNumericKey(evt){
        	var charCode = (evt.which) ? evt.which : evt.keyCode;
        	if (charCode != 46 && charCode > 31 
        	&& (charCode < 48 || charCode > 57))
        	return true;
        	return false;
        } 
        //format to dd-mm-yy
        function dateFormat(dates){
            var date = new Date(dates);
        	var day = date.getDate();
    	  	var monthIndex = date.getMonth()+1;
    	  	var year = date.getFullYear();

    	  	return (day <= 9 ? '0' + day : day) + '-' + (monthIndex<=9 ? '0' + monthIndex : monthIndex) + '-' + year ;
        }
    });
  </script>
</body>
</html>