<?php
include('layout/head.php');
?>

<body>
    <!--  sidebar -->
    <?php
    include('layout/sidebar.php');
    ?>
    <!--  sidebar -->


    <!-- header nav -->
    <?php
    include('layout/header.php');
    ?>
    <!-- header nav -->



    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>Category</h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title d-flex justify-content-end align-items-center">
                                <a href="category.php" class="btn btn-danger">Back to list</a>

                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <section id="main-content">

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                             
                                <div class="card-body">
                                    <div class="basic-form">
                                        <form action="#" method="post">
                                            <div class="mb-3">
                                                <label class="form-label">Category Name</label>
                                                <input type="text" class="form-control" placeholder="Category Name">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Category Slug</label>
                                                <input type="text" class="form-control" placeholder="Category Name">
                                            </div>

                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer">
                                <p>2018 © Admin Board. - <a href="#">example.com</a></p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>



    <div id="search">
        <button type="button" class="close">×</button>
        <form>
            <input type="search" value="" placeholder="type keyword(s) here" />
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
    <!-- jquery vendor -->
    <?php
    include('layout/script.php');
    ?>

    <script src="assets/js/scripts.js"></script>
    <!-- scripit init-->


</body>

</html>