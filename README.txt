SISTEM INFORMASI PELANGGARAN SISWA - PHP + MYSQL (XAMPP)

CARA INSTALASI:
1. Ekstrak folder sistem_pelanggaran_siswa ke C:\xampp\htdocs\
2. Buka XAMPP Control Panel, klik Start pada Apache dan MySQL.
3. Buka http://localhost/phpmyadmin
4. Pilih menu Import, pilih file database.sql dari folder proyek, lalu klik Import/Go.
5. Buka http://localhost/sistem_pelanggaran_siswa/

LOGIN DEMO:
Username: admin
Password: password

FITUR:
- Login dan logout
- Dashboard ringkasan siswa, jumlah pelanggaran, status baru, dan total poin
- CRUD data siswa (hapus dibatasi jika sudah terkait pelanggaran)
- CRUD jenis pelanggaran dan poin
- Input pelanggaran, riwayat, pencarian, dan ubah status tindak lanjut
- Layout responsif

PENGATURAN DATABASE:
Konfigurasi default berada di config.php: host localhost, database db_pelanggaran_siswa, user root, password kosong. Ubah jika pengaturan MySQL Anda berbeda.

Catatan: Ini proyek dasar pembelajaran. Untuk penggunaan nyata di sekolah, tambahkan pengelolaan akun/role lengkap, CSRF protection, audit log, backup, dan uji keamanan. Password akun demo perlu diganti sebelum penggunaan sungguhan.
