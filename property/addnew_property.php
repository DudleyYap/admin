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
    <title>EP Utilities</title>
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
                                <strong class="card-title">Add New Property</strong>
                            </div>
                            <form id="add_new_account" role="form" action="addnew_property_process.php" method="post">
                                <div class="card-body card-block ">
									<!-- Adding property information-->  
									
									<!------****------>
                                	<div class="form-group row col-sm-12">
										<div class="col-sm-2" ><small class="form-text text-muted">Location/Area<span style="color:red;">*</span></small></div>
										<div class="col-sm-4"><input type="text" id="location_name" name="location_name" class="form-control" placeholder="eg: Seri Maju Apartment"></div>	
									</div>   
									<!------****------>
									
									<!------****------>
									
									<div class="form-group row col-sm-12">
										<div class="col-sm-2" ><small class="form-text text-muted">Company <span style="color:red;">*</span></small></div>
										<div class="col-sm-4">
													<?php
                                                $company = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE status='1'");
                                                db_select ($company, 'company', '','','-select-','form-control','','required');
                                            ?>
										</div>
									</div>   
									<!------****------>
								
									<!------****------>
									<div class="form-group row col-sm-12">
										<div class="col-sm-2" ><small class="form-text text-muted">Size (Square Feet) <span style="color:red;">*</span></small></div>
										<div class="col-sm-4"><input type="text" id="size" name="size" class="form-control" placeholder="eg: 1200 (if none, put 0)" required></div>	
									</div> 

                                    <div class="form-group row col-sm-12">
                                        <div class="col-sm-2"><small class="form-text text-muted">Type of Floor</small></div>
                                        <div class="col-sm-3"><input type="text" id="floor1" name="floor1" placeholder="first row" class="form-control" ></div>
                                        <div class="col-sm-3"><input type="text" id="floor2" name="floor2" placeholder="second row" class="form-control" ></div>
                                    </div>
									<!------****------>
										<div class="form-group row col-sm-12">
											<div class="col col-md-2"><small class="form-text text-muted">Address <span style="color:red;">*</span></small></div>
											<div class="col-sm-6"><textarea name="property_address" id="property_address" rows="3" class="form-control" value="" required></textarea></div>	
										</div>
									<!------****------>
									<div class="form-group row col-sm-12">
										<div class="col col-md-2"><small class="form-text text-muted">Remark </small></div>
										<div class="col-sm-6"><input type="text" id="property_remark" name="property_remark" class="form-control"></div>	
									</div>
                                    
                                    
									<!------****------>
									<!-- End of adding property information -->
                                    <div class="card-body">
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
		 $(document).ready(function() {
    	// Initialize select2
    	var select2 = $("#company").select2({
//     		placeholder: "select option",
    	    selectOnClose: true
        });
		select2.data('select2').$selection.css('height', '38px');
    	select2.data('select2').$selection.css('border', '1px solid #ced4da');
		
		
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
