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
                                        <a href="tag.php">tag</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-md-6 text-end">
                                <a href="tag.php" class="btn btn-danger btn-sm"><i class="fa fa-reply"></i> Back to list</a>
                            </div>
                        </div>
                    </div>

                    <?php

                    $data = [];
                    $errors = [];

                    if (isset($_POST['submit'])) {

                        $name = $_POST['name'];
                        $slug = $_POST['slug'];
                        $tagId   = $_POST['tagId'];


                        if (empty($name)) {
                            $errors['name'] = "Name is required";
                        } else {
                            $data['name'] = $name;
                        }

                        if (empty($slug)) {
                            $errors['slug'] = "Slug is required";
                        } else {
                            $data['slug'] = $slug;
                        }

                        try {
                            if (empty($errors)) {

                                $sql = "UPDATE tag SET name =:name, slug =:slug WHERE id =:id";

                                $stmt = $pdo->prepare($sql);
                                $stmt->bindParam(':name', $data['name'], PDO::PARAM_STR);
                                $stmt->bindParam(':slug', $data['slug'], PDO::PARAM_STR);
                                $stmt->bindParam(':id', $tagId, PDO::PARAM_INT);
                                $stmt->execute();
                                $_SESSION['success'] = "Tag update successfully";

                                echo ' <script>window.location.href = "tag.php";</script>';
                                exit();
                            }
                        } catch (\Exception $e) {
                            die($e->getMessage());
                        }
                    }

                    if (isset($_GET['id']) && !empty($_GET['id'])) {
                        $id = $_GET['id'];

                        $sql = "SELECT * FROM tag WHERE id = :id";
                        $stmt = $pdo->prepare($sql);
                        $stmt->bindParam(':id', $id);
                        $stmt->execute();
                        $tag = $stmt->fetch(PDO::FETCH_OBJ);
                    }

                    ?>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header py-2">
                                    <h4 class="card-title">Add Tag </h4>
                                </div>
                                <div class="card-body">
                                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">

                                        <input type="hidden" name="tagId" value="<?php echo $tag->id ?? ''; ?>">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Name</label>
                                            <input type="text" class="form-control" name="name" id="name" value="<?php echo $tag->name ?? $data['name'] ?? ''; ?>">
                                            <span class="text-danger"><?php echo  $errors['name'] ?? ''; ?></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="slug" class="form-label">Slug</label>
                                            <input type="text" name="slug" class="form-control" id="slug" value="<?php echo $tag->slug ?? $data['slug'] ?? ''; ?>">
                                            <span class="text-danger"><?php echo  $errors['slug'] ?? ''; ?></span>
                                        </div>

                                        <button type="submit" name="submit" class="btn btn-primary">Update</button>
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



    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>
    <script>
        $(document).ready(function() {

            $("#name").keyup(function() {

                var text = $(this).val();

                text = text.toLowerCase();
                text = text.replace(text, text)
                text = text.replace(/^-+|-+$/g, '')
                text = text.replace(/\s/g, '-')
                text = text.replace(/\-\-+/g, '-');
                $("#slug").val(text);
            });
        });
    </script>

</body>

</html>