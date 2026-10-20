<?php
if (session_status() === PHP_SESSION_NONE) session_start();
try {
 $pdo = new PDO('mysql:host=localhost;dbname=db_pelanggaran_siswa;charset=utf8mb4','root','',[
  PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
  PDO::ATTR_EMULATE_PREPARES=>false
 ]);
} catch(PDOException $e) { http_response_code(500); exit('Database belum tersambung. Aktifkan MySQL di XAMPP lalu import database.sql melalui phpMyAdmin.'); }
function e($v){ return htmlspecialchars((string)($v ?? ''), ENT_QUOTES, 'UTF-8'); }
function require_login(){ if(empty($_SESSION['user'])) { header('Location: login.php'); exit; } }
function is_admin(){ return !empty($_SESSION['user']) && $_SESSION['user']['role']==='admin'; }
