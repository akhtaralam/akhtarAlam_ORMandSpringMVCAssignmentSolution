<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Customer List</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div
			style="display: flex; background-color: #01d932; text-align: center; height: 100px; align-items: center; justify-content: center; margin-top: 20px; margin-bottom: 50px;">
			<h1>CUSTOMER RELATIONSHIP MANAGEMENT</h1>
		</div>
		<a
			href="/SpringCustomerRelationshipManagement/customer/showFormForAdd"
			class="btn btn-primary btn-sm mb-3">Add Customer</a>

		<!--  add our html table here -->

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>

			<!-- loop over and print our customers -->
			<tbody>
				<c:forEach var="tempCustomer" items="${customers}">

					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>

						<td>
							<!-- display the update link --> <a
							href="/SpringCustomerRelationshipManagement/customer/showFormForUpdate?id=${tempCustomer.id}"
							class="btn btn-info btn-sm">Update</a> <a
							href="/SpringCustomerRelationshipManagement/customer/delete?id=${tempCustomer.id}"
							class="btn btn-danger btn-sm"
							onclick="if(!(confirm('Are you sure to delete this customer?'))) return false">Delete</a>
						</td>

					</tr>

				</c:forEach>

			</tbody>

		</table>

	</div>

	</div>


</body>

</html>









