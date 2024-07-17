<?php
session_start();

$capcode = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz';
$capcode = substr(str_shuffle($capcode), 0, 6);
$_SESSION['captcha'] = $capcode;
echo '<div class = "unselectable">'.$capcode.'</div>';
?>
