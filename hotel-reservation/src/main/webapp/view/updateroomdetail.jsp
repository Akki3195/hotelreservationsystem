<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Admin</title>
</head>
<body>
<jsp:include page="adminpage.jsp"></jsp:include>

	 <div class="container">

        <form:form action="/admin/updateroomdetail" method="POST" modelAttribute="roomDetail" class="form-signin">
            <h2 class="form-signin-heading">Update Room Details</h2>
            <form:input type="hidden" path="id"/>
            	<div class="form-group">
            		<label for="roomNumber">Room Number</label>
                    <form:input type="number" name="roomNumber" path="roomNumber" class="form-control" placeholder="First Name" readonly="readonly"/>
                </div>

				<div class="form-group">
					<label for="roomType">Room Type</label>
					<form:select name="roomType" path="roomType" class="form-control">
                    	<form:option value="Standard" label="Standard"/>
                    	<form:option value="Deluxe" label="Deluxe"/>
                    	<form:option value="Luxury" label="Luxury"/>
                    </form:select>
                </div>
                <div class="form-group">
                	<label for="beds">Bed Count</label>
                    <form:input name="beds" type="number" path="beds" class="form-control"></form:input>
                </div>
                
                <div class="form-group">
                	<label for="costPerNight">Cost</label>
                    <form:input name="costPerNight" type="number" path="costPerNight" class="form-control"></form:input>
                </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
        </form:form>

    </div>

</body>
</html>