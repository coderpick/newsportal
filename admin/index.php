<?php
session_start();

// Check if the user is already logged in
if (isset($_SESSION['role'])) {
    // Redirect based on the role
    if ($_SESSION['role'] == 'admin' || $_SESSION['role'] == 'editor') {
        header("Location: dashboard.php");
    }
}


$filepath = realpath(dirname(__FILE__));
include $filepath . "/../db/connection.php";
// include $filepath . "/../helpers/helper.php";

$errors = [];
$data = [];




if (isset($_POST['login'])) {


    $email     = validate($_POST['email']);
    $password  = $_POST['password'];



    if (empty($email)) {
        $errors['email'] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Invalid email format";
    } else {
        $data['email'] = $email;
    }

    if (empty($password)) {
        $errors['password'] = "Password is required";
    } else {
        $data['password'] = $password;
    }

    if (count($errors) == 0) {


        $sql = "SELECT * FROM users WHERE email=:email";

        $stmt = $pdo->prepare($sql);

        $stmt->bindParam(':email', $email, PDO::PARAM_STR);

        if ($stmt->execute()) {

            if ($stmt->rowCount() == 1) {

                $row = $stmt->fetch(PDO::FETCH_OBJ);

                if (password_verify($data['password'], $row->password)) {

                    $_SESSION['name']   = $row->name;

                    $_SESSION['role']   = $row->role;

                    if ($_SESSION['role'] == "admin" || $_SESSION['role'] == "editor") {

                        header("Location:dashboard.php");
                    } else {
                        header("Location:../index.php");
                    }
                }
            } else {
                $errors["password"] = "Password does not match!";
            }
        } else {
            $errors["email"] = "Email is not found";
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
    <title>Login </title>
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
                                    <h4 class="text-center mb-4">Sign in your account</h4>
                                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="post">
                                        <div class="form-group">
                                            <label><strong>Email</strong></label>
                                            <input type="email" name="email" class="form-control" value="<?php echo $data['email'] ?? ''; ?>">
                                            <span class="text-danger"><?php echo  $errors['email'] ?? ''; ?></span>

                                        </div>
                                        <div class="form-group">
                                            <label><strong>Password</strong></label>
                                            <input type="password" class="form-control" name="password">
                                            <span class="text-danger"><?php echo  $errors['password'] ?? ''; ?></span>

                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">

                                            <div class="form-group">
                                                <a href="page-forgot-password.html">Forgot Password?</a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" name="login" class="btn btn-primary btn-block">Sign me in</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Don't have an account? <a class="text-primary" href="register.php">Sign up</a></p>
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
    <script src="./js/custom.min.js"></script>

</body>

</html>