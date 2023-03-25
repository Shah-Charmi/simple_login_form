<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form</title>
</head>
<body>
	<form action="ActionControl" method="post">

		<table>
		
			<tr>
			
				<td >First Name:</td>
				<td><input type="text" name="fname" placeholder="first name"
					required="error"></td>
			</tr>
			

			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lname" placeholder="last name"
					required="error"></td>
			</tr>

			<tr>
				<td>Contact:</td>
				<td><input type="text" name="contact" placeholder="contact"
					required="error"></td>
			</tr>

			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" placeholder="email"
					required="error"></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" 
				placeholder="password" required="error"></td>
			</tr>
			<tr>
				
				<td><input type="submit" name="action" value="submit"></td>
			</tr>
			<tr>
				
				<td><input type="button" name="action" value="login"></td>
			</tr>




		</table>
	</form>
</body>
</html>