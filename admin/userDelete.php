<?php
session_start();

$filepath = realpath(dirname(__FILE__));
include $filepath . "/../db/connection.php";

if (isset($_GET['id']) && !empty($_GET['id'])) {


    $id = $_GET['id'];

   

    try {
        /* get user info for delete image */
        $sql = "SELECT * FROM users WHERE id=:id";
        $stmp = $pdo->prepare($sql);
        $stmp->bindParam(':id', $id, PDO::PARAM_INT);
        $stmp->execute();
        $user = $stmp->fetch(PDO::FETCH_OBJ);
        if ($user->image != null) {
            unlink($user->image);
        }

        $sql = "DELETE FROM users WHERE id=:id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        $stmt->execute();
        $_SESSION['success'] = "User deleted successfully";
        header('Location: user.php');
    } catch (\PDOException $e) {
        die($e->getMessage());
    }
}
