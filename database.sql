CREATE DATABASE IF NOT EXISTS db_pelanggaran_siswa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_pelanggaran_siswa;
CREATE TABLE IF NOT EXISTS users (
 id_user INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(50) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 role ENUM('admin','guru','bk','siswa') NOT NULL DEFAULT 'admin',
 nama_lengkap VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS siswa (
 id_siswa INT AUTO_INCREMENT PRIMARY KEY,
 nis VARCHAR(20) NOT NULL UNIQUE,
 nama_siswa VARCHAR(100) NOT NULL,
 kelas VARCHAR(30) NOT NULL,
 jenis_kelamin ENUM('L','P') NOT NULL DEFAULT 'L',
 alamat TEXT NULL
);
CREATE TABLE IF NOT EXISTS jenis_pelanggaran (
 id_jenis INT AUTO_INCREMENT PRIMARY KEY,
 nama_jenis VARCHAR(100) NOT NULL,
 poin INT NOT NULL DEFAULT 0,
 keterangan TEXT NULL
);
CREATE TABLE IF NOT EXISTS pelanggaran (
 id_pelanggaran INT AUTO_INCREMENT PRIMARY KEY,
 id_siswa INT NOT NULL,
 id_jenis INT NOT NULL,
 tanggal DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 keterangan TEXT NULL,
 status ENUM('Baru','Diproses','Selesai') NOT NULL DEFAULT 'Baru',
 FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),
 FOREIGN KEY (id_jenis) REFERENCES jenis_pelanggaran(id_jenis)
);
-- Akun demo: admin / password
INSERT IGNORE INTO users(username,password,role,nama_lengkap) VALUES
('admin','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.','admin','Administrator');
INSERT INTO jenis_pelanggaran(nama_jenis,poin,keterangan)
SELECT 'Terlambat datang',5,'Datang setelah jam masuk' WHERE NOT EXISTS (SELECT 1 FROM jenis_pelanggaran WHERE nama_jenis='Terlambat datang');
INSERT INTO jenis_pelanggaran(nama_jenis,poin,keterangan)
SELECT 'Atribut tidak lengkap',10,'Tidak memakai atribut sekolah lengkap' WHERE NOT EXISTS (SELECT 1 FROM jenis_pelanggaran WHERE nama_jenis='Atribut tidak lengkap');
INSERT INTO jenis_pelanggaran(nama_jenis,poin,keterangan)
SELECT 'Tidak mengerjakan tugas',5,'Tugas tidak dikumpulkan' WHERE NOT EXISTS (SELECT 1 FROM jenis_pelanggaran WHERE nama_jenis='Tidak mengerjakan tugas');
