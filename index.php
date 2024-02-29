<?php
// Include auth.php file on all secure pages
include("auth.php");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">

</head>
<body class="index-page">
<body>
    <!-- Background Image -->
    <div class="background"></div>

    <!-- !PAGE CONTENT! -->
    <div class="w3-content" style="max-width:1500px">
        <!-- Header -->
        <header class="w3-panel w3-center w3-opacity" style="padding:128px 16px">
			
            <h1 class="w3-xlarge">Homepage</h1>
            <h1></h1>
            
            <div class="w3-padding-32">
                <div class="w3-bar w3-border">
                    <p>Welcome <?php echo $_SESSION['username']; ?>!</p>
       <a href="index.php" class="w3-bar-item w3-button">Home</a>
	   	  <a href="blogs.php" class="w3-bar-item w3-button">Blogs</a>
	  <a href="profile.php" class="w3-bar-item w3-button">Profile</a>
	<a href="logout.php" class="w3-bar-item w3-button">Logout</a>
                </div>
            </div>
        </header>

        <!-- End Page Content -->
    </div>
</body>
</html>
