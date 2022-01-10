<?php
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
	global $conn_admin_db;
?>

<!doctype html>
<html class="no-js" lang=""> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EP Admin System</title>
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
        
        .select2-selection__rendered {
          margin: 5px;
        }
        .select2-selection__arrow {
          margin: 5px;
        }
        .button_add{
            position: absolute;
            left:    0;
            bottom:   0;
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
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Update Payment</strong>
                            </div>
                            <form id="payment_form" role="form" action="" method="post">
                                <div class="card-body card-block ">
		
									<!-- rental for staff-->
									<div id="2" class="rental_payment_internal" style="display:">
										<hr>
										<div class="form-group row col-sm-12" >
										   <div class="col-sm-8" id="rpi">
												<h3>Payment<h3>
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12">
                                      <div class="col-sm-4" id="">
											<label for="renter_name" class="control-label"><small class="form-text text-muted">Tenant<span style="color:red">*</span> </small></label>    
                                            <div>
													<?php
														$renter_name = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(tenant_name) FROM u_tenant WHERE status='1'");
														db_select ($renter_name, 'renter_name', '','','-select-','form-control form-control-sm','','required');
													?>
												</div>
											
                                        </div>  
											<div class="col-sm-4" >
												<label class="control-label"><small class="form-text text-muted">Location<span style="color:red">*</span></small></label>
												<div >
													<?php
													 $address = mysqli_query ( $conn_admin_db, "SELECT ur_id, address_edit FROM u_renter WHERE status = '1'");
													 db_select ($address, 'address', '','','-select-','form-control form-control-sm','', 'required');
												?>
												</div>
												<small class="help-block form-text" style="color: grey">Choose the correct location based on the selected tenant.</small>
											</div> 
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label fclass=" form-control-label"><small class="form-text text-muted">Tenant(s)</small></label>
												<input type="text" value="Aaron Dale J Chin" class="form-control" disabled="">
											</div>   
											<div class="col-sm-3">
												 <label class=" form-control-label"><small class="form-text text-muted">&nbsp;</small></label>
												<input type="text" value="Aaron Dale J Chin" class="form-control" disabled="">
											</div>  
										</div>
										
										<div class="form-group row col-sm-12" sty;e="display:">
											<div class="col-sm-2">
												 <label for="rpi_rentpayMonth" class=" form-control-label"><small class="form-text text-muted">Payment for (month)<span style="color:red">*</span> </small></label>
												 <div class="input-group">
													<?php
													 $rpsmonth = mysqli_query ( $conn_admin_db, "SELECT shotform, text FROM month");
													 db_select ($rpsmonth, 'rpi_rentpayMonth', '','','-select-','form-control','');
												?>
												</div>
											</div> 
										<div class="col-sm-3">
												 <label class=" form-control-label"><small class="form-text text-muted">Monthly Rental (RM)</small></label>
												<input type="number" id="rpi_discount" placeholder="RM" class="form-control" disabled="">
											</div> 
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label for="water_bill" class=" form-control-label"><small class="form-text text-muted">Water Bill (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="water_bill" name="water_bill" placeholder="RM" class="form-control" required="required">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>  
											<div class="col-sm-3">
												 <label for="e_bill" class=" form-control-label"><small class="form-text text-muted">Electricity Bill (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="e_bill" name="e_bill" placeholder="RM" class="form-control" required="required">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div><div class="col-sm-3">
												 <label for="management_bill" class=" form-control-label"><small class="form-text text-muted">Management Bill (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="management_bill" name="management_bill" placeholder="RM" class="form-control" required="required">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>		
										</div>
										<hr>
									</div>
									<!-- end of rental for staff-->
                                    <div class="form-group row col-sm-12" style="display:">
											<div class="offset-sm-1 col-sm-10">
												<label " class=" form-control-label"><small class="form-text text-muted" style="text-decoration:underline">Payment Record</small></label>
												<table class="table table-bordered" style="width:100%">
													<thead>
														<tr style="">
															<th rowspan="2" class="text-center align-middle" style="width:10%; ">Ref. No</th>
															<th rowspan="2"  style="width:20%; " class="text-center align-middle">Payment Made</th>
															<th rowspan="2"  style="width:20%;"  class="text-center align-middle">Payment for <br>(month)</th>
															<th colspan="4"  class="text-center">Bill</th>
															<th rowspan="2"  style="" class="text-center align-middle">Action</th>
														</tr>
														<tr style="">
															<th class="text-center"><small>Water (RM)</small></th> <!--<i class="fa fa-tint"></i> -->
															<th class="text-center"><small>Electricity (RM)</small></th><!--<i class="fa fa-bolt"></i> -->
															<th class="text-center"><small>Management (RM)</small></th><!--<i c;lass="fa fa-building"></i> -->
															<th class="text-center"><small>Monthly (RM)</small></th><!--<i class="fa fa-calendar"></i> -->
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="text-align:center"><a href="#" style="font-weight: bold;">25</a></td>
															<td style="text-align:center">18/02/2020</td>
															<td style="text-align:center">February</td>
															<td style="text-align:center">38.60</td>
															<td style="text-align:center">168.80</td>
															<td style="text-align:center">70.00</td>
															<td style="text-align:center">300.00</td>
															<td style="text-align:center">Edit</td>
														</tr>
														<tr>
															<td style="text-align:center"><a href="#" style="font-weight: bold;">29</a></td>
															<td style="text-align:center">19/03/2020</td>
															<td style="text-align:center">March</td>
															<td style="text-align:center">50.10</td>
															<td style="text-align:center">180.40</td>
															<td style="text-align:center">70.00</td>
															<td style="text-align:center">300.00</td>
															<td style="text-align:center">Edit</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div> 
                                    <div class="card-body">
                                        <button type="submit" id="save" name="save" class="btn btn-primary">Save</button>
                                        <button type="button" id="cancel" name="cancel" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
                                    </div> <!-- end of buttons -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
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
    <script src="../assets/js/select2.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {

        $('#payment_form').on("submit", function(event){  
        event.preventDefault();  
        $.ajax({  
            url:"property.payment.ajax.php",  
            method:"POST",  
            data:{action:'add_new_payment', data: $('#payment_form').serialize()},  
            success:function(data){
                if(data){
                	alert("Successfully added!");
                	$('#editItem').modal('hide');                   
                    location.reload();  
                }                    
            }  
       });
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


  </script>
</body>
<style>
.table{
    font-size:14px;
}
</style>
</html>
