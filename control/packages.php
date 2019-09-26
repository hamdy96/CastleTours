<?php

require_once 'model/db/UserDao.php';

$UserDao = new UserDao();
$_UserData = new UserDao();
$_Pack = $_UserData->SelectAllWhere('Packages','id','best = 0');
$Count = count($_Pack);


for ($i = 0; $i < $Count; $i++) {

    echo '<div class="col-md-6 col-lg-3 mb-4 mb-lg-4">
            <a href="#" class="unit-1 text-center">
              <img src="'. $_Pack[$i]['image'] . '" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                <!--<strong class="text-primary mb-2 d-block">$390</strong>-->
                <h3 class="unit-1-heading">'. $_Pack[$i]['name'] . '</h3>
                <h4 class="unit-1-heading"> '. $_Pack[$i]['days'] . ' Days / '. $_Pack[$i]['nights'] . ' Nights</h4>
              </div>
            </a>
          </div>';

}


?>
