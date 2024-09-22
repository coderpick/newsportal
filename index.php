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
            <div class="col-xl-8 stretch-card grid-margin">
              <div class="position-relative">

                <?php
                $slq = "SELECT * FROM post WHERE is_published = true ORDER BY id DESC LIMIT 1 ";
                $result = $pdo->query($slq);
                $latestPost = $result->fetch(PDO::FETCH_OBJ);

                if ($latestPost != null) { ?>

                  <img src="admin/<?php echo $latestPost->image ?>" alt="banner"
                    class="img-fluid" />
                  <div class="banner-content">

                    <h1 class="mb-0"> <?php echo $latestPost->title ?></h1>
                    <h1 class="mb-2 text-white">
                      <?php echo  html_entity_decode(str_limit($latestPost->description, 40)) ?> <a href="">Read more</a>
                    </h1>
                    <div class="fs-12">
                      <span class="mr-2">
                        <?php
                        $date = date_create($latestPost->created_at);
                        echo  date_format($date, "d M Y H:i:s");
                        ?>
                      </span>
                    </div>
                  </div>

                <?php } ?>
              </div>
            </div>
            <div class="col-xl-4 stretch-card grid-margin">
              <div class="card bg-dark text-white">
                <div class="card-body">
                  <h2>Latest news</h2>
                  <?php
                  $slq = "SELECT * FROM post WHERE is_published = true ORDER BY id DESC LIMIT 3 ";
                  $result = $pdo->query($slq);
                  $latestPosts = $result->fetchAll(PDO::FETCH_OBJ);
                  if ($latestPosts != null) {
                    foreach ($latestPosts as $latestPost) { ?>
                      <div class="d-flex border-bottom-blue pt-3 pb-4 align-items-center justify-content-between">
                        <div class="pr-3">
                          <h5><?php echo $latestPost->title ?></h5>
                          <div class="fs-12">
                            <span class="mr-2">
                              <?php
                              $date = date_create($latestPost->created_at);
                              echo  date_format($date, "d M Y H:i:s");
                              ?>
                            </span>
                          </div>
                        </div>
                        <div class="rotate-img">
                          <img src="admin/<?php echo $latestPost->image ?>"
                            alt="thumb" class="img-fluid img-lg" />
                        </div>
                      </div>
                  <?php }
                  }   ?>
                </div>
              </div>
            </div>
          </div>
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
                  $slq = "SELECT post.*,category.name as categoryName FROM post 
                        INNER JOIN category ON
                        post.category_id=category.id 
                        WHERE post.is_published = true AND post.is_featured = true
                        ORDER BY post.id DESC LIMIT 3;
                        ";
                  $result = $pdo->query($slq);
                  $posts = $result->fetchAll(PDO::FETCH_OBJ);

                  if ($posts != null) {
                    foreach ($posts as $post) { ?>
                      <div class="row">
                        <div class="col-sm-4 grid-margin">
                          <div class="position-relative">
                            <div class="rotate-img">
                              <img src="admin/<?php echo $post->image ?>"
                                alt="thumb" class="img-fluid" />
                            </div>
                            <div class="badge-positioned">
                              <span class="badge badge-danger font-weight-bold">
                                <?php echo $post->categoryName ?>
                              </span>
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
                  <?php }
                  }  ?>


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
          <div class="row" data-aos="fade-up">
            <div class="col-sm-12">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-xl-6">
                      <div class="card-title">
                        Sport light
                      </div>
                      <div class="row">
                        <div class="col-xl-6 col-lg-8 col-sm-6">
                          <div class="rotate-img">
                            <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_16.jpg"
                              alt="thumb" class="img-fluid" />
                          </div>
                          <h2 class="mt-3 text-primary mb-2">
                            Newsrooms exercise..
                          </h2>
                          <p class="fs-13 mb-1 text-muted">
                            <span class="mr-2">Photo </span>10 Minutes ago
                          </p>
                          <p class="my-3 fs-15">
                            Lorem Ipsum has been the industry's standard dummy
                            text ever since the 1500s, when an unknown printer
                            took
                          </p>
                          <a href="index.html#" class="font-weight-600 fs-16 text-dark">Read more</a>
                        </div>
                        <div class="col-xl-6 col-lg-4 col-sm-6">
                          <div class="border-bottom pb-3 mb-3">
                            <h3 class="font-weight-600 mb-0">
                              Social distancing is ..
                            </h3>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">Photo </span>10 Minutes ago
                            </p>
                            <p class="mb-0">
                              Lorem Ipsum has been the industry's
                            </p>
                          </div>
                          <div class="border-bottom pb-3 mb-3">
                            <h3 class="font-weight-600 mb-0">
                              Panic buying is forcing..
                            </h3>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">Photo </span>10 Minutes ago
                            </p>
                            <p class="mb-0">
                              Lorem Ipsum has been the industry's
                            </p>
                          </div>
                          <div class="border-bottom pb-3 mb-3">
                            <h3 class="font-weight-600 mb-0">
                              Businesses ask hundreds..
                            </h3>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">Photo </span>10 Minutes ago
                            </p>
                            <p class="mb-0">
                              Lorem Ipsum has been the industry's
                            </p>
                          </div>
                          <div>
                            <h3 class="font-weight-600 mb-0">
                              Tesla's California factory..
                            </h3>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">Photo </span>10 Minutes ago
                            </p>
                            <p class="mb-0">
                              Lorem Ipsum has been the industry's
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-6">
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="card-title">
                            Sport light
                          </div>
                          <div class="border-bottom pb-3">
                            <div class="rotate-img">
                              <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_17.jpg"
                                alt="thumb" class="img-fluid" />
                            </div>
                            <p class="fs-16 font-weight-600 mb-0 mt-3">
                              Kaine: Trump Jr. may have
                            </p>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">Photo </span>10 Minutes ago
                            </p>
                          </div>
                          <div class="pt-3 pb-3">
                            <div class="rotate-img">
                              <img src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_18.jpg"
                                alt="thumb" class="img-fluid" />
                            </div>
                            <p class="fs-16 font-weight-600 mb-0 mt-3">
                              Kaine: Trump Jr. may have
                            </p>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">Photo </span>10 Minutes ago
                            </p>
                          </div>
                        </div>
                        <div class="col-sm-6">
                          <div class="card-title">
                            Celebrity news
                          </div>
                          <div class="row">
                            <div class="col-sm-12">
                              <div class="border-bottom pb-3">
                                <div class="row">
                                  <div class="col-sm-5 pr-2">
                                    <div class="rotate-img">
                                      <img
                                        src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_19.jpg"
                                        alt="thumb" class="img-fluid w-100" />
                                    </div>
                                  </div>
                                  <div class="col-sm-7 pl-2">
                                    <p class="fs-16 font-weight-600 mb-0">
                                      Online shopping ..
                                    </p>
                                    <p class="fs-13 text-muted mb-0">
                                      <span class="mr-2">Photo </span>10
                                      Minutes ago
                                    </p>
                                    <p class="mb-0 fs-13">
                                      Lorem Ipsum has been
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-sm-12">
                              <div class="border-bottom pb-3 pt-3">
                                <div class="row">
                                  <div class="col-sm-5 pr-2">
                                    <div class="rotate-img">
                                      <img
                                        src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_20.jpg"
                                        alt="thumb" class="img-fluid w-100" />
                                    </div>
                                  </div>
                                  <div class="col-sm-7 pl-2">
                                    <p class="fs-16 font-weight-600 mb-0">
                                      Online shopping ..
                                    </p>
                                    <p class="fs-13 text-muted mb-0">
                                      <span class="mr-2">Photo </span>10
                                      Minutes ago
                                    </p>
                                    <p class="mb-0 fs-13">
                                      Lorem Ipsum has been
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-sm-12">
                              <div class="border-bottom pb-3 pt-3">
                                <div class="row">
                                  <div class="col-sm-5 pr-2">
                                    <div class="rotate-img">
                                      <img
                                        src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_21.jpg"
                                        alt="thumb" class="img-fluid w-100" />
                                    </div>
                                  </div>
                                  <div class="col-sm-7 pl-2">
                                    <p class="fs-16 font-weight-600 mb-0">
                                      Online shopping ..
                                    </p>
                                    <p class="fs-13 text-muted mb-0">
                                      <span class="mr-2">Photo </span>10
                                      Minutes ago
                                    </p>
                                    <p class="mb-0 fs-13">
                                      Lorem Ipsum has been
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-sm-12">
                              <div class="pt-3">
                                <div class="row">
                                  <div class="col-sm-5 pr-2">
                                    <div class="rotate-img">
                                      <img
                                        src="https://demo.bootstrapdash.com/world-time/assets/images/dashboard/home_22.jpg"
                                        alt="thumb" class="img-fluid w-100" />
                                    </div>
                                  </div>
                                  <div class="col-sm-7 pl-2">
                                    <p class="fs-16 font-weight-600 mb-0">
                                      Online shopping ..
                                    </p>
                                    <p class="fs-13 text-muted mb-0">
                                      <span class="mr-2">Photo </span>10
                                      Minutes ago
                                    </p>
                                    <p class="mb-0 fs-13">
                                      Lorem Ipsum has been
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
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