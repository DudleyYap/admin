<?php
require_once('../assets/config/database.php');
require_once('../function.php');
require_once('../check_login.php');
global $conn_admin_db;


$select_c = isset($_POST['select_company']) ? $_POST['select_company'] : "";


?>

<!doctype html><html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Utilities</title>
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
                                <strong class="card-title">Motorcycle</strong>
                            </div>     
                           <div class="card-body">     
                         <!--  <form id="myform" enctype="multipart/form-data" method="post" action="">                	                   
                            <div class="form-group row col-sm-12">
                    	            	<div class="col-sm-3">
                                			<label for="company_dd" class="form-control-label"><small class="form-text text-muted">Company</small></label>
                                    		<?php
                                                $select_company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1' ");
                                                db_select ($select_company, 'select_company', $select_c,'submit()','All','form-control form-control-sm','');                        
                                            ?>
                                      	</div>
                                    
                                       
                             </div>  
                               
                            </form> -->
                                                                        
							<div class="form-group row col-sm-12">
								<div class="col-sm-2">
									<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addItem">
                                       Add New Record
        							</button>
								</div>
                                
													
							</div>
                                <table id="item-data-table" class="table table-striped table-bordered">
                                	
                                    <thead>
                                        <tr>
                                            <th>No.</th>
											<th>Date</th>				
                                            <th>Motorcycle</th>
                                            <th>Maintenance</th>							
											<th>Budget</th>
											<th>Workshop</th>
											<th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <?php 
                                      
                                            $sql_query = "SELECT * FROM u_motorcycle um
                                                       INNER JOIN company c on um.id=c.id
                                                       LEFT JOIN u_add_motorcycle uam ON um.id = uam.uam_id
                                                         WHERE um.status ='1'"; 
                                       
  
                                        if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                            $count = 0;
                                            $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                                while($row = mysqli_fetch_array($sql_result)){ 
                                                    $count++;
                                                    
                                                    $motor = itemName("SELECT motor_name FROM u_add_motorcycle WHERE uam_id='".$row['motor_id']."'");
                                                    $company = itemName("SELECT name FROM company WHERE id='".$row['company_id']."'");
                                                    $motorcycle = "<span><b>".$motor."</b> -  ".$company."</span><br>";
                                                    ?>
                                                    <tr>
                                                    	<td><?=$row['id']?></td>    
                                                        <td><?=$row['motor_date'] != NULL ? dateFormatRev($row['motor_date']) : "-" ?></td>                                                    
                                                        <td><?=strtoupper($motorcycle)?></td>
                                                        <td><?=$row['maintenance']?></td>
                                                        <td><?=$row['budget']?></td>
                                                        <td><?=$row['workshop']?></td>
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
        
        <!-- Modal Add new motor record -->
        <div id="addItem" class="modal fade">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Record</h4>
                    </div>
                    <div class="modal-body">
                    <form role="form" method="POST" action="" id="add_form">                    
                    <div class="form-group row col-sm-12">
                    <div class="col-sm-6">
                            <label class="form-control-label"><small class="form-text text-muted">Motorcycle</small></label>
							<div>
							<?php
                                   $motor = mysqli_query ( $conn_admin_db, "SELECT uam_id, UPPER(motor_name) FROM u_add_motorcycle WHERE status='1' ORDER BY motor_name ASC");
                                 db_select ($motor, 'motor_name', '','','-select-','form-control','','required');
                             ?>
							</div>     
                        </div>  
                        <div class="col-sm-6">
                                <label for="motor_date" class="form-control-label"><small class="form-text text-muted">Date</small></label>
                                <div class="input-group">
                                  <input type="text" id="motor_date" name="motor_date" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div> 
                            </div> 
                    </div>                    
                   
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-6">
                            <label><small class="form-text text-muted">Maintenance</small></label>
							<div class="col-sm-14"><textarea name="maintenance" id="maintenance" rows="3" class="form-control" value="" ></textarea></div>
                        </div> 
                        <div class="col-sm-6">
                            <label for="budget" class=" form-control-label"><small class="form-text text-muted">Budget</small></label>
                            <input type="text" id="budget" name="budget" class="form-control">
                        </div>
                        </div>
                    <div class="form-group row col-sm-12">
                        <div class="col-sm-6">
                            <label for="workshop" class="form-control-label"><small class="form-text text-muted">Workshop</small></label>
                            <select id="workshop" name="workshop" class="form-control">
                                <option value="">- Select -</option>
                                <option value="Yong Yiap Hardware and Motor Part Trading">Yong Yiap Hardware and Motor Part Trading</option>
                                <option value="Son Motor Trading">Son Motor Trading</option>
                             </select>          
                        </div>   
                        <div class="col-sm-6">
                            <label class="form-control-label"><small class="form-text text-muted">Company</small></label>
							<div>
							<?php
                                   $company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1'");
                                 db_select ($company, 'company', '','','-select-','form-control','','required');
                             ?>
							</div>     
                        </div>         
                    </div>
             
                                 
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary save_data">Save</button>
                    </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal edit maintenance  -->
        <div id="editItem" class="modal fade">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit</h4>
                </div>
                <div class="modal-body">
                    <form role="form" method="POST" action="" id="update_form">
                        <input type="hidden" name="_token" value="">
                        <input type="hidden" id="id" name="id" value="">
                        <div class="form-group row col-sm-12">
                        <div class="col-sm-6">
                            <label class="form-control-label"><small class="form-text text-muted">Motorcycle</small></label>
							<div>
							<?php
                                   $motor = mysqli_query ( $conn_admin_db, "SELECT uam_id, UPPER(motor_name) FROM u_add_motorcycle WHERE status='1' ORDER BY motor_name ASC");
                                 db_select ($motor, 'motor_name_edit', '','','-select-','form-control','','required');
                             ?>
							</div>     
                        </div>  
                        <div class="col-sm-6">
                                <label for="motor_date_edit" class="form-control-label"><small class="form-text text-muted">Date</small></label>
                                <div class="input-group">
                                  <input type="text" id="motor_date_edit" name="motor_date_edit" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div> 
                            </div> 
                    </div>                    
                   
                    <div class="form-group row col-sm-12">
                    <div class="col-sm-6">
                        <label><small class="form-text text-muted">Maintenance</small></label>
							<div class="col-sm-14"><textarea name="maintenance_edit" id="maintenance_edit" rows="3" class="form-control" value="" ></textarea></div>
                            </div> 
                        <div class="col-sm-6">
                            <label for="budget_edit" class=" form-control-label"><small class="form-text text-muted">Budget</small></label>
                            <input type="text" id="budget_edit" name="budget_edit" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row col-sm-12">
                        <div class="col-sm-6">
                            <label for="workshop_edit" class="form-control-label"><small class="form-text text-muted">Workshop</small></label>
                            <select id="workshop_edit" name="workshop_edit" class="form-control">
                            <option value="">- Select -</option>
                                <option value="Yong Yiap Hardware and Motor Part Trading">Yong Yiap Hardware and Motor Part Trading</option>
                                <option value="Son Motor Trading">Son Motor Trading</option>
                             </select>          
                        </div>   
                        <div class="col-sm-6">
                       <label class="form-control-label"><small class="form-text text-muted">Company</small></label>
							<div>
							<?php
                                   $company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1'");
                                 db_select ($company, 'company_edit', '','','-select-','form-control','','required');
                             ?>
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

        //get filtered report
        $('#myform').on("submit", function(event){  
            	table.clear();
      			table.ajax.reload();
      			table.draw();     
            }); 

        $('#motor_date, #date_edit').datepicker({
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

        $('#item-data-table').DataTable({
        	'columnDefs': [
          	  {
          	      "targets": [4], // your case first column
          	      "className": "text-right", 
          	      "render": $.fn.dataTable.render.number(',', '.', 2, '')               	                      	        	     
          	 }
			],
  	  	});
        
        $(document).on('click', '.edit_data', function(){
        	var id = $(this).attr("id");        	
        	$.ajax({
        			url:"add.motorcycle.ajax.php",
        			method:"POST",
        			data:{action:'retrieve_motor', id:id},
        			dataType:"json",
        			success:function(data){  
            			console.log(data);    
						$('#id').val(id);            			       			       			        			
        				$('#motor_name_edit').val(data.motor_id);	
                        $('#motor_date_edit').val(data.motor_date);						
                        $('#maintenance_edit').val(data.maintenance);      
                        $('#budget_edit').val(data.budget);   
                        $('#company_edit').val(data.company_id);       
                        $('#workshop_edit').val(data.workshop);           
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
    			url:"add.motorcycle.ajax.php",
    			method:"POST",    
    			data:{action:'delete_motor', id:ID},
    			success:function(data){	  						
    				$('#deleteItem').modal('hide');		
    				location.reload();		
    			}
    		});
    	});
    
        $('#update_form').on("submit", function(event){  
          event.preventDefault();  
         
               $.ajax({  
                    url:"add.motorcycle.ajax.php",  
                    method:"POST",  
                    data:{action:'update_motor', data: $('#update_form').serialize()},  
                    success:function(data){  
                        if(data){
                        	$('#editItem').modal('hide');  
                        	location.reload();  
                        }                          
                    }  
               });  
           
        }); 
        
        $('#add_form').on("submit", function(event){  
            event.preventDefault();  
                 $.ajax({  
                      url:"add.motorcycle.ajax.php",  
                      method:"POST",  
                      data:{action:'add_new_motor', data: $('#add_form').serialize()},  
                      success:function(data){   
                           $('#editItem').modal('hide');  
                           $('#bootstrap-data-table').html(data);
                           location.reload();  
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
