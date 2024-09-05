<?php
$filepath = realpath(dirname(__FILE__));
include $filepath . "/../db/connection.php";
// include $filepath . "/../helpers/helper.php";

$errors = [];
$data = [];




if (isset($_POST['register'])) {

    $name      = validate($_POST['name']);
    $email     = validate($_POST['email']);
    $password  = $_POST['password'];

    if (empty($name)) {
        $errors['name'] = "Name is required";
    } else {
        $data['name'] = $name;
    }

    if (empty($email)) {
        $errors['email'] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Invalid email format";
    } else {
        $data['email'] = $email;
    }

    if (empty($password)) {
        $errors['password'] = "Password is required";
    } elseif (strlen($password) < 6) {
        $errors['password'] = "Password must be at least 6 characters";
    } else {
        $data['password'] = $password;
    }

    if (count($errors) == 0) {

        $sql = "INSERT INTO users (name, email, password) VALUES (:name, :email, :password)";

        if ($stmt = $pdo->prepare($sql)) {
            $hashedPassword = password_hash($data['password'], PASSWORD_BCRYPT);
            $stmt->bindParam(':name', $data['name'], PDO::PARAM_STR);
            $stmt->bindParam(':email', $data['email'], PDO::PARAM_STR);
            $stmt->bindParam(':password', $hashedPassword, PDO::PARAM_STR);
            $stmt->execute();

            header('location: index.php'); /*  index.php as a login page */
        }
    }
}

function validate($data)
{
    $data = trim($data);
    $data = stripcslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

?>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Register </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link href="./css/style.css" rel="stylesheet">

</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">Sign up your account</h4>
                                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
                                        <div class="form-group">
                                            <label><strong>Name</strong></label>
                                            <input type="text" name="name" class="form-control" placeholder="Enter name" value="<?php echo $data['name'] ?? ''; ?>">
                                            <span class="text-danger"><?php echo  $errors['name'] ?? ''; ?></span>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Email</strong></label>
                                            <input type="email" name="email" class="form-control" placeholder="Enter email" value="<?php echo $data['email'] ?? ''; ?>">
                                            <span class="text-danger"><?php echo  $errors['email'] ?? ''; ?></span>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Password</strong></label>
                                            <input type="password" name="password" class="form-control" placeholder="Enter password">
                                            <span class="text-danger"><?php echo $errors['password'] ?? ''; ?></span>
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" name="register" class="btn btn-primary btn-block">Sign me up</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Already have an account? <a class="text-primary" href="page-login.html">Sign in</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <!--endRemoveIf(production)-->
</body>

</html>