<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="header">
		<div class="container">
			<div class="logo">
				<a  href="${pageContext.request.contextPath }/index.jsp"><span>Magic</span>BBS</a>
			</div>
			<div class="header-right">
			<c:if test="${empty loginResult }">
					<a class="account"  style =" font-family: 'Comic Sans MS'" href="${pageContext.request.contextPath }/login.jsp">Login</a>
			</c:if>
			<c:if test="${not empty loginResult }">
			         <a class="account" style =" font-family: 'Comic Sans MS'"  href="${pageContext.request.contextPath}/userServlet.action?md=logout&un=${un }">Log Out</a>
					<a class="account" style =" font-family: 'Comic Sans MS'"  href="${pageContext.request.contextPath}/userServlet.action?md=myAccount&un=${un }">My Account</a>
			</c:if>
		
			<a  class="account" style =" font-family: 'Comic Sans MS'" href="${pageContext.request.contextPath }/register.jsp">Register</a>
			<a  class="account" style =" font-family: 'Comic Sans MS'" href="${pageContext.request.contextPath }/post_Servlet.do?un=${un}">Write a Post</a>
			<a  class="account" style =" font-family: 'Comic Sans MS'" href="${pageContext.request.contextPath }/postMag_Servlet.do?m=init&un=${un}">Manage Your Post</a>
	<!-- Large modal -->
				<script>
				$('#myModal').modal('');
				</script>
			</div>
		</div>
</div>