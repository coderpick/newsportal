  <div class="header">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12">
                  <div class="float-left">
                      <div class="hamburger sidebar-toggle">
                          <span class="line"></span>
                          <span class="line"></span>
                          <span class="line"></span>
                      </div>
                  </div>
                  <div class="float-right">
                      <ul>
                          <li class="header-icon dib"><span class="user-avatar">
                                  <?php
                                    echo $_SESSION['name'];
                                    ?>
                                  <i class="ti-angle-down f-s-10"></i></span>
                              <div class="drop-down dropdown-profile">
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li><a href="#"><i class="ti-user"></i> <span>Profile</span></a></li>
                                          <li><a href="logout.php"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
  </div>