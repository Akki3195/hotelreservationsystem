<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
</head>
<body>
	
<div class="page-top" style="width:100%; height:20px;background-color: #f46b42"></div>

<nav class="navbar navbar-default navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand pointer" href="#">Hotel Reservation</a>
    </div>

    <div id="navbar">
        
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${pageContext.request.userPrincipal.name == null}">
        <li>
          <a href="${contextPath}/login?flag=admin">Admin Login</a>
        </li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <li>
          <a href="#">MY PROFILE</a>
        </li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <li>
          <a style="cursor: pointer;"  href="${contextPath}/logout">Logout</a>
        </li>
      </c:if>

      </ul>
    </div>
  </div>

</nav>
	
</body>
</html>