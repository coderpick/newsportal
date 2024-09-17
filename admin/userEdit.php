<?php
include "layout/head.php";
?>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php
        include "layout/sidebar.php";
        ?>
        <!-- End Sidebar -->
        <div class="main-panel">
            <div class="main-header">
                <div class="main-header-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img
                                src="assets/img/kaiadmin/logo_light.svg"
                                alt="navbar brand"
                                class="navbar-brand"
                                height="20" />
                        </a>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>
                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    <!-- End Logo Header -->
                </div>
                <!-- Navbar Header -->
                <?php
                include "layout/header.php";
                ?>
                <!-- End Navbar -->
            </div>

            <div class="container">
                <div class="page-inner">
                    <div class="p-3">
                        <div class="row">
                            <div class="col-md-6">

                                <ul class="breadcrumbs mb-3">
                                    <li class="nav-home">
                                        <a href="dashboard.php">
                                            <i class="icon-home"></i>
                                        </a>
                                    </li>
                                    <li class="separator">
                                        <i class="icon-arrow-right"></i>
                                    </li>
                                    <li class="nav-item">
                                        <a href="user.php">User</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-md-6 text-end">
                                <a href="user.php" class="btn btn-danger btn-sm"><i class="fa fa-reply"></i> Back to list</a>
                            </div>
                        </div>
                    </div>

                    <?php

                    $data = [];
                    $errors = [];

                    if (isset($_POST['submit'])) {


                        $name = validate($_POST['name']);
                        $email = validate($_POST['oldEmail']);
                        $phone = validate($_POST['phone']);
                        $role   = $_POST['role'] ?? '';

                        $data['status'] = $_POST['status'] ?? '';

                        $data['userId']  = $_POST['userId'];
                        $userOldImage  = $_POST['userOldImage'];

                        $fileName = $_FILES['image']['name'];
                        $fileTmp = $_FILES['image']['tmp_name'];
                        $fileSize = $_FILES['image']['size'];

                        if (empty($name)) {
                            $errors['name'] = "Name is required";
                        } else {
                            $data['name'] = $name;
                        }

                        if (empty($email)) {
                            $errors['email'] = "Email is required";
                        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                            $errors['email'] = "Email is invalid";
                        } else {
                            $data['email'] = $email;
                        }


                        if (empty($role)) {
                            $errors['role'] = "Role is required";
                        } else {
                            $data['role'] = $role;
                        }

                        if (strlen($phone) < 10) {
                            $errors['phone'] = "Phone number must be at least 11 characters";
                        } elseif (!preg_match("/^['0-9']*$/", $phone)) {
                            $errors['phone'] = "Only numeric value allow";
                        } else {
                            $data['phone'] = $phone;
                        }

                        $ext = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
                        $allowItem = array('jpg', 'jpeg', 'png', 'webp');
                        $uniqueImgName = uniqid() . time() . '.' . $ext;
                        $upload_Image = 'uploads/user/' . $uniqueImgName;


                        if (!empty($fileName)) {
                            if ($fileSize > 1048576) {
                                /* max photo size 1mb */
                                $errors['image'] = "Image size less then 1mb required";
                            } else {
                                if (!in_array($ext, $allowItem)) {
                                    $errors['image'] = "Only jpg, jpeg, webp & png allow";
                                } else {
                                    if (!empty($userOldImage)) {
                                        unlink($userOldImage); /* delete user old image */
                                    }

                                    move_uploaded_file($fileTmp, $upload_Image);

                                    $data['image'] = $upload_Image;
                                }
                            }
                        } else {
                            $data['image'] = $userOldImage;
                        }

                        // try {
                        if (empty($errors)) {

                            $sql = "UPDATE users SET name=:name,email=:email,phone=:phone,role=:role,status=:status,image=:image WHERE id=:userId";


                            if ($stmt = $pdo->prepare($sql)) {

                                $stmt->bindParam(':name', $data['name'], PDO::PARAM_STR);
                                $stmt->bindParam(':email', $data['email'], PDO::PARAM_STR);
                                $stmt->bindParam(':phone', $data['phone'], PDO::PARAM_STR);
                                $stmt->bindParam(':role', $data['role'], PDO::PARAM_STR);
                                $stmt->bindParam(':status', $data['status'], PDO::PARAM_STR);
                                $stmt->bindParam(':image', $data['image'], PDO::PARAM_STR);
                                $stmt->bindParam(':userId', $data['userId'], PDO::PARAM_INT);
                                $stmt->execute();
                                $_SESSION['success'] = "User updated successfully";
                                echo ' <script>window.location.href = "user.php";</script>';
                                exit();
                            }
                        }
                        // } catch (\Exception $e) {
                        //     die($e->getMessage());
                        // }
                    }

                    /* get user info by request id */

                    if (isset($_GET['id']) && !empty($_GET['id'])) {

                        $id = $_GET['id'];

                        $sql = "SELECT * FROM users WHERE id = :id";
                        $stmt = $pdo->prepare($sql);
                        $stmt->bindParam(':id', $id);
                        $stmt->execute();
                        $user = $stmt->fetch(PDO::FETCH_OBJ);

                        if ($user != null) {
                            $data['name'] = $user->name;
                            $data['email'] = $user->email;
                            $data['status'] = $user->status;
                            $data['image'] = $user->image;
                            $data['role'] = $user->role;
                            $data['phone'] = $user->phone;
                        }
                    }
                    ?>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header py-2">
                                    <h4 class="card-title">Edit User </h4>
                                </div>
                                <div class="card-body">
                                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" enctype="multipart/form-data">

                                        <input type="hidden" name="userId" value="<?php echo $user->id; ?>">
                                        <input type="hidden" name="userOldImage" value="<?php echo $user->image; ?>">

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="mb-3">
                                                    <label for="name" class="form-label">Name <strong class="text-danger">*</strong></label>
                                                    <input type="text" class="form-control" name="name" id="name" value="<?php echo $data['name'] ?? ''; ?>">
                                                    <span class="text-danger"><?php echo  $errors['name'] ?? ''; ?></span>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="email" class="form-label">Email <strong class="text-danger">*</strong></label>
                                                    <input type="email" name="email" class="form-control" id="email" readonly value="<?php echo $data['email'] ?? ''; ?>">

                                                    <input type="hidden" name="oldEmail" value="<?php echo $data['email'] ?? ''; ?>">

                                                    <span class="text-danger"><?php echo  $errors['email'] ?? ''; ?></span>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="phone" class="form-label">Phone</label>
                                                    <input type="text" min="0" name="phone" class="form-control" id="phone" value="<?php echo $data['phone'] ?? ''; ?>">
                                                    <span class="text-danger"><?php echo  $errors['phone'] ?? ''; ?></span>
                                                </div>

                                            </div>

                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="image" class="form-label">User Image</label>
                                                    <input type="file" name="image" class="form-control dropify" data-default-file="<?php echo $data['image'] ?? ''; ?>" data-max-file-size="2M" data-allowed-file-extensions="jgp jpeg png webp" id="image">
                                                    <span class="text-danger"><?php echo  $errors['image'] ?? ''; ?></span>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="role" class="form-label">Select Role <strong class="text-danger">*</strong></label>
                                                    <select name="role" id="role" class="form-select">
                                                        <option value="" disabled>Select Role</option>
                                                        <option <?php echo isset($user->role) && $user->role == 'admin' ? 'selected' : '' ?> value="admin">Admin</option>
                                                        <option <?php echo isset($user->role) && $user->role == 'editor' ? 'selected' : '' ?> value="editor">Editor</option>
                                                    </select>
                                                    <span class="text-danger"><?php echo  $errors['role'] ?? ''; ?></span>
                                                </div>

                                                <div>
                                                    <label for="inlineRadioOptions" class="form-label">Status: <strong class="text-danger">*</strong></label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" <?php echo $data['status'] == 'active' ? 'checked' : ''; ?> name="status" id="inlineRadio1" value="active">
                                                    <label class="form-check-label" for="inlineRadio1">Active</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" <?php echo $data['status'] == 'inactive' ? 'checked' : ''; ?> name="status" id="inlineRadio2" value="inactive">
                                                    <label class="form-check-label" for="inlineRadio2">Inactive</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="text-center py-2">
                                            <button type="submit" name="submit" class="btn btn-primary">Update</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- footer -->
            <?php
            include "layout/footer.php";
            ?>
        </div>
    </div>
    <!--   Core JS Files   -->
    <?php
    include "layout/script.php";
    ?>

    <!-- page js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js" integrity="sha512-8QFTrG0oeOiyWo/VM9Y8kgxdlCryqhIxVeRpWSezdRRAvarxVtwLnGroJgnVW9/XBRduxO/z1GblzPrMQoeuew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>
    <script>
        $(document).ready(function() {

            /* dropify active */

            $('.dropify').dropify({
                height: 120
            });
        });
    </script>

</body>

</html>