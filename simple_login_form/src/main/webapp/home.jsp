<%@page import="com.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Hello, world!</title>
</head>
<body>
	<h1>Hello, world!</h1>
	<%
	User u = null;
	if (session != null) {
		if (session.getAttribute("u") != null) {
			u = (User) session.getAttribute("u");
		} else {
			response.sendRedirect("login.jsp");
		}
	} else {
		response.sendRedirect("login.jsp");
	}
	%>

	<h1 class="text-center"><%=u.getFname()%></h1>
	<div class="container">
	<form action="ActionControl" method="post">
	<input type="submit" name="action" value="logout">
	</form>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Firstname</th>
					<th scope="col">Lastname</th>
					<th scope="col">Contact</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Hobbies</th>
					<th scope="col">Country</th>
					<th scope="col">Gender</th>
					
					
					
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>

			<%
			List<User> list = UserDao.getallUsers();
			%>
			<%
			for (User u1 : list) {
			%>
			<tbody>
				<tr>
					<td><%=u1.getId()%></td>
					<td><img src="image/<%=u1.getImage()%>" width=50px height=50px/></td>
					<td><%=u1.getFname()%></td>
					<td><%=u1.getLname()%></td>
					<td><%=u1.getContact()%></td>
					<td><%=u1.getEmail()%></td>
					<td><%=u1.getPassword()%></td>
					<td><%String Hobbies="";
					String[] val=request.getParameterValues("hobbies");
			        if(val!=null) {
			        	for(int i=0;i<val.length;i++) {
			        		Hobbies+=val[i]+",";
			        		u.setHobbies(Hobbies);
			        	}
			        	System.out.println(" ");
			        } %>
			        <%=u1.getHobbies() %>
			        </td>
			        <td><% String country="";
					String[] con=request.getParameterValues("countries");
			        if(con!=null) {
			        	for(int i=0;i<con.length;i++) {
			        		country+=con[i];
			        	   u.setCountry(country);
			        	}
			        	System.out.println(" ");
			        }
			        else {
			        	System.out.println("error");
			        } %>
			        <%=u.getCountry() %>
			        </td>
			        <td><%String Gender="";
			        String[] gen=request.getParameterValues("gender");
			        if(gen!=null) {
			        	for(int i=0;i<gen.length;i++) {
			        		Gender+=gen[i];
			        		u.setGender(Gender);
			        	}
			        	System.out.println(" ");
			        }
			        else {
			        	System.out.println("error");
			        }
			        %>
			        <%=u.getGender() %>
			        </td>
					
					
					
					
					
					<td>
						<form action="ActionControl" method="post">
							<input type="hidden" name="id" value="<%=u1.getId()%>"> <input
								type="submit" name="action" value="edit">
						</form>
					</td>
					<td>

						<form action="ActionControl" method="post">
							<input type="hidden" name="id" value="<%=u1.getId()%>"> <input
								type="submit" name="action" value="delete">
						</form>
					</td>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
</html>
