<?php
session_start();
require('db.php');
//$con = mysqli_connect("localhost","root","","register");
// If form submitted, insert values into the database.
if (isset($_REQUEST['username'])){
  
	$username = stripslashes($_REQUEST['username']);
	$username = mysqli_real_escape_string($con,$username); 
	
	$email = stripslashes($_REQUEST['email']);
	$email = mysqli_real_escape_string($con,$email);
	
	$token = stripslashes($_REQUEST['token']);
	$token = mysqli_real_escape_string($con,$token);
	
	$password = stripslashes($_REQUEST['password']);
	$password = mysqli_real_escape_string($con,$password);
	
	$trn_date = date("Y-m-d H:i:s");
	
	//$query = "SELECT username, email, token FROM tokens WHERE (username = '$username' OR email = '$username' OR token = '$token')";
	//$result = mysqli_query($con,$query);
	//if equlas true then try below else fail for invalid above
	

	$query1 = "SELECT username, email, token FROM tokens WHERE username = '$username' AND email = '$email' AND token = '$token'";
        $result1 = mysqli_query($con,$query1);
		
        if($result1){
		$query2 = "UPDATE users SET password =('".md5($password)."') WHERE username = '$username' AND email = '$email'"; 	
          $result2 = mysqli_query($con,$query2); 
        

	}
}
?>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8">
	<title>Password reset</title>
	<link rel="stylesheet" href="css/style.css" />
	 </head>
	 <body>
	 <html>
	<form action="password_reset.php" method="post">
	<p>Enter details to reset password</p>
	Username: <input type="text" name="username"><br>
	Email: <input type="text" name="email"><br>
	Token No: <input type="text" name="token"><br>
	New Password: <input type="text" name="password"><br>
	<input type="submit">
	</form>
	</body>
	</html>
