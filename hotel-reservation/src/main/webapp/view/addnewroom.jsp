<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Registration</title>
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
	        <li>
	          <a href="/admin/getroomdetails">Check Room Details</a>
	        </li>
	        <li>
	          <a href="/admin/addnewroom">Add New Room</a>
	        </li>
	        <li>
	          <a href="/admin/viewreport">View Booking Report</a>
	        </li>
	        <li>
	          <a style="cursor: pointer;"  href="${contextPath}/logout">Logout</a>
	        </li>
	      </ul>
	    </div>
	    </div>
	    </nav>

    <div class="container">

        <form:form action="/admin/addnewroom" method="POST" modelAttribute="room">
            <h2>Add New Room</h2>
                <div class="form-group">
                	<label for="roomNumber">Room Number:</label>
                    <form:input type="number" id="roomNumber" path="roomNumber" class="form-control" placeholder="Room Number"
                                autofocus="true"></form:input>
                </div>
                <div class="form-group">
					<label for="roomType">Room Type</label>
					<form:select id="roomType" path="roomType" class="form-control">
                    	<form:option value="Standard" label="Standard"/>
                    	<form:option value="Deluxe" label="Deluxe"/>
                    	<form:option value="Luxury" label="Luxury"/>
                    </form:select>
                </div>
            	
            	<div class="form-group">
            		<label for="costPerNight">Cost</label>	
                    <form:input type="number" id="costPerNight" path="costPerNight" class="form-control"></form:input>
                </div>

				<div class="form-group">
					<label for="beds">Number Of Bed</label>	
                    <form:input type="number" path="beds" class="form-control"></form:input>
                </div>
                
            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  </body>
</html>