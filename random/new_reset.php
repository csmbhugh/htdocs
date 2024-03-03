<?php
//error_reporting(0);
session_start();
require('db.php');
//$con = mysqli_connect("localhost","root","","register");
// If form submitted, insert values into the database.
if (isset($_POST['username'])){
  
	$username = stripslashes($_POST['username']);
	$username = mysqli_real_escape_string($con,$username); 
	
	$email = stripslashes($_POST['email']);
	$email = mysqli_real_escape_string($con,$email);
	
	$token = stripslashes($_POST['token']);
	$token = mysqli_real_escape_string($con,$token);
	
	$password = stripslashes($_POST['password']);
	$password = mysqli_real_escape_string($con,$password);
	
	//$hashed_password = hash('sha256', $password);
	//$options = ['cost' => 12,];
	//echo "'$hashed_password'";
    //$hash_pass = password_hash($password, PASSWORD_BCRYPT, $options);
			
	//$hashed_password = hash('sha256', $password);
	
	$trn_date = date("Y-m-d H:i:s");
	
	//$query = "SELECT username, email, token FROM tokens WHERE (username = '$username' OR email = '$username' OR token = '$token')";
	//$result = mysqli_query($con,$query);
	//if equlas true then try below else fail for invalid above
	
	$query = "SELECT username, email, token FROM tokens WHERE (username='$username' AND email='$email' AND token='$token')";
        $result = mysqli_query($con,$query);
       if($result && mysqli_num_rows($result) == 1) {
		
        $query = "(UPDATE users SET password = '$password' WHERE username = '$username' AND email = '$email')";    
        $result = mysqli_query($con, $query); 
        //echo "'$hashed_password'";
        if ($result) {
            echo "<h3>Password has been reset successfully.</h3>";
        } else {
            echo "<h3>Failed to reset password. Please try again.</h3>";
        }
    //} else {
        //echo "<h3>Invalid username, email, or token.</h3>";
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
	<form action="new_reset.php" method="post">
	<p>Enter details to reset password</p>
	Username: <input type="text" name="username"><br>
	Email: <input type="text" name="email"><br>
	Token No: <input type="text" name="token"><br>
	New Password: <input type="text" name="password"><br>
	<input type="submit">
	</form>
	</body>
	</html>
