<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Save Student</title>
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

		<h3>Save Customer</h3>
		<form
			action="/SpringCustomerRelationshipManagement/customer/saveCustomer"
			method="post">
			<input type="hidden" name="id" value="${customer.id}">
			<div class="form-inline">
				<input type="text" name="firstName" value="${customer.firstName}"
					placeholder="First Name" class="form-control mb-4 col-4">
			</div>
			<div class="form-inline">
				<input type="text" name="lastName" value="${customer.lastName}"
					placeholder="Last Name" class="form-control mb-4 col-4">
			</div>
			<div class="form-inline">
				<input type="text" name="email" value="${customer.email}"
					placeholder="Email" class="form-control mb-4 col-4">
			</div>
			<button type="submit" class="btn btn-info col-2">Submit</button>
		</form>
		<br /> <a href="/SpringCustomerRelationshipManagement/customer/list">Back
			to Customer List</a>

	</div>
</body>

</html>










