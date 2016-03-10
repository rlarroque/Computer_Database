<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="customLib"%>

<c:url value="/../resources/css" var="css" />
<c:url value="/../resources/js" var="js" />

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="global/head.jsp" />
</head>
<body>

	<jsp:include page="global/navbar.jsp" />

	<section id="main">
		<div class="container">
			<div class="row">
				<div class="col-xs-8 col-xs-offset-2 box">
					<h1><spring:message code="computer.add"/></h1>
					
					<form:form modelAttribute="computerToAdd" action="${pageContext.request.contextPath}/computer/add" method="POST" id="computer_form" name="computer_form">
						<fieldset>
							<form:errors cssClass="error" style="font-weight: bold; margin-bottom:20px;"/>
							<div class="form-group">
								<label for="computerName"><spring:message code="computer.name"/></label>
								<c:set var="name_placeholder"><spring:message code="placeholder.computer.name"/></c:set>
								<form:input type="text" class="form-control has-feedback" id="name" 
											name="name" placeholder="${name_placeholder}" 
											path="name"/>
								<form:errors path="name" cssClass="error" style="font-weight: bold; margin-bottom:20px;"/>
							</div>
							
							<div class="form-group">
								<label for="introduced"><spring:message code="computer.introduced"/></label>
								<c:set var="introduced_placeholder"><spring:message code="placeholder.computer.introduced"/></c:set>
								<form:input type="date" class="form-control has-feedback" id="introducedDate"
									   name="introducedDate" placeholder="${introduced_placeholder}"
									   path="introducedDate"/>
								<form:errors path="introducedDate" cssClass="error" style="font-weight: bold; margin-bottom:20px;"/>
							</div>
							
							<div class="form-group">
								<label for="discontinued"><spring:message code="computer.discontinued"/></label>  
								<c:set var="discontinued_placeholder"><spring:message code="placeholder.computer.discontinued"/></c:set>
								<form:input type="date" class="form-control has-feedback" id="discontinuedDate"
									   		name="discontinuedDate" placeholder="${discontinued_placeholder}"
									   		path="discontinuedDate"/>
								<form:errors path="discontinuedDate" cssClass="error" style="font-weight: bold; margin-bottom:20px;"/>
							</div>
							
							<div class="form-group">
								<label for="companyId"><spring:message code="computer.company"/></label> 
								<form:select class="form-control has-feedback" id="companyId" name="companyId" path="companyId">
									<form:option value="0">--</form:option>

									<c:forEach items="${companies}" var="companies">
										<form:option value="${companies.id}">${companies.name}</form:option>
									</c:forEach>

								</form:select>
							</div>
						</fieldset>
						<div class="actions pull-right">
							<input type="submit" value="<spring:message code="button.add"/>" class="btn btn-primary"/>
							or <a href=<customLib:link uri="${pageContext.request.contextPath}/dashboard" current_page="${page}"/> class="btn btn-default"><spring:message code="button.cancel"/></a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="global/scripts.jsp" />
	<script src="<c:url value="${js}/jquery.validate.js" />"></script>
	<script src="<c:url value="${js}/jquery.validate.additional.js" />"></script>
	<script src="<c:url value="${js}/validator.js" />"></script>
</body>
</html>