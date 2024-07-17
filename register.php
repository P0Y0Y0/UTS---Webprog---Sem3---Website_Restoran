<?php

   include 'components/connect.php';

   session_start();

   $message = [];

   if (isset($_SESSION['user_id'])) {
      $user_id = $_SESSION['user_id'];
   } else {
      $user_id = '';
   }

   if (isset($_POST['submit'])) {

      $first_name = $_POST['first_name'];
      $last_name = $_POST['last_name'];
      $name = $first_name . ' ' . $last_name;
      $name = filter_var($name, FILTER_SANITIZE_STRING);
      $email = $_POST['email'];
      $email = filter_var($email, FILTER_SANITIZE_STRING);
      $number = $_POST['number'];
      $number = filter_var($number, FILTER_SANITIZE_STRING);
      $pass = sha1($_POST['pass']);
      $pass = filter_var($pass, FILTER_SANITIZE_STRING);
      $cpass = sha1($_POST['cpass']);
      $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);
      $gender = $_POST['gender'];
      $date_of_birth = $_POST['date_of_birth'];

      $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? OR number = ?");
      $select_user->execute([$email, $number]);
      $row = $select_user->fetch(PDO::FETCH_ASSOC);

      if ($select_user->rowCount() > 0) {
         $message[] = 'Email or number already exists!';
      } else {
         if ($pass != $cpass) {
            $message[] = 'Confirm password not matched!';
         } else {
            $insert_user = $conn->prepare("INSERT INTO `users`(first_name, last_name, email, number, password, gender, date_of_birth) VALUES(?,?,?,?,?,?,?)");
            $insert_user->execute([$first_name, $last_name, $email, $number, $cpass, $gender, $date_of_birth]);
            $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ?");
            $select_user->execute([$email, $pass]);

            if ($select_user->rowCount() > 0) {
               $row = $select_user->fetch(PDO::FETCH_ASSOC);
               $_SESSION['user_id'] = $row['id'];
               header('location:index.php');
            }
         }
      }
   }

?>

<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE, edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Register</title>

      <!-- Font Awesome CDN link  -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

      <!-- Custom CSS file link  -->
      <link rel="stylesheet" href="css/style.css">

   </head>

   <body>

      <?php include 'components/user_header.php'; ?>


      <section class="form-container">

         <form action="" method="post">
            <h3>Register Now</h3>
            <?php
            if (!empty($message)) {
               echo '<div class="error-message">' . $message . '</div>';

            }
            ?>
            <input type="text" name="first_name" required placeholder="Enter your first name" class="box" maxlength="20">  <!-- nambahin bagian first name -->
            <input type="text" name="last_name" required placeholder="Enter your last name" class="box" maxlength="20">    <!-- nambahin bagian last name -->
            <input type="email" name="email" required placeholder="Enter your email" class="box" maxlength="50">
            <input type="number" name="number" required placeholder="Enter your number" class="box" min="0" max="9999999999" maxlength="10">
            <input type="password" name="pass" required placeholder="Enter your password" class="box" maxlength="50">
            <input type="password" name="cpass" required placeholder="Confirm your password" class="box" maxlength="50">
            
            <select name="gender" id="gender" class="box" required>
               <option value="Male">Male</option>
               <option value="Female">Female</option>
            </select>
            
            <input type="date" name="date_of_birth" id="date_of_birth" class="box" required>
            <input type="submit" value="Register Now" name="submit" class="btn">
            <p>Already have an account? <a href="login.php">Login now</a></p>
         </form>

      </section>

      <?php include 'components/footer.php'; ?>

      <!-- Custom JavaScript file link  -->
      <script src="js/script.js"></script>

   </body>

</html>
