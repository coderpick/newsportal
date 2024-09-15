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
                                <a href="post.php" class="btn btn-danger btn-sm"><i class="fa fa-reply"></i> Back to list</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header py-2">
                                    <h4 class="card-title">Post Detils </h4>
                                </div>
                                <div class="card-body">
                                    <?php

                                    if (isset($_GET['id']) && !empty($_GET['id'])) {
                                        $id = $_GET['id'];

                                        $sql = "SELECT post.*, category.name as categoryName,users.name as author FROM post
                                                    INNER JOIN category ON post.category_id = category.id INNER JOIN users ON post.user_id = users.id  WHERE post.id = :id";
                                        $stmt = $pdo->prepare($sql);
                                        $stmt->bindParam(':id', $id);
                                        $stmt->execute();
                                        $post = $stmt->fetch(PDO::FETCH_OBJ);

                                       
                                    }
                                    ?>
                                    <h4><?php echo $post->categoryName ?></h4>
                                    <h1><?php echo $post->title ?></h1>
                                    <p>
                                        Author: <?php echo $post->author ?> | <span><?php echo $post->created_at ?></span>
                                    </p>
                                    <img src="<?php echo $post->image ?>" alt="">
                                    <p>
                                        <?php echo html_entity_decode($post->description) ?>
                                    </p>

                                    <?php


                                    $sql = "SELECT tag.* FROM tag INNER JOIN post_tag ON tag.id = post_tag.tag_id WHERE post_id=:postId";
                                    $stmt = $pdo->prepare($sql);
                                    $stmt->bindParam(':postId', $post->id, PDO::PARAM_INT);
                                    $stmt->execute();
                                    $tags = $stmt->fetchAll(PDO::FETCH_OBJ);
                                    if ($tags) {
                                        foreach ($tags as $key => $tag) { ?>
                                            <span class="badge badge-info badge-pill m-r-5 m-b-5"><?php echo $tag->name; ?></span>
                                    <?php
                                        }
                                    }



                                    ?>
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
            <!-- PAGE LEVEL SCRIPTS-->
            <script src="assets/vendor/summernote/dist/summernote-bs4.min.js"></script>
            <script src="assets/vendor/select2/dist/js/select2.full.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js" integrity="sha512-8QFTrG0oeOiyWo/VM9Y8kgxdlCryqhIxVeRpWSezdRRAvarxVtwLnGroJgnVW9/XBRduxO/z1GblzPrMQoeuew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

            <!-- Kaiadmin JS -->
            <script src="assets/js/kaiadmin.min.js"></script>
            <script>
                $(document).ready(function() {

                    $("#title").keyup(function() {

                        var text = $(this).val();

                        text = text.toLowerCase();
                        text = text.replace(text, text)
                        text = text.replace(/^-+|-+$/g, '')
                        text = text.replace(/\s/g, '-')
                        text = text.replace(/\-\-+/g, '-');
                        $("#slug").val(text);
                    });

                    /* summernote active */
                    $('#description').summernote({
                        height: 250,
                        placeholder: 'Write post details',
                        tabsize: 2,
                    });

                    /* dropify active */

                    $('.dropify').dropify();

                    $('#tag').select2();
                });
            </script>

</body>

</html>