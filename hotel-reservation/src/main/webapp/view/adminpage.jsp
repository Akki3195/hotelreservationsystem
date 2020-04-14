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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Admin</title>
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
    
    <h2>
		Welcome ${pageContext.request.userPrincipal.name}
	</h2>
			
	<c:if test="${message == 'success'}">
		<h2>Room Detail updated successfully.</h2>
	</c:if>
	<!-- List of Room Details -->
   	<c:if test="${roomList != null}">
	<div id = "roomList">
	<table  class="table table-hover" >
				<thead class="thead-light">
					<tr>
						<th colspan = "6" class="text-center" style = "font-size:25px" >Available Room Details</th>
					</tr>
					<tr>
						<th>Room No</th>
						<th>No of Bed</th>
						<th>Room Type</th>
						<th>cost Rs/Night</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${roomList}" var = "room" varStatus = "temp">
						<tr>
							<td>${room.roomNumber}</td>
							<td>${room.beds}</td>
							<td>${room.roomType}</td>
							<td>${room.costPerNight}</td>
							
							<td><a href="findroom?id=${room.id}"><button type="button" class="btn btn-primary">Edit</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	</c:if>
	<!-- booking report -->
	<c:if test="${reservationList != null}">
	
	<div class="row">
	
			<form action = "/admin/filterreport" method = "GET">
			  <div class="form-row align-items-center">
			    <div class="col-sm-3 my-1">
			      <input type="text" name="fromDate" class="form-control" id="fromDate" placeholder="From Date">
			    </div>
			    <div class="col-sm-3 my-1">
			      <div class="input-group">
			        <input type="text" name="toDate" class="form-control" id="toDate" placeholder="To Date">
			      </div>
			    </div>
			    <div class="col-auto my-1">
			      <button type="submit" class="btn btn-primary">Search Report</button>
			    </div>
			  </div>
			</form>
	</div>
	
	<div id = "roomList">
	<table  class="table table-hover" >
				<thead class="thead-light">
					<tr>
						<th colspan = "6" class="text-center" style = "font-size:25px" >Booking Report</th>
					</tr>
					<tr>
						<th>UserName</th>
						<th>Room Number</th>
						<th>Reservation Id</th>
						<th>No of Guests</th>
						<th>Check In Date</th>
						<th>Check Out Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reservationList}" var = "reservation" varStatus = "temp">
						<tr>
							<td>${reservation.userName}</td>
							<td>${reservation.room.roomNumber}</td>
							<td>${reservation.reservationId}</td>
							<td>${reservation.noOfGuests}</td>
							<td>${reservation.checkInDate}</td>
							<td>${reservation.checkOutDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	</c:if>
	
</div>

<script type="text/javascript">
		$(function() {
			$('#fromDate').datepicker();
			$('#toDate').datepicker();
		}); 
		
	</script>
</body>
</html>