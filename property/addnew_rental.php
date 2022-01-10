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
    <title>Eng Peng Utilities</title>
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
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Add New Rental</strong>
                            </div>
                            <form id="tenure_form" role="form" action="tenant_add_process.php" method="post">
                                <div class="card-body card-block">
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
										</div> 
										
                                    
									 <div class="form-group row col-sm-12">
										<div class="col-sm-4" >
											 <label for="company" class=" form-control-label"><small class="form-text text-muted">Company <span class="color-red">*</span></small></label>
											<div>
												<?php
													$company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1'");
													db_select ($company, 'company', '','','-select-','form-control form-control-sm','','required');
												?>
											</div>
										</div> 
                                    <div class="col-sm-5" id="address">
                                            <label for="address" class=" form-control-label"><small class="form-text text-muted">Address<span style="color:red">*</span></small></label>
                                            <div class="input-group">
												<?php
														$u_property = mysqli_query ( $conn_admin_db, "SELECT up_id, UPPER(up_address) FROM u_property");
														db_select ($u_property, 'u_property', '','','-select-','form-control','required');
												?>
											</div>
                                        </div>    
                                    </div> 
									<div class="form-group row col-sm-12">
										<div class="col-sm-3">
											 <label for="date_entered" class=" form-control-label"><small class="form-text text-muted">Date</small></label>
												<div class="input-group">
												<input type="text" id="date_entered" name="date_entered" class="form-control" autocomplete="off">
												<div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
								</div>
										</div> 
										<div class="col-sm-3">
											 <label for="tenure_enddate" class=" form-control-label"><small class="form-text text-muted">Tenure End</small></label>
											<input type="date" id="tenure_enddate" name="tenure_enddate" value="" class="form-control">
										</div>  
									</div>
									<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label for="m_rental" class=" form-control-label"><small class="form-text text-muted">Monthly Rental (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="m_rental" name="m_rental" placeholder="RM" class="form-control" required="required">
											</div>  
											<div class="col-sm-3">
												 <label for="rental_TaxInv" class=" form-control-label"><small class="form-text text-muted">Rental as Per Tax Inv (RM)</small></label>
												<input type="number" id="rental_TaxInv" name="rental_TaxInv" placeholder="RM" class="form-control">
												
											</div>
									</div>
									<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label for="w_bill" class=" form-control-label"><small class="form-text text-muted">Water Bill (RM)</small></label>
												<input type="number" id="w_bill" name="w_bill" placeholder="RM" class="form-control">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>  
									<div class="col-sm-3">
												 <label for="e_bill" class=" form-control-label"><small class="form-text text-muted">Electricity Bill (RM)</small></label>
												<input type="number" id="e_bill" name="e_bill" placeholder="RM" class="form-control">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>
									<div  class="col-sm-3">
												 <label for="managementbill" class=" form-control-label"><small class="form-text text-muted">Management Bill (RM)</small></label>
												<input type="number" id="managementbill" name="managementbill" placeholder="RM" class="form-control">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>		
										</div>	
									<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label for="r_deposit" class=" form-control-label"><small class="form-text text-muted">Rental Deposit (RM)</small></label>
												<input type="number" id="r_deposit" name="r_deposit" placeholder="RM" class="form-control">
												
											</div>  
											<div class="col-sm-3">
												 <label for="u_deposit" class=" form-control-label"><small class="form-text text-muted">Utility Deposit (RM)</small></label>
												<input type="number" id="u_deposit" name="u_deposit" placeholder="RM" class="form-control">
												
											</div>
									</div>	
									<div class="form-group row col-sm-12">
                                        <div class="col-sm-9" id="tenant_remark">
                                            <label for="tenant_remark" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
											<textarea name="tenant_remark" id="tenant_remark" rows="6" placeholder="Content..." class="form-control"></textarea>
                                        </div>                                           
                                    </div>  
                                    <div class="card-body">
                                        
                                        <button type="submit" id="save" name="save" class="btn btn-primary">Save</button>
                                        <button type="button" id="cancel" onclick="return confirm('Are you sure you want to CANCEL summision?')" name="cancel" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
                                    </div>
                                </div> <!----> <!-- end of card block and card body-->
                            </form><!-- end of form -->
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div>
        </div>
        <div>
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
    	// Initialize select2
    	var select2 = $("#company").select2({
//     		placeholder: "select option",
    	    selectOnClose: true
        });
		select2.data('select2').$selection.css('height', '38px');
    	select2.data('select2').$selection.css('border', '1px solid #ced4da');
	
		
		<!-- $('#tenure_form').on("submit", function(event){  
        <!--       event.preventDefault();  
         <!--       $.ajax({  
        <!--            url:"rental.collection.report.ajax.php",  
        <!--            method:"POST",  
        <!--            data:{action:'add_new_tenant', data: $('#tenure_form').serialize()},  
        <!--            success:function(data){ 
        <!--                  if(data){                              
        <!--                      alert("Added Successfully!");
        <!--                      window.location = "rental_collection_report.php";  
        <!--                  }                               
        <!--            }  
         <!--      	});   
         <!--    });
		
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

<?php
// dont forget to check process the option of rental for as well, move into new page for existing rented house. 
// for new house to be rented, don't include the house that is rented. TQ
// when rental and add tenant button is clicked, save the form and redirect into same url but with the newly added rental id and pop up a lightbox to add tenant 

?>
