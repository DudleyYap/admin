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
    <title>Eng Peng Vehicle</title>
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
                            <form id="" role="form" action="" method="post">
                                <div class="card-body card-block">
                                    <div class="form-group row col-sm-12">
										<div class="col-sm-4" id="qra_company">
											<label class="control-label"><small class="form-text text-muted">Rental Category<span style="color:red">*</span> </small></label>
											<div class="input-group">
												<?php
														$ar_cate = mysqli_query ( $conn_admin_db, "SELECT propCat_id, UPPER(propCat_desc) FROM utility_propertycategory");
														db_select ($ar_cate, 'ar_category', '','','-select-','form-control','');
												?>
											</div>
										</div> 
                                    </div>
									 <div class="form-group row col-sm-12">
										<div class="col-sm-4" id="qra_company">
											<label class="control-label"><small class="form-text text-muted">Company<span style="color:red">*</span> </small></label>
											<div class="input-group">
												<?php
													$ar_comp = mysqli_query ( $conn_admin_db, "SELECT id, UPPER(name) FROM company WHERE utility_used = '1' ORDER BY `company`.`name` ASC");
													db_select ($ar_comp, 'ar_company', '','','-select-','form-control','');
												?>
											</div>
										</div> 
                                        <div class="col-sm-5" id="ar_address">
                                            <label for="ar_address" class=" form-control-label"><small class="form-text text-muted">Address<span style="color:red">*</span></small></label>
                                            <div class="input-group">
												<?php
														$ar_cate = mysqli_query ( $conn_admin_db, "SELECT propCat_id, UPPER(propCat_desc) FROM utility_propertycategory");
														db_select ($ar_cate, 'ar_category', '','','-select-','form-control','');
												?>
											</div>
                                        </div>     
                                    </div> 
									<div class="form-group row col-sm-12">
										<div class="col-sm-3">
											 <label for="ar_startdate" class=" form-control-label"><small class="form-text text-muted">Tenure Start</small></label>
											<input type="date" id="ar_startdate" name="ar_startdate" value="" class="form-control">
										</div> 
										<div class="col-sm-3">
											 <label for="ar_enddate" class=" form-control-label"><small class="form-text text-muted">Tenure End</small></label>
											<input type="date" id="ar_enddate" name="ar_enddate" value="" class="form-control">
										</div>  
									</div>
									<div class="form-group row col-sm-12">
                                        <div class="col-sm-9" id="tenant_remark">
                                            <label for="tenant_remark" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
											<textarea name="tenant_remark" id="tenant_remark" rows="6" placeholder="Content..." class="form-control"></textarea>
                                        </div>                                           
                                    </div>  
                                    <div class="card-body">
                                        <button type="submitandrent" id="saveandrent" name="saveandrent" class="btn btn-success">Save & Add Tenant</button>
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
        //declare empty array to temporary save the data in table
        var TELEPHONE_LIST = [];
        
    	$('.billing').hide();
    	$('#bill_type').change(function(){
    		$('.billing').hide();
			$('#'+$(this).val()).show();
			if($(this).val() == 4 || $(this).val() == 5){
				$('.date, #cheque_no').hide();
			}
			else if($(this).val() == 6){
				$('.date, #cheque_no').hide();
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
    	
        $('#add_new_bill').on("submit", function(event){  
            event.preventDefault();     
            console.log(TELEPHONE_LIST);         
            $.ajax({  
                url:"add_bill.ajax.php",  
                method:"POST",  
                data:{action:'add_new_bill', data : $('#add_new_bill').serialize(), telefon_list:TELEPHONE_LIST},  
                success:function(data){ 
                    location.reload();                                                        	 
                }  
           });    
        });

        $('#from_date, #to_date, #paid_date, #due_date, #date_entered, #payment_date, #receive_date, #date_entered_fx').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
        });

        //onchange billtype
        $("#bill_type").change(function(){
            var bill_type = $(this).val();

            $.ajax({
                url: 'get_account.ajax.php',
                type: 'post',
                data: {bill_type:bill_type},
                dataType: 'json',
                success:function(response){
                    console.log(response);
                    var len = response.length;
                    $("#sel_account").empty();
                    for( var i = 0; i<len; i++){
                        var acc_id = response[i]['acc_id'];
                        var description = response[i]['description'];
                        
                        $("#sel_account").append("<option value='"+acc_id+"'>"+description+"</option>");

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
