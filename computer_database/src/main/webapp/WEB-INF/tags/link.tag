<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="uri" required="true" description="URI of the page to go" %>
<%@ attribute name="current_page" type="com.excilys.computer_database.webapp.dto.PageDTO" description="Contains the information to build page links" %>
<%@ attribute name="override_page" description="Page number to use" %>
<%@ attribute name="override_offset" description="Offset to use" %>
<%@ attribute name="override_order" description="Order to use" %>
<%@ attribute name="override_filter" description="Filter to use" %>
<%@ attribute name="override_order_type" description="order type to use" %>

<c:set var="default_url" value="?page=1&offset=10&order=&filter="/>

"${uri}
	<c:choose>
		<c:when test="${not empty current_page}">
			?page=
			<c:choose>
				<c:when test="${not empty override_page}">
					${override_page}
				</c:when>
				<c:otherwise>
					${page.currentPage}
				</c:otherwise>
			</c:choose>
			
			&offset=
			<c:choose>
				<c:when test="${not empty override_offset}">
					${override_offset}
				</c:when>
				<c:otherwise>
					${page.offset}
				</c:otherwise>
			</c:choose>
			
			&order=
			<c:choose>
				<c:when test="${not empty override_order}">
					${override_order}
				</c:when>
				<c:otherwise>
					${page.order}
				</c:otherwise>
			</c:choose>
			
			<c:if test="${not empty override_order_type}">
				&order_type=${override_order_type}				
			</c:if>
			
			&filter=
			<c:choose>
				<c:when test="${not empty override_filter}">
					${override_filter}
				</c:when>
				<c:otherwise>
					${page.filter}
				</c:otherwise>
			</c:choose>	
			
		</c:when>
		<c:otherwise>${default_url}</c:otherwise> 
	</c:choose>"