<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/assets/projectjs/Quotation.js"></script>

<style>
/* #sortable th{ text-align: center; } .equipmentSerialno{ width:50px; } .equipmentName{ width:100px } #sortable th{ width:50%; }.equipmentunitOfMeasurement{ width:80px; } .equipmentUnitCost{ width:80px; }.equipmentQuantity{ width:80px; } .sgdd, .equipmentItemCode{ width:80px; }
 */
th {
	text-align: left;
}

table.tabll td {
	white-space: wrap;
	word-wrap: break-word;
	/* text-overflow: ellipsis;
	overflow: hidden;
	max-width: 1px; */
	text-align: justify;
}

h2 {
	margin-bottom: 10px;
}

.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover
	{
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #0754a4;
	border-color: #0754a4;
}

button.dropdown-toggle {
	padding: 14px;
}

.btn-primary {
	color: #fff;
	background-color: #0754a4;
	border-color: #0754a4;
}

input[type="button"] {
	border: none;
	background-color: #0754a4;
	color: #fff;
	padding: 7px 9px;
}

input[type="submit"] {
	border: none;
	background-color: #0754a4;
	color: #fff;
	padding: 7px 9px;
}

button {
	border: none;
	background-color: #0754a4;
	color: #fff;
	padding: 7px 9px;
}

table {
	table-layout: auto;
}

table th {
	background-color: #0754a4;
	color: #fff;
	padding: 7px 0px;
	margin: 0;
}

.table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th
	{
	padding: 4px 0px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
	width: auto;
}

table td {
	width: auto;
	align: center;
}

table tr.footable-filtering>th {
	background-color: #FFF;
}

div.input-group-btn {
	position: relative;
	left: 6px;
	bottom: 2px;
}

.btn {
	display: inline-block;
	padding: 9px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

table.footable-details>tbody>tr>th:nth-child(1) {
	background-color: #FFF;
	color: 000;
	vertical-align: middle;
}
</style>


</head>
<body class="appear-animate">
	<c:choose>
		<c:when test="${not empty edit}">
			<c:url value="/quotation/updatequotation" var="updateUrl" />
			<c:set var="var_url" value="${updateUrl}" />
			<c:set var="submit_caption" value="Update" />

		</c:when>

		<c:otherwise>
			<c:url value="/quotation/addquotation" var="addurl" />
			<c:set var="var_url" value="${addurl}" />
			<c:set var="submit_caption" value="Add" />

		</c:otherwise>
	</c:choose>


	<!-- Head Section -->

	<section class="small-section bg-dark-alfa-30 parallax-2"
		style="margin-bottom:-70px;position:relative"
		data-background="${pageContext.servletContext.contextPath}/resources/assets/images/full-width-images/section-bg-18.jpg">
	<div class="relative container align-left">
		<div class="row">
			<div class="col-md-8">
				<h1 class="hs-line-11 font-alt mb-10 mb-xs-0"
					style="margin-top: 5px">ADD QUOTATION</h1>
			</div>

			<div class="col-md-4 mt-30">
				<div class="mod-breadcrumbs font-alt align-right">
					<a class="label-click"
						href="${pageContext.servletContext.contextPath}/dashboard">Dashboard</a>&nbsp;/&nbsp;<a
						class="label-click" href=""> Add Quotation</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<div class="clearfix"></div>

	<!-- End Head Section -->
	<div style="height: 100px; position: relative"></div>
	<div class="container" style="width: 100%;">
		<div class="row">
			<div class="col-xs-3 col-sm-3 col-lg-3 col-md-3">
				<jsp:include page="/WEB-INF/views/menu.jsp" />
			</div>
			<div class="col-xs-9 col-sm-9 col-lg-9 col-md-9"
				style="padding-left: 0px; padding-right: 0px;">

				<form:form class="form contact-form" id="contact_form"
					action="${var_url}" commandName="quotation">
					<div class="clearfix">
						<div>
							<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
								style="margin-bottom: 20px; position: relative; border-bottom: 1px dashed #808080">
								${submit_caption} Quotation</h2>

							<c:if test="${not empty success}">
								<div class="success">${success}</div>
							</c:if>
							<c:if test="${not empty fail}">
								<div class="error">${fail}</div>
							</c:if>
						</div>
						<div class="form-group">
							<form:hidden path="id" />
							<form:hidden path="quotationCode" />
							<form:hidden path="workspace" />
							<form:hidden path="type" />
							<form:input type="text" path="quotationDate" id="quotationDate"
								class="input-md round form-control"
								placeholder="Installation Date" style="width:25%" />

							<img
								src="${pageContext.servletContext.contextPath}/resources/assets/date/cal.png"
								onclick="javascript: NewCssCal('quotationDate','ddMMyyyy')"
								style="cursor: pointer; width: 30px" />
							<form:errors path="quotationDate" />
						</div>
						<div class="form-group">
							<form:input type="text" path="validity" id="validity"
								class="input-md round form-control" placeholder="Validity" />
							<form:errors path="validity" />
						</div>
						<div class="form-group">
							<form:input type="text" path="quotationFor" id="clientname"
								class="input-md round form-control" placeholder="Client Name" />
							<form:errors path="quotationFor" />
						</div>
						<div class="form-group">
							<form:textarea path="quotationDescription" name="description"
								class="input-md round form-control col-lg-3"
								style="margin-bottom:10px" placeholder="Description"></form:textarea>
						</div>
						<div class="form-group">
							<form:input type="text" path="refrenceno" id="refno"
								class="input-md round form-control"
								placeholder="SITE Reference No." />
							<form:errors path="refrenceno" />
						</div>
						<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
							style="margin-bottom: 20px; position: relative; border-bottom: 1px dashed #808080">
							Add SOR</h2>
						<div class="form-group">

							<button type="button" data-toggle="modal" data-target="#myModal2">Add
								SOR</button>

						</div>

					</div>

					<div class="clearfix"></div>

					<table class="" id="sortable">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Equip Type</th>
								<th>Item Code</th>
								<th>Equipment</th>
								<th>Description</th>
								<th>Unit</th>
								<th>Unit Price</th>
								<th>Qty</th>
								<th>Price In SGD</th>
								<th>Remarks</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="sortbody">
							<c:forEach items="${quotation.equipmentList}" var="sorequip"
								varStatus="i">
								<tr>
									<td><input style="width: 35px;" type="text" readonly
										class="equipmentSerialno"
										name="equipmentList[${i.index}].serialno"
										value="${sorequip.serialno}"></td>
									<td><input style="width: 125px;" type="text" readonly
										class="equipmentType"
										name="equipmentList[${i.index}].equipType"
										value="${sorequip.equipType}"></td>
									<td><input style="width: 96px;" type="text" readonly
										class="equipmentItemCode"
										name="equipmentList[${i.index}].itemCode"
										value="${sorequip.itemCode}"></td>
									<td><input type="text" readonly class="equipmentName"
										name="equipmentList[${i.index}].equipName"
										value="${sorequip.equipName}"></td>
									<td><input type="text" readonly
										class="equipmentDescription"
										name="equipmentList[${i.index}].description"
										value="${sorequip.description}"></td>
									<td><input style="width: 44px;" type="text" readonly
										class="equipmentunitOfMeasurement"
										name="equipmentList[${i.index}].unitOfMeasure"
										value="${sorequip.unitOfMeasure}"></td>
									<td><input style="width: 100px;" type="text" readonly
										class="equipmentUnitCost"
										name="equipmentList[${i.index}].unitCost"
										value="${sorequip.unitCost}"></td>
									<td><input style="width: 45px;" type="text"
										class="equipmentQuantity"
										name="equipmentList[${i.index}].quantity"
										value="${sorequip.quantity}"></td>
									<c:set value="${sorequip.unitCost * sorequip.quantity}"
										var="result" />

									<td><input style="width: 100px;" type="text" readonly
										value="${result}" class="sgdd" name="sgd"></td>
									<td><input style="width: 87px;" type="text"
										class="equipmentRemarks"
										name="equipmentList[${i.index}].remarks"
										value="${sorequip.remarks}"></td>
									<td><a style="margin-left: 20px;" class="btn-remove-tr"><i
											class="fa fa-trash"></i></a></td>
								</tr>


							</c:forEach>

						</tbody>
					</table>

					<div class="clearfix"></div>
					<br />
					<div class="form-group">
						<input type="text" style="float: right;" readonly name="subtotal"
							id="sorsubtotal" class="input-md round col-lg-3"
							placeholder="Sub Total" />
					</div>
					<div class="clearfix"></div>
					<br />
					<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
						style="margin-bottom: 20px; position: relative; border-bottom: 1px dashed #808080">
						Star Rate Items</h2>

					<div class="form-group">
						<input type="button" id="btnResult" value="Add" />
					</div>


					<div class="form-group">
						<table class="" id="tblResult">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Description</th>
									<th>Unit</th>
									<th>Unit Price</th>
									<th>Qty</th>
									<th>Total Cost</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${quotation.otherVendorEquipmentList}"
									var="othervendorequip" varStatus="i">
									<tr>
										<td><input type="text" class="othervendorserialno"
											name="otherVendorEquipmentList[${i.index}].serialno"
											value="${othervendorequip.serialno}"></td>
										<td><textarea style="width: 153px;"
												class="othervendordescription"
												name="otherVendorEquipmentList[${i.index}].description">${othervendorequip.description}</textarea></td>
										<td><input type="text" class="othervendorunit"
											name="otherVendorEquipmentList[${i.index}].unitOfMeasure"
											value="${othervendorequip.unitOfMeasure}"></td>
										<td><input type="text" class="othervendorprice"
											name="otherVendorEquipmentList[${i.index}].unitPrice"
											value="${othervendorequip.unitPrice}"></td>
										<td><input type="text" class="othervendorquantity"
											name="otherVendorEquipmentList[${i.index}].qty"
											value="${othervendorequip.qty}"></td>
										<td><input style="width: 127px;" type="text"
											class="othervendorcost"
											name="otherVendorEquipmentList[${i.index}].cost"
											value="${othervendorequip.cost}"></td>
										<td><a class="btn-tr-remove" style="margin-left: 25px;"><i
												class="fa fa-trash"></i></a></td>
									</tr>


								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
						<input type="text" style="float: right;" readonly name="subtotal"
							id="otherveneqsubtotal" class="input-md round col-lg-3"
							placeholder="Sub Total" />
					</div>
					<div class="clearfix"></div>
					<br />
					<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
						style="margin-bottom: 20px; position: relative; border-bottom: 1px dashed #808080">
						Add Labour Rate</h2>
					<div class="form-group">
						<button type="button" data-toggle="modal" data-target="#myModal">Add
							labour</button>
					</div>
					<div class="form-group">
						<table class="" id="labourtable">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Item Code</th>
									<th>Description</th>
									<th>Unit</th>
									<th>Unit Price</th>
									<th>Qty</th>
									<th>Total</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody id="labourbody">
								<c:forEach items="${quotation.labourRateList}" var="labourrate"
									varStatus="i">
									<tr>
										<td><input style="width: 44px;" type="text" readonly
											class="labourSerialno"
											name="labourRateList[${i.index}].serialno"
											value="${labourrate.serialno}"></td>
										<td><input type="text" readonly class="labouritemCode"
											name="labourRateList[${i.index}].itemCode"
											value="${labourrate.itemCode}"></td>
										<td><input type="text" readonly class="labourDescription"
											name="labourRateList[${i.index}].description"
											value="${labourrate.description}"></td>
										<td><input style="width: 100px;" type="text" readonly
											class="labourUnit"
											name="labourRateList[${i.index}].unitOfMeasure"
											value="${labourrate.unitOfMeasure}"></td>
										<td><input type="text" readonly class="labourcost"
											name="labourRateList[${i.index}].unitCost"
											value="${labourrate.unitCost}"></td>
										<td><input style="width: 44px;" type="text"
											class="labourQuantity" name="labourRateList[${i.index}].qty"
											value="${labourrate.qty}"></td>
										<c:set value="${labourrate.unitCost*labourrate.qty }"
											var="labtotal"></c:set>
										<td><input type="text" readonly class="labourtotal"
											value="${labtotal}" name="total"></td>
										<td><a class="btn-remove-tr"><i class="fa fa-trash"></i></a></td>
									</tr>

								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
						<input type="text" style="float: right;" readonly name="subtotal"
							id="laboursubtotal" class="input-md round col-lg-3"
							placeholder="Sub Total" />
					</div>
					<div class="clearfix"></div>
					<br />
					<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
						style="margin-bottom: 20px; position: relative; border-bottom: 1px dashed #808080">
						Other Rate</h2>
					<div class="form-group">
						<input type="button" id="btnResul" value="Add" />
					</div>

					<div class="form-group">

						<table class="table" id="tblResul">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Description</th>
									<th>Unit</th>
									<th>Unit Price</th>
									<th>Qty</th>
									<th>Total Cost</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${quotation.otherVendorLabourList}"
									var="othervendorlaboutlist" varStatus="i">
									<tr>
										<td><input type="text" readonly
											class="othervendorlablistserialno"
											name="otherVendorLabourList[${i.index}].serialno"
											value="${othervendorlaboutlist.serialno}"></td>
										<td><textarea class="othervendorlablistdescription"
												name="otherVendorLabourList[${i.index}].description">${othervendorlaboutlist.description}</textarea></td>
										<td><input type="text" class="othervendorlablistunit"
											name="otherVendorLabourList[${i.index}].unitOfMeasure"
											value="${othervendorlaboutlist.unitOfMeasure}"></td>
										<td><input type="text" class="othervendorlablistprice"
											name="otherVendorLabourList[${i.index}].unitPrice"
											value="${othervendorlaboutlist.unitPrice}"></td>
										<td><input style="width: 35px;" type="text"
											class="othervendorlablistqty"
											name="otherVendorLabourList[${i.index}].qty"
											value="${othervendorlaboutlist.qty}"></td>
										<td><input type="text" class="othervendorlablistcost"
											name="otherVendorLabourList[${i.index}].cost"
											value="${othervendorlaboutlist.cost}"></td>
										<td><a class="btn-removeee" style="margin-left: 10px"><i
												class="fa fa-trash"></i></a></td>
									</tr>


								</c:forEach>
							</tbody>
						</table>
					</div>
					<!--   <div class="clearfix"></div> -->


					<div>
						<input type="text" style="float: right; width: 250px" readonly
							name="subtotal" id="othervendotlablistsubtotal"
							class="input-md round " placeholder="Sub Total" />
					</div>
                                          &nbsp;&nbsp;
                                     
  <h2 class="section-title font-alt align-left mb-70 mb-sm-40"
						style="margin-bottom: 20px; position: relative; border-bottom: 1px dashed #808080">
						CALCULATIONS</h2>

					<!--   <div class="clearfix"></div> -->
					<div style="display: inline-block">
						<label> Actual Amount</label>
					</div>
                                          &nbsp;&nbsp;
                                        <div
						style="display: inline-block">
						<form:input type="text" readonly="true" path="actualamount"
							id="actualamount" class="input-md round "
							placeholder="Actual Amount" />
					</div>
                                          &nbsp;&nbsp;
                                         <div
						style="display: inline-block">
						<label> Select Emergency/Discount</label>
					</div>
					<div style="display: inline-block">
						<div>

							<form:select style="width: 184px;height: 37px;" path="value"
								class="target">

								<form:option value="Emergency">Emergency Charges</form:option>
								<form:option value="Discount">Discount Charges</form:option>
							</form:select>


						</div>
					</div>
                                        &nbsp;&nbsp; &nbsp;&nbsp;  
                                    
                                      <div style="display: inline-block">
						<label id="labper"> Emergency %</label>
					</div>


					<div style="display: inline-block">

						<form:input type="text" style=" width: 95px;"
							path="emergencyOrDiscountPercent" id="emerper"
							class="input-md round " />

					</div>
					<div class="clearfix"></div>
					<br />

					<div style="display: inline-block">
						<label id="labamount"> Emergency Amount</label>
					</div>
                                         &nbsp;&nbsp;
                                        <div
						style="display: inline-block">

						<input style="width: 282px;" type="text" id="emeramt"
							class="input-md round "
							placeholder="Emergency or Discount Amount" readonly="true" />

					</div>
                                         &nbsp;&nbsp;
                                          
                                        <div
						style="display: inline-block">
						<label id="aae"> Amount After Emergency</label>
					</div>
                                         &nbsp;&nbsp;
                                        <div
						style="display: inline-block">
						<form:input style=" width: 266px;" type="text" path="amountafter"
							id="emerafterr" class="input-md round "
							placeholder="Amount after emergency or Discount" readonly="true" />

					</div>
                                         &nbsp;&nbsp;
                                        <div class="clearfix"></div>
					<br />

					<div style="display: inline-block">
						<label> GST %</label>
					</div>
                                        &nbsp;&nbsp; &nbsp;&nbsp;
                                        <div
						style="display: inline-block">
						<form:input type="text" path="gst" id="gst"
							class="input-md round " placeholder="GST in %" />
					</div>
                                        &nbsp;&nbsp; &nbsp;&nbsp;
                                        <div
						style="display: inline-block">
						<label> GST Amount</label>
					</div>
                                        &nbsp;&nbsp; &nbsp;
                                        <div
						style="display: inline-block">
						<input type="text" readonly name="gstamount" id="gstamount"
							class="input-md round " placeholder="GST Amount" />
					</div>
                                        &nbsp;&nbsp;
                                       
                                        <div
						style="display: inline-block">
						<label>Grand Amount[SGD]</label>
					</div>
                                         &nbsp; 
                                        <div
						style="display: inline-block">
						<form:input type="text" readonly="true" path="totalAmount"
							id="grandamount" class="input-md round "
							placeholder="Grand  Total Amount" />
					</div>
					<div class="clearfix"></div>
					<br />
					<div class="form-group">
						<div class="form-group">
							<form:textarea path="remarks"
								class="input-md round form-control col-lg-3"
								style="margin-bottom:10px" placeholder="Terms & Conditions"></form:textarea>
						</div>
					</div>
					<div class="clearfix"></div>
					<br />
					<div class="form-group">


						<input type="submit" id="btnCreate" value="${submit_caption}" />
					</div>
				</form:form>
			</div>
		</div>


		<!-- Modal Labour Rates-->
		<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content" style="height: auto;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
								style="margin-bottom: 3px; position: relative; border-bottom: 1px dashed #808080">
								Add Labour Rates</h2>
						</div>
						<div class="modal-body">
							<div>


								<div class="clearfix"></div>
								<c:url value="/labourRate/getlabourrate/" var="laburl" />
								<input type="hidden" id="laburl" value="${laburl}">
								<!--  <div class="form-group">
                              <input type="search"  id="mylabour" onkeyup="myLabourFunction()" name="search" id="search" placeholder="Search" class="input-md round form-control">
                      </div>  -->
								<table class="table ta tabll" id="tblRes1" data-paging="true"
									data-filtering="true">
									<thead>

										<tr>

											<th data-formatter="formatte" data-type="text"></th>
											<th></th>
											<th data-breakpoints="all"></th>

										</tr>

									</thead>
									<%--   <tbody>
                                                                <tr>
                                                                
                                                                 <c:forEach items="${labList}" var="lr">
                                                                <tr>
                                                                
                                                                <td><input  type="checkbox" value="${lr.id}"></td>
                                                                <td>${lr.itemCode}</td>
   																<td>${lr.description}</td>
                                                                <td>${lr.unit}</td>
                                                                <td>${lr.rate}</td>
                                                                </tr>
                                                                </c:forEach>
                                                            </tbody> --%>
								</table>

								<div class="form-group"
									style="position: relative; bottom: 5px;">
									<input type="button" id="addtolabour" value="Add" />
								</div>
							</div>
						</div>
						<!--   <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  --->
					</div>

				</div>
			</div>

		</div>

		<!-- Modal SOR-->
		<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->

					<div class="modal-content" style="height: auto;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="section-title font-alt align-left mb-70 mb-sm-40"
								style="margin-bottom: 3px; position: relative; border-bottom: 1px dashed #808080">
								Add SOR</h2>
						</div>

						<div class="modal-body">
							<div class="clearfix">
								<div>
									<c:url value="/SOR/getSOR/" var="sorurl" />
									<input type="hidden" id="sorurl" value="${sorurl}">
									<!--  <div class="form-group">
                              <input type="search"  id="myInput"  name="search" id="search" placeholder="Search" class="input-md round form-control">
                      </div>     -->
									<div class="clearfix"></div>
									<table class="tabl tab tabll table table-stripped" id="tblRes2"
										data-paging="true" data-filtering="true"
										data-breakpoints="all">
										<thead>

											<tr>

												<th data-formatter="formatter" data-type="text"></th>
												<th></th>
												<th></th>
												<th></th>
												<th data-breakpoints="all"></th>

											</tr>

										</thead>

									</table>
									<div class="clearfix"></div>
									<div class="form-group"
										style="position: relative; bottom: 5px;">
										<input type="button" id="addtoquot" value="Add" />
									</div>
								</div>
							</div>
						</div>
						<!--  <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div> -->
					</div>

				</div>
			</div>

		</div>

	</div>

	<!-- End Contact Form -->
	<script type="text/javascript">
		// $("#contact_form").validate();

		/* jQuery(function($){
		 

			$('.tablee').footable({
				"columns": $.get('${pageContext.servletContext.contextPath}/resources/assets/columns.json'),
				"rows": $.get('${pageContext.servletContext.contextPath}/resources/assets/columns.json/rows.json')
		});   
		
		} */

		jQuery(function($) {
			$('.tabl')
					.footable(
							{
								"columns" : [ {
									"name" : "id",
									"title" : "ID"
								}, {
									"name" : "equipmentType",
									"title" : "Equip Type"
								}, {
									"name" : "itemCode",
									"title" : "Item Code"
								}, {
									"name" : "equipmentName",
									"title" : "Equipment"
								}, {
									"name" : "description",
									"title" : "Description"
								}, {
									"name" : "unit",
									"title" : "Unit"
								}, {
									"name" : "rate",
									"title" : "Unit Price"
								} ],
								"rows" : $
										.get('${pageContext.servletContext.contextPath}/SOR/getallsor')
							});
		});
		function formatter(value) {
			/*    var va= this;
			   console.dir(va);
			   console.log("vhjv"+value); */
			return "<input type='checkbox' value= "+value+" >";
		}

		jQuery(function($) {
			$('.ta')
					.footable(
							{
								"columns" :[
								            {"name":"id","title":"ID"},
								            {"name":"itemCode","title":"Item Code"},
								            {"name":"description","title":"Description"},
								            {"name":"unit","title":"Unit"},
								            {"name":"rate","title":"Unit Price"}
								          ],
								"rows" : $
										.get('${pageContext.servletContext.contextPath}/labourRate/getworkspacelabourrate')
							});
		});
		function formatte(value) {
			/*    var va= this;
			   console.dir(va);
			   console.log("vhjv"+value); */
			return "<input type='checkbox' value= "+value+" >";
		}

		/*  jQuery(function($){
		 $('.tab').footable();
		 }); */
	</script>





</body>
</html>