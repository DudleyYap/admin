<?php 
    require_once('../assets/config/database.php');
    require_once('../function.php');
    require_once('../check_login.php');
    global $conn_admin_db;
    
    $id = isset($_GET['id']) ? $_GET['id'] : "";
    
    
    $query = "SELECT * FROM u_property
					 INNER JOIN company ON company.id = u_property.company_id_1
																		
					WHERE u_property.up_id = '$id'";
    
    $result = mysqli_query($conn_admin_db, $query) or die(mysqli_error($conn_admin_db));
    $row = mysqli_fetch_assoc($result);

    $acc_id = $row['up_id'];
    $company = itemName("SELECT name FROM company WHERE id='".$row['company_id_1']."'");
    $address = $row['up_address'];
    $size = $row['up_size'];
    $area = $row['up_location'];
   
    //for image
    $image_query = "SELECT * FROM u_image WHERE acc_id = '$acc_id' ";
    $image_result = mysqli_query($conn_admin_db, $image_query) or die(mysqli_error($conn_admin_db));
    $arr_data_mf = [];
    while ($rows = mysqli_fetch_assoc($image_result)){
        $arr_data_mf[] = $rows;
    }
   

  

?>

<!doctype html><html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eng Peng Property</title>
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
    
    .center{
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 800px;
        height: 600px;

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
                                <strong class="card-title"><a href="property_list.php">Property List</a> > Images of Property</strong>
                            </div>     
                            <div class="card-body">                                       
                                <div class="col-sm-12">
                                    <label class=" form-control-label"><small class="form-text text-muted">Area : <?=$area?></small></label>                                        
                                </div>                                
                                <div class="col-sm-12">
                                	<label class=" form-control-label"><small class="form-text text-muted">Company: <?=$company?></small></label>                                    	
                                </div>
                                <div class="col-sm-12">
                                	<label class=" form-control-label"><small class="form-text text-muted">Size: <?=$size?></small></label>                                    
                                </div>
                                <div class="col-sm-12">
                                	<label class=" form-control-label"><small class="form-text text-muted">Location : <?=$address?></small></label>                                    
                                </div>   
                                <hr>           
                                <form method="POST" action="index.php" enctype="multipart/form-data">    
                                <input type="hidden" name="size" value ="1000000">
                                       <div class="col-sm-4">
                                    		<b>Images</b>
                                    	 </div>     
                                      
                                       <div class="card-body">
                                        <table id="image-table" class="table table-striped table-bordered">
                                          <thead>
                                           <tr>
                                          	<th>No.</th>
										                      	<th>Image</th>
                                            <th>Action</th>
                                           </tr>
                                          </thead>
                                          <tbody>                                        
                                        	<?php 
                                                    $count = 0;
                                                    if(!empty($arr_data_mf)){
                                                        foreach ($arr_data_mf as $data){
                                                          $count++;
                                                          $img = "<img class='center' src='uploads/".$data['image']."' >";

                                          ?>
                                                    <tr>
                                                        <td><?=$count?></td>
                                                        <td><?=$img?></td>						
                                                        <td class="text-center">
                                                        <span id="<?=$data['id']?>" data-toggle="modal" data="u_image" class="delete_data" data-target="#deleteItem"><i class="fas fa-trash-alt fa-2x"></i></span>
                                                        </td>
                                                    </tr>
                                    <?php }
                                            }?>             
                                    </tbody>     
                                        </table>
                                       </div>
                                </form>                                                                             
                            </div>
                         </div>
                    </div>
                </div>
          </div>
          </div>
  </div>

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
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/select2.min.js"></script>
    
	
	<script type="text/javascript">
    $(document).ready(function() {		
		var acc_id = '<?=$id?>';			
        $('#image-table').DataTable({
            "bInfo" : false,
            "bLengthChange": false,
            "searching": false,
            "dom": "lBtipr",
            "buttons": {
              "buttons": [
                {
                  text: "Add New Image",
                  action: function(e, dt, node, config) {
                    //trigger the bootstrap modal
                      window.open('addnew_image_process.php?id=<?=$acc_id?>');
                  }
                }
              ],
              "dom": {
                "button": {
                  tag: "button",
                  className: "btn btn-primary"
                },
                "buttonLiner": {
                  tag: null
                }
              }
            }
        });
     
	
       
      
        $(document).on('click', '.delete_data', function(){
        	var id = $(this).attr("id");
        	var database = $(this).attr("data");
        	
        	$('#delete_record').data('id', id); //set the data attribute on the modal button
        	$('#delete_record').data('database', database);
        
        });
      	
    	$( "#delete_record" ).click( function() {
    		var ID = $(this).data('id');
    		var DB = $(this).data('database');
    		$.ajax({
    			url:"u.new.renting.ajax.php",
    			method:"POST",    
    			data:{action:'delete_image', id:ID, database:DB},
    			success:function(data){	
        			if(data){
        				$('#deleteItem').modal('hide');		
        				location.reload();		
            		}  						    				
    			}
    		});
    	});


        $('#payment_date_mf, #received_date_mf, #paid_date, #due_date').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            orientation: "top left",
            todayHighlight: true
        });

        $(".tabs").tabs();
        var currentTab = $('.ui-state-active a').index();
        if(localStorage.getItem('activeTab') != null){
        	 $('.tabs > ul > li:nth-child('+ (parseInt(localStorage.getItem('activeTab')) + 1)  +')').find('a').click();
        }

         $('.tabs > ul > li > a').click(function(e) {
          var curTab = $('.ui-tabs-active');         
          curTabIndex = curTab.index();          
          localStorage.setItem('activeTab', curTabIndex);
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
        //format to dd-mm-yy
        function dateFormat(dates){
            var date = new Date(dates);
        	var day = date.getDate();
    	  	var monthIndex = date.getMonth()+1;
    	  	var year = date.getFullYear();

    	  	return (day <= 9 ? '0' + day : day) + '-' + (monthIndex<=9 ? '0' + monthIndex : monthIndex) + '-' + year ;
        }
    });
  </script>
</body>
</html>