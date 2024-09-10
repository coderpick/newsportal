<?php
session_start();

$filepath = realpath(dirname(__FILE__));
include $filepath . "/../db/connection.php";

if (isset($_GET['id']) && !empty($_GET['id'])) {


    $id = $_GET['id'];

    try {

        $sql = "DELETE FROM category WHERE id=:id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        $stmt->execute();
        $_SESSION['success'] = "Category deleted successfully";
        header('Location: category.php');
    } catch (\PDOException $e) {
        die($e->getMessage());
    }
}
