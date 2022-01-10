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
    <title>Eng Peng Property</title>
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
                       <div class="form-group row col-sm-12">  
                           	<div class="col-sm-2">  
                           	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addItem">
                               Add Renting
							</button>
                           	</div>  
                       	</div>                                            
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                       
											<th>Reference No.</th>
											<th>Tenant</th>
                                       		<th>Area</th>
											<th>Location/Address</th>
											<th>Company</th>
                                            <th>Insurance</th>
                                            <th>Priority</th>
                                            <th>Action</th>
											
                                    </tr>
                               
                                </thead>
                                <tbody>

                                <?php 
                                    $sql_query = "SELECT * FROM u_renter ur 
                                                    LEFT JOIN u_property up ON up.up_id = ur.address_id

                                                 WHERE ur.status_1='1'";
 																		
                                    if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                        $count = 0;
                                        $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                            while($row = mysqli_fetch_array($sql_result)){ 
                                                $count++;  
												 //$add_name = itemName ("SELECT up_address FROM u_property WHERE up_id='".$row['address_id']."'");
                                                 $comp_name = itemName("SELECT name FROM company WHERE id='".$row['company_id_1']."'");
                                                 $tenant_name = itemName("SELECT tenant_name FROM u_tenant WHERE id='".$row['tenant_id']."'");
                                                 $area_name = itemName("SELECT up_location FROM u_property WHERE up_id='".$row['address_id']."'");
                                                 $address_name = itemName("SELECT up_address FROM u_property WHERE up_id='".$row['address_id']."'");
                                                 $date = $row['insurance_date'];
                                                 $curdate = '1980-01-01';

                                                 if($curdate > $date){
                                                     $insuranceDate ="<span>-</span><br><br>";
                                                 } else{
                                                     $insuranceDate = "<span>".$row['insurance_date']."</span><br><br>";
                                                 }

                                                ?>
                                                <tr>
                                                    <td><a href="u_rental_details.php?id=<?=$row['ur_id']?>" target="_blank" style="color:blue;"><?=$row['ur_id']?></a></td>
													<td><?=strtoupper($tenant_name)?></td>
													<td><?=strtoupper($area_name)?></td>
													<td><?=strtoupper($address_name)?></td>
                                                    <td><?=strtoupper($comp_name)?></td>     
                                                    <td><?=$insuranceDate?></td>    
                                                    <td><?=$row['priority']?></td>                                                                                    
                                                    <td>
                                                    	<span id="<?=$row['ur_id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="fa fa-edit "></i></span>
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

                         <div class="col-sm-6">
								<label for="address" class=" form-control-label"><small class="form-text text-muted">Property (Area) <span class="color-red">*</span></small></label>
										<div>
											<?php
												$address = mysqli_query ( $conn_admin_db, "SELECT up_id, UPPER(up_address) FROM u_property WHERE status='1'");
												db_select ($address, 'address', '','','-select-','form-control form-control-sm','','required');
											?>
										</div>
						</div>	
                         			
				</div>  

				<div class="form-group row col-sm-12">				
                    
                     <div class="col-sm-6">
                            <label for="insurance_date" class=" form-control-label"><small class="form-text text-muted">Insurance </small></label>                                            
                            <div class="input-group">
                                <input id="insurance_date" name="insurance_date" class="form-control" autocomplete="off" >
                                <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                            </div>  
                        </div>    
                        <div class="col-sm-6" >
                                 <label for="priority" class=" form-control-label"><small class="form-text text-muted">Set priority</small></label>
								<input type="text" name="priority" id="priority" rows="3" class="form-control"></textarea>
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
                         <div class="col-sm-6" >
                                 <label for="priority_edit" class=" form-control-label"><small class="form-text text-muted">Set priority</small></label>
								<input type="text" name="priority_edit" id="priority_edit" rows="3" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-6" >
                                 <label for="tenant_name_edit" class=" form-control-label"><small class="form-text text-muted">Tenant Name</small></label>
								<input type="text" name="tenant_name_edit" id="tenant_name_edit" rows="3" class="form-control"></textarea>
                        </div>
		
                        <div class="col-sm-6">
                                <label for="insurance_date_edit" class="form-control-label"><small class="form-text text-muted">Insurance</small></label>
                                <div class="input-group">
                                  <input type="text" id="insurance_date_edit" name="insurance_date_edit" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
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
//	var select2 = $("#company").select2({
//	    selectOnClose: true
   // });
//	select2.data('select2').$selection.css('height', '31px');
	//select2.data('select2').$selection.css('border', '1px solid #ced4da');
	
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
					
                    $('#insurance_date_edit').val(dateFormat(data.insurance_date));  
                    $('#tenant_name_edit').val(data.tenant_name);  
                    $('#priority_edit').val(data.priority);
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

    
$('#insurance_date, #insurance_date_edit, #from_date, #to_date, #from_date_edit, #to_date_edit').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
        });

        //format to dd-mm-yy
        function dateFormat(dates){
            var date = new Date(dates);
        	var day = date.getDate();
    	  	var monthIndex = date.getMonth()+1;
    	  	var year = date.getFullYear();

    	  	return (day <= 9 ? '0' + day : day) + '-' + (monthIndex<=9 ? '0' + monthIndex : monthIndex) + '-' + year ;
        }
     

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
