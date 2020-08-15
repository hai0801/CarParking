<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>List Trip</title>
<jsp:include page="include/head.jsp" />
</head>
<body>
	<div id="wrapper">
		<jsp:include page="include/navmenu.jsp" />

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Trip List</h1>

					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="container-fluid bg-light ">
					<div class="row align-items-center justify-content-center">
						<form action="${pageContext.request.contextPath}/search-trip" method="post">
							<div class="col-md-4 pt-3">
								<div class="form-group ">
									<div class="form-group input-group">
										<span class="input-group-addon"> <i class="fa fa-search"></i>
										</span> <input type="text" id="searchText" name="searchText" class="form-control"
											placeholder="Trip Search">
									</div>
								</div>
							</div>

							<div class="col-md-3 pt-3">
								<div class="form-group">
									<div class="form-group input-group">
										<span class="input-group-addon"> <i class="fa fa-filter"></i> Filter By
										</span> <select class="form-control selectpicker" name="filter">
											<option value="destination">Destination</option>
											<option value="departureTime">Departure time</option>
											<option value="driver">Driver</option>
											<option value="carType">Car type</option>
											<option value="maximumOnlineTicketNumber">Maximum online ticket number</option>
											<option value="DepartureDate">Departure date</option>
										</select>
									</div>
								</div>
							</div>
							<!-- Time picker -->
							<div class="col-md-2 pt-3">
								<div class="form-group">
									<div class="form-group input-group">
										<div class="input-group date form_time_search" data-date-format="hh:ii">
											<input class="form-control" type="text" name="departureTime"
												placeholder="HH:mm"> <span class="input-group-addon"> <span
												class="glyphicon glyphicon-time"></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<!-- Date picker -->
							<div class="col-md-2 pt-3" style="padding-right: 10px;">
								<div class="form-group">
									<div class="form-group input-group">
										<div class="input-group date form_date_search" data-date-format="dd-mm-yyyy">
											<input class="form-control" type="text" name="departureDate"
												placeholder="dd-mm-yyyy"> <span class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-1">
								<button title="Search Trip" type="submit" class="btn btn-info">Search</button>
							</div>
						</form>
					</div>
				</div>

				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<!-- /.panel-heading -->
							<div class="panel-body">
								<c:if test="${status != null && status == 'ok'}">
									<div class="alert alert-success alert-dismissible text-center">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>${message}</strong>
									</div>
								</c:if>
								<c:if test="${status != null && status == 'fail'}">
									<div class="alert alert-danger alert-dismissible text-center">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>${message}</strong>
									</div>
								</c:if>
								<c:if test="${trips.size() == 0}">
									<div class="alert alert-info alert-dismissible text-center">
										<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>No
											data found!</strong>
									</div>
								</c:if>
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover text-center">
										<thead style="background: #ECEDEE;">
											<tr>
												<th class="text-center">No</th>
												<th class="text-center">Destination</th>
												<th class="text-center">Departure time</th>
												<th class="text-center">Driver</th>
												<th class="text-center">Car type</th>
												<th class="text-center">Maximum online<br>ticket number
												</th>
												<th style="min-width: 100px;" class="text-center">Departure date</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${trips}" var="t">
												<tr>
													<td>${t.tripId}</td>
													<td>${t.destination}</td>
													<td>${t.departureTime}</td>
													<td>${t.driver}</td>
													<td>${t.carType}</td>
													<td>${t.maximumOnlineTicketNumber}</td>
													<td><fmt:formatDate pattern="dd-MM-yyyy" value="${t.departureDate}" /></td>
													<td><a class="btn btn-danger" role="button"
														href="<c:url value="delete-trip/${t.tripId}"/>"
														onclick="return confirm('Are you sure delete?');"> <i
																class="fa fa-trash"></i> Delete
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<ul class="pagination">
										<c:choose>
											<c:when test="${(page -1) < 1}">
												<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="<c:url value="/trip-list?page=${page -1}&searchText=${searchText}&filter=${filter}&departureTime=${departureTime}&departureDate=${departureDate}"/>">Previous</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="1" end="${totalPage}" varStatus="loop">
											<c:choose>
												<c:when test="${loop.count == page}">
													<li class="page-item active"><a class="page-link"
														href="<c:url value="/trip-list?page=${loop.count}&searchText=${searchText}&filter=${filter}&departureTime=${departureTime}&departureDate=${departureDate}"/>">${loop.count}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="<c:url value="/trip-list?page=${loop.count}&searchText=${searchText}&filter=${filter}&departureTime=${departureTime}&departureDate=${departureDate}"/>">${loop.count}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${(page +1 ) > totalPage}">
												<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="<c:url value="/trip-list?page=${page +1}&searchText=${searchText}&filter=${filter}&departureTime=${departureTime}&departureDate=${departureDate}"/>">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>

								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>
				<!-- /.row -->
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
