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

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Rental Collection</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
        .hide{
            display:none
        }
        .button_search{
            position: absolute;
            left:    0;
            bottom:   0;
        }
		
		.modal-xl {
			width:90%;
			max-width:1200px;
		}
		
		input.larger {
			width: 50px;
			height: 50px;
		
		}
    </style>
</head>

<body>
    <!--Left Panel -->
	<?php  include('../assets/nav/leftNav.php')?>
    <!-- Right Panel -->
    <?php include('../assets/nav/rightNav.php')?>
    <!-- /#header -->
    <!-- /#header -->
    <!-- Content -->
        <div id="right-panel" class="right-panel">
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card" id="printableArea">
                            <div class="card-header">
                                <h6><strong class="card-title">Rental Collection</strong></h6>
                            </div>
                            <div class="card-body">
                                <form id="myform" enctype="multipart/form-data" method="post" action="">                	                   
									<div class="form-group row col-sm-12">
										<div class="col-sm-3">
                                            <label for="date_start" class="form-control-label"><small class="form-text text-muted">Company</small></label>
                                            <?php
                                            $select_company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company ");
                                            db_select ($select_company, 'select_company', $select_c,'-select-','All','form-control form-control-sm','');
                                        ?>                            
                                        </div>
                                        <div class="col-sm-2">
                                        	<label for="acc_no" class="form-control-label"><small class="form-text text-muted">Year</small></label>
                                        	<?=$html_year_select;?>
                                        </div>
                                        <div class="col-sm-4">                                    	
                                        	<button type="submit" class="btn btn-sm btn-primary button_search ">View</button>
                                        </div>
										<div><input class="form-control" id="myInput" type="text" placeholder="Search..">
										</div>
                                     </div>
                                </form>
                            </div>
                            <hr>
                            <div class="card-body">
                                <table id="rental_table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                       		<th rowspan="2">No.</th>
                                       		<th rowspan="2">Lessee</th>
                                       		<th rowspan="2">Land Lot</th>
											<th rowspan="2">Purpose and Use of Demised Premises</th>
											<th colspan="2" style="text-align: center">Tenure</th>
											<th rowspan="2">Rental Deposit</th>
											<th rowspan="2">Utility Deposit</th>
											<th rowspan="2">Rental/Month</th>
											<th rowspan="2">Rental as Per Tax Inv</th>
											<th rowspan="2" >Action</th>
											

										</tr>   
										<tr>
											<th>From</th>
											<th>Until</th>		

										</tr>
										
                                    </thead>
                                    <tbody id="filterTable">    
									<?php 
										
										
									
                                        $sql_query = "SELECT * FROM u_renter
																		INNER JOIN u_property ON u_renter.address_id = u_property.up_id
																		INNER JOIN company ON company.id = u_renter.company_id
																		WHERE u_renter.status='1'";
                                        
                                        if(mysqli_num_rows(mysqli_query($conn_admin_db,$sql_query)) > 0){
                                            $count = 0;
                                            $sql_result = mysqli_query($conn_admin_db, $sql_query)or die(mysqli_error($conn_admin_db));
                                                while($row = mysqli_fetch_array($sql_result)){ 
                                                    $count++;
                                                    ?>
                                                    <tr>
                                                    	<td><?=$count?></td>
                                                        <td><?=strtoupper($row['ur_name'])?></td>
														<td hidden><?=strtoupper($row['code'])?></td>   
														<td><?=strtoupper($row['up_address'])?></td>
                                                        <td><?=strtoupper($row['ur_remark'])?></td>
														<td><?=strtoupper($row['ur_tenure_startdate'])?></td>
														<td><?=strtoupper($row['ur_tenure_enddate'])?></td>
														<td><?=strtoupper($row['ur_rental_deposit'])?></td>
														<td><?=strtoupper($row['ur_utility_deposit'])?></td>
														<td><?=strtoupper($row['ur_monthly_rental'])?></td>
														<td><?=strtoupper($row['ur_rental_TaxInv'])?></td>												
                                                        <td>
                                                        <!--	<span id="<?=$row['id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="menu-icon fa fa-calendar"></i></span><br> -->
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
		
		
<!-- Modal edit vehicle  -->
   <!--  <div id="editItem" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-xl container-fluid"  role="document">
            <div class="modal-content container-fluid">
                <div class="modal-header container-fluid">
                    <h4 class="modal-title">Date</h4>
                </div>
                <div class="modal-body container-fluid">
                    <div class="card-body">
                                <table id="date_table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
              							
											<th colspan="2" scope='col' style="text-align: center">January (1)</th>
                                            <th colspan="2" scope='col' style="text-align: center">February (2)</th>
                                            <th colspan="2" scope='col' style="text-align: center">March (3)</th>
                                            <th colspan="2" scope='col' style="text-align: center">April (4)</th>
                                            <th colspan="2" scope='col' style="text-align: center">May (5)</th>
                                            <th colspan="2" scope='col' style="text-align: center">June (6)</th>
                                            
										</tr>   
										<tr>
												
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											
											
										</tr>
										<tr>
											<th></th>
										</tr>
										<tr>
											<th><input type='checkbox' class="larger" store="checkbox1" /></th>
											<th><input type='checkbox' class="larger" store="checkbox2" /></th>
											<th><input type='checkbox' class="larger" store="checkbox3" /></th>
											<th><input type='checkbox' class="larger" store="checkbox4" /></th>
											<th><input type='checkbox' class="larger" store="checkbox5" /></th>
											<th><input type='checkbox' class="larger" store="checkbox6" /></th>
											<th><input type='checkbox' class="larger" store="checkbox7" /></th>
											<th><input type='checkbox' class="larger" store="checkbox8" /></th>
											<th><input type='checkbox' class="larger" store="checkbox9" /></th>
											<th><input type='checkbox' class="larger" store="checkbox10" /></th>
											<th><input type='checkbox' class="larger" store="checkbox11" /></th>
											<th><input type='checkbox' class="larger" store="checkbox12" /></th>
											
											
											
										</tr>
										
                                    </thead>
                                    <tbody>    
							 	
                                  
                                    </tbody> 
                                                                    
                                </table>
								
								<table id="date_table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
              							
											<th colspan="2" scope='col' style="text-align: center">July (7)</th>
                                            <th colspan="2" scope='col' style="text-align: center">August (8)</th>
                                            <th colspan="2" scope='col' style="text-align: center">September (9)</th>
                                            <th colspan="2" scope='col' style="text-align: center">October (10)</th>
                                            <th colspan="2" scope='col' style="text-align: center">November (11)</th>
                                            <th colspan="2" scope='col' style="text-align: center">December (12)</th>	
										</tr>
										<tr>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
											<th>Tax Invoice</th>
											<th>Official Receipt</th>
										</tr>
										<tr>
											<th></th>
										</tr>
										<tr>
											<th><input type='checkbox' class="larger" store="checkbox13" /></th>
											<th><input type='checkbox' class="larger" store="checkbox14" /></th>
											<th><input type='checkbox' class="larger" store="checkbox15" /></th>
											<th><input type='checkbox' class="larger" store="checkbox16" /></th>
											<th><input type='checkbox' class="larger" store="checkbox17" /></th>
											<th><input type='checkbox' class="larger" store="checkbox18" /></th>
											<th><input type='checkbox' class="larger" store="checkbox19" /></th>
											<th><input type='checkbox' class="larger" store="checkbox20" /></th>
											<th><input type='checkbox' class="larger" store="checkbox21" /></th>
											<th><input type='checkbox' class="larger" store="checkbox22" /></th>
											<th><input type='checkbox' class="larger" store="checkbox23" /></th>
											<th><input type='checkbox' class="larger" store="checkbox24" /></th>
											
											
									</tr>
											
									</thead>
									
									
								</table>
                            </div>
							<!-- <input type="button" id="ReserveerButton1" value="save" class="btn btn-primary" "onclick="save()"/> -->
                </div> 
			
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal --> 
	
	 <!-- Modal edit puspakom  -->
        <div id="editItem" class="modal fade">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit</h4>
                </div>
                <div class="modal-body">
                    <form role="form" method="POST" action="" id="update_form">
                        <input type="hidden" id="id" name="id" value="">
                        <div class="form-group row col-sm-12">
                            <div class="form-group row col-sm-12">
                                <div class="col-sm-6">
                            	<label for="ur_name_edit" class=" form-control-label"><small class="form-text text-muted">Lessee</small></label>
                                <input type="text" id="ur_name_edit" name="ur_name_edit" placeholder="Enter lessee's name" class="form-control" required>
								</div>    
							<!--	<div class="col-sm-6">
                            	<label for="up_address_edit" class=" form-control-label"><small class="form-text text-muted">Location</small></label>
                                <input type="text" id="up_address_edit" name="up_address_edit" placeholder="Enter Location" class="form-control" required>
								</div>  		-->						
                            </div>  
                            <div class="col-sm-6">
                                <label for="ur_tenure_startdate_edit" class="form-control-label"><small class="form-text text-muted">From</small></label>
                                <div class="input-group">
                                  <input type="text" id="ur_tenure_startdate_edit" name="ur_tenure_startdate_edit" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div>                       
                            </div> 
							<div class="col-sm-6">
                                <label for="ur_tenure_enddate_edit" class="form-control-label"><small class="form-text text-muted">Until</small></label>
                                <div class="input-group">
                                  <input type="text" id="ur_tenure_enddate_edit" name="ur_tenure_enddate_edit" class="form-control" autocomplete="off">
                                  <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                </div> 
                            </div>
                                                                 
                        </div>
						 <div class="form-group row col-sm-12">  
						 <div class="col-sm-6">
                            	<label for="ur_rental_deposit_edit" class=" form-control-label"><small class="form-text text-muted">Rental Deposit</small></label>
                                <input type="text" id="ur_rental_deposit_edit" name="ur_rental_deposit_edit" class="form-control" required>
								</div>    
								<div class="col-sm-6">
                            	<label for="ur_utility_deposit_edit" class=" form-control-label"><small class="form-text text-muted">Utility Deposit</small></label>
                                <input type="text" id="ur_utility_deposit_edit" name="ur_utility_deposit_edit"  class="form-control" required>
								</div> 
								<div class="col-sm-6">
                            	<label for="ur_monthly_rental_edit" class=" form-control-label"><small class="form-text text-muted">Rental/Month</small></label>
                                <input type="text" id="ur_monthly_rental_edit" name="ur_monthly_rental_edit"  class="form-control" required>
								</div>    
								<div class="col-sm-6">
                            	<label for="ur_rental_TaxInv_edit" class=" form-control-label"><small class="form-text text-muted">Rental as Per Tax Inv</small></label>
                                <input type="text" id="ur_rental_TaxInv_edit" name="ur_rental_TaxInv_edit"  class="form-control" required>
								</div> 
							</div>
                        <div class="form-group row col-sm-12">                            
                            <div class="form-group col-12">
                                <label for="ur_remark_edit" class=" form-control-label"><small class="form-text text-muted">Purpose and Use of Demised Premises</small></label>
                                <textarea id="ur_remark_edit" name="ur_remark_edit" class="form-control"></textarea>
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
                    <h5 class="modal-title" id="staticModalLabel">Delete </h5>
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
	<script src="http://code.jquery.com/jquery.js"></script>
	
	<script type="text/javascript">

	  
	 $(document).ready(function() {
        $('#rental_table').DataTable({
        	"paging": false,
        	"pageLength": 1,
        	"responsive": true
         });
		   
		 
     $(document).on('click', '.edit_data', function(){
        	var id = $(this).attr("id");        	
        	$.ajax({
  					url:"rental.collection.report.ajax.php",
  					method:"POST",
  					data:{ action:'retrieve_rental_collection_report', id:id},
  					dataType:"json",
  					success:function(data){	  
						console.log(data);			
  						$('#id').val(id);			
                        $('#ur_name_edit').val(data.ur_name);						
                        $('#ur_remark_edit').val(data.ur_remark);  
						$('#ur_tenure_startdate_edit').val(dateFormat(data.ur_tenure_startdate));  
						$('#ur_tenure_enddate_edit').val(dateFormat(data.ur_tenure_enddate));
                        $('#ur_rental_TaxInv_edit').val(data.ur_rental_TaxInv); 
                        $('#ur_utility_deposit_edit').val(data.ur_utility_deposit);   
						$('#ur_monthly_rental_edit').val(data.ur_monthly_rental);  
						$('#ur_rental_deposit_edit').val(data.ur_rental_deposit);  	
                        $('#editItem').modal('show');
  					}
  				});
        });  
		
		// display data on table 
	/*		var table = $('#rental_table').DataTable({
    		"paging": false,
        	"pageLength": 1,
            "ajax":{
           	 "url": "rental.collection.report.ajax.php",    
           	 "type":"POST",       	
           	 "data" : function ( data ) {
			
				data.action = 'display_rental_collection_report';				
   	        }
   	      },
   	     });    */
  	     
  	     

		//delete item
        $(document).on('click', '.delete_data', function(){
			var id = $(this).attr("id");
			$('#delete_record').data('id', id); //set the data attribute on the modal button

    	});
        $( "#delete_record" ).click( function() {
    		var ID = $(this).data('id');
    		$.ajax({
    			url:"rental.collection.report.ajax.php",
    			method:"POST",    
    			data:{action:'delete_rental_collection_report', id:ID},
    			success:function(data){	  						
    				$('#deleteItem').modal('hide');		
    				location.reload();		
    			}
    		});
    	});
    	
	/*	//update summon form submit
        $('#update_form').on("submit", function(event){  
            event.preventDefault();  
            if($('#code').val() == ""){  
                 alert("Company code is required");  
            }  
            else if($('#name').val() == ''){  
                 alert("Company name is required");  
            }  
            else if($('#reg_no').val() == ''){  
                 alert("Company registration number is required");  
            }  
            else{  
                 $.ajax({  
                      url:"company.ajax.php",  
                      method:"POST",  
                      data:{action:'update_company', data:$('#update_form').serialize()},  
                      success:function(data){   
                           $('#editItem').modal('hide');  
                           $('#bootstrap-data-table').html(data);  
                           location.reload();	
                      }  
                 });  
            }  
       });  */

      });

	   $("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#filterTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
		

    function dateFormat(dates){
        var date = new Date(dates);
    	var day = date.getDate();
	  	var monthIndex = date.getMonth()+1;
	  	var year = date.getFullYear();

	  	return (day <= 9 ? '0' + day : day) + '-' + (monthIndex<=9 ? '0' + monthIndex : monthIndex) + '-' + year ;
    }
	

//--------------------save state of checkbox-----------------------------------------------------------------
/* (function() {
    var boxes = document.querySelectorAll("input[type='checkbox']");
    for (var i = 0; i < boxes.length; i++) {
        var box = boxes[i];
        if (box.hasAttribute("store")) {
            setupBox(box);
        }
    }
    
    function setupBox(box) {
        var storageId = box.getAttribute("store");
        var oldVal    = localStorage.getItem(storageId);
        console.log(oldVal);
        box.checked = oldVal === "true" ? true : false;
        
        box.addEventListener("change", function() {
            localStorage.setItem(storageId, this.checked); 
        });
    }
})(); */
//-------------------------------------------------end of save state of checkbox-------------------------------------------------
  </script>
</body>
</html>
