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
                                <strong class="card-title">Add New Tenant</strong>
                            </div>
                            <form id="tenant_form" role="form" action="" method="post">
                                <div class="card-body card-block">
                                    <div class="form-group row col-sm-12">
                                        <div class="col-sm-4">
                                            <label for="tenant_name" class=" form-control-label"><small class="form-text text-muted">Full Name<span style="color:red">*</span></small></label>
                                            <input type="text" id="tenant_name" name="tenant_name" placeholder="Name as per NRIC" class="form-control">
                                        </div>     
										<!-- Aaron here : make sure that only alphabet and numerical is accepted in this section. Spacebar and special character cannot be entered -->
										 <div class="col-sm-4">
                                            <label for="ic" class=" form-control-label"><small class="form-text text-muted">Passport No. / Company No.</small></label>
                                            <input type="text" id="ic" name="ic" placeholder="*NO Spacebar, dash or any special character" class="form-control">
                                        </div>   
                                    </div> 
									<div class="form-group row col-sm-12">
                                        <div class="col-sm-4">
                                            <label for="contact_no" class=" form-control-label"><small class="form-text text-muted">Contact No.</small></label>
                                            <input type="text" id="contact_no" name="contact_no" placeholder="Contact No." class="form-control" >
                                        </div>     
										 <div class="col-sm-5" id="tenant_email">
                                            <label for="tenant_email" class=" form-control-label"><small class="form-text text-muted">Email</small></label>
                                            <input type="email" id="tenant_email" name="tenant_email" placeholder="example@test.com" class="form-control">
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

$('#tenant_form').on("submit", function(event){  
    event.preventDefault();  
    if($('#tenant_name').val() == ""){  
         alert("Full name is required");  
    }  
                 
    else{  
         $.ajax({  
              url:"tenant.ajax.php",  
              method:"POST",  
              data:{action:'add_new_tenant', data : $('#tenant_form').serialize()},  
              success:function(data){ 
                  location.reload();      
                  alert("Successfully added!", "addnew_tenant.php");                                                  	 
              }  
         });  
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
  </script>
</body>
<style>
.table{
    font-size:14px;
}
</style>
</html>
