<?php
	require_once('../assets/config/database.php');
	require_once('../function.php');
	require_once('../check_login.php');
	global $conn_admin_db;

?>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Property</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
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
                                <strong class="card-title">Tenant List</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                        	<th>No.</th>
											<th>Tenant Name</th>
                                            <th>Passport No. / Company No</th>
											<th>Contact No.</th>
											<th>Email</th>
											<th>Remark</th>
											<th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>                                        
										<?php 
                                         $sql_query = "SELECT * FROM u_tenant WHERE status='1'";
                                        
                                        if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                            $count = 0;
                                            $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                                while($row = mysqli_fetch_array($sql_result)){ 
                                                    $count++;
                                                    ?>
                                                    <tr>
                                                        <td><?=$count?></td>
                                                        <td><?=strtoupper($row['tenant_name'])?></td>
														<td><?=strtoupper($row['ic'])?></td>   
                                                        <td><?=strtoupper($row['contact_no'])?></td>
														<td><?=strtoupper($row['tenant_email'])?></td>
														<td><?=strtoupper($row['tenant_)remark'])?></td>											
                                                        <td>
                                                        	<span id="<?=$row['id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="menu-icon fa fa-edit"></i></span><br>
                                                        	<span id="<?=$row['id']?>" data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="menu-icon fa fa-trash-alt"></i></span>
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
        
        <!-- Modal edit tenant -->
        <div id="editItem" class="modal fade">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Tenant</h4>
                </div>
                <div class="modal-body">
                    <form role="form" method="POST" action="" id="update_form">
                        <input type="hidden" name="_token" value="">
                        <input type="hidden" id="id" name="id" value="">
                    	 	<div class="form-group row col-sm-12">
                            <div class="col-sm-6">
                            	<label for="tenant_name" class=" form-control-label"><small class="form-text text-muted">Tenant Name</small></label>
                                <input type="text" id="tenant_name" name="tenant_name" placeholder="Enter location name" class="form-control">
                                
                            </div> 
							<div class="col-sm-6">
								<label for="ic" class="form-control-label"><small class="form-text text-muted">IC/Passport No</small></label>
								<input type="text" id="ic" name="ic" class="form-control">
							</div>
                        </div>
                        <div class="form-group row col-sm-12">                            
							<div class="col-sm-6">
								<label for="contact_no" class="form-control-label"><small class="form-text text-muted">Contact No.</small></label>
								<textarea id="contact_no" name="contact_no" class="form-control"></textarea>
							</div>
                            <div class="col-sm-6">
                                <label for="tenant_email" class=" form-control-label"><small class="form-text text-muted">Email</small></label>
                                <input type="text" id="tenant_email" name="tenant_email" class="form-control">
                            </div>
                            <div class="col-sm-6">
                                <label for="tenant_remark" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
                                <input type="text" id="tenant_remark" name="tenant_remark" class="form-control">
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
                        <h5 class="modal-title" id="staticModalLabel">Delete Company</h5>
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
	
	<script type="text/javascript">
        $(document).ready(function() {
          $(document).on('click', '.edit_data', function(){
  			var id = $(this).attr("id");
  			$.ajax({
  					url:"tenant.list.ajax.php",
  					method:"POST",
  					data:{ action:'retrieve_tenant', id:id},
  					dataType:"json",
  					success:function(data){	   	  	  					          	             	
  						$('#id').val(id);					
                        $('#tenant_name').val(data.tenant_name);  
                        $('#ic').val(data.ic);  
                        $('#contact_no').val(data.contact_no);    
						$('#tenant_email').val(data.tenant_email);   
                        $('#tenant_remark').val(data.tenant_remark);   
                        $('#editItem').modal('show');
  					}
  				});
        });

		//delete item
        $(document).on('click', '.delete_data', function(){
			var id = $(this).attr("id");
			$('#delete_record').data('id', id); //set the data attribute on the modal button

    	});
        $( "#delete_record" ).click( function() {
    		var ID = $(this).data('id');
    		$.ajax({
    			url:"tenant.list.ajax.php",
    			method:"POST",    
    			data:{action:'delete_tenant', id:ID},
    			success:function(data){	  						
    				$('#deleteItem').modal('hide');		
    				location.reload();		
    			}
    		});
    	});
    	
		//update property form submit
        $('#update_form').on("submit", function(event){  
            event.preventDefault();  
            if($('#tenant_name').val() == ""){  
                 alert("Name is required");  
            }  
           
            else{  
                 $.ajax({  
                      url:"tenant.list.ajax.php",  
                      method:"POST",  
                      data:{action:'update_tenant', data:$('#update_form').serialize()},  
                      success:function(data){   
							alert("Successful Update!");
                           $('#editItem').modal('hide');  
                           $('#bootstrap-data-table').html(data);  
                           location.reload();
						   
                      }  
                 });  
            }  
       });

      });


    function dateFormat(dates){
        var date = new Date(dates);
    	var day = date.getDate();
	  	var monthIndex = date.getMonth()+1;
	  	var year = date.getFullYear();

	  	return (day <= 9 ? '0' + day : day) + '-' + (monthIndex<=9 ? '0' + monthIndex : monthIndex) + '-' + year ;
    }
  </script>
</body>
</html>
