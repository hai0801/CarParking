<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<c:url value="/home"/>"> <i class="fa fa-plane"></i>
			Trip
		</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"
			onclick="alert('Feature under construction.')"> Welcome Nguyen Van Hai </a></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"
			onclick="alert('Feature under construction.')"> <i class="fa fa-sign-out fa-fw"></i>
				Logout
		</a></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="#"> <i class="fa fa-plane"></i> Trip manager<span
						class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level collapse in">
						<li><a href="<c:url value="/trip-list"/>"> <i class="fa fa-list"></i> Trip
								List
						</a></li>
						<li><a href="<c:url value="/add-trip"/>"> <i class="fa fa-plus"></i> Add
								Trip
						</a></li>
					</ul> <!-- /.nav-second-level --></li>

				<li><a href="#"> <i class="fa fa-ticket"></i> Ticket manager<span
						class="fa arrow"></span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="#" onclick="alert('Feature under construction.')"> <i class="fa fa-list"></i> Ticket List
						</a></li>
					</ul> <!-- /.nav-second-level --></li>

			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>