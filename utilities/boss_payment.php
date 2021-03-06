<?php
require_once('../assets/config/database.php');
require_once('../function.php');
require_once('../check_login.php');
global $conn_admin_db;

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
                            <strong class="card-title">Boss Payment</strong>
                        </div>     
                       <div class="card-body">
                       <div class="form-group row col-sm-12">  
                           	<div class="col-sm-2">  
                           	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addItem">
                               Add New record
							</button>
                           	</div>  
                       	</div>                                            
                            <table id="item-data-table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Reference No</th>
										<th>Company</th>
										<th>Account/Unit No.</th>											
										<th>Location</th>	
										<th>Owner</th>										
										<th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                <?php 
                                    $sql_query = "SELECT * FROM u_boss_payment WHERE status ='1'"; 
                                    if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                        $count = 0;
                                        $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                            while($row = mysqli_fetch_array($sql_result)){ 
                                                $count++;  
                                                $acc_unit_no = $row['account_no']."/".$row['unit_no'];
                                                $comp_name = itemName("SELECT name FROM company WHERE id='".$row['company_id']."'")
                                                ?>
                                                <tr>
                                                    <td><a href="boss_payment_details.php?id=<?=$row['id']?>" target="_blank" style="color:blue;"><?=$row['reference_no']?></a></td>
                                                    <td><?=strtoupper($comp_name)?></td>
                                                    <td><?=$acc_unit_no?></td>                                                        
                                                    <td><?=$row['location']?></td> 
                                                    <td><?=$row['owner']?></td>                                                       
                                                    <td>
                                                    	<span id="<?=$row['id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="fa fa-edit"></i></span>
                                                    	<span id="<?=$row['id']?>" data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt"></i></span>
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
                    <h4 class="modal-title">Add New </h4>
                </div>
                <div class="modal-body">
                <form role="form" method="POST" action="" id="add_form">                    
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
                    <div class="col-sm-6">
                        <label for="acc_no" class=" form-control-label"><small class="form-text text-muted">Account No. <span class="color-red">*</span></small></label>
                        <input type="text" id="acc_no" name="acc_no" placeholder="Enter Account number" class="form-control form-control-sm" required>
                    </div>
                </div>   
                <div class="form-group row col-sm-12">
                	<div class="col-sm-6">
                        <label for="management" class=" form-control-label"><small class="form-text text-muted">Management <span class="color-red">*</span></small></label>
                        <input type="text" id="management" name="management" class="form-control form-control-sm" required>
                    </div>
                	<div class="col-sm-6">
                        <label for="unit_no" class=" form-control-label"><small class="form-text text-muted">Unit No. <span class="color-red">*</span></small></label>
                        <input type="text" id="unit_no" name="unit_no" class="form-control form-control-sm" required>
                    </div>                        
                </div>  
                <div class="form-group row col-sm-12">
                	<div class="col-sm-6">
                        <label for="tenant" class=" form-control-label"><small class="form-text text-muted">Tenant</small></label>
                        <input type="text" id="tenant" name="tenant" class="form-control form-control-sm">
                    </div>
                	<div class="col-sm-6">
                        <label for="debtor_acc" class=" form-control-label"><small class="form-text text-muted">Debtor Account</small></label>
                        <input type="text" id="debtor_acc" name="debtor_acc" class="form-control form-control-sm">
                    </div>                        
                </div>                   
                <div class="form-group row col-sm-12">
                	<div class="col-sm-12">
                        <label for="location" class=" form-control-label"><small class="form-text text-muted">Location <span class="color-red">*</span></small></label>
                        <textarea id="location" name="location" class="form-control form-control-sm" required></textarea>
                    </div>
                </div>                     
                <div class="form-group row col-sm-12">
                	<div class="col-sm-6">
                        <label for="owner" class=" form-control-label"><small class="form-text text-muted">Owner</small></label>
                        <input type="text" id="owner" name="owner" class="form-control form-control-sm">
                    </div>
					<div class="col-sm-6">
                            <label for="reference_no" class=" form-control-label"><small class="form-text text-muted">Reference No<span class="color-red">*</span></small></label>
                            <input type="text" id="reference_no" name="reference_no" class="form-control" placeholder="xxxxxx">
                        </div>
                	<div class="col-sm-6">
                        <label for="remark" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
                        <textarea id="remark" name="remark" class="form-control form-control-sm"></textarea>
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
                    <input type="hidden" id="id" name="id" value="">
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
                            <label for="acc_no_edit" class=" form-control-label"><small class="form-text text-muted">Account No.</small></label>
                            <input type="text" id="acc_no_edit" name="acc_no_edit"class="form-control form-control-sm">
                        </div>
                    </div>   
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-6">
                            <label for="management_edit" class=" form-control-label"><small class="form-text text-muted">Management <span class="color-red">*</span></small></label>
                            <input type="text" id="management_edit" name="management_edit" class="form-control form-control-sm" required>
                        </div>
                    	<div class="col-sm-6">
                            <label for="unit_no_edit" class=" form-control-label"><small class="form-text text-muted">Unit No. <span class="color-red">*</span></small></label>
                            <input type="text" id="unit_no_edit" name="unit_no_edit" class="form-control form-control-sm" required>
                        </div>                        
                    </div>  
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-6">
                            <label for="tenant_edit" class=" form-control-label"><small class="form-text text-muted">Tenant</small></label>
                            <input type="text" id="tenant_edit" name="tenant_edit" class="form-control form-control-sm">
                        </div>
                    	<div class="col-sm-6">
                            <label for="debtor_acc_edit" class=" form-control-label"><small class="form-text text-muted">Debtor Account</small></label>
                            <input type="text" id="debtor_acc_edit" name="debtor_acc_edit" class="form-control form-control-sm">
                        </div>                        
                    </div>                 
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-12">
                            <label for="location_edit" class=" form-control-label"><small class="form-text text-muted">Location</small></label>
                            <textarea id="location_edit" name="location_edit" class="form-control form-control-sm"></textarea>
                        </div>
                    </div> 
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-6">
                            <label for="owner_edit" class=" form-control-label"><small class="form-text text-muted">Owner</small></label>
                            <input type="text" id="owner_edit" name="owner_edit" class="form-control form-control-sm">
                        </div>
						<div class="col-sm-6">
                            <label for="reference_no_edit" class=" form-control-label"><small class="form-text text-muted">Reference No (6 digit limit)</small></label>
                            <input type="text" id="reference_no_edit" name="reference_no_edit" class="form-control" placeholder="xxxxxx">
                        </div>
                    	<div class="col-sm-6">
                            <label for="remark_edit" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
                            <textarea id="remark_edit" name="remark_edit" class="form-control form-control-sm"></textarea>
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
    	var id = $(this).attr("id");        	    	
    	$.ajax({
    			url:"boss.payment.ajax.php",
    			method:"POST",
    			data:{action:'retrieve_account', id:id},
    			dataType:"json",
    			success:function(data){ 
        			console.log(data);           			        			
    				$('#id').val(id);					
                    $('#company_edit').val(data.company_id);      
                    $('#acc_no_edit').val(data.account_no);  
                    $('#tenant_edit').val(data.tenant);  
                    $('#management_edit').val(data.paid_to);  
                    $('#debtor_acc_edit').val(data.debtor_account);  
                    $('#unit_no_edit').val(data.unit_no);  
                    $('#location_edit').val(data.location);          
                    $('#owner_edit').val(data.owner);       
                    $('#remark_edit').val(data.remarks);     
					$('#reference_no').val(data.reference_no); 
                    $('#editItem').modal('show');
    			}
    		});
    });

    $(document).on('click', '.delete_data', function(){
    	var id = $(this).attr("id");
    	$('#delete_record').data('id', id); //set the data attribute on the modal button
    
    });
  	
	$( "#delete_record" ).click( function() {
		var ID = $(this).data('id');
		$.ajax({
			url:"boss.payment.ajax.php",
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
          url:"boss.payment.ajax.php",  
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
            url:"boss.payment.ajax.php",  
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
