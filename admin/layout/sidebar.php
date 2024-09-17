  <div class="sidebar" data-background-color="dark">
      <div class="sidebar-logo">
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
      <div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
              <ul class="nav nav-secondary">

                  <li class="nav-item active">
                      <a href="dashboard.php">
                          <i class="fas fa-home"></i>
                          <p>Dashboard</p>
                      </a>
                  </li>
                  <?php
                    if ($_SESSION['role'] == 'admin') { ?>
                      <li class="nav-item">
                          <a href="category.php">
                              <i class="fas fa-th-large"></i>
                              <p>Category</p>
                          </a>
                      </li>
                  <?php } ?>

                  <li class="nav-item">
                      <a href="tag.php">
                          <i class="fas fa-th-large"></i>
                          <p>Tag</p>
                      </a>
                  </li>

                  <li class="nav-item">
                      <a href="post.php">
                          <i class="fas fa-th-large"></i>
                          <p>Posts</p>
                      </a>
                  </li>
                  <?php
                    if ($_SESSION['role'] == 'admin') { ?>
                      <li class="nav-item">
                          <a href="user.php">
                              <i class="fas fa-users"></i>
                              <p>Admins</p>
                          </a>
                      </li>

                  <?php } ?>


              </ul>
          </div>
      </div>
  </div>