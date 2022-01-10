<?php 
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
    global $conn_admin_db;
    
    $id = isset($_GET['id']) ? $_GET['id'] : "";
    $year_select = isset($_POST['year_select']) ? $_POST['year_select'] : date('Y');
    ob_start();
    selectYear('year_select',$year_select,'submit()','','form-control form-control-sm','','');
    $html_year_select = ob_get_clean();
    
    $query = "SELECT * FROM u_trading_license WHERE u_trading_license.id = '$id'";
    
    $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    $row = mysqli_fetch_assoc($result);
    $acc_id = $row['id'];
    $company = itemName("SELECT code FROM company WHERE id='".$row['company_id']."'");
    $no_register = $row['no_register'];
    $owner= $row['owner'];
    
    //get the telefon_list
    
    $details_query = "SELECT u_tl_details.id AS id, main_business,
	address, process_fee, add_payment, total, area FROM u_tl_details WHERE acc_id = '$acc_id' ";
			
    $result2 = mysqli_query($conn_admin_db, $details_query) or die(mysqli_error($conn_admin_db));
    $arr_data = [];
    while ($rows = mysqli_fetch_assoc($result2)){
        $arr_data[] = $rows;
    }
    
?>

<!doctype html><html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Utilities - Trading License</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
    .select2-selection__rendered {
      margin: 5px;
    }
    .select2-selection__arrow {
      margin: 5px;
    }
    .select2-container{ 
        width: 100% !important; 
    }
    .button_add{
        position: absolute;
        left:    0;
        bottom:   0;
    }
    .hideBorder {
        border: 0px;
        background-color: transparent;        
    }
    .hideBorder:hover {
        background: transparent;
        border: 1px solid #dee2e6;
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
                                <strong class="card-title"><a href="trading_license.php">Trading License</a> > Account Details</strong>
                            </div>     
                            <div class="card-body">                                       
                                <div style="font-weight: bold;">
                                    <div class="col-sm-12">
                                        <label class=" form-control-label">Company : <?=$company?></label>                                        
                                    </div>
                                    <div class="col-sm-12">
                                    	<label class=" form-control-label">No Register Company : <?=$no_register?></label>                                    
                                    </div>
                                    <div class="col-sm-12">
                                    	<label class=" form-control-label">Owner : <?=$owner?></label>                                    
                                    </div>                                   
                                    
                                </div>                                                                 
                            	<hr>
                            	<form action="" method="post">
                                	<div class="form-group row col-sm-12">           
                                    	<div class="col-sm-4">
                                    		<b>Monthly Expenses</b>
                                    	</div>                                    	
                                    	<div class="col-sm-4">
                                    		<?=$html_year_select?>
                                    	</div>
                                    	<div class="row col-sm-4">
                                    		<div  class="col-sm-4">
                                    			<button type="button" class="btn btn-sm btn-primary button_add" data-toggle="modal" data-target="#addItem">Add New Record</button>
                                    		</div>
                                    		<div  class="col-sm-6">
                                    			<button type="button" class="btn btn-sm btn btn-info" onClick="window.close();">Back</button>
                                    		</div> 
                                    	</div>
                                	</div>
                            	</form>                            	
                            	<div>     
                                    <table id="sesb-table"  class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                        	<th>Main Business</th>
											<th>Location</th>
											<th>Process Fee</th>
											<th>Add Payment</th>
											<th>Total</th>
											<th>Area</th>
											<th>Action</th>
                                        </tr>
                                      										
                                    </thead>  
                                    <tbody>
                                    <?php 
//                                     $current_usage = 0;
//                                     $kwtbb = 0;
//                                     $penalty = 0;
//                                     $add_depo = 0;
//                                     $other_charge = 0;
//                                     $adj = 0;
//                                     $amount = 0;
                                    foreach ($arr_data as $data){
//                                         $current_usage += $data['current_usage'];
//                                         $kwtbb += $data['kwtbb'];
//                                         $penalty += $data['penalty'];
//                                         $add_depo += $data['additional_deposit'];
//                                         $other_charge += $data['other_charges'];
//                                         $adj += $data['adjustment'];
//                                         $amount += $data['amount'];
                                    ?>
                                    <tr>
                                        <td><?=$data['main_business']?></td>
										<td><?=$data['address']?></td>
                                        <td><?=number_format($data['process_fee'],2)?></td>
                                        <td><?=number_format($data['add_payment'],2)?></td>
                                        <td><?=number_format($data['total'],2)?></td>                                           
                                        <td><?=$data['area']?></td>      
										<td class="text-center">
                                        	<span id="<?=$data['id']?>" data-toggle="modal" class="edit_data" data-target="#editItem"><i class="fa fa-edit"></i></span>
                                            <span id="<?=$data['id']?>" data-toggle="modal" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt"></i></span>
                                        </td>                                 
                                    </tr>
                                        
                                    <?php }
                                    ?>
                                    </tbody>                                     	
                                    <tfoot>
                                    	<tr>
                                    		<th>TOTAL</th>
                                    		<th></th>
                                    		<th></th>
                                    		<th></th>
                                    		<th></th>
                                    		<th></th>
                                    		
                                    	</tr>
                                    </tfoot>                                                                                                                                              
                                    </table>
                                </div>                                                                                                            
                          	 
                           	</div> 
                           	<br>                      
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        </div>
        <!-- Modal add new record -->
        <div class="modal fade" id="addItem">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h4 class="modal-title">Add New</h4>
                </div>
                <div class="modal-body">
                    <form role="form" method="POST" action="" id="add_form">  
                    <input type="hidden" id="acc_id" name="acc_id" value="">                        
                    <div class="col-sm-12">
                    	<label for="main_business" class=" form-control-label"><small class="form-text text-muted">Main Business</small></label>       
						<input type="text" id="main_business" name="main_business" class="form-control">
					</div>
         
                    <div class="col-sm-12">
                    	<label for="address" class="form-control-label"><small class="form-text text-muted">Location</small></label>     
						<textarea type="text" id="address" name="address" class="form-control"></textarea>
                    </div>                    
                    <div class="row form-group col-sm-12">                                            
                        <div class="col-sm-4">
                            <label for="process_fee" class=" form-control-label"><small class="form-text text-muted">Process Fee<span class="color-red">*</span></small></label>
                            <input type="text" id="process_fee" name="process_fee" class="form-control">
                        </div>
                        <div class="col-sm-4">
                            <label for="add_payment" class=" form-control-label"><small class="form-text text-muted">Add Payment<span class="color-red">*</span></small></label>
                            <input type="text" id="add_payment" name="add_payment" class="form-control">
                        </div>
						
                    </div>
                    <div class="row form-group col-sm-12">      
                        <div class="col-sm-4">
                            <label for="area" class=" form-control-label"><small class="form-text text-muted">Area</small></label>
                            <input type="text" id="area" name="area" class="form-control" >
                        </div> 
                    </div>                    
   
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary save_data ">Save</button>
                    </div>
                    </form>
                </div>
                </div>
            </div>
        </div>
		
		<!---------------------modal edit record --------------------->
        <div id="editItem" class="modal fade">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Record</h4>
                </div>
                <div class="modal-body">
                    <form role="form" method="POST" action="" id="update_form">  
                    <input type="hidden" id="id" name="id" value="">    
                    <div class="form-group row col-sm-12">
                    	<div class="col-sm-12">
                    	<label for="main_business_edit" class=" form-control-label"><small class="form-text text-muted">Main Business</small></label>       
						<input type="text" id="main_business_edit" name="main_business_edit" class="form-control">
					</div>
         
                    <div class="col-sm-12">
                    	<label for="address_edit" class="form-control-label"><small class="form-text text-muted">Location</small></label>     
						<textarea type="text" id="address_edit" name="address_edit" class="form-control"></textarea>
                    </div>                    
                    <div class="row form-group col-sm-12">                                            
                        <div class="col-sm-4">
                            <label for="process_fee_edit" class=" form-control-label"><small class="form-text text-muted">Process Fee<span class="color-red">*</span></small></label>
                            <input type="text" id="process_fee_edit" name="process_fee_edit" class="form-control">
                        </div>
                        <div class="col-sm-4">
                            <label for="add_payment_edit" class=" form-control-label"><small class="form-text text-muted">Add Payment<span class="color-red">*</span></small></label>
                            <input type="text" id="add_payment_edit" name="add_payment_edit" class="form-control">
                        </div>
						
                    </div>
                    <div class="row form-group col-sm-12">      
                        <div class="col-sm-4">
                            <label for="area_edit" class=" form-control-label"><small class="form-text text-muted">Area</small></label>
                            <input type="text" id="area_edit" name="area_edit" class="form-control" >
                        </div> 
                    </div>   
                    </div>      
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-primary save_data ">Save</button>
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
                    <h5 class="modal-title" id="staticModalLabel">Delete Item</h5>
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
		
		var acc_id = '<?=$id?>';
			
        $('#sesb-table').DataTable({
            "bInfo" : false,
            "bLengthChange": false,
            "searching": false,
            "ordering": false,
            "paging" : false,
            "dom": "Bfrtip",
            "buttons": {
              "buttons": [
                {
                  text: "Export to Excel",
                  extend: 'excelHtml5', 
                  footer: true
                },
                {
                    text: "Print",
                    extend: 'print',
                    footer: true,
                    customize: function(win){             
                        var last = null;
                        var current = null;
                        var bod = [];
         
                        var css = '@page { size: landscape; }',
                            head = win.document.head || win.document.getElementsByTagName('head')[0],
                            style = win.document.createElement('style');
         
                        style.type = 'text/css';
                        style.media = 'print';
         
                        if (style.styleSheet)
                        {
                          style.styleSheet.cssText = css;
                        }
                        else
                        {
                          style.appendChild(win.document.createTextNode(css));
                        }
         
                        head.appendChild(style);
                 	}
                  }
              ],
              "dom": {
                "button": {
                  tag: "button",
                  className: "btn btn-sm btn-info"
                },
                "buttonLiner": {
                  tag: null
                }
              }
            },
            "footerCallback": function ( row, data, start, end, display ) {
                var api = this.api(), data;
                var numFormat = $.fn.dataTable.render.number( '\,', '.', 2, '' ).display;
             // Remove the formatting to get integer data for summation
                var floatVal = function (i) {
                    if (typeof i === "number") {
                        return i;
                    } else if (typeof i === "string") {
                        i = i.replace("$", "")
                        i = i.replace(",", "")
                        var result = parseFloat(i);
                        if (isNaN(result)) {
                            try {
                                var result = $(i).text();
                                result = parseFloat(result);
                                if (isNaN(result)) { result = 0 };
                                return result * 1;
                            } catch (error) {
                                return 0;
                            }
                        } else {
                            return result * 1;
                        }
                    } else {
                        alert("Unhandled type for totals [" + (typeof i) + "]");
                        return 0
                    }
                };
                
                api.columns([4]).every(function() {
    				var sum = this
    			    .data()
    			    .reduce(function(a, b) {
    			    var x = floatVal(a) || 0;
    			    var y = floatVal(b) || 0;
    			    	return x + y;
    			    }, 0);			
    				
    			    $(this.footer()).html(numFormat(sum));
    			});
            }                       
  	  	});
		
		
		
        $('#add_form').on("submit", function(event){  
            event.preventDefault();  
            
            $('#acc_id').val(acc_id);

            if($('#process_fee').val() == ""){  
                 alert("Process Fee is required");  
            }
            else if($('#add_payment').val() == ""){  
                alert("Add Payment is required");  
            } 			
            else{  
                 $.ajax({  
                      url:"trading.license.setup.ajax.php",  
                      method:"POST",  
                      data:{action:'add_new_bill', data: $('#add_form').serialize()},  
                      success:function(data){   
                           $('#editItem').modal('hide');  
                            $('#bootstrap-data-table').html(data);
                           location.reload();  
                      }  
                 });  
            }  
          });

        $(document).on('click', '.edit_data', function(){
        	var id = $(this).attr("id");        	
        	$.ajax({
        			url:"trading.license.setup.ajax.php",
        			method:"POST",
        			data:{action:'retrieve_account_details', id:id},
        			dataType:"json",
        			success:function(data){ 
            			console.log(data);           			        			
        				$('#id').val(id);					
                        $('#main_business_edit').val(data.main_business);      
                        $('#address_edit').val(data.address); 
                        $('#process_fee_edit').val(data.process_fee);      
                        $('#add_payment_edit').val(data.add_payment); 
                        $('#area_edit').val(data.area);                                     
                        $('#editItem').modal('show');
        			}
        		});
        });

        $('#update_form').on("submit", function(event){  
            event.preventDefault();              
            $.ajax({  
                url:"trading.license.setup.ajax.php",  
                method:"POST",  
                data:{action:'update_account_details', data: $('#update_form').serialize()},  
                success:function(data){  
                    if(data){
                  	  $('#editItem').modal('hide');  
                        location.reload();  
                    }                            
                }  
           }); 
          });
        
        $(document).on('click', '.delete_data', function(){
        	var id = $(this).attr("id");
        	$('#delete_record').data('id', id); //set the data attribute on the modal button
        
        });
      	
    	$( "#delete_record" ).click( function() {
    		var ID = $(this).data('id');
    		
    		$.ajax({
    			url:"trading.license.setup.ajax.php",
    			method:"POST",    
    			data:{action:'delete_account_details_item', id:ID},
    			success:function(data){	  						
    				$('#deleteItem').modal('hide');		
    				location.reload();		
    			}
    		});
    	});
        
        $('#from_date, #to_date, #date_received,#date_paid').datepicker({
              format: "dd-mm-yyyy",
              autoclose: true,
              orientation: "top left",
              todayHighlight: true
        });

        $('#from_date_edit, #to_date_edit, #date_paid_edit, #date_received').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
        });

        //format to dd-mm-yy
        function dateFormat(dates){
            var date = new Date(dates);
        	var day = date.getDate();
    	  	var monthIndex = date.getMonth()+1;
    	  	var year = date.getFullYear();

    	  	return (day <= 9 ? '0' + day : day) + '-' + (monthIndex<=9 ? '0' + monthIndex : monthIndex) + '-' + year ;
        }
        //yy-mm-dd
        function dateFormatRev(dates){
            var date = dates.split("-");
            var day = date[0];
            var month = date[1];
            var year = date[2];

            return year + '-' + month + '-' + day ;
        }
        
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
    });
  </script>
</body>
</html>