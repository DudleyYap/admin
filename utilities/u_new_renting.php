<?php
require_once('../assets/config/database.php');
require_once('../function.php');
require_once('../check_login.php');
global $conn_admin_db;

$select_company = isset($_POST['company']) ? $_POST['company'] : "";
$year_select = isset($_POST['year_select']) ? $_POST['year_select'] : date("Y");
ob_start();
selectYear('year_select',$year_select,'submit()','','form-control form-control-sm','','');
$html_year_select = ob_get_clean();

?>

<!doctype html><html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Utility</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
    .select2-selection__rendered {
      margin: 2px;
    }
    .select2-selection__arrow {
      margin: 2px;
    }
    .select2-container{ 
        width: 100% !important; 
    }
    .myFont{
      font-size:4px;
    }
   </style>
</head>

<body>
<!--Left Panel -->
<?php  include('../assets/nav/leftNav.php')?>
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
                            <strong class="card-title">Rental </strong>
                        </div> 
                        <div class="card-body">
                                <form id="myform" enctype="multipart/form-data" method="post" action="">                	                   
                    	            <div class="form-group row col-sm-12">
                                        <div class="col-sm-3">
                                            <label for="acc_no" class="form-control-label"><small class="form-text text-muted">Company</small></label>
                                            <?php
                                                $company = mysqli_query ( $conn_admin_db, "SELECT id , UPPER(name) FROM company WHERE status='1' ORDER BY name");
                                                db_select ($company, 'company', $select_company,'submit()','All','form-control form-control-sm','');
                                            ?>                           
                                        </div>
                                        <div class="col-sm-2">
                                        	<label for="acc_no" class="form-control-label"><small class="form-text text-muted">Year</small></label>
                                        	<?=$html_year_select;?>
                                        </div>
                                        <div class="col-sm-4">                                    	
                                        	<button type="submit" class="btn btn-sm btn-primary button_search ">View</button>
                                        </div>
                                     </div>    
                                </form>   
                            </div>    
                       <div class="card-body">
                       <div class="form-group row col-sm-12">  
                           	<div class="col-sm-2">  
                           	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addItem">
                               Add Renting
							</button>
                           	</div>  
                       	</div>                                            
                            <table id="item-data-table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                       
											<th>Reference No.</th>
											<th>Tenant</th>
                                       		<th>Land Lot/Address</th>
											<th>Month </th>
											<th>Use of Demised Premises</th>
											<th>Company</th>
											<th>Action</th>
											
                                    </tr>
									
                                </thead>
                                <tbody>

                                <?php 
                                    $sql_query = "SELECT * FROM u_renter WHERE status='1'";
 																		
                                    if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                        $count = 0;
                                        $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                            while($row = mysqli_fetch_array($sql_result)){ 
                                                $count++;  
												 //$add_name = itemName ("SELECT up_address FROM u_property WHERE up_id='".$row['address_id']."'");
                                                 $comp_name = itemName("SELECT name FROM company WHERE id='".$row['company_id']."'");
                                                 $tenant_name = itemName("SELECT tenant_name FROM u_tenant WHERE id='".$row['tenant_id']."'");
                                                ?>
                                                <tr>
                                                    <td><a href="u_rental_details.php?id=<?=$row['ur_id']?>" target="_blank" style="color:blue;"><?=$row['ur_id']?></a></td>
													<td><?=strtoupper($tenant_name)?></td>
													<td><?=$row['address_edit']?></td> 
													<td><?=$row['ur_remark']?></td>
													<td><?=$row['ur_demise']?></td>
                                                    <td><?=strtoupper($comp_name)?></td>                                                                                                    
                                                    <td>
                                                    	<span id="<?=$row['ur_id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="fa fa-edit"></i></span>
                                                    	<span id="<?=$row['ur_id']?>" data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt"></i></span>
                                                    </td>
                                                </tr>
                                <?php
                                            }
                                        }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- .animated -->
    </div><!-- .content -->
    </div>
    
    <!-- Modal Add new account -->
    <div id="addItem" class="modal fade">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add New</h4>
                </div>
                <div class="modal-body">
                <form role="form" method="POST" action="" id="add_form">                    
                 <div class="form-group row col-sm-12">
										<div class="col-sm-6" id="">
											<label for="renter_name" class="control-label"><small class="form-text text-muted">Select Tenant<span style="color:red">*</span> </small></label>    
                                            <div>
													<?php
														$renter_name = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(tenant_name) FROM u_tenant WHERE status='1'");
														db_select ($renter_name, 'renter_name', '','','-select-','form-control form-control-sm','','required');
													?>
												</div>
											
                                        </div>
										
										</div>  
									 <div class="form-group row col-sm-12">
										<div class="col-sm-6">
												<label for="company" class=" form-control-label"><small class="form-text text-muted">Company <span class="color-red">*</span></small></label>
												<div>
													<?php
														$company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1'");
														db_select ($company, 'company', '','','-select-','form-control form-control-sm','','required');
													?>
												</div>
										</div>
                                    <div class="col-sm-6" id="addres">
                            <label for="address" class=" form-control-label"><small class="form-text text-muted">Addres</small></label>
							<textarea name="address" id="address" rows="3" placeholder="Content..." class="form-control"></textarea>
                         </div>     
                                    </div> 
									<div class="form-group row col-sm-12">
                                        <div class="col-sm-6" id="tenant_remark">
                                            <label for="tenant_remark" class=" form-control-label"><small class="form-text text-muted">Purpose</small></label>
											<textarea name="tenant_remark" id="tenant_remark" rows="3" placeholder="Content..." class="form-control"></textarea>
                                        </div>   
									<div class="col-sm-6" id="tenant_demise">
                                            <label for="tenant_demise" class=" form-control-label"><small class="form-text text-muted">Use of Demised Premises</small></label>
											<textarea name="tenant_demise" id="tenant_demise" rows="3" placeholder="Content..." class="form-control"></textarea>
                                        </div>                                         
                                    </div>                         
                </div>              
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary save_data ">Save</button>
                </div>
                </form>
                </div>
            </div>
        </div>
    </div>
     <!-- Modal edit account  -->
    <div id="editItem" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Account</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="POST" action="" id="update_form">                        
                    <input type="hidden" id="ur_id" name="ur_id" value="">
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-6">
                            <label for="company_edit" class=" form-control-label"><small class="form-text text-muted">Company</small></label>
                            <div>
                                <?php
                                    $company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1'");
                                    db_select ($company, 'company_edit', '','','-select-','form-control form-control-sm','','required');
                                ?>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="renter_name_edit" class=" form-control-label"><small class="form-text text-muted">Name</small></label>
                            <div>
								<?php
									$renter_name = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(tenant_name) FROM u_tenant WHERE status='1'");
									db_select ($renter_name, 'renter_name_edit', '','','-select-','form-control form-control-sm','','required');
								?>
							</div>
                        </div>
                    </div>   
                    <div class="form-group row col-sm-12">
                    	 <div class="col-sm-6" id="addres_edit">
                            <label for="address_edit" class=" form-control-label"><small class="form-text text-muted">Addres</small></label>
							<textarea name="address_edit" id="address_edit" rows="3" placeholder="Content..." class="form-control"></textarea>
                         </div>    
						<div class="col-sm-6" id="tenant_demise_edit">
                            <label for="tenant_demise_edit" class=" form-control-label"><small class="form-text text-muted">Use of Demised Premises</small></label>
							<textarea name="tenant_demise_edit" id="tenant_demise_edit" rows="3" placeholder="Content..." class="form-control"></textarea>
                         </div> 
						<div class="col-sm-6">
                            <label for="tenant_remark_edit" class=" form-control-label"><small class="form-text text-muted">Purpose</small></label>
                            <textarea id="tenant_remark_edit" name="tenant_remark_edit"  rows="3" class="form-control form-control-sm"></textarea>
                        </div>  
                
                    </div>                
                    	               
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary update_data ">Update</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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
<script src="../assets/js/select2.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// Initialize select2
	var select2 = $("#company").select2({
	    selectOnClose: true
    });
	select2.data('select2').$selection.css('height', '31px');
	select2.data('select2').$selection.css('border', '1px solid #ced4da');
	
// 	$("#company").select2({ dropdownCssClass: "myFont" });
    $('#item-data-table').DataTable({
           	        	
             	 
  	});
    
    $(document).on('click', '.edit_data', function(){
    	var ur_id = $(this).attr("id");        	    	
    	$.ajax({
    			url:"u.new.renting.ajax.php",
    			method:"POST",
    			data:{action:'retrieve_account', id:ur_id},
    			dataType:"json",
    			success:function(data){ 
        			console.log(data); 		
    				$('#ur_id').val(ur_id);	
                    $('#company_edit').val(data.company_id);      
                    $('#address_edit').val(data.address_edit);  
                    $('#renter_name_edit').val(data.tenant_id);  
                    $('#tenant_remark_edit').val(data.ur_remark);
					$('#reference_no_edit').val(data.reference_no);
					$('#tenant_demise_edit').val(data.ur_demise);
                    $('#editItem').modal('show');
    			}
    		});
    });

    $(document).on('click', '.delete_data', function(){
    	var ur_id = $(this).attr("id");
    	$('#delete_record').data('id', ur_id); //set the data attribute on the modal button
    
    });
  	
	$( "#delete_record" ).click( function() {
		var ID = $(this).data('id');
		$.ajax({
			url:"u.new.renting.ajax.php",
			method:"POST",    
			data:{action:'delete_account', id:ID},
			success:function(data){	  						
				$('#deleteItem').modal('hide');		
				location.reload();		
			}
		});
	});

    $('#update_form').on("submit", function(event){  
      event.preventDefault();  
      $.ajax({  
          url:"u.new.renting.ajax.php",  
          method:"POST",  
          data:{action:'update_account', data: $('#update_form').serialize()},  
          success:function(data){   
               if(data){
                   alert("Successfully updated!");
            	   $('#editItem').modal('hide');                 
                   location.reload(); 
               } 
          }  
     }); 
    }); 
    
    $('#add_form').on("submit", function(event){  
        event.preventDefault();  
        $.ajax({  
            url:"u.new.renting.ajax.php",  
            method:"POST",  
            data:{action:'add_new_account', data: $('#add_form').serialize()},  
            success:function(data){
                if(data){
                	alert("Successfully added!");
                	$('#editItem').modal('hide');                   
                    location.reload();  
                }                    
            }  
       });
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
});
</script>
</body>
</html>
