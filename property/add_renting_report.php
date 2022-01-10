<?php
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
	global $conn_admin_db;
	
	$acc_id = isset($_GET['id']) ? $_GET['id'] : "";
	$item_id = isset($_GET['item_id']) ? $_GET['item_id'] : '';
	
	$header_title = !empty($item_id) ? "Edit " : "Add New ";
	
	$query = "SELECT * FROM u_renting_extend WHERE id='$item_id'";
	$result  = mysqli_query($conn_admin_db, $query)or die(mysqli_error($conn_admin_db));
	if(mysqli_num_rows($result) > 0){
	    $row = mysqli_fetch_assoc($result);
	    $ur_rental_deposit = $row['ur_rental_deposit'];
	    $ur_utility_deposit = $row['ur_utility_deposit'];
	    $ur_gst = $row['ur_gst'];
		$ur_monthly_rental = $row['ur_monthly_rental'];
	    $ur_rental_taxinv = $row['ur_rental_taxinv'];
	    $date_from = dateFormatRev($row['date_from']);
	    $date_until = dateFormatRev($row['date_until']);
	    $ure_remark = $row['ure_remark'];
        $payment_amount = $row['payment_amount'];
		
	}
	
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
                        <div class="card" id="printableArea">
                            <div class="card-header">
                                <strong class="card-title"><?=$header_title?></strong>
                            </div>
                            <div class="modal-body">
                                <form role="form" method="POST" action="" id="add_form">  
                                <input type="hidden" id="acc_id" name="acc_id" value="">    
                                <input type="hidden" id="item_id" name="item_id" value=""> 
                                <div class="form-group row col-sm-12">                    	
                                	<div class="col-sm-6">
                                        <label for="date_from" class=" form-control-label"><small class="form-text text-muted">From </small></label>                                            
                                        <div class="input-group">
                                            <input id="date_from" name="date_from" value="<?=$date_from?>" class="form-control" autocomplete="off" >
                                            <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                        </div>  
                                    </div>       
                                    <div class="col-sm-6">
                                        <label for="date_until" class=" form-control-label"><small class="form-text text-muted">Until </small></label>                                            
                                        <div class="input-group">
                                            <input id="date_until" name="date_until" value="<?=$date_until?>" class="form-control" autocomplete="off">
                                            <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                        </div>  
                                    </div>
                                </div>                                                    
                                <div class="row form-group col-sm-12">
                                    <div class="col-sm-6">
                                        <label for="rental_deposit" class=" form-control-label"><small class="form-text text-muted">Rental Deposit <span class="color-red">*</span></small></label>
                                        <input type="text" id="rental_deposit" placeholder="Input 0 if there is none.." name="rental_deposit" value="<?=$ur_rental_deposit?>" class="form-control" required>
                                    </div>
                                     <div class="col-sm-6">
                                        <label for="utility_deposit" class=" form-control-label"><small class="form-text text-muted">Utility Deposit <span class="color-red">*</span></small></label>
                                        <input type="text" id="utility_deposit" placeholder="Input 0 if there is none.." name="utility_deposit" value="<?=$ur_utility_deposit?>" class="form-control" required >
                                    </div>
                                </div>
                                <div class="row form-group col-sm-12">  
                                	<div class="col-sm-6">
                                        <label for="rental_monthly" class=" form-control-label"><small class="form-text text-muted">Rental/Monthly<span class="color-red">*</span></small></label>
                                        <input type="text" id="rental_monthly" placeholder="Input 0 if there is none.." name="rental_monthly" value="<?=$ur_monthly_rental?>" class="form-control" required>
                                    </div>                                   	
                                    <div class="col-sm-6">
                                        <label for="rental_per_taxinv" class=" form-control-label"><small class="form-text text-muted">Rental as Per Tax Inv<span class="color-red">*</span></small></label>
                                        <input type="text" id="rental_per_taxinv" placeholder="Input 0 if there is none.." name="rental_per_taxinv" value="<?=$ur_rental_taxinv?>" class="form-control" required>
                                    </div>        
                                </div>    
								
                                <div class="row form-group col-sm-12"> 
								<div class="col-sm-6">
                                        <label for="ur_gst" class=" form-control-label"><small class="form-text text-muted">GST (6%)<span class="color-red">*</span></small></label>
                                        <input type="text" id="ur_gst" placeholder="Input 0 if there is none.." name="ur_gst" value="<?=$ur_gst?>" class="form-control" required>
                                    </div>  
                                	<div class="col-sm-6">
                                        <label for="remark" class=" form-control-label"><small class="form-text text-muted">Remark</small></label>
                                        <textarea id="remark" name="remark" class="form-control"><?=$ure_remark?></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <?php if(!empty($item_id)){?>
                                    	<button type="submit" class="btn btn-primary save_data ">Update</button>
                                    <?php }else{?>
                                    	<button type="submit" class="btn btn-primary save_data ">Save</button>
                                    <?php }?>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div>
        </div>
        <div>
        </div>
        <!-- Modal add telefon list  -->        
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
    	var acc_id = '<?=$acc_id?>';
    	var item_id = '<?=$item_id?>';
        $('#add_form').on("submit", function(event){  
            event.preventDefault();   
            $('#acc_id').val(acc_id);      
            $('#item_id').val(item_id); 
            var action = (item_id !='') ? 'update_rent' : 'add_rent';     
            $.ajax({  
                url:"u.renting.record.ajax.php",  
                method:"POST",  
                data:{action:action, data : $('#add_form').serialize()},  
                success:function(data){
                    if(data){
						alert("Successfully added!");						
						window.location.replace("u_rental_details.php?id="+acc_id);
                	}                    
                }  
           });    
        });

        $('#date_from, #date_until').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
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
