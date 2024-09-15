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
                                        <a href="post.php">Post</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-md-6 text-end">
                                <a href="postCreate.php" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i> Add New</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header py-2">
                                    <h4 class="card-title">Posts </h4>
                                </div>
                                <div class="card-body">
                                    <?php
                                    if (isset($_SESSION['success'])) { ?>
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Success!</strong> <?php echo $_SESSION['success']; ?>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    <?php unset($_SESSION['success']);
                                    }
                                    ?>
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="datatable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Category</th>
                                                    <th scope="col">Author</th>
                                                    <th scope="col">Created_At</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php

                                                $sql = "SELECT post.*, category.name as categoryName,users.name as author FROM post
                                                    INNER JOIN category ON post.category_id = category.id INNER JOIN users ON post.user_id = users.id ORDER BY post.id DESC;";
                                                $stmt = $pdo->prepare($sql);
                                                $stmt->execute();
                                                $posts = $stmt->fetchAll(PDO::FETCH_OBJ);


                                                foreach ($posts as $key => $post) {
                                                ?>
                                                    <tr>
                                                        <td><?php echo $key + 1 ?></td>
                                                        <td>
                                                            <img style="width: 50px;" src="<?php echo $post->image ?>" alt="">
                                                        </td>
                                                        <td><?php echo $post->title ?></td>
                                                        <td><?php echo $post->categoryName ?></td>
                                                        <td><?php echo $post->author ?></td>
                                                        <td><?php echo $post->created_at ?></td>

                                                        <td>
                                                            <a href="postShow.php?id=<?php echo $post->id; ?>" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
                                                            <a href="postEdit.php?id=<?php echo $post->id; ?>" class="btn btn-success btn-sm"><i class="fa fa-edit"></i></a>

                                                            <?php
                                                            if ($_SESSION['user_id'] == $post->user_id || $_SESSION['role'] == "admin") { ?>
                                                                <a onclick="return confirm('Are you sure to delete?')" href="postDelete.php?id=<?php echo $post->id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
                                                            <?php     }
                                                            ?>

                                                        </td>
                                                    </tr>
                                                <?php
                                                }
                                                ?>


                                            </tbody>
                                        </table>
                                    </div>
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

    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Sweet Alert -->
    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#datatable').DataTable();
        });
    </script>
</body>

</html>