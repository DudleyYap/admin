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
	<?php  //include('../assets/nav/leftNav.php')?>
    <!-- Right Panel -->
    <?php //include('../assets/nav/rightNav.php')?>
    <!-- /#header -->
    <!-- Content -->
        <div id="right-panel" class="right-panel">
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Add Quit Rent & Assessment</strong>
                            </div>
                            <form id="add_new_account" role="form" action="" method="post">
                                <div class="card-body card-block ">
									<!-- Adding quitrent and assessment-->       
                                	<div id="3" class="quitrent_assessment" style="display:" style="border: 1px solid black">
										<div class="form-group row col-sm-12"  style="border: 1px solid black">
										   <div class="col-sm-4" id="qra_company">
												<label class="control-label"><small class="form-text text-muted">Company<span style="color:red">*</span> </small></label>
												<div class="input-group">
													<?php
													$qracomp = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE utility_used = '1' ORDER BY `company`.`name` ASC");
													db_select ($qracomp, 'location', '','','-select-','form-control','');
												?>
												</div>
											</div> 
											 <div class="col-sm-4">
												 <label for="qra_vendor" class=" form-control-label"><small class="form-text text-muted">Occupant<span style="color:red">*</span> </small></label>
												<input type="text" id="qra_vendor" name="qra_vendor" placeholder="eg: Majlis Daerah Papar, Majlis Daerah Tuaran" class="form-control" required="required">
											</div> 
											<!--
											<div class="col-sm-4">
												 <label for="qra_owner" class=" form-control-label"><small class="form-text text-muted">Owner</small></label>
												<input type="text" id="qra_owner" name="qra_owner" placeholder="Enter Owner Name" class="form-control">
											</div>  
											-->                                                                          
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-4">
												 <label for="qra_refno" class=" form-control-label"><small class="form-text text-muted">Reference No.<span style="color:red">*</span> </small></label>
												<input type="text" id="qra_refno" name="qra_refno" placeholder="Enter Reference Number" class="form-control" required="required">
											</div>   
											<div class="col-sm-4">
												 <label for="qra_tiltlot" class=" form-control-label"><small class="form-text text-muted">Title / Lot<span style="color:red">*</span> </small></label>
												<input type="text" id="qra_tiltlot" name="qra_tiltlot" placeholder="Enter Title / Lot" class="form-control" required="required">
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-8">
												<label for="qra_address" class=" form-control-label"><small class="form-text text-muted">Adress<span style="color:red">*</span> </small></label>
												<textarea name="qra_address" id="tl_caddress" rows="3" class="form-control" placeholder="Enter Location" required="required"></textarea>
											</div>
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-2">
												 <label for="aqa_period" class=" form-control-label"><small class="form-text text-muted">Period<span style="color:red">*</span> </small></label>
												<input type="text" id="aqa_period" name="aqa_period" placeholder="eg: 2020" class="form-control" required="required">
											</div>  
											<div class="col-sm-2">
												 <label for="aqa_annualrate" class=" form-control-label"><small class="form-text text-muted">Annual Fee Rate<span style="color:red">*</span> </small></label>
												<input type="number" id="aqa_annualrate" name="aqa_annualrate" placeholder="RM" class="form-control" required="required">
											</div>
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-2">
												 <label for="aqa_discount" class=" form-control-label"><small class="form-text text-muted">5% Discount (RM)<span style="color:red"></span> </small></label>
												<input type="number" id="aqa_discount" name="aqa_discount" placeholder="RM" class="form-control">
											</div>
											<div class="col-sm-2">
												 <label for="aqa_adjustment" class=" form-control-label"><small class="form-text text-muted">Adjustement<span style="color:red"></span> </small></label>
												<input type="number" id="aqa_adjustment" name="aqa_adjustment" placeholder="RM" class="form-control">
											</div>
											<div class="col-sm-2">
												 <label for="aqa_discount" class=" form-control-label"><small class="form-text text-muted">Interest (RM)<span style="color:red"></span> </small></label>
												<input type="number" id="aqa_discount" name="aqa_discount" placeholder="RM" class="form-control" >
											</div>
										</div>
										
									</div>
									<!-- End of adding quitrent and assessment -->
									
                                    
									<div class="card-body" style="display:">
										<button type="button" class="btn btn-info mb-1" data-toggle="modal" data-target="#scrollmodal">
											Scrolling
										</button>
                                        <button type="submit" id="saveupdate" data-toggle="modal" name="saveupdate" class="btn btn-success edit_data">Save and Update Payment</button>
                                        <button type="submit" id="save" name="save" class="btn btn-primary">Save</button>
                                        <button type="button" id="cancel" name="cancel" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
                                    </div>
                                </div>
                            </form>
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
	$(document).ready(function(){
    	// Initialize select2
        var select2 = $("#licence_no").select2({   
            selectOnClose: true
        });
        select2.data('select2').$selection.css('height', '38px');
        select2.data('select2').$selection.css('border', '1px solid #ced4da');
        
        $('#offer_letter_date, #payment_advice_date').datepicker({
    	  	format: 'dd-mm-yyyy',
          	autoclose: true,
          	todayHighlight: true,       
       });
    });
	
    $(document).ready(function() {
        //declare empty array to temporary save the data in table
        // var TELEPHONE_LIST = []; not really understand what this is for
        
    	$('.billing').hide();  
    	$('#owner_ref, #serial_no, #owner, #reference, #property_type').hide();  	
    	
		$('#bill_type').change(function(){
    		$('.billing').hide();
			$('#'+$(this).val()).show();
			if($(this).val() == 1){
				$('#location, #deposit, #tariff, #acc_no').show();
				$('#owner,#serial_no,#owner_ref,#reference,#property_type').hide();
			}
			else if($(this).val() == 2){
				$('#location, #deposit, #owner').show();
				$('#tariff, #reference,#property_type').hide();
			}
			else if($(this).val() == 3){
				$('#location, #reference').show();
				$('#owner, #deposit, #tariff,#property_type').hide();
			}
			else if($(this).val() == 4){
				$('#location, #deposit, #tariff, #reference, #serial_no,#property_type').hide();
				$('#acc_no').show();
			}
			else if($(this).val() == 5){
				$('#serial_no, #location').show();
				$('#deposit, #tariff, #acc_no,#owner_ref, #reference,#property_type').hide();
			}
			else if($(this).val() == 6){
				$('#owner_ref, #location, #property_type').show();		
				$('#deposit, #tariff, #acc_no, #serial_no').hide();		
			}

        });

        $('#telefon_bill').on("submit", function(e){ 
            e.preventDefault();
            var telefon = $("input[name='telefon']").val();
            var type = $("input[name='type']").val();
         	var usage = $("input[name='usage']").val();
         	
            $(".data-table tbody").append("<tr data-telefon='"+telefon+"' data-type='"+type+"' data-usage='"+usage+"'><td>"+telefon+"</td><td>"+type+"</td><td>"+usage+"</td><td><button class='btn btn-info btn-xs btn-edit'>Edit</button><button class='btn btn-danger btn-xs btn-delete'>Delete</button></td></tr>");

            //push data into array
            TELEPHONE_LIST.push({
				telefon: telefon,
				type: type,
				usage: usage
            });
            console.log(TELEPHONE_LIST);
            $("input[name='telefon']").val('');
            $("input[name='type']").val('');
            $("input[name='usage']").val('');
        });
    	
        $('#add_new_account').on("submit", function(event){  
            event.preventDefault();     
            console.log(TELEPHONE_LIST);         
            $.ajax({  
                url:"account_setup.ajax.php",  
                method:"POST",  
                data:{action:'add_new_account', data : $('#add_new_account').serialize()},  
                success:function(data){ 
                    location.reload();                                                        	 
                }  
           });    
        });

        $('#from_date, #to_date, #paid_date, #due_date').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
        });
        
    });


  </script>
</body>
<style>
.table{
    font-size:14px;
}
</style>
</html>
