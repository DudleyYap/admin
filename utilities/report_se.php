<?php
require_once('../assets/config/database.php');
require_once('../function.php');
require_once('../check_login.php');
global $conn_admin_db;

$select_company = isset($_POST['company']) ? $_POST['company'] : "";
$year_select = isset($_POST['year_select']) ? $_POST['year_select'] : date("Y");
ob_start();
selectYear('year_select',$year_select,'submit()','','form-control form-control-sm','','');
$html_year_select = ob_get_clean();

$company_name = "";
if(!empty($select_company)){
    $company_name = itemName("SELECT name FROM company WHERE id = '$select_company'");
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
    <title>Report SESB</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- link to css -->
	<?php include('../allCSS1.php')?>
   <style>
        .hide{
            display:none
        }
        .button_search{
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
    <!-- /#header -->
    <!-- Content -->
        <div id="right-panel" class="right-panel">
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" id="printableArea">
                            <div class="card-header">
                                <h6><strong class="card-title">SESB</strong></h6>
                            </div>
                            <div class="card-body">
                                <form id="myform" enctype="multipart/form-data" method="post" action="">                	                   
                    	            <div class="form-group row col-sm-12">
                                        <div class="col-sm-3">
                                            <label for="date_start" class="form-control-label"><small class="form-text text-muted">Company</small></label>
                                            <?php
                                                $company = mysqli_query ( $conn_admin_db, "SELECT company_id,(SELECT UPPER(name) FROM company WHERE id=u_se_account.company_id)company_name FROM u_se_account GROUP BY company_id");
                                                db_select ($company, 'company', $select_company,'submit()','ALL','form-control form-control-sm','');
                                            ?>                           
                                        </div>
                                        <div class="col-sm-2">
                                        	<label for="acc_no" class="form-control-label"><small class="form-text text-muted">Year</small></label>
                                        	<?=$html_year_select;?>
                                        </div>
                                        <div class="col-sm-4">                                    	
                                        	<button type="submit" class="btn btn-sm btn-primary button_search ">View</button>
                                        </div>
                                     </div>    
                                </form>
                            </div>
                            <hr>
                            <div class="card-body">
                                <table id="sesb_table" class="table table-striped table-bordered" >
                                    <thead>
                                        <tr>                                        	
                                        	<th>Account No.</th>	
											<th>Owner</th>
											<th>Location</th>
											<th scope='col'>Jan</th>
                                            <th scope='col'>Feb</th>
                                            <th scope='col'>Mar</th>
                                            <th scope='col'>Apr</th>
                                            <th scope='col'>May</th>
                                            <th scope='col'>Jun</th>
                                            <th scope='col'>Jul</th>
                                            <th scope='col'>Aug</th>
                                            <th scope='col'>Sep</th>
                                            <th scope='col'>Oct</th>
                                            <th scope='col'>Nov</th>
                                            <th scope='col'>Dec</th>
											<th scope='col'>TOTAL</th>
                                        </tr>                                        									
                                    </thead>
                                    <tbody>                                      
                                    </tbody>  
                                    <tfoot id="tfoot">
<!--                                     	<tr> -->
<!--                                             <th colspan="3" class="text-right">Grand Total</th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                             <th class="text-right"></th> -->
<!--                                         </tr> -->
                                    </tfoot>                                 
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
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
	
	<script type="text/javascript">
      $(document).ready(function() {
          var company_name = '<?=$company_name;?>';
          var year = '<?=$year_select;?>';
          var res = company_name.concat('_'+year);
          
          var table = $('#sesb_table').DataTable({
              "searching": true,
              "paging": false,
              "order": [[ 15, "desc" ]],
              "ajax":{
                  "url": "all.report.ajax.php",  
                  "type":"POST",       	        	
             	 	"data" : function ( data ) {
      					data.action = 'report_monthly_sesb';
      					data.filter = '<?=$select_company?>';		
      					data.year = '<?=$year_select?>';		
         	        }         	                 
                 },
//                  "footerCallback": function( tfoot, data, start, end, display ) {
//        				var api = this.api(), data;
//        				var numFormat = $.fn.dataTable.render.number( '\,', '.', 2, '' ).display;

//       				api.columns([3,4,5,6,7,8,9,10,11,12,13,14,15], { page: 'current'}).every(function() {
//       					var sum = this
//       				    .data()
//       				    .reduce(function(a, b) {
//       				    var x = parseFloat(a) || 0;
//       				    var y = parseFloat(b) || 0;
//       				    	return x + y;
//       				    }, 0);			
      				       
//       				    $(this.footer()).html(numFormat(sum));
//       				}); 
//        			},
      			"columnDefs": [
                	  {
                	      "targets": [3,4,5,6,7,8,9,10,11,12,13,14,15], // your case first column
                	      "className": "text-right", 
                	      "render": $.fn.dataTable.render.number(',', '.', 2, '')               	                      	        	     
                	 }
      			],
                "dom": "Bfrtip",
                "buttons": {
                  "buttons": [
                    {
                      text: "Export to Excel",
                      extend: 'excelHtml5', 
                    },
                    {
                        text: "Print",
                        extend: 'print',
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
           });
          $.fn.dataTable.Api.register( 'sum()', function () {
              return this.flatten().reduce( function ( a, b ) {
                  return (a*1) + (b*1); 
          	});
          });
          $("#sesb_table").on('search.dt', function() {
              var numFormat = $.fn.dataTable.render.number( '\,', '.', 2, '' ).display;
              var jan = table.column( 3, {page:'current'} ).data().sum();
              var feb = table.column( 4, {page:'current'} ).data().sum();
              var mar = table.column( 5, {page:'current'} ).data().sum();
              var apr = table.column( 6, {page:'current'} ).data().sum();
              var may = table.column( 7, {page:'current'} ).data().sum();
              var jun = table.column( 8, {page:'current'} ).data().sum();
              var jul = table.column( 9, {page:'current'} ).data().sum();
              var aug = table.column( 10, {page:'current'} ).data().sum();
              var sep = table.column( 11, {page:'current'} ).data().sum();
              var oct = table.column( 12, {page:'current'} ).data().sum();
              var nov = table.column( 13, {page:'current'} ).data().sum();
              var dec = table.column( 14, {page:'current'} ).data().sum();
              var total = table.column( 15, {page:'current'} ).data().sum();
                      		
              jan = (jan == null) ? '&nbsp;' : numFormat(jan);        		
              feb = (feb == null) ? '&nbsp;' : numFormat(feb);
              mar = (mar == null) ? '&nbsp;' : numFormat(mar);        		
              apr = (apr == null) ? '&nbsp;' : numFormat(apr);
              may = (may == null) ? '&nbsp;' : numFormat(may);        		
              jun = (jun == null) ? '&nbsp;' : numFormat(jun);
              jul = (jul == null) ? '&nbsp;' : numFormat(jul);        		
              aug = (aug == null) ? '&nbsp;' : numFormat(aug);
              sep = (sep == null) ? '&nbsp;' : numFormat(sep);        		
              oct = (oct == null) ? '&nbsp;' : numFormat(oct);
              nov = (nov == null) ? '&nbsp;' : numFormat(nov);        		
              dec = (dec == null) ? '&nbsp;' : numFormat(dec);
              total = (total == null) ? '&nbsp;' : numFormat(total);        		        	
               	 
              var data = "<tr><th colspan='3' class='text-right'>Grand Total</th>";
              data += "<th class='text-right'>"+jan+"</th>";
              data +="<th class='text-right'>"+feb+"</th>";
              data +="<th class='text-right'>"+mar+"</th>";
              data +="<th class='text-right'>"+apr+"</th>";
              data +="<th class='text-right'>"+may+"</th>";
              data +="<th class='text-right'>"+jun+"</th>";
              data +="<th class='text-right'>"+jul+"</th>";
              data +="<th class='text-right'>"+aug+"</th>";
              data +="<th class='text-right'>"+sep+"</th>";
              data +="<th class='text-right'>"+oct+"</th>";
              data +="<th class='text-right'>"+nov+"</th>";
              data +="<th class='text-right'>"+dec+"</th>";
              data +="<th class='text-right'>"+total+"</th></tr>";
              
  			$("#tfoot").html(data);
          });
//           $('#date_start, #date_end').datepicker({
//               format: "dd-mm-yyyy",
//               autoclose: true,
//               orientation: "top left",
//               todayHighlight: true
//           });
      });
  </script>
</body>
</html>
