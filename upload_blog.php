<?php
// Include your database connection file here
require('db.php');

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
    // Get the form data
    $title = $_POST['title'];
    $content = $_POST['content'];
   
    // Handle image upload
    $image = $_FILES['image']['name'];
    $target = "".basename($image);
    move_uploaded_file($_FILES['image']['tmp_name'], $target);

    // Insert the blog post details into the database
    $sql = "INSERT INTO blog_posts (title, content, image) VALUES (?, ?, ?)";
    $stmt = $con->prepare($sql); // Change $conn to $con here
    $stmt->bind_param("sss", $title, $content, $image);
    $stmt->execute();
    $stmt->close();
   
    // Redirect back to the dashboard page after processing
    header("Location: blogs.php");
    exit();
}
?>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Upload Blog</title>
</head>
<body>

<div class="navbar">
    <a href="index.php" class="w3-bar-item w3-button">Index</a>
    <a href="profile.php" class="w3-bar-item w3-button">Profile</a>
    <a href="logout.php" class="w3-bar-item w3-button">Logout</a>
</div>

<h1>Upload Blog</h1>
<form action="upload_blog.php" method="post" enctype="multipart/form-data">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" required><br><br>
    <label for="content">Content:</label><br>
    <textarea id="content" name="content" rows="5" required></textarea><br><br>
    <label for="image">Upload Image:</label><br>
    <input type="file" id="image" name="image"><br><br>
    <input type="submit" name="submit" value="Upload">
</form>

</body>
</html>
