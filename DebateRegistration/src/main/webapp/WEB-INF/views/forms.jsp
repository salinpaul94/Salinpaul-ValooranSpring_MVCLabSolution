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

<title>Books Directory</title>

</head>

<body>

	<div class="container">

		<h3>Debate Registration List</h3>
		<hr>

		<!-- Add a search form -->
		
		<a href="/DebateRegistration/forms"
				class="btn btn-primary btn-sm mb-3"> List Of Participants </a>

		<a href="/DebateRegistration/AddStudent"
				class="btn btn-primary btn-sm mb-3"> Add Student </a>
		
		<form action="/DebateRegistration/search" class="form-inline">

			<!-- Add a button -->
			 	<h4>Please Enter Name or Department or Country to Search</h4>
				<input
				type="search" name="name" placeholder=""
				class="form-control-sm ml-5 mr-2 mb-3" /> 

			<button type="submit" 
			class="btn btn-success btn-sm mb-3">Search</button>
			
		</form>

		<table class="table table-bordered table-striped">

			<thead>
				<tr class="table-dark">
				<th>Name</th>
				<th>Department</th>
				<th>Country</th>
				<th>Action</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach items="${Forms}" var="tempForm">
					<tr>
						<td><c:out value="${tempForm.name}" /></td>
						<td><c:out value="${tempForm.department}" /></td>
						<td><c:out value="${tempForm.country}" /></td>
						<td>
							<!-- Add "update" button/link --> <a
							href="/DebateRegistration/Update?id=${tempForm.id}"
							class="btn btn-info btn-sm"> Update </a> 
							<!-- Add "delete" button/link -->
							<a href="/DebateRegistration/delete?id=${tempForm.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
								Delete </a>
						</td>
					</tr>

				</c:forEach>

			</tbody>

		</table>

	</div>

</body>

</html>