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
	<h1 class="text-center">Registration Form</h1>

	<div class="container mt-5">

		<form action="ActionControl" method="post" enctype="multipart/form-data">
		`
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Upload Image</label>
				 <input type="file" class="form-control" name="image"
					id="exampleInputEmail1" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">First
					name</label> <input type="text" class="form-control" name="fname"
					id="exampleInputEmail1" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Last name</label>
				<input type="text" class="form-control" name="lname"
					id="exampleInputEmail1" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Contact</label> <input
					type="text" class="form-control" name="contact"
					id="exampleInputEmail1" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Email
					address</label> <input type="email" class="form-control" name="email"
					id="exampleInputEmail1" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class="form-control" name="password"
					id="exampleInputPassword1">
			</div>
			
			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			<label for="exampleInputHobbies" class="form-label">Hobbies</label><br>
			
					
		       <input type="checkbox" class="form-check-input" id="hobbiesCheck1" name="hobbies" value="Reading">
				<label class="hobbies-label" for="hobbiesCheck1">Reading</label><br>
				<input type="checkbox" class="form-check-input" id="hobbiesCheck1" name="hobbies" value="Singing">
				<label class="hobbies-label" for="hobbiesCheck1">Singing</label><br>
				<input type="checkbox" class="form-check-input" id="hobbiesCheck1" name="hobbies" value="Dancing">
				<label class="hobbies-label" for="hobbiesCheck1">Dancing</label><br>
			</div> 
			
			<div>
			<label for="exampleInputcountry" class="form-label">country</label><br>
			
			
            <select name="countries" id="countries" >
            <option value="india"> India</option>
            <option value="usa">USA</option>
            <option value="Canada">Canada</option>
            <option value="australia">Australia</option>
     </select>
</div> 
  <div>
			<label for="exampleInputGender" class="form-label">Gender</label><br>
			
					
		       <input type="radio" class="form-check-input" id="male" name="gender" value="Male">
				<label class="gender-label" for="genderCheck1">Male</label><br>
				<input type="radio" class="form-check-input" id="female" name="gender" value="Female">
				<label class="gender-label" for="hobbiesCheck1">Female</label><br>
				
			</div>  
			
			
			
			
			 <div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			
			
			<div class="text-center">
				<button type="submit" class="btn btn-primary" name="action" value="register">Submit</button>
				<button type="submit" class="btn btn-outline-success">Login</button>
			</div>
		</form>
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