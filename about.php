<?php

   include 'components/connect.php';

   session_start();

   if(isset($_SESSION['user_id'])){
      $user_id = $_SESSION['user_id'];
   }else{
      $user_id = '';
   };

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>about</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include 'components/user_header.php'; ?>
<!-- header section ends -->

<div class="heading">
   <h3>about us</h3>
   <p><a href="index.php">Home</a> <span> / About</span></p>
</div>

<!-- about section starts  -->

<section class="about">

   <div class="row">

      <div class="image">
         <img src="images/about-img.svg" alt="">
      </div>

      <div class="content">
         <h3>Why Choose Us?</h3>
         <p>Indulge in the exquisite flavors of Japan at Lupakan Diet. Our commitment to authenticity shines through in every dish, prepared by skilled chefs using the freshest, sustainably sourced ingredients. From sushi and Sobacha to hearty ramen and flavorful Sushi our diverse menu offers a true taste of Japan.</p>
         <a href="menu.php" class="btn">Our Menu</a>
      </div>

   </div>

</section>

<!-- about section ends -->

<!-- steps section starts  -->

<section class="steps">

   <h1 class="title">simple steps</h1>

   <div class="box-container">

      <div class="box">
         <img src="images/step-1.png" alt="">
         <h3>choose order</h3>
         <p>Make your selection from our menu.Your culinary adventure begins with the power to handpick your favorite dishes - the possibilities are endless!</p>
      </div>

      <div class="box">
         <img src="images/step-2.png" alt="">
         <h3>fast delivery</h3>
         <p>Experience lightning-fast delivery that brings your favorite flavors right to your doorstep.</p>
      </div>

      <div class="box">
         <img src="images/step-3.png" alt="">
         <h3>enjoy food</h3>
         <p>Delight in an exceptional culinary experience as you savor each mouthwatering bite. At Lupakan Diet, we're dedicated to ensuring that every dish is a feast for your senses.</p>
      </div>

   </div>

</section>

<!-- steps section ends -->

<!-- reviews section starts  -->

<section class="reviews">

   <h1 class="title">Our Team</h1>

   <div class="swiper reviews-slider">

      <div class="swiper-wrapper">

         <div class="swiper-slide slide">
            <img src="images/linda.png" alt="">
            <p>"Pls bunuh aja gw sekarang"</p>
            <div class="stars">
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
            </div>
            <h3>Linda Sundoko<br />00000068320</h3>
         </div>

         <div class="swiper-slide slide">
            <img src="images/citra.png" alt="">
            <p>"Hidup ini terkadang kidding"</p>
            <div class="stars">
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
            </div>
            <h3>Nadhila Citra<br />00000072495</h3>
         </div>

         <div class="swiper-slide slide">
            <img src="images/nasywa.png" alt="">
            <p>"Gwaenchanayo~"</p>
            <div class="stars">
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
            </div>
            <h3>Nasywa Naura<br />00000071873</h3>
         </div>

         <div class="swiper-slide slide">
            <img src="images/theon.png" alt="">
            <p>"Nge-harem dulu boss"</p>
            <div class="stars">
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
            </div>
            <h3>Theon Anabel<br />00000076775</h3>
         </div>

         <div class="swiper-slide slide">
            <img src="images/vanes.png" alt="">
            <p>"Jangan lupa kasih bintang 5"</p>
            <div class="stars">
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
               <i class="fas fa-star"></i>
            </div>
            <h3>Vanesa Dwi<br />00000071818</h3>
         </div>

      </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

<!-- reviews section ends -->

<!-- footer section starts  -->
<?php include 'components/footer.php'; ?>
<!-- footer section ends -->=

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<script>

   var swiper = new Swiper(".reviews-slider", {
      loop:true,
      grabCursor: true,
      spaceBetween: 20,
      pagination: {
         el: ".swiper-pagination",
         clickable:true,
      },
      breakpoints: {
         0: {
         slidesPerView: 1,
         },
         700: {
         slidesPerView: 2,
         },
         1024: {
         slidesPerView: 3,
         },
      },
   });

</script>

</body>
</html>