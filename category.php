<?php
include "layout/head.php";
?>

<body>
    <div class="container-scroller">
        <div class="main-panel">
            <!-- partial:partials/_navbar.html -->
            <?php
            include "layout/header.php";
            ?>

            <!-- partial -->
            <?php
            include "layout/flash_news.php";
            ?>
            <div class="content-wrapper">
                <div class="container">

                    <div class="row" data-aos="fade-up">
                        <div class="col-lg-3 stretch-card grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <h2>Category</h2>
                                    <ul class="vertical-menu">
                                        <?php
                                        $slq = "SELECT * FROM category";
                                        $result = $pdo->query($slq);
                                        $categories = $result->fetchAll(PDO::FETCH_OBJ);

                                        if ($categories != null) {
                                            foreach ($categories as $category) { ?>
                                                <li><a href="category.php?id=<?php echo $category->id ?>"><?php echo $category->name ?></a></li>
                                        <?php }
                                        }

                                        ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 stretch-card grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <?php

                                    if (isset($_GET['id']) && !empty($_GET['id'])) {

                                        $categoryId = $_GET['id'];

                                        $sql = "SELECT * FROM post WHERE category_id = :categoryId";
                                        if ($stmt = $pdo->prepare($sql)) {
                                            $stmt->bindParam(':categoryId', $categoryId, PDO::PARAM_INT);
                                            $stmt->execute();
                                            $categoryPosts = $stmt->fetchAll(PDO::FETCH_OBJ);
                                            if ($categoryPosts != null) {
                                                foreach ($categoryPosts as $key => $post) { ?>

                                                    <div class="row">
                                                        <div class="col-sm-4 grid-margin">
                                                            <div class="position-relative">
                                                                <div class="rotate-img">
                                                                    <img src="admin/<?php echo $post->image ?>"
                                                                        alt="thumb" class="img-fluid" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8  grid-margin">
                                                            <h2 class="mb-2 font-weight-600">
                                                                <?php echo $post->title ?>
                                                            </h2>
                                                            <div class="fs-13 mb-2">
                                                                <span class="mr-2">
                                                                    <?php
                                                                    $date = date_create($post->created_at);
                                                                    echo  date_format($date, "d M Y H:i:s");
                                                                    ?>
                                                                </span>
                                                            </div>
                                                            <p class="mb-0">
                                                                <?php echo  html_entity_decode(str_limit($post->description, 40)) ?> <a href="">Read more</a>
                                                            </p>
                                                        </div>
                                                    </div>

                                    <?php
                                                }
                                            } else {
                                                echo "This category has no post available";
                                            }
                                        }
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" data-aos="fade-up">
                        <div class="col-sm-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="card-title">
                                                Video
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 grid-margin">
                                                    <div class="position-relative">
                                                        <div class="rotate-img">
                                                            <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_7.jpg"
                                                                alt="thumb" class="img-fluid" />
                                                        </div>
                                                        <div class="badge-positioned w-90">
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="badge badge-danger font-weight-bold">Lifestyle</span>
                                                                <div class="video-icon">
                                                                    <i class="mdi mdi-play"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 grid-margin">
                                                    <div class="position-relative">
                                                        <div class="rotate-img">
                                                            <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_8.jpg"
                                                                alt="thumb" class="img-fluid" />
                                                        </div>
                                                        <div class="badge-positioned w-90">
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="badge badge-danger font-weight-bold">National News</span>
                                                                <div class="video-icon">
                                                                    <i class="mdi mdi-play"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 grid-margin">
                                                    <div class="position-relative">
                                                        <div class="rotate-img">
                                                            <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_9.jpg"
                                                                alt="thumb" class="img-fluid" />
                                                        </div>
                                                        <div class="badge-positioned w-90">
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="badge badge-danger font-weight-bold">Lifestyle</span>
                                                                <div class="video-icon">
                                                                    <i class="mdi mdi-play"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 grid-margin">
                                                    <div class="position-relative">
                                                        <div class="rotate-img">
                                                            <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_10.jpg"
                                                                alt="thumb" class="img-fluid" />
                                                        </div>
                                                        <div class="badge-positioned w-90">
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="badge badge-danger font-weight-bold">National News</span>
                                                                <div class="video-icon">
                                                                    <i class="mdi mdi-play"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="card-title">
                                                    Latest Video
                                                </div>
                                                <p class="mb-3">See all</p>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center border-bottom pb-2">
                                                <div class="div-w-80 mr-3">
                                                    <div class="rotate-img">
                                                        <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_11.jpg"
                                                            alt="thumb" class="img-fluid" />
                                                    </div>
                                                </div>
                                                <h3 class="font-weight-600 mb-0">
                                                    Apple Introduces Apple Watch
                                                </h3>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center border-bottom pt-3 pb-2">
                                                <div class="div-w-80 mr-3">
                                                    <div class="rotate-img">
                                                        <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_12.jpg"
                                                            alt="thumb" class="img-fluid" />
                                                    </div>
                                                </div>
                                                <h3 class="font-weight-600 mb-0">
                                                    SEO Strategy & Google Search
                                                </h3>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center border-bottom pt-3 pb-2">
                                                <div class="div-w-80 mr-3">
                                                    <div class="rotate-img">
                                                        <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_13.jpg"
                                                            alt="thumb" class="img-fluid" />
                                                    </div>
                                                </div>
                                                <h3 class="font-weight-600 mb-0">
                                                    Cycling benefit & disadvantag
                                                </h3>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center border-bottom pt-3 pb-2">
                                                <div class="div-w-80 mr-3">
                                                    <div class="rotate-img">
                                                        <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_14.jpg"
                                                            alt="thumb" class="img-fluid" />
                                                    </div>
                                                </div>
                                                <h3 class="font-weight-600">
                                                    The Major Health Benefits of
                                                </h3>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center pt-3">
                                                <div class="div-w-80 mr-3">
                                                    <div class="rotate-img">
                                                        <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_15.jpg"
                                                            alt="thumb" class="img-fluid" />
                                                    </div>
                                                </div>
                                                <h3 class="font-weight-600 mb-0">
                                                    Powerful Moments of Peace
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- main-panel ends -->
            <!-- container-scroller ends -->

            <!-- partial:partials/_footer.html -->
            <?php
            include "layout/footer.php";
            ?>

            <!-- partial -->
        </div>
    </div>
    <?php
    include "layout/script.php";
    ?>
</body>

</html>