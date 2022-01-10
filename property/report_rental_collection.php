<?php
	require_once('../assets/config/database.php');
	require_once('../check_login.php');
	global $conn_admin_db;
	$date_from = isset($_POST['date_from']) ? $_POST['date_from'] : date('01-m-Y');
	$date_until = isset($_POST['date_until']) ? $_POST['date_until'] : date('t-m-Y');
	$select_c = isset($_POST['select_company']) ? $_POST['select_company'] : "";
	
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
        .button_search{
            position: absolute;
            left:    0;
            bottom:   0;
        }
        #myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 12px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

@page {
    size: auto;
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
                                <strong class="card-title">Rental Collection Report</strong>
                            </div>
                            <div class="card-body">
                            <form id="myform" enctype="multipart/form-data" method="post" action="">                	                   
                            <div class="form-group row col-sm-12">
                    	            	<div class="col-sm-3">
                                			<label for="company_dd" class="form-control-label"><small class="form-text text-muted">Company</small></label>
                                    		<?php
                                                $select_company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1' ");
                                                db_select ($select_company, 'select_company', $select_c,'submit()','All','form-control form-control-sm','');                        
                                            ?>
                                      	</div>
                                        
                                        <div class="col-sm-1">                                    	
                                        	<button type="submit" class="btn btn-sm btn-primary button_search ">View</button>
                                        </div>
                                        <div class="col-sm-1">                                    	
                                    	<button type="button" class="btn btn-sm btn-primary button_search" onclick="window.open('rental_report_print.php?company=<?php echo $select_c; ?>')">Print</button>
                                         </div>
                             </div>  
                               
                            </form>
                            </div>
                            <hr>
                            <div class="card-body">                            	
                                <table id="general_table" class="table table-striped table-bordered">
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
                                            <th rowspan="2">Payment</th>
										<!--	<th rowspan="2">Remark</th>    -->
                                            <th rowspan="2">Action</th>                   
                                           
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
                                    </tbody>
                                   <!-- <tfoot>
                                        <tr>
                                            <td colspan="6" class="text-right font-weight-bold">Total</td>
                                            <td class="text-right font-weight-bold">Premium Total</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>                                            
                                            <td class="text-right font-weight-bold">Excess Total</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td class="text-right font-weight-bold">Amount Total</td>
                                            <td>&nbsp;</td>
                                        </tr> -->
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        </div>

         <!-- Modal edit data  -->
    <div id="editItem" class="modal fade">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit </h4>
            </div>
            <div class="modal-body">
                <form role="form" method="POST" action="" id="update_form">                        
                    <input type="hidden" id="ur_id" name="ur_id" value="">
                   
                    <div class="form-group row col-sm-12">  
                         <div class="col-sm-6" >
                                 <label for="priority" class=" form-control-label"><small class="form-text text-muted">Set priority</small></label>
								<input type="text" name="priority" id="priority" rows="3" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-6" >
                                 <label for="tenant_name" class=" form-control-label"><small class="form-text text-muted">Tenant Name</small></label>
								<input type="text" name="tenant_name" id="tenant_name" rows="3" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-6" >
                                 <label for="area" class=" form-control-label"><small class="form-text text-muted">Area</small></label>
								<input type="text" name="area" id="area" rows="3" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-6" >
                                 <label for="size" class=" form-control-label"><small class="form-text text-muted">Size</small></label>
								<input type="text" name="size" id="size" rows="3" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-12" >
                                 <label for="address" class=" form-control-label"><small class="form-text text-muted">Address</small></label>
								<input type="text" name="address" id="address" rows="3" class="form-control"></textarea>
                        </div>

                        <div class="col-sm-6">
                                <label for="insurance_date" class="form-control-label"><small class="form-text text-muted">Insurance</small></label>
                                <div class="input-group">
                                  <input type="text" id="insurance_date" name="insurance_date" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div> 
                            </div> 
                            <div class="col-sm-6" >
                                 <label for="rental" class=" form-control-label"><small class="form-text text-muted">Rental</small></label>
								<input type="text" name="rental" id="rental" rows="3" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-6">
                        <label for="" class="form-control-label"><small class="form-text text-muted">Floor</small></label></div>
                        <div class="input-group col-sm-8">
                                 <input type="text" id="floor1" name="floor1" class="form-control">
                                 <input type="text" id="floor2" name="floor2" class="form-control">
                        </div>
                
                    </div>      
                    <div class="form-group row col-sm-12">
                    <div class="col-sm-6">
                                <label for="date_from" class="form-control-label"><small class="form-text text-muted">From</small></label>
                                <div class="input-group">
                                  <input type="text" id="date_from" name="date_from" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div> 
                            </div> 
                            <div class="col-sm-6">
                                <label for="date_until" class="form-control-label"><small class="form-text text-muted">Until</small></label>
                                <div class="input-group">
                                  <input type="text" id="date_until" name="date_until" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div> 
                            </div> 
                    </div>

                 <div class="form-group row col-sm-12">

                        <div class="col-sm-6" >
                                 <label for="e_bill" class=" form-control-label"><small class="form-text text-muted">Electricity Bill</small></label>
								<input type="text" name="e_bill" id="e_bill" rows="3" class="form-control"></textarea>
                        </div>
                        
                        <div class="col-sm-6" >
                                 <label for="water_bill" class=" form-control-label"><small class="form-text text-muted">Water Bill</small></label>
								<input type="text" name="water_bill" id="water_bill" rows="3" class="form-control"></textarea>
                        </div>
                        
                        <div class="col-sm-6" >
                                 <label for="management_bill" class=" form-control-label"><small class="form-text text-muted">Management Bill</small></label>
								<input type="text" name="management_bill" id="management_bill" rows="3" class="form-control"></textarea>
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
                    <h5 class="modal-title" id="staticModalLabel">Delete Puspakom</h5>
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
    <!-- from right panel page -->
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
	<script type="text/javascript">
        $(document).ready(function() {
            var table = $('#general_table').DataTable({
                "processing": true,
                "serverSide": true,
                "searching": false,
                "ajax":{
                 "url": "report.rental.collection.ajax.php",     
                 "type":"POST",      	
                 "data" : function ( data ){	
                        data.action = 'display_rental_report';
                	 	data.date_from = '<?=$date_from?>';
						data.date_until = '<?=$date_until?>';
						data.select_company = '<?=$select_c?>';									
                     }
                },
               
				"dom": 'Bfrtip',
	            "buttons": [ 
	             { 
	            	extend: 'excelHtml5', 
	            	messageTop: 'General Table',
	            	footer: true 
	             },
	            // {
	            //	extend: 'print',
	            //	messageTop: 'Report',
	            //	footer: true,
                 //   orientation : 'landscape',
                 //   pageSize : 'A0',

                 //   exportOptions: {
                  //      columns:[1,2,3,4,5,6,7,8,9,10,11,12,13, 'visible'],
                        
                  //  }

	           // }
	            ], 
            });

            
       
    $(document).on('click', '.edit_data', function(){
    	var ur_id = $(this).attr("id");        	    	
    	$.ajax({
    			url:"report.rental.collection.ajax.php",
    			method:"POST",
    			data:{action:'retrieve_rental', id:ur_id},
    			dataType:"json",
    			success:function(data){ 
        			console.log(data); 	
                   

    				$('#ur_id').val(ur_id);	
                    $('#area').val(data.up_location);
                    $('#address').val(data.up_address);
                    $('#size').val(data.up_size);
                    $('#rental').val(data.ur_monthly_rental);
                    $('#e_bill').val(data.electric_bill);
                    $('#water_bill').val(data.water_bill);
                    $('#management_bill').val(data.maintenance_cost);
                    $('#tenant_name').val(data.tenant_name);
                    $('#priority').val(data.priority);
                    $('#floor1').val(data.floor1);
                    $('#floor2').val(data.floor2);
                    $('#insurance_date').val(data.insurance_date);
                    $('#date_from').val(data.date_from);
                    $('#date_until').val(data.date_until);
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
			url:"report.rental.collection.ajax.php",
			method:"POST",    
			data:{action:'delete_rental', id:ID},
			success:function(data){	  						
				$('#deleteItem').modal('hide');		
				location.reload();		
			}
		});
	});


    function printDiv(divName) {
	     var printContents = document.getElementById(divName).innerHTML;
	     var originalContents = document.body.innerHTML;
	     document.body.innerHTML = printContents;
	     window.print();
	     document.body.innerHTML = originalContents;
	}
    
      
	$('#update_form').on("submit", function(event){  
      event.preventDefault();  
      $.ajax({  
          url:"report.rental.collection.ajax.php",  
          method:"POST",  
          data:{action:'update_rental', data: $('#update_form').serialize()},  
          success:function(data){   
               if(data){
                 
            	   $('#editItem').modal('hide');                 
                   location.reload(); 
               } 
          }  
     }); 
    }); 

    		//get filtered report
            $('#myform').on("submit", function(event){  
            	table.clear();
      			table.ajax.reload();
      			table.draw();     
            }); 
            $('#date_from, #date_until, #insurance_date').datepicker({
                format: "dd-mm-yyyy",
                autoclose: true,
                orientation: "top left",
                todayHighlight: true
            });

            $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#general_table tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });


      });
  </script>
</body>
</html>
