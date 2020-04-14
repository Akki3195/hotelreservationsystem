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
<title>Welcome Page</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
</head>
<body>
	<jsp:include page="titlepage.jsp"></jsp:include>
	<div class="container">
			<h2>
				Welcome ${pageContext.request.userPrincipal.name}
			</h2>
			<h4>
				Search Available Room by Entering CheckIn Date and Checkout Dates
			</h4>
	<div class="row">
	
			<form action = "${contextPath}/viewRoomsDetails" method = "GET">
			  <div class="form-row align-items-center">
			  <label class="sr-only" for="chkInDt" >Name</label>
			    <div class="col-sm-3 my-1">
			      <input type="text" name="chkInDt" class="form-control" id="chkInDt" placeholder="Check In Date">
			    </div>
			    <div class="col-sm-3 my-1">
			      <label class="sr-only" for="chkOutDt">Username</label>
			      <div class="input-group">
			        <input type="text" name="chkOutDt" class="form-control" id="chkOutDt" placeholder="Check Out Date">
			      </div>
			    </div>
			    <div class="col-auto my-1">
			      <button type="submit" class="btn btn-primary">Search</button>
			    </div>
			  </div>
			</form>
	</div>
	
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
							<td><a href='javascript:bookRoom(${room.id});'>Book</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	</c:if>
</div>
	<script type="text/javascript">
		$(function() {
			$('#chkInDt').datepicker();
			$('#chkOutDt').datepicker();
		}); 
		
	</script>
	<script>
	function bookRoom(id){
		$.confirm({
		    title: 'Book Room!',
		    content: '' +
		    '<form action="" class="formName">' +
		    '<div class="form-group">' +
		    '<label>Enter Total No of Guests</label>' +
		    '<input type="number" placeholder="No of Guests" class="guestCount form-control" required />' +
		    '</div>' +

		    '<div class="form-group">' +
		    '<label>Enter Check In Date</label>' +
		    '<input type="date" placeholder="CheckIn date" class="chkInDt form-control" required />' +
		    '</div>' +

		    '<div class="form-group">' +
		    '<label>Enter Check Out Date</label>' +
		    '<input type="date" placeholder="Checkout date" class="chkOutDt form-control" required />' +
		    '</div>' +
		    '</form>',
		    buttons: {
		        formSubmit: {
		            text: 'Submit',
		            btnClass: 'btn-blue',
		            action: function () {
		                var count = this.$content.find('.guestCount').val();
		                var fromDt = this.$content.find('.chkInDt').val();
		                var toDt = this.$content.find('.chkOutDt').val();
		            			$.ajax({
		            			type : "GET",
		            			url : "bookroom?id="+id+"&fromDt="+fromDt+"&toDt="+toDt+"&count="+count,
		            			dataType : "JSON",
		            			success : function(value) {
		            				
		            			}
		            		});
		            			$("#roomList").hide();
		                        $.alert('Your room is successfully booked');
		                
		            }
		        },
		        cancel: function () {
		            //close
		        },
		    },
		    onContentReady: function () {
		        // bind to events
		        var jc = this;
		        this.$content.find('form').on('submit', function (e) {
		            // if the user submits the form by pressing enter in the field.
		            e.preventDefault();
		            jc.$$formSubmit.trigger('click'); // reference the button and click it
		        });
		    }
		});
	}
</script>
</body>
</html>