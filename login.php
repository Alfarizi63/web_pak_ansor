<?php
require_once 'config.php'; if(!empty($_SESSION['user'])){header('Location: dashboard.php');exit;}$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
 $st=$pdo->prepare('SELECT * FROM users WHERE username=? LIMIT 1');$st->execute([trim($_POST['username']??'')]);$u=$st->fetch();
 if($u && password_verify($_POST['password']??'',$u['password'])){session_regenerate_id(true);unset($u['password']);$_SESSION['user']=$u;header('Location: dashboard.php');exit;} $error='Username atau password salah.';
}
?><!doctype html><html lang="id"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Login - Pelanggaran Siswa</title><link rel="stylesheet" href="assets/style.css"></head><body class="login-page"><main class="login-card"><div class="logo">PS</div><h1>Sistem Pelanggaran Siswa</h1><p class="muted">Masuk untuk mengelola data kedisiplinan siswa.</p><?php if($error):?><div class="alert error"><?=e($error)?></div><?php endif;?><form method="post"><label>Username</label><input name="username" required autofocus><label>Password</label><input type="password" name="password" required><button class="btn primary full">Masuk</button></form><div class="demo">Akun demo: <b>admin</b> / <b>password</b></div></main></body></html>
