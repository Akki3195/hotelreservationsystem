<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
</head>
<body>
<jsp:include page="titlepage.jsp"></jsp:include>
<c:set var="flag" value='<%= request.getParameter("flag")%>'/>


	
	 <div class="container">
	 <div class="col-md-6 offset-md-3">
      <form method="POST" action="${contextPath}/login" class="form-signin">
      <c:if test="${flag == 'admin'}">
        <h2 class="form-heading">Admin Log in</h2>
      </c:if>
      <c:if test="${flag == null}">
        <h2 class="form-heading">Visitor Log in</h2>
      </c:if>
					<div  class="form-group ${error != null ? 'has-error' : ''}">
						<div>
							<span>${message}</span> <input name="userName" type="text"
								class="form-control" placeholder="Username" autofocus="true" />
						</div>
						<div>
							<input name="password" type="password" class="form-control"
								placeholder="Password" /> <span>${error}</span>
						</div>
						<button class="btn btn-lg btn-primary btn-block" type="submit">Log
							In</button>
						<c:if test="${flag == null}">
							<h4 class="text-center">
								<a href="${contextPath}/registration">Register</a>
							</h4>
						</c:if>
					</div>
				</form>
      </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>