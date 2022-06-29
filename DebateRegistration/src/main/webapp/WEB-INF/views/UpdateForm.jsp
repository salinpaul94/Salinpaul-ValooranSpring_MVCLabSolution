<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	context="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Update Form</title>
</head>
<body>
	<div class="container">
		<center>
		<h4>Update Book</h4>
		<a href="/DebateRegistration/forms"
				class="btn btn-primary btn-sm mb-3"> Participants </a>
		<table class="table table-bordered table-striped">

			<thead>
				<tr class="table-dark">
				<th>Name</th>
				<th>Department</th>
				<th>Country</th>
				</tr>
			</thead>

			<tbody>

				
					<tr>
						<td><c:out value="${Form.name}" /></td>
						<td><c:out value="${Form.department}" /></td>
						<td><c:out value="${Form.country}" /></td>
					</tr>

			</tbody>

		</table>
		
			<form action="/DebateRegistration/updateForm" method="POST">
				<!-- <input name="id" value=${Book.id} /> -->
				
				<div class="form-inline">
					<input type="text" class="form-control mb-4 clo-4" 
						name="id" style="width: 200px;"  
						placeholder="Id" value="${Form.id}" />
				</div>
				
				<div class="form-inline">
					<input type="text" class="form-control mb-4 clo-4" 
						name="name" style="width: 200px;"  
						placeholder="Name" value="${Form.name}" />
				</div>
				
				<div class="form-inline">
					<input type="text" class="form-control mb-4 clo-4" 
						name="department" style="width: 200px;" 
						placeholder="Department" value="${Form.department}" />
				</div>
				
				<div class="form-inline">
					<input type="text" class="form-control mb-4 clo-4" 
						name="country" style="width: 200px;" 
						placeholder="Country" value="${Form.country}" />
				</div>
			
				<button type="submit">Save</button>
		</form>
		</center>
	</div>
</body>
</html>