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
                                <strong class="card-title">Update Payment</strong>
                            </div>
                            <form id="add_new_account" role="form" action="" method="post">
                                <div class="card-body card-block ">
									<!-- 1st layer section starts-->
                                    <div class="form-group row col-sm-12">
                                        <div class="col-sm-5">
                                            <label class="control-label "><small class="form-text text-muted">Bill Type</small></label>                                  
                                            <?php
                                                $bill_type = mysqli_query ( $conn_admin_db, "SELECT util_id, util_name FROM utility_type WHERE util_isActive <> 'No' ORDER BY `utility_type`.`util_name` ASC");
                                                db_select ($bill_type, 'utility_type', '','','-select-','form-control','');
                                            ?>
                                        </div>
										<div class="col-sm-4" style="display:none">
												<label for="licence_no" class=" form-control-label"><small class="form-text text-muted">Licence No.</small></label>
												<?php
													$vehicle = mysqli_query ( $conn_admin_db, "SELECT utradL_id, UPPER(utradL_licenceNo) FROM utility_trading_licence");
													db_select ($vehicle, 'licence_no', '','','-select-','form-control','');
												?>
										</div>  
                                    </div>
									<!-- 1st layer section ends-->
									
									<!-- 2nd layer section starts-->
                                    <div id="3" class="tranding_licence" style="display:">
										<div class="form-group row col-sm-12">
											                                                                   
										</div>
										<!--  *************************:::::::::::::::::::::::::::::************************* -->
										<hr>
										<div class="form-group row col-sm-12" >
										   <div class="col-sm-8" id="qra_company">
												<h3>Trading Licence<h3>
											</div>                                                                           
										</div>
										<!--  *************************:::::::::::::::::::::::::::::************************* -->
										<div class="form-group row col-sm-12" >
										   <div for="tlcompany" class="col-sm-4" id="qra_company">
												<label class="control-label"><small class="form-text text-muted">Company Reg. No.</small></label>
												<div class="input-group">
													<?php
													$tlcomp = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'   ORDER BY `company`.`name` ASC");
													db_select ($tlcomp, 'tlcompany', '','','-select-','form-control','');
												?>
												</div>
											</div>                                                                          
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-4">
												 <label for="qra_vendor" class=" form-control-label"><small class="form-text text-muted">Address</small></label><div class="input-group">
												<?php
													$tlcomp = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'   ORDER BY `company`.`name` ASC");
													db_select ($tlcomp, 'qra_vendor', '','','-select-','form-control','');
												?>
												</div>
											</div> 
											<div class="col-sm-4">
												 <label for="qra_owner" class=" form-control-label"><small class="form-text text-muted">Area</small></label>
												<input type="text" id="qra_owner" name="qra_owner"  class="form-control" disabled="">
											</div>   
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-4">
												 <label for="qra_refno" class=" form-control-label"><small class="form-text text-muted">Name</small></label>
												<input type="text" id="qra_refno" name="qra_refno" class="form-control"  disabled="">
											</div>   
											<div class="col-sm-4">
												 <label for="qra_tiltlot" class=" form-control-label"><small class="form-text text-muted">Owner</small></label>
												<input type="text" id="qra_tiltlot" name="qra_tiltlot" class="form-control" disabled="">
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-8">
												<label for="qra_address" class=" form-control-label"><small class="form-text text-muted">Business Nature</small></label>
												<textarea name="qra_address" id="tl_caddress" rows="3" class="form-control" disabled=""></textarea>
											</div>
										</div>
										
										<div class="form-group row col-sm-12" >
											<div class="col-sm-2">
												 <label for="qra_period" class=" form-control-label"><small class="form-text text-muted">Period<span style="color:red">*</span> </small></label>
												<input type="text" id="qra_period" name="qra_period" placeholder="Eg: 2020" class="form-control">
											</div>
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-3">
												 <label for="qra_annualfee" class=" form-control-label"><small class="form-text text-muted">Annual Fee (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="qra_annualfee" name="qra_annualfee" placeholder="RM" class="form-control" required="">
											</div>
											<div class="col-sm-3">
												 <label for="qra_discount" class=" form-control-label"><small class="form-text text-muted">Additional Fee (RM)</small></label>
												<input type="number" id="qra_discount" name="qra_discount" placeholder="(if any)" class="form-control">
											</div>   
										</div>	
										<!--  *************************:::::::::::::::::::::::::::::************************* -->
										<div class="form-group row col-sm-12">
											<div class="col col-sm-1"><small class="form-text text-muted">Remark</small></div>
											<div class="col-sm-6"><textarea name="tl_caddress" id="tl_caddress" rows="3" class="form-control" value=""></textarea></div>	
										</div>
										<!--  *************************:::::::::::::::::::::::::::::************************* -->
										<hr>	
									</div>
									<!-- 2nd layer section ends-->
									
									
									<!-- 3rd layer section starts-->
                                    <div id="4" class="quitrent_assessment" style="display:">
										<hr>
										<div class="form-group row col-sm-12" >
										   <div class="col-sm-8" id="qra_company">
												<h3>Quit Rent & Assessment<h3>
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12" >
										   <div for="qraId" class="col-sm-4" id="qra_company">
												<label class="control-label"><small class="form-text text-muted">Ref. No</small></label>
												<div class="input-group">
													<?php
													$qracomp = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'   ORDER BY `company`.`name` ASC");
													db_select ($qracomp, 'qraId', '','','-select-','form-control','');
												?>
												</div>
											</div>                                                                          
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-4">
												 <label for="qra_owner" class=" form-control-label"><small class="form-text text-muted">Owner</small></label>
												<input type="text" id="qra_owner" name="qra_owner" placeholder="Enter Owner Name" class="form-control" disabled="">
											</div>   
											<div class="col-sm-4">
												 <label for="qra_vendor" class=" form-control-label"><small class="form-text text-muted">Vendor</small></label>
												<input type="text" id="qra_vendor" name="qra_vendor" placeholder="Enter Vendor Name" class="form-control" disabled="">
											</div> 
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-4">
												 <label for="qra_refno" class=" form-control-label"><small class="form-text text-muted">Reference No.</small></label>
												<input type="text" id="qra_refno" name="qra_refno" placeholder="Enter Reference Number" class="form-control" disabled="">
											</div>   
											<div class="col-sm-4">
												 <label for="qra_tiltlot" class=" form-control-label"><small class="form-text text-muted">Title / Lot</small></label>
												<input type="text" id="qra_tiltlot" name="qra_tiltlot" placeholder="Enter Title / Lot" class="form-control" disabled="">
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-8">
												<label for="qra_address" class=" form-control-label"><small class="form-text text-muted">Adress</small></label>
												<textarea name="qra_address" id="tl_caddress" rows="3" class="form-control" placeholder="Enter Location" disabled=""></textarea>
											</div>
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-2">
												 <label for="qra_period" class=" form-control-label"><small class="form-text text-muted">Period</small></label>
												<input type="text" id="qra_period" name="qra_period" placeholder="Eg: 2020" class="form-control">
											</div>
										</div>
										<div class="form-group row col-sm-12" >
											<div class="col-sm-3">
												 <label for="qra_annualfee" class=" form-control-label"><small class="form-text text-muted">Annual Fee (RM)</small></label>
												<input type="number" id="qra_annualfee" name="qra_annualfee" placeholder="Enter Annual Fee Rate" class="form-control">
											</div>
											<div class="col-sm-3">
												 <label for="qra_discount" class=" form-control-label"><small class="form-text text-muted">Discount (RM)</small></label>
												<input type="number" id="qra_discount" name="qra_discount" placeholder="(if any)" class="form-control">
											</div>   
											<div class="col-sm-3">
												 <label for="qra_adjustment" class=" form-control-label"><small class="form-text text-muted">Adjustment (RM)</small></label>
												<input type="number" id="qra_adjustment" name="qra_adjustment" placeholder="(if any)" class="form-control">
											</div>  
											<div class="col-sm-3">
												 <label for="qra_interest" class=" form-control-label"><small class="form-text text-muted">Interest (RM)</small></label>
												<input type="number" id="qra_interest" name="qra_interest" placeholder="(if any)" class="form-control">
											</div>
										</div>
										<hr>
									</div>
									<!-- 3rd layer section ends-->
									
									<!-- Aaron THIS -->
									<div id="1" class="rental_payment_external" style="display:">
										<hr>
										<div class="form-group row col-sm-12" >
										   <div class="col-sm-8" id="qra_company">
												<h3>Rental Payment (External)<h3>
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-4" id="qra_company">
												<label class="control-label"><small class="form-text text-muted">Company</small></label>
												<div class="input-group">
													<?php
													$rentPay = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'  ORDER BY `company`.`name` ASC");
													db_select ($rentPay, 'rentPay', '','','-select-','form-control','');
												?>
												</div>
											</div> 
											<div class="col-sm-5" id="qra_company">
												<label class="control-label"><small class="form-text text-muted">Location</small></label>
												<div class="input-group">
													<?php
													$rentPay = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'  ORDER BY `company`.`name` ASC");
													db_select ($rentPay, 'rentPay', '','','-select-','form-control','');
												?>
												</div>
												<small class="help-block form-text" style="color: grey">Choose the right location based on the selected company.</small>
												<small class="help-block form-text" style="color: grey">*use land lot's column.</small>
											</div> 
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-3">
												 <label for="qra_discount" class=" form-control-label"><small class="form-text text-muted">Tenant(s)</small></label>
												<input type="text" id="qra_discount" name="qra_discount" value="*use lessee's column" class="form-control" disabled="">
											</div>  
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-3">
												 <label for="qra_discount" class=" form-control-label"><small class="form-text text-muted">Tenure Start</small></label>
												<input type="date" id="qra_discount" name="qra_discount" value="" class="form-control" disabled="">
											</div> 
											<div class="col-sm-3">
												 <label for="qra_discount" class=" form-control-label"><small class="form-text text-muted">Tenure End</small></label>
												<input type="date" id="qra_discount" name="qra_discount" value="" class="form-control" disabled="">
											</div>  
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-2">
												 <label for="qra_discount" class=" form-control-label"><small class="form-text text-muted">Rental Deposit (RM)</small></label>
												<input type="number" id="qra_discount" name="qra_discount" class="form-control" disabled="">
											</div>   
											<div class="col-sm-2">
												 <label for="qra_adjustment" class=" form-control-label"><small class="form-text text-muted">Utility Deposit (RM)</small></label>
												<input type="number" id="qra_adjustment" name="qra_adjustment"  class="form-control" disabled="">
											</div>  
											<div class="col-sm-2">
												 <label for="qra_interest" class=" form-control-label"><small class="form-text text-muted">Monthly Rental (RM)</small></label>
												<input type="number" id="qra_interest" name="qra_interest" class="form-control" disabled="">
											</div>
											<div class="col-sm-2" style="display:none">
												 <label for="qra_interest" class=" form-control-label"><small class="form-text text-muted">Rental / Tax Inv. (RM)</small></label>
												<input type="number" id="qra_interest" name="qra_interest" class="form-control" disabled="">
											</div>
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="offset-sm-1 col-sm-10">
												<label " class=" form-control-label"><small class="form-text text-muted" style="text-decoration:underline">Payment Record</small></label>
												<table class="table table-bordered" style="width:100%">
													<thead>
														<tr style="">
															<th rowspan="2" class="text-center align-middle" style="width:10%; ">Ref. No</th>
															<th rowspan="2"  style="width:20%; " class="text-center align-middle">Payment Made</th>
															<th rowspan="2"  style="width:20%;"  class="text-center align-middle">Payment for <br>(month)</th>
															<th colspan="2"  class="text-center">Bill</th>
															<th rowspan="2"  style="" class="text-center align-middle">Action</th>
														</tr>
														<tr style="">
															<th class="text-center"><small>Tax Invoice </small></th> <!--<i class="fa fa-tint"></i> -->
															<th class="text-center"><small>Official Recipt</small></th><!--<i class="fa fa-bolt"></i> -->
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="text-align:center"><a href="#" style="font-weight: bold;">25</a></td>
															<td style="text-align:center">18/02/2020</td>
															<td style="text-align:center">February</td>
															<td style="text-align:center"><a >AJ30029A</a></td>
															<td style="text-align:center"><a >AJ30029A-12</a></td>
															<td style="text-align:center">Edit</td>
														</tr>
														<tr>
															<td style="text-align:center"><a href="#" style="font-weight: bold;">29</a></td>
															<td style="text-align:center">19/03/2020</td>
															<td style="text-align:center">March</td>
															<td style="text-align:center"><a >AK33026Q</a></td>
															<td style="text-align:center"><a >AK33026Q-11</a></td>
															<td style="text-align:center">Edit</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-2">
												 <label for="rpe_taxinvoice" class=" form-control-label"><small class="form-text text-muted">Tax Invoice</small></label>
												<input type="text" id="rpe_taxinvoice" name="rpe_taxinvoice" placeholder="" class="form-control">
												<small class="help-block form-text" style="color: grey">Enter tax inovice no.</small>
											</div>   
											<div class="col-sm-2">
												 <label for="rpe_tiamount" class=" form-control-label"><small class="form-text text-muted">T.Invoice Amount (RM)</small></label>
												<input type="text" id="rpe_tiamount" name="rpe_tiamount" placeholder="RM" class="form-control">
											</div>   
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-2">
												 <label for="rpe_officialreceipt" class=" form-control-label"><small class="form-text text-muted">Official Receipt</small></label>
												<input type="text" id="rpe_officialreceipt" name="rpe_officialreceipt" placeholder="" class="form-control">
												<small class="help-block form-text" style="color: grey">Enter official receipt no.</small>
											</div>  
											<div class="col-sm-2">
												 <label for="rpe_oramount" class=" form-control-label"><small class="form-text text-muted">O.Receipt Amount (RM)</small></label>
												<input type="text" id="rpe_oramount" name="rpe_oramount" placeholder="RM" class="form-control">
											</div>  
										</div>
										<hr>
									</div>
									<!-- Aaron THIS -->
									
									<!-- rental for staff-->
									<div id="2" class="rental_payment_internal" style="display:">
										<hr>
										<div class="form-group row col-sm-12" >
										   <div class="col-sm-8" id="rpi">
												<h3>Rental Payment (Internal)<h3>
											</div>                                                                           
										</div>
										<div class="form-group row col-sm-12">
											<div class="col-sm-4" id="rpi_comp">
												<label class="control-label"><small class="form-text text-muted">Company</small></label>
												<div class="input-group">
													<?php
													$rpi_comp = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'  ORDER BY `company`.`name` ASC");
													db_select ($rpi_comp, 'rpi_company', '','','-select-','form-control','');
												?>
												</div>
											</div> 
											<div class="col-sm-4" id="rpi_loca" >
												<label class="control-label"><small class="form-text text-muted">Location</small></label>
												<div class="input-group">
													<?php
													$rpi_area = mysqli_query ( $conn_admin_db, "SELECT id, name FROM company WHERE utility_used = '1'  ORDER BY `company`.`name` ASC");
													db_select ($rpi_area, 'rpi_location', '','','-select-','form-control','');
												?>
												</div>
												<small class="help-block form-text" style="color: grey">Choose the correct location based on the selected company.</small>
											</div> 
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label fclass=" form-control-label"><small class="form-text text-muted">Tenant(s)</small></label>
												<input type="text" value="Aaron Dale J Chin" class="form-control" disabled="">
											</div>   
											<div class="col-sm-3">
												 <label class=" form-control-label"><small class="form-text text-muted">&nbsp;</small></label>
												<input type="text" value="Aaron Dale J Chin" class="form-control" disabled="">
											</div>  
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="offset-sm-1 col-sm-10">
												<label " class=" form-control-label"><small class="form-text text-muted" style="text-decoration:underline">Payment Record</small></label>
												<table class="table table-bordered" style="width:100%">
													<thead>
														<tr style="">
															<th rowspan="2" class="text-center align-middle" style="width:10%; ">Ref. No</th>
															<th rowspan="2"  style="width:20%; " class="text-center align-middle">Payment Made</th>
															<th rowspan="2"  style="width:20%;"  class="text-center align-middle">Payment for <br>(month)</th>
															<th colspan="4"  class="text-center">Bill</th>
															<th rowspan="2"  style="" class="text-center align-middle">Action</th>
														</tr>
														<tr style="">
															<th class="text-center"><small>Water (RM)</small></th> <!--<i class="fa fa-tint"></i> -->
															<th class="text-center"><small>Electricity (RM)</small></th><!--<i class="fa fa-bolt"></i> -->
															<th class="text-center"><small>Management (RM)</small></th><!--<i c;lass="fa fa-building"></i> -->
															<th class="text-center"><small>Monthly (RM)</small></th><!--<i class="fa fa-calendar"></i> -->
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="text-align:center"><a href="#" style="font-weight: bold;">25</a></td>
															<td style="text-align:center">18/02/2020</td>
															<td style="text-align:center">February</td>
															<td style="text-align:center">38.60</td>
															<td style="text-align:center">168.80</td>
															<td style="text-align:center">70.00</td>
															<td style="text-align:center">300.00</td>
															<td style="text-align:center">Edit</td>
														</tr>
														<tr>
															<td style="text-align:center"><a href="#" style="font-weight: bold;">29</a></td>
															<td style="text-align:center">19/03/2020</td>
															<td style="text-align:center">March</td>
															<td style="text-align:center">50.10</td>
															<td style="text-align:center">180.40</td>
															<td style="text-align:center">70.00</td>
															<td style="text-align:center">300.00</td>
															<td style="text-align:center">Edit</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="form-group row col-sm-12" sty;e="display:">
											<div class="col-sm-2">
												 <label for="rpi_rentpayMonth" class=" form-control-label"><small class="form-text text-muted">Payment for (month)<span style="color:red">*</span> </small></label>
												 <div class="input-group">
													<?php
													$rpsmonth = mysqli_query ( $conn_admin_db, "SELECT shotform, text FROM month");
													db_select ($rpsmonth, 'rpi_rentpayMonth', '','','-select-','form-control','');
												?>
												</div>
											</div> 
											<div class="col-sm-3">
												 <label class=" form-control-label"><small class="form-text text-muted">Monthly Rental (RM)</small></label>
												<input type="number" id="rpi_discount" placeholder="RM" class="form-control" disabled="">
											</div>  
										</div>
										<div class="form-group row col-sm-12" style="display:">
											<div class="col-sm-3">
												 <label for="rpi_adjustment" class=" form-control-label"><small class="form-text text-muted">Water Bill (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="rpi_adjustment" name="rpi_adjustment" placeholder="RM" class="form-control" required="required">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>  
											<div class="col-sm-3">
												 <label for="rpi_electricity" class=" form-control-label"><small class="form-text text-muted">Electricity Bill (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="rpi_electricity" name="rpi_electricity" placeholder="RM" class="form-control" required="required">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div><div class="col-sm-3">
												 <label for="rpi_managementbill" class=" form-control-label"><small class="form-text text-muted">Management Bill (RM)<span style="color:red">*</span> </small></label>
												<input type="number" id="rpi_managementbill" name="rpi_managementbill" placeholder="RM" class="form-control" required="required">
												<small class="help-block form-text" style="color: grey">Leave this empty if bill is paid by the company.</small>
											</div>		
										</div>
										<hr>
									</div>
									<!-- end of rental for staff-->
									
                                    <div class="card-body">
                                        <button type="submit" id="save" name="save" class="btn btn-primary">Save</button>
                                        <button type="button" id="cancel" name="cancel" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
                                    </div> <!-- end of buttons -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div>
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
        
    });
	
	$(document).ready(function(){
    	// Initialize select2
        var select2 = $("#tlcompany").select2({   
            selectOnClose: true
        });
        select2.data('select2').$selection.css('height', '38px');
        select2.data('select2').$selection.css('border', '1px solid #ced4da');
        
    });
	
	$(document).ready(function(){
    	// for quitrent and assessment
        var select2 = $("#qraId").select2({   
            selectOnClose: true
        });
        select2.data('select2').$selection.css('height', '38px');
        select2.data('select2').$selection.css('border', '1px solid #ced4da');
    });
	
    $(document).ready(function() {
        //declare empty array to temporary save the data in table
        // var TELEPHONE_LIST = []; not really understand what this is for
        /*
    	$('.billing').hide();  */
    	$('#tranding_licence, #quitrent_assessment, #rental_payment_external, #rental_payment_internal').hide();  	
    	
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
