<?php
include "layout/head.php";

 if ($_SESSION['role'] !== 'admin') {
    echo ' <script>window.location.href = "dashboard.php";</script>';
 }
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
                                        <a href="user.php">Users</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-md-6 text-end">
                                <a href="userCreate.php" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i> Add New</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header py-2">
                                    <h4 class="card-title">All Users </h4>
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
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php

                                                $sql = "SELECT * FROM users where role != 'user'";
                                                $stmt = $pdo->prepare($sql);
                                                $stmt->execute();
                                                $users = $stmt->fetchAll(PDO::FETCH_OBJ);


                                                foreach ($users as $key => $user) {
                                                ?>
                                                    <tr>
                                                        <td><?php echo $key + 1 ?></td>
                                                        <td>

                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img src="<?php echo $user->image?? 'assets/img/default-user.png' ?>" style="width: 50px; height: 50px; border-radius: 50%;" alt="...">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <p> <?php echo $user->name ?></p>
                                                                    <span class="badge badge-primary"><?php echo $user->role ?></span>
                                                                </div>
                                                            </div>

                                                        </td>
                                                        <td><?php echo $user->email ?></td>
                                                        <td><?php echo $user->phone ?></td>
                                                        <td><?php echo $user->status ?></td>
                                                        <td>
                                                            <a href="userEdit.php?id=<?php echo $user->id; ?>" class="btn btn-success btn-sm"><i class="fa fa-edit"></i></a>
                                                            <?php
                                                            if ($_SESSION['role'] == 'admin') { ?>
                                                                <a onclick="return confirm('Are you sure to delete?')" href="userDelete.php?id=<?php echo $user->id; ?>" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
                                                            <?php      }
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