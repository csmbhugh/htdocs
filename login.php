<?php
session_start();
require('db.php');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.PHP';

//Load Composer's autoloader
require 'vendor/autoload.php';
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

<?php

if (empty($_SESSION['token'])) {
    $_SESSION['token'] = bin2hex(random_bytes(32));
}
$token = $_SESSION['token']

?>

<?php
if (isset($_REQUEST['username'])){
        // removes backslashes
	$username = stripslashes($_REQUEST['username']);
        //escapes special characters in a string
	$username = mysqli_real_escape_string($con,$username); 
	
	$email = stripslashes($_REQUEST['email']);
	$email = mysqli_real_escape_string($con,$email);
	$trn_date = date("Y-m-d H:i:s");
	
        $query = "INSERT into `tokens` (username, token, email, trn_date)
VALUES ('$username', '$token', '$email', '$trn_date')";
        $result = mysqli_query($con,$query);
        if($result){
            echo "<div class='form'>
<h3>Your reset token has been sent.";
        }
    }else{
		echo "<div class='form'>
<h3>Your reset token could not be sent, your username or email is invalid.</h3></div>";
	}
?>


<form action="new_registration.php" method="post">
<p>Enter details to reset password</p>
username: <input type="text" name="username" required ><br>
email: <input type="text" name="email" required><br>
<input type="submit">
</form>

</body>
</html>
<?php
     if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // collect value of input field
  $emailReset = $_POST['email'];
  if (empty($emailReset)) {
    echo "Name is empty";
  } else {
    echo $emailReset;
  }
}

?>

<?php
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'wadams6090@gmail.com';                     //SMTP username
    $mail->Password   = 'vytzxolpwhnsqdbf';                               //SMTP password
    $mail->SMTPSecure = 'PHPMailer::ENCRYPTION_STARTTLS';            //Enable implicit TLS encryption
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('wadams6090@gmail.com', 'Password Reset');
    $mail->addAddress("$emailReset", 'Joe User');     //Add a recipient
    
    $mail->addReplyTo('resetlink10@gmail.com', 'Password Reset');
    

    //Attachments
    //$mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'Password reset';
    $mail->Body    = "This is your token number <b>$token</b><h3>https://localhost/password_reset.php</h3>";
    //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
    echo '<h3>Follow the link to reset your password.</h3>';
} catch (Exception $e) {
    echo "Your reset token could not be sent. Mailer Error: {$mail->ErrorInfo}";
}

session_unset();

?>
