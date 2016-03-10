<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="customLib"%>
<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="global/head.jsp" />
</head>
<body>

	<jsp:include page="global/navbar.jsp" />
	
	<section id="main">
		<div class="container">
			<h1 id="homeTitle">${page.totalComputer} <spring:message code="computer.found"/> </h1>
			<div id="actions" class="form-horizontal">
				<div class="pull-left">
					<form id="searchForm" action="${pageContext.request.contextPath}/dashboard" method="GET" class="form-inline">

						<input type="search" id="searchbox" name="filter"
							class="form-control" placeholder="<spring:message code="placeholder.search"/>" /> <input
							type="submit" id="searchsubmit" value="<spring:message code="button.filter"/>"
							class="btn btn-primary" />
					</form>
				</div>
				<div class="pull-right">
					<a class="btn btn-success" id="addComputer"
						href="${pageContext.request.contextPath}/computer/add"><spring:message code="button.add.computer"/></a> <a
						class="btn btn-default" id="editComputer" href="#"
						onclick="$.fn.toggleEditMode();"><spring:message code="button.edit"/></a>
				</div>
			</div>
		</div>

		<form id="deleteForm" action="computer/delete" method="POST">
			<input type="hidden" name="selection" value="">
		</form>

		<div class="container" style="margin-top: 10px;">
			<table class="table table-striped table-bordered" id="table_computers">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->

						<th class="editMode" style="width: 60px; height: 22px;"><input
							type="checkbox" id="selectall" /> <span id="deleteContainer"
							style="vertical-align: top;"> - <a href="#"
								id="deleteSelected" onclick="$.fn.deleteSelected();"> <i class="fa fa-trash-o fa-lg"></i>
							</a>
						</span></th>
						<th> <div class="parent">
								<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="name" override_order_type="ASC"/> class="child fa fa-sort-asc"></a>
							 	<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="name" override_order_type="DESC"/> style="margin-top: 7px;" class="child fa fa-sort-desc"></a>
						 	</div>
						 	<div class="child_link" ><spring:message code="computer.name"/></div>
						 </th>
						
						<th>
							<div class="parent">
								<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="introduced" override_order_type="ASC"/> class="child fa fa-sort-asc"></a>
							 	<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="introduced" override_order_type="DESC"/>  style="margin-top: 7px;" class="child fa fa-sort-desc"></a>
						 	</div>
						 	<div class="child_link" ><spring:message code="computer.introduced"/></div>
					 	</th>
						
						<th>
						<div class="parent">
								<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="discontinued" override_order_type="ASC"/> class="child fa fa-sort-asc"></a>
							 	<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="discontinued" override_order_type="DESC"/>  style="margin-top: 7px;" class="child fa fa-sort-desc"></a>
						 	</div>
						 	<div class="child_link" ><spring:message code="computer.discontinued"/></div>
						</th>
						
						<th>
							<div class="parent">
								<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="company_id" override_order_type="ASC"/> class="child fa fa-sort-asc"></a>
							 	<a href=<customLib:link uri="dashboard" current_page="${page}" override_order="company_id" override_order_type="DESC"/>  style="margin-top: 7px;" class="child fa fa-sort-desc"></a>
						 	</div>
						 	<div class="child_link" ><spring:message code="computer.company"/></div>
						</th>

					</tr>
				</thead>

				<tbody id="results">
					<c:forEach items="${page.computers}" var="computer">
						<tr>
							<td class="editMode"><input type="checkbox" name="cb"
								class="cb" value="${computer.id}"></td>
							<td><a href="${pageContext.request.contextPath}/computer/edit?computer=${computer.id}" onclick="">${computer.name}</a></td>
							<td>${computer.introducedDate}</td>
							<td>${computer.discontinuedDate}</td>
							<td>${computer.companyName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	
	<footer class="navbar-fixed-bottom">
		<div class="container text-center">
			<customLib:page page="${page}" langList="${languageList}"></customLib:page>
		</div>
	</footer>
	
	<jsp:include page="global/scripts.jsp" />
	
	<script type="text/javascript">
		var localized_strings = new Array();
		localized_strings['button.edit'] = "<spring:message code='button.edit' javaScriptEscape='true' />";
		localized_strings['button.view'] = "<spring:message code='button.view' javaScriptEscape='true' />";
	</script>
	
</body>
</html>