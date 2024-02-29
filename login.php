<?php
session_start();
require('db.php');

// Check if form is submitted
if (isset($_POST['submit'])) {
    $ip_address = getIpAddr();

    // Check if there are too many failed login attempts within 30 seconds
    $time_limit = time() - 30;
    $query = "SELECT COUNT(*) AS total_count FROM loginlogs WHERE IpAddress='$ip_address' AND TryTime > FROM_UNIXTIME($time_limit)";
    $result = mysqli_query($con, $query);
    $check_login_row = mysqli_fetch_assoc($result);
    $total_count = $check_login_row['total_count'];

    if ($total_count >= 3) {
        $msg = "Too many failed login attempts. Please login after 30 seconds.";
    } else {
        $username = mysqli_real_escape_string($con, $_POST['username']);
        $password = mysqli_real_escape_string($con, $_POST['password']);

        // Checking if user exists in the database and password matches
        $query = "SELECT * FROM `users` WHERE username='$username' AND password='".md5($password)."'";
        $result = mysqli_query($con, $query);

        if (mysqli_num_rows($result) == 1) {
            $_SESSION['IS_LOGIN'] = 'yes';
            $_SESSION['username'] = $username;
            
            // Reset login attempts for this IP
            mysqli_query($con, "DELETE FROM loginlogs WHERE IpAddress='$ip_address'");
            
            header("Location: index.php");
            exit();
        } else {
            // Insert login attempt with timestamp
            mysqli_query($con, "INSERT INTO loginlogs (IpAddress, TryTime) VALUES ('$ip_address', NOW())");
            
            $msg = "Please enter valid login details.";
        }
    }
}

// Function to get the client's IP address
function getIpAddr(){
    if (!empty($_SERVER['HTTP_CLIENT_IP'])){
        $ipAddr = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
        $ipAddr = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else{
        $ipAddr = $_SERVER['REMOTE_ADDR'];
    }
    return $ipAddr;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css" />
	 <style>
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<div class="form">
    <h1>Log In</h1>
    <form action="" method="post" name="login">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input name="submit" type="submit" value="Login" />
		<?php if (isset($msg)) { ?>
            <div class="error-message"><?php echo $msg; ?></div>
        <?php } ?>
    </form>
    <p>Not registered yet? <a href='registration.php'>Register Here</a></p>
</div>
</body>
</html>
