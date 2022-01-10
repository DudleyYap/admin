<?php
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
	global $conn_admin_db;
	$acc_id = isset($_GET['id']) ? $_GET['id'] : '';
	$item_id = isset($_GET['item_id']) ? $_GET['item_id'] : '';
	
	$header_title = !empty($item_id) ? "Edit " : "Add New ";
	
	$query = "SELECT * FROM u_renting_date WHERE id='$item_id'";
	$result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
	if(mysqli_num_rows($result) > 0){
	    $row = mysqli_fetch_assoc($result);
	    $tax_invoice = $row['tax_invoice'];       
        $date_received = dateFormatRev($row['date_received']);
        $mark2 = $row['mark2'];   
        $mark1 = $row['mark1'];
        $official_receipt= $row['official_receipt'];	    
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
                            <form id="add_date" role="form" action="" method="post">
                            	<input type="hidden" id="acc_id" name="acc_id" class="form-control">
                            	<input type="hidden" id="item_id" name="item_id" class="form-control">
                                <div class="card-body card-block">
                                    <div class="form-group row col-sm-12"> 
                                        <div class="col-sm-3">
                                            <label for="tax_invoice" class=" form-control-label"><small class="form-text text-muted">Tax invoice</small></label>                                            
                                            <div class="input-group">
                                                <input id="tax_invoice" name="tax_invoice" value="<?=$tax_invoice?>" class="form-control" autocomplete="off">                                                
                                            </div>  
                                        </div>  

                                        <div class="col-sm-3">
                                            <label for="mark1" class=" form-control-label"><small class="form-text text-muted">Mark</small></label>                                            
                                            <select id="mark1" name="mark1" class="form-control" >
                                        		<option value="">- Select -</option>
                                        		<option value="done"<?php if($mark1 == "done") echo "selected"?>>Done</option>
                                        		<option value="notdone" <?php if($mark1 == "notdone") echo "selected"?>>Not Done</option>
                                        	</select>  
                                        </div>                               
                                    </div>                                   
                                    <div class="form-group row col-sm-12 date">
                                    	<div class="col-sm-3">
                                            <label for="official_receipt" class=" form-control-label"><small class="form-text text-muted">Official Receipt</small></label>                                            
                                            <div class="input-group">
                                                <input id="official_receipt" name="official_receipt" value="<?=$official_receipt?>" class="form-control" autocomplete="off">                                                
                                            </div>  
                                        </div>  
										 <div class="col-sm-3">
                                            <label for="mark2" class=" form-control-label"><small class="form-text text-muted">Mark</small></label>                                            
                                            <select id="mark2" name="mark2" class="form-control" >
                                        		<option value="">- Select -</option>
                                        		<option value="done"<?php if($mark2 == "done") echo "selected"?>>Done</option>
                                        		<option value="notdone" <?php if($mark2 == "notdone") echo "selected"?>>Not Done</option>
                                        	</select>  
                                        </div>                                         
                                    </div>  
									<div class="form-group row col-sm-12 date">
										 <div class="col-sm-3">
                                            <label for="date_received" class=" form-control-label"><small class="form-text text-muted">Received date<span class="color-red">*</span></small></label>                                            
                                            <div class="input-group">
                                                <input id="date_received" name="date_received" value="<?=$date_received?>" class="form-control" autocomplete="off" required>
                                                <div class="input-group-addon"><i class="fas fa-calendar-alt"></i></div>
                                            </div>  
                                        </div>
									</div>
									                                                                                                                            
                                    <div class="card-body">
                                    <?php if(!empty($item_id)){?>
                                    <button type="submit" id="update" name="update" class="btn btn-primary">Update</button>
                                    <?php }else{?>
                                        <button type="submit" id="save" name="save" class="btn btn-primary">Save</button>
                                    <?php }?>
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
        var acc_id = '<?=$acc_id?>';
        var item_id = '<?=$item_id?>';
        $('#add_date').on("submit", function(event){  
            event.preventDefault(); 
            $('#acc_id').val(acc_id); 
            $('#item_id').val(item_id); 
            var action = ( item_id !='') ? 'update_date' : 'add_date';
            console.log(action)
            $.ajax({  
                url:"u.renting.record.ajax.php",  
                method:"POST",  
                data:{action:action, data : $('#add_date').serialize()},  
                success:function(data){                     
                	if(data){
						alert("Successfully added!");
						window.location.replace("u_rental_details.php?id="+acc_id);
                	}                                                                           	 
                }  
           }); 
        });

        $('#date_received').datepicker({
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