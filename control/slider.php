<?php

require_once 'model/db/UserDao.php';

$_UserData = new UserDao();
$_Slider = $_UserData->SelectAllWhere('Sliders','id','hidden = 0');
$Count = count($_Slider);

echo '<div class="slide-one-item home-slider owl-carousel">';

for ($i = 0; $i < $Count; $i++) {

    echo '<div class="site-blocks-cover overlay" style="background-image: url('. $_Slider[$i]['image'] . ');" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              

              <h1 class="text-white font-weight-light">'. $_Slider[$i]['header'] .'</h1>
              <p class="mb-5">'. $_Slider[$i]['paragraph'] .'</p>
              <p><a href="'. $_Slider[$i]['url'] .'" class="btn btn-outline-primary py-3 px-5 text-white">Book Now!</a></p>

            </div>
          </div>
        </div>
      </div> ';

}

echo '</div>';

?>
