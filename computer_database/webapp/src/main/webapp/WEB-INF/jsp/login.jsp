<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="global/head.jsp" />
</head>
<body>

	<jsp:include page="global/navbar.jsp" />
	
   	<div id="login-panel" class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link"><spring:message code="login.login"/></a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link"><spring:message code="login.register"/></a>
							</div>
						</div>
						<hr>
					</div>
					
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							
								<form id="login-form" action="${pageContext.request.contextPath}/login" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="username_login" id="username_login" tabindex="1" class="form-control"
										       placeholder="<spring:message code="placeholder.login.username"/>" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password_login" id="password_login" tabindex="2" class="form-control"
											   placeholder="<spring:message code="placeholder.login.password"/>">
									</div>
									<div class="form-group">
										<label class="checkbox">
											<label class="checkbox">
												<input type="checkbox" value="true"
													   id="rememberMe" name="_spring_security_remember_me"> Remember me</label>
										</label>
									</div>
									<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4"
													   class="form-control btn btn-login" value="<spring:message code="button.login"/>">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<button type="button" id="forgot-psw" class="btn btn-link">
														<spring:message code="login.forgot-password"/>
													</button>
												</div>
											</div>
										</div>
									</div>
								</form>

								<form:form modelAttribute="user" id="register-form" action="${pageContext.request.contextPath}/user/create" method="post" role="form" style="display: none;">
								<fieldset>
									<div class="form-group">
										<c:set var="username_placeholder"><spring:message code="placeholder.login.username"/></c:set>
										<form:input type="text" path="username" id="username" tabindex="1" class="form-control"
											   placeholder="${username_placeholder}"/>
									</div>
									<div class="form-group">
										<c:set var="password_placeholder"><spring:message code="placeholder.login.password"/></c:set>
										<form:input type="password" path="password" id="password" tabindex="2" class="form-control"
											   placeholder="${password_placeholder}"/>
									</div>
									<div class="form-group">
										<c:set var="confirm_password_placeholder"><spring:message code="placeholder.login.password.confirm"/></c:set>
										<form:input type="password" path="confirm_password" id="confirm_password" tabindex="2" class="form-control"
											   placeholder="${confirm_password_placeholder}"/>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" 
													   value="<spring:message code="button.register"/>">
											</div>
										</div>
									</div>
									</fieldset>
								</form:form>
							</div>
						</div>
					</div>
				</div>
				
				<c:if test="${param.error != null}">
					<div id="loginError" class="alert alert-danger text-center" role="alert">
						<spring:message code="error.authentification"/>
					</div>
				</c:if>
				
				<c:if test="${param.logout != null}">
					<div id="logout" class="alert alert-success text-center" role="alert">
					    <spring:message code="success.logout"/>
					</div>
				</c:if>			
			</div>
		</div>
	</div>
	
	<jsp:include page="global/scripts.jsp" />
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.additional.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/validator.js"></script>
	
	<script type="text/javascript">
		var localized_strings = new Array();
		localized_strings['password.forgot'] = "<spring:message code='error.password.forgot' javaScriptEscape='true' />";
		localized_strings['validation.username'] = "<spring:message code='validation.username' javaScriptEscape='true' />";
		localized_strings['validation.password'] = "<spring:message code='validation.password' javaScriptEscape='true' />";
		localized_strings['validation.password.confirm'] = "<spring:message code='validation.password.confirm' javaScriptEscape='true' />";
	</script>
	
</body>
</html>