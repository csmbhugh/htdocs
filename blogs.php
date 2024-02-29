<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
       <a href="index.php" class="w3-bar-item w3-button">Home</a>
	   	  <a href="blogs.php" class="w3-bar-item w3-button">Blogs</a>
	  <a href="profile.php" class="w3-bar-item w3-button">Profile</a>
	<a href="logout.php" class="w3-bar-item w3-button">Logout</a>
</div>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
  box-sizing: border-box;
}

/* Add a gray background color with some padding */
body {
  font-family: Arial;
  padding: 20px;
  background: #f1f1f1;
}

/* Header/Blog Title */
.header {
  padding: 30px;
  font-size: 40px;
  text-align: center;
  background: white;
}

        /* Container for blogs */
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Blog card */
        .blog-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Adjust width as needed */
            margin-bottom: 20px;
        }

        /* Blog title */
        .blog-title {
            font-size: 20px;
            margin-bottom: 10px;
        }

        /* Blog content */
        .blog-content {
            margin-bottom: 10px;
        }

        /* Blog image */
        .blog-image {
            width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        /* Blog comments */
        .blog-comments {
            margin-bottom: 10px;
        }

        /* Comment form */
        .comment-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        .comment-form input[type="submit"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .comment-form input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the blogs stack on top of each other */
        @media screen and (max-width: 800px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .blog-card {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Blogs</h2>
    <!-- Add Upload Blog Button -->
    <button onclick="window.location.href = 'upload_blog.php';">Upload Blog</button>
</div>

<div class="container">

    <?php
    // Include authentication check and database connection
    include("auth.php");
    require('db.php');

    // Check if form is submitted for a specific blog post
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if(isset($_POST['comment']) && isset($_POST['blog_id'])) {
            $comment = $_POST['comment'];
            $blog_id = $_POST['blog_id'];

            // Update the comments for the specific blog post in the database
            $update_sql = "UPDATE blog_posts SET comments = CONCAT(IFNULL(comments, ''), 'New Comment: $comment\n') WHERE id = $blog_id";
            if ($con->query($update_sql) === TRUE) {
                echo "Comment added successfully.";
            } else {
                echo "Error adding comment: " . $con->error;
            }
        }
    }

    // Query to retrieve blogs from the database
    $sql = "SELECT * FROM blog_posts";
    $result = $con->query($sql);

    // Check if there are any blogs
    if ($result->num_rows > 0) {
        // Output each blog
        while($row = $result->fetch_assoc()) {
            echo "<div class='blog-card'>";
            echo "<h2 class='blog-title'>" . $row["title"] . "</h2>";
            echo "<p class='blog-content'>" . $row["content"] . "</p>";

            // Display image if available
            if (!empty($row["image"])) {
                echo "<img src='uploads/" . $row["image"] . "' alt='Blog Image' class='blog-image'>";
            }

            // Display existing comments
            if (!empty($row["comments"])) {
                echo "<div class='blog-comments'>";
                echo "<h3>Comments:</h3>";
                echo "<p>" . nl2br($row["comments"]) . "</p>";
                echo "</div>";
            }

            // Form to add comments
            echo "<div class='comment-form'>";
            echo "<form method='post'>";
            echo "<input type='hidden' name='blog_id' value='" . $row["id"] . "'>";
            echo "<textarea name='comment' placeholder='Add your comment'></textarea>";
            echo "<input type='submit' value='Submit'>";
            echo "</form>";
            echo "</div>";

            echo "</div>";
        }
    } else {
        echo "No blogs found.";
    }
    ?>

</div>
</body>
</html>