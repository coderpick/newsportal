<?php
session_start();

$filepath = realpath(dirname(__FILE__));
include $filepath . "/../db/connection.php";

if (isset($_GET['id']) && !empty($_GET['id'])) {


    $id = $_GET['id'];

    $sql = "SELECT * FROM post WHERE id=:id";
    $stmp = $pdo->prepare($sql);
    $stmp->bindParam(':id', $id, PDO::PARAM_INT);
    $stmp->execute();
    $post = $stmp->fetch(PDO::FETCH_OBJ);
  
    if ($post) {
        unlink($post->image);
    }

    try {

        $sql = "DELETE FROM post WHERE id=:id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        $stmt->execute();
        $_SESSION['success'] = "Post deleted successfully";
        header('Location: post.php');
    } catch (\PDOException $e) {
        die($e->getMessage());
    }
}
