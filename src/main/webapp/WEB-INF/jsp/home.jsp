<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
						<h1 class="page-header">Menu</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<a class="btn btn-success" role="button" href="<c:url value="trip-list"/>">
					<i class="fa fa-list"></i> List
				</a>
				<a class="btn btn-info" role="button" href="<c:url value="add-trip"/>">
					<i class="fa fa-plus"></i> Add
				</a>

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<footer class="footer" style="height: 50px;">
		<div class="container">
			<p class="text-muted text-center" style="padding: 25px;">© 2020 Copyright: Nguyen Van Hai.</p>
		</div>
	</footer>
</body>
</html>