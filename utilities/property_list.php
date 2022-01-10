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
    <title>Eng Peng Utility</title>
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
                                <strong class="card-title">Property List</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                        	<th>No.</th>
											<th>Location/Area</th>
                                            <th>Company</th>
											<th>Size</th>
											<th>Address</th>
											<th>Remark</th>
											<th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>                                        
										<?php 
                                         $sql_query = "SELECT * FROM u_property
																		INNER JOIN company ON company.id = u_property.company_id
																		WHERE u_property.status='1'";
                                        
                                        if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                            $count = 0;
                                            $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                                while($row = mysqli_fetch_array($sql_result)){ 
                                                    $count++;
                                                    ?>
                                                    <tr>
                                                    	<td><?=$count?></td>
                                                        <td><?=strtoupper($row['up_location'])?></td>
														<td><?=strtoupper($row['name'])?></td>   
                                                        <td><?=strtoupper($row['up_size'])?></td>
														<td><?=strtoupper($row['up_address'])?></td>
														<td><?=strtoupper($row['up_remark'])?></td>											
                                                        <td>
                                                        	<span id="<?=$row['up_id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="menu-icon fa fa-calendar"></i></span><br>
                                                        	<span id="<?=$row['up_id']?>" data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="menu-icon fa fa-trash-alt"></i></span>
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
        
        <!-- Modal edit property -->
        <div id="editItem" class="modal fade">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Property</h4>
                </div>
                <div class="modal-body">
                    <form role="form" method="POST" action="" id="update_form">
                        <input type="hidden" name="_token" value="">
                        <input type="hidden" id="id" name="id" value="">
                    	 	<div class="form-group row col-sm-12">
                            <div class="col-sm-6">
                            	<label for="location_name" class=" form-control-label"><small class="form-text text-muted">Location/Area</small></label>
                                <input type="text" id="location_name" name="location_name" placeholder="Enter location name" class="form-control">
                                
                            </div> 
							<div class="col-sm-6">
								<label for="size" class="form-control-label"><small class="form-text text-muted">Size (Square Feet)</small></label>
								<input type="text" id="size" name="size" class="form-control">
							</div>
                        </div>
                        <div class="form-group row col-sm-12">                            
							<div class="col-sm-6">
								<label for="property_address" class="form-control-label"><small class="form-text text-muted">Address</small></label>
								<textarea id="property_address" name="property_address" class="form-control"></textarea>
							</div>
                            <div class="col-sm-6">
                                <label for="property_remark" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
                                <input type="text" id="property_remark" name="property_remark" class="form-control">
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
  					url:"property.list.ajax.php",
  					method:"POST",
  					data:{ action:'retrieve_property', id:id},
  					dataType:"json",
  					success:function(data){	   	  	  					          	             	
  						$('#id').val(id);					
                        $('#location_name').val(data.up_location);  
                        $('#size').val(data.up_size);  
                        $('#property_address').val(data.up_address);    
						$('#property_remark').val(data.up_remark);    
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
    			url:"property.list.ajax.php",
    			method:"POST",    
    			data:{action:'delete_property', id:ID},
    			success:function(data){	  						
    				$('#deleteItem').modal('hide');		
    				location.reload();		
    			}
    		});
    	});
    	
		//update property form submit
        $('#update_form').on("submit", function(event){  
            event.preventDefault();  
            if($('#location_name').val() == ""){  
                 alert("Location is required");  
            }  
            else if($('#property_address').val() == ""){  
                 alert("Address is required");  
            }   
            else{  
                 $.ajax({  
                      url:"property.list.ajax.php",  
                      method:"POST",  
                      data:{action:'update_property', data:$('#update_form').serialize()},  
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
