<?php

include "db/connection.php";

session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <h1>Welcome to my news portal</h1>
    <a href="/admin/index.php">Go to admin</a>

    <h1>Welcome Mr. <?php echo isset($_SESSION['name']) ? $_SESSION['name'] : 'Guest' ?></h1>
    <h2>Your role is <?php echo isset($_SESSION['role']) ? $_SESSION['role'] : '' ?></h2>

    <?php

    if (isset($_SESSION['name']) && $_SESSION['role'] == 'user') {
        echo '<a href="logout.php">Logout</a>';
    } else {
        echo '<a href="admin/index.php">Login</a>';
    }
    ?>

</body>

</html>