<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-3.4.1.min.js"/>" type="text/javascript"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/resources/js/metisMenu.min.js"/>"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/js/sb-admin-2.js"/>"></script>
<!-- Date Picker -->
<script src="<c:url value="/resources/picker/bootstrap-datetimepicker.js"/>"
	type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/resources/picker/custom-picker.js"/>"></script>
<!-- Select Picker -->
<script src="<c:url value="/resources/picker/bootstrap-select.js"/>"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		var selectOptions;
		if (localStorage.getItem("selectOptions")) {
			selectOptions = JSON.parse(localStorage.getItem("selectOptions"));
			Object.keys(selectOptions).forEach(function(select) {
				$("select[name=filter]").val(selectOptions[select]);
			});
		} else {
			selectOptions = {};
		}
		$("select").change(
				function() {
					var $this = $(this), selectName = $this.attr("filter");
					selectOptions[selectName] = $this.val();
					localStorage.setItem("selectOptions", JSON
							.stringify(selectOptions));
				});

	});
</script>

<script type="text/javascript">
	$("#other").click(function() {
		$("#target").focus();
	});
</script>

