<?php require_once 'config.php'; header('Location: '.(!empty($_SESSION['user'])?'dashboard.php':'login.php')); exit;
