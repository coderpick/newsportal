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

                    <?php

                    $data = [];
                    $errors = [];

                    if (isset($_POST['submit'])) {

                        $title = validate($_POST['title']);
                        $slug  = validate($_POST['slug']);
                        $description = validate($_POST['description']);
                        $category      = $_POST['category'] ?? '';
                        $tags          = $_POST['tags'] ?? '';
                        $data['is_published'] = $_POST['is_published'] ?? '';
                        $data['is_featured'] = $_POST['is_featured'] ?? '';

                        $fileName = $_FILES['image']['name'];
                        $fileTmp = $_FILES['image']['tmp_name'];
                        $fileSize = $_FILES['image']['size'];

                        if (empty($title)) {
                            $errors['title'] = 'Post title is required';
                        } else {
                            $data['title'] = $title;
                        }
                        if (empty($slug)) {
                            $errors['slug'] = 'Post slug is required';
                        } else {
                            $data['slug'] = $slug;
                        }

                        if (empty($description)) {
                            $errors['description'] = 'Post description is required';
                        } else {
                            $data['description'] = $description;
                        }
                        if (empty($category)) {
                            $errors['category'] = 'Category is required';
                        } else {
                            $data['category'] = $category;
                        }
                        if (empty($tags)) {
                            $errors['tag'] = 'Tag is required';
                        } else {
                            $data['tags'] = $tags;
                        }

                        $ext = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
                        $allowItem = array('jpg', 'jpeg', 'png', 'webp');
                        $uniqueImgName = uniqid() . time() . '.' . $ext;
                        $upload_Image = 'uploads/post/' . $uniqueImgName;

                        if (empty($fileName)) {
                            $errors['image'] = "Post image is required";
                        } elseif ($fileSize > 1048576) {
                            /* max photo size 1mb */
                            $errors['image'] = "Image size less then 1mb required";
                        } else {
                            if (!in_array($ext, $allowItem)) {
                                $errors['image'] = "Only jpg, jpeg, webp & png allow";
                            } else {
                                $data['image'] = $upload_Image;
                            }
                        }
                        // echo "<pre>";

                        // print_r($data);

                        try {
                            if (empty($errors)) {

                                /* user_id`, `category_id`, `title`, `slug`, `description`, `image`, `is_published`, `is_featured */
                                $sql = "INSERT INTO post(category_id, user_id, title, slug, description, image, is_published, is_featured)VALUES(:categoryId, :userId, :title, :slug, :description, :image, :is_published, :is_featured)";

                                if ($stmt = $pdo->prepare($sql)) {
                                    $stmt->bindParam(':categoryId', $data['category'], PDO::PARAM_INT);
                                    $stmt->bindParam(':userId', $_SESSION['user_id'], PDO::PARAM_INT);
                                    $stmt->bindParam(':title', $data['title'], PDO::PARAM_STR);
                                    $stmt->bindParam(':slug', $data['slug'], PDO::PARAM_STR);
                                    $stmt->bindParam(':description', $data['description'], PDO::PARAM_STR);
                                    $stmt->bindParam(':image', $data['image'], PDO::PARAM_STR);
                                    $stmt->bindParam(':is_published', $data['is_published'], PDO::PARAM_STR);
                                    $stmt->bindParam(':is_featured', $data['is_featured'], PDO::PARAM_STR);
                                    $stmt->execute();

                                    $lastPostId = $pdo->lastInsertId();

                                    /* insert post tags */
                                    if ($data['tags']) {
                                        foreach ($tags as $key => $tag) {
                                            $sql = "INSERT INTO post_tag(post_id,tag_id)VALUES(:post_id,:tag_id)";
                                            if ($stmt = $pdo->prepare($sql)) {
                                                $stmt->bindParam(':post_id', $lastPostId, PDO::PARAM_INT);
                                                $stmt->bindParam(':tag_id', $tags[$key], PDO::PARAM_INT);
                                                $stmt->execute();
                                            }
                                        }
                                    }

                                    if ($lastPostId) {

                                        if ($fileName != null) {
                                            move_uploaded_file($fileTmp, $upload_Image);
                                        }

                                        $_SESSION['success'] = "Post created successfully";

                                        echo '<script>window.location.href = "post.php";</script>';
                                    }
                                }
                            }
                        } catch (\Exception $e) {
                            die($e->getMessage());
                        }
                    }

                    ?>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header py-2">
                                    <h4 class="card-title">Add Post </h4>
                                </div>
                                <div class="card-body">
                                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" enctype="multipart/form-data">

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="mb-3">
                                                    <label for="title" class="form-label">Title</label>
                                                    <input type="text" class="form-control" name="title" id="title" value="<?php echo $data['title'] ?? ''; ?>">
                                                    <span class="text-danger"><?php echo  $errors['title'] ?? ''; ?></span>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="slug" class="form-label">Slug</label>
                                                    <input type="text" name="slug" class="form-control" id="slug" value="<?php echo $data['slug'] ?? ''; ?>">
                                                    <span class="text-danger"><?php echo  $errors['slug'] ?? ''; ?></span>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="description" class="form-label">Post Description</label>
                                                    <textarea type="text" name="description" class="form-control" id="description"><?php echo $data['description'] ?? ''; ?></textarea>
                                                    <span class="text-danger"><?php echo  $errors['description'] ?? ''; ?></span>
                                                </div>


                                                <?php
                                                $sql = "SELECT * FROM tag";
                                                $stmt = $pdo->query($sql);
                                                $tags = $stmt->fetchAll(PDO::FETCH_OBJ);
                                                ?>
                                                <div class="form-group">
                                                    <label for="tag" class="form-label">Select Tags</label>
                                                    <select name="tags[]" id="tag" class="form-control" multiple>
                                                        <option value="">Select tag</option>
                                                        <?php
                                                        if ($tags != null) {
                                                            foreach ($tags as $key => $tag) { ?>
                                                                <option value="<?php echo $tag->id; ?>"><?php echo $tag->name; ?>
                                                                </option>

                                                        <?php }
                                                        } ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo $errors['tag'] ?? ''; ?></span>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="image" class="form-label">Post Feature Image</label>
                                                    <input type="file" name="image" class="form-control dropify" data-max-file-size="2M" data-allowed-file-extensions="jgp jpeg png webp" id="image">
                                                    <span class="text-danger"><?php echo  $errors['image'] ?? ''; ?></span>
                                                </div>
                                                <?php

                                                $sql = "SELECT * FROM category";
                                                $stmt = $pdo->prepare($sql);
                                                $stmt->execute();
                                                $categories = $stmt->fetchAll(PDO::FETCH_OBJ);

                                                ?>
                                                <div class="mb-3">
                                                    <label for="category" class="form-label">Select Category</label>
                                                    <select name="category" id="category" class="form-select">
                                                        <option value="">Select Category</option>
                                                        <?php
                                                        foreach ($categories as $category) {
                                                        ?>
                                                            <option value="<?php echo $category->id; ?>"><?php echo $category->name; ?></option>
                                                        <?php
                                                        }
                                                        ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo  $errors['category'] ?? ''; ?></span>
                                                </div>

                                                <div>
                                                    <label for="inlineRadioOptions" class="form-label">Status: <strong class="text-danger">*</strong></label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="is_published" id="inlineRadio1" value="1">
                                                    <label class="form-check-label" for="inlineRadio1">Published</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="is_published" checked id="inlineRadio2" value="0">
                                                    <label class="form-check-label" for="inlineRadio2">Draft</label>
                                                </div>


                                                <div>
                                                    <label for="inlineRadioOptions" class="form-label">Is Feature: <strong class="text-danger">*</strong></label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="is_featured" id="yes" value="1">
                                                    <label class="form-check-label" for="yes">Yes</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="is_featured" checked id="no" value="0">
                                                    <label class="form-check-label" for="no">No</label>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="text-center py-4">
                                            <button type="submit" name="submit" class="btn btn-primary">Submit</button>
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
                callbacks: {
                    onPaste: function(e) {
                        var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                        e.preventDefault();
                        document.execCommand('insertText', false, bufferText);
                    }
                }
            });

            /* dropify active */

            $('.dropify').dropify();

            $('#tag').select2();
        });
    </script>

</body>

</html>