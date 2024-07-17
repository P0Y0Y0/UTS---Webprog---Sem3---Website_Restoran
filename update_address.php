<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:index.php');
};

if(isset($_POST['submit'])){

   $address = $_POST['jalan'] .', '.$_POST['rt_rw'].', '.$_POST['no_rumah'].', '.$_POST['wilayah'] .', '. $_POST['provinsi'] .', '. $_POST['kode_pos'] .', '. $_POST['negara'] .' - '. $_POST['kode_pin'];
   $address = filter_var($address, FILTER_SANITIZE_STRING);

   $update_address = $conn->prepare("UPDATE `users` set address = ? WHERE id = ?");
   $update_address->execute([$address, $user_id]);

   $message[] = 'address saved!';

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>update address</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php' ?>

<section class="form-container">

   <form action="" method="post">
      <h3>Your address</h3>
      <input type="text" class="box" placeholder="Nama Jalan" required maxlength="50" name="jalan">
      <input type="text" class="box" placeholder="RT/RW" required maxlength="50" name="rt_rw">
      <input type="number" class="box" placeholder="Nomor Rumah" required max="99" min="0" maxlength="2" name="no_rumah">
      <input type="text" class="box" placeholder="Kota/Kabupaten" required maxlength="50" name="wilayah">
      <input type="text" class="box" placeholder="Provinsi" required maxlength="50" name="provinsi">
      <input type="number" class="box" placeholder="Kode Pos" required max="99999" min="0" maxlength="5" name="kode_pos">
      <input type="text" class="box" placeholder="Negara" required maxlength="50" name="negara">
      <input type="number" class="box" placeholder="Pin Code" required max="999999" min="0" maxlength="6" name="kode_pin">
      <input type="submit" value="save address" name="submit" class="btn">
   </form>

</section>

<?php include 'components/footer.php' ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>