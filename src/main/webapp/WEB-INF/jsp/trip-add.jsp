<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Trip Add</title>
<jsp:include page="include/head.jsp" />
</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<jsp:include page="include/navmenu.jsp" />

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Add Trip</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<c:if test="${conect != null}">
					<div class="alert alert-danger alert-dismissible text-center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>${conect}</strong>
					</div>
				</c:if>
				<div class="container-fluid bg-light ">
					<div class="row align-items-center justify-content-center">

						<mvc:form class="form-horizontal" modelAttribute="trip"
							action="${pageContext.request.contextPath}/${action}" method="post">
							<fieldset>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="destination" style="text-align: left;">Destination
										<span class="required">(*)</span>
									</label>
									<div class="col-md-4">
										<input id="destination" name="destination" placeholder="Enter Destination"
											class="form-control input-md" type="text" maxlength="55">
										<mvc:errors path="destination" cssClass="required" />
									</div>
								</div>

								<!-- Time input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="departure_time"
										style="text-align: left;">Departure time <span class="required">(*)</span></label>

									<div class="col-md-4">
										<div class="input-group date form_time_add" data-date-format="hh:ii">
											<input class="form-control" type="text" name="departureTime"
												placeholder="HH:mm"> <span class="input-group-addon"> <span
												class="glyphicon glyphicon-time"></span>
											</span>
										</div>
										<mvc:errors path="departureTime" cssClass="required" />
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="driver" style="text-align: left;">Driver
										<span class="required">(*)</span>
									</label>
									<div class="col-md-4">
										<input id="driver" name="driver" placeholder="Enter Driver"
											class="form-control input-md" type="text">
										<mvc:errors path="driver" cssClass="required" />
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="car_type" style="text-align: left;">Car
										type <span class="required">(*)</span>
									</label>
									<div class="col-md-4">
										<input id="car_type" name="carType" placeholder="Enter Car type"
											class="form-control input-md" type="text">
										<mvc:errors path="carType" cssClass="required" />
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="max_ticket" style="text-align: left;">Maximum
										online ticket number <span class="required">(*)</span>
									</label>
									<div class="col-md-4">
										<input id="max_ticket" name="maximumOnlineTicketNumber" placeholder="0"
											class="form-control input-md" type="text">
										<mvc:errors path="maximumOnlineTicketNumber" cssClass="required" />
									</div>
								</div>

								<!-- Date input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="departure_date"
										style="text-align: left;">Departure date <span class="required">(*)</span></label>
									<div class="col-md-4">
										<div class="input-group date form_date_add" data-date-format="dd-mm-yyyy">
											<input class="form-control" type="text" name="departureDate"
												placeholder="dd-mm-yyyy"> <span class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
										<mvc:errors path="departureDate" cssClass="required" />
									</div>
								</div>

								<!-- Button -->
								<div class="form-group">
									<div class="col-md-7 text-center">
										<button id="singlebutton" name="reset" type="reset" class="btn btn-warning">
											<i class="fa fa-undo"></i>
											Reset
										</button>

										<button id="singlebutton" type="submit" class="btn btn-success">
											<i class="fa fa-plus"></i>
											Add
										</button>
									</div>
								</div>

							</fieldset>
						</mvc:form>

					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<footer class="footer" style="background: #ECEDEE;">
		<div class="container">
			<p class="text-muted text-center" style="padding: 25px;">© 2020 Copyright: Nguyen
				Van Hai.</p>
		</div>
	</footer>
	<jsp:include page="include/foot.jsp" />
</body>

</html>
