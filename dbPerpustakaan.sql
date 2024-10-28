CREATE DATABASE dbPerpustakaan
GO
USE dbPerpustakaan
GO
CREATE TABLE tbBuku (
	kodebuku CHAR (6) PRIMARY KEY,
	judulbuku VARCHAR (30),
	pengarang VARCHAR (30),
	penerbit VARCHAR (30),
	tahun CHAR (4),
	isbn CHAR (6),
	jumlah INT,
	lokasilemari CHAR (3),
)
GO
INSERT INTO tbBuku VALUES
('BK0001', 'Matematika Diskrit', 'Bacista J', 'Pustaka', '2010', '100736', '3', 'A01'),
('BK0002', 'Algoritma Sederhana', 'Smith G', 'Elexmedia', '2013', '100900', '6', 'A01'),
('BK0003', 'Fisika Modern', 'Takamoto J', 'Sinar Baru', '2010', '108495', '5', 'B01'),
('BK0004', 'Mekanika', 'Kuncoro B', 'Elexmedia', '2008', '108392', '8', 'B01'),
('BK0005', 'Pemrograman C#', 'Ijikata S', 'Informatika', '2016', '112490', '5', 'C01')
GO
CREATE TABLE tbMahasiswa (
	npm CHAR (10) PRIMARY KEY,
	namamahasiswa VARCHAR (30),
	jeniskelamin CHAR (1),
	alamat VARCHAR (30),
	notelp VARCHAR (15),
)
GO
INSERT INTO tbMahasiswa VALUES
('1821110001', 'Lilia', 'P', 'JL Bangau No 14', '0711345678'),
('1821110002', 'Michael', 'L', 'Jl Nuri No 11', '0711237811'),
('1821110003', 'Stephanie', 'P', 'Jl Semangat No 13', '0711346591'),
('1821110004', 'Rudi', 'L', 'Jl Pipit No 11', '0711452981'),
('1821110005', 'Cecilia', 'P', 'Jl Merdeka No 10', '0711394899')
GO
CREATE TABLE tbPeminjaman (
	kodepeminjaman CHAR (6) PRIMARY KEY,
	tanggalpinjam DATE,
	tanggalkembali DATE,
	npm CHAR (10) REFERENCES tbMahasiswa (npm),
	kodebuku CHAR (6) REFERENCES tbbuku (kodebuku),
	jumlahpinjam INT,
)
GO
INSERT INTO tbPeminjaman VALUES
('PJ0001', '09-11-2019', '09-14-2019', '1821110001', 'BK0002', '2'),
('PJ0002', '09-12-2019', '09-15-2019', '1821110003', 'BK0005', '1'),
('PJ0003', '09-12-2019', '09-15-2019', '1821110004', 'BK0005', '1'),
('PJ0004', '09-13-2019', '09-16-2019', '1821110001', 'BK0004', '3'),
('PJ0005', '09-13-2019', '09-16-2019', '1821110002', 'BK0001', '1')
GO
CREATE TABLE tbPengembalian (
	kodepengembalian CHAR (6) PRIMARY KEY,
	kodepeminjaman CHAR (6) REFERENCES tbPeminjaman (kodepeminjaman),
	npm CHAR (10) REFERENCES tbMahasiswa (npm),
	kodebuku CHAR (6) REFERENCES tbBuku (kodebuku),
	jumlahkembali INT,
	tanggalkembali DATE,
	denda INT,
)
GO
INSERT INTO tbPengembalian VALUES
('PG0001', 'PJ0001', '1821110001', 'BK0002', '2', '09-15-2019', '3000'),
('PG0002', 'PJ0003', '1821110004', 'BK0005', '1', '09-15-2019', '0'),
('PG0003', 'PJ0005', '1821110002', 'BK0001', '1', '09-16-2019', '0'),
('PG0004', 'PJ0004', '1821110001', 'BK0004', '3', '09-17-2019', '3000'),
('PG0005', 'PJ0002', '1821110003', 'BK0005', '1', '09-17-2019', '6000')
GO
SELECT * FROM tbBuku WHERE jumlah <= 5
SELECT * FROM tbMahasiswa
SELECT * FROM tbPeminjaman
SELECT * FROM tbPengembalian

-- Fungsi Agregat (MAX, MIN, AVG, SUM, COUNT)

-- MAX = nilai terbesar
SELECT MAX(jumlah) AS jlhbukuterbanyak FROM tbBuku
-- Menampilkan data buku untuk jlh buku yang paling byk
SELECT * FROM tbBuku WHERE jumlah = (SELECT MAX(jumlah) FROM tbBuku)
-- Menampilkan kode buku terakhir
SELECT MAX(kodebuku) AS kdbukutrkhr FROM tbBuku

-- MIN = nilai terkecil
-- Menampilkan jlh buku yg plg sedikit
SELECT MIN(jumlah) AS jlhbukuplgsdkt FROM tbBuku
-- Menampilkan data utk buku yg plg sedikit dipinjam
SELECT * FROM tbPeminjaman WHERE jumlahpinjam = (SELECT MIN(jumlahpinjam) FROM tbPeminjaman)

-- AVG = rata2
-- rata2 jlh buku
SELECT AVG(jumlah) AS rata2 FROM tbBuku

-- SUM = mencari total data
-- menampilkan total buku
SELECT SUM(jumlah) AS totalbuku FROM tbBuku
-- menampikan total buku yg dipinjam
SELECT SUM(jumlahpinjam) AS totalbukudipinjam FROM tbPeminjaman

-- COUNT = mencari jumlah data
--brp judul buku di perpus?
SELECT COUNT(kodebuku) AS jlhjudulbuku FROM tbBuku
-- brp jlh anggota perpus?
SELECT COUNT(npm) AS jlhanggotaperpus FROM tbMahasiswa

-- Inner Join
--1.	Menampilkan npm, nama mahasiswa, dan tanggal pinjam buku.
SELECT tbMahasiswa.npm, namaMahasiswa, tanggalPinjam
FROM tbMahasiswa INNER JOIN tbPeminjaman
ON tbMahasiswa.npm = tbPeminjaman.npm 

--2.	Menampilkan kode peminjaman, kode buku, dan judul buku
SELECT kodepeminjaman, tbBuku.kodeBuku, judulBuku 
FROM tbBuku INNER JOIN tbPeminjaman
ON tbBuku.kodeBuku = tbPeminjaman.kodeBuku 

--3.	Menampilkan npm, nama mahasiswa, kode buku, dan judulbuku
SELECT tbMahasiswa.npm, namaMahasiswa, tbBuku.kodeBuku, judulBuku
FROM tbMahasiswa INNER JOIN tbPeminjaman
ON tbMahasiswa.npm = tbPeminjaman.npm 
INNER JOIN tbBuku
ON tbPeminjaman.kodeBuku = tbBuku.kodeBuku

--4.	Menampilkan nama mahasiswa, judul buku untuk buku yang dipinjam 
SELECT namaMahasiswa, judulBuku
FROM tbMahasiswa INNER JOIN tbPeminjaman
ON tbMahasiswa.npm = tbPeminjaman.npm 
INNER JOIN tbBuku
ON tbPeminjaman.kodeBuku = tbBuku.kodeBuku 
WHERE judulBuku = 'Matematika Diskrit'

--LEFT OUTER JOIN : menampilkan data berdasarkan tabel yang di sebelah kiri (tabel1)
--CONTOH :
--Menampilkan npm, nama mahasiswa, dan tanggal pinjam buku dengan fungsi LEFT OUTER JOIN. 
SELECT tbMahasiswa.npm, namaMahasiswa, tanggalPinjam
FROM tbMahasiswa LEFT OUTER JOIN tbPeminjaman
ON tbMahasiswa.npm = tbPeminjaman.npm 

--RIGHT OUTER JOIN : menampilkan data berdasarkan tabel yang di sebelah kanan (tabel2)
--CONTOH :
--Menampilkan npm, nama mahasiswa, dan tanggal pinjam buku dengan fungsi RIGHT OUTER JOIN. 
SELECT tbMahasiswa.npm, namaMahasiswa, tanggalPinjam
FROM tbMahasiswa RIGHT OUTER JOIN tbPeminjaman
ON tbMahasiswa.npm = tbPeminjaman.npm 

-- VIEW
CREATE VIEW vwMahasiswa
AS
	SELECT * FROM tbMahasiswa

SELECT * FROM vwMahasiswa

ALTER VIEW vwMahasiswa
AS
	SELECT npm, namaMahasiswa, jenisKelamin FROM tbMahasiswa

SP_HELPTEXT vwMahasiswa

-- Stored Procedure
CREATE PROCEDURE spTampilMahasiswa
AS
	SELECT * FROM tbMahasiswa
GO
spTampilMahasiswa
GO

CREATE PROCEDURE spDataPeminjaman
AS
	SELECT tbPengembalian.kodepeminjaman, tbPengembalian.npm, tbMahasiswa.namamahasiswa, tbBuku.judulbuku  
	FROM tbPengembalian, tbMahasiswa, tbBuku
	WHERE tbPengembalian.kodebuku = tbBuku.kodebuku AND tbMahasiswa.npm = tbPengembalian.npm
GO
spDataPeminjaman
GO

CREATE PROCEDURE spTampilNpmNama
	@npm CHAR (10),
	@nama VARCHAR (30)
AS
	SELECT * FROM tbMahasiswa
	WHERE npm = @npm AND namamahasiswa = @nama 
GO
spTampilNpmNama '1821110003', 'Stephanie'
GO

CREATE PROCEDURE spTampilNama
	@nama VARCHAR (30)
AS
	SELECT * FROM tbMahasiswa
	WHERE namamahasiswa LIKE '%'+@nama+'%'
GO
spTampilNama 'i'
GO

CREATE PROCEDURE spTampilJudulBuku
	@judulbuku VARCHAR (30)
AS
	SELECT * FROM tbBuku
	WHERE judulbuku = @judulbuku
GO
spTampilJudulBuku 'Pemrograman C#'
GO

-- TRIGGER
-- Trigger adalah salah satu bentuk stored procedure
-- Trigger melekat pada tabel, sedangkan stored procedure melekat pada database

-- Membuat Trigger
CREATE TRIGGER tgInsertBuku
ON tbBuku
FOR INSERT
AS
	PRINT 'Data Telah Tersimpan'

INSERT INTO tbBuku VALUES ('BK0007','Microsoft SQL Server','Agung Yuwono','Andi Yogyakarta','2020','124924',4,'C01')

SELECT * FROM tbBuku

-- Mengubah Trigger
ALTER TRIGGER tgInsertBuku
ON tbBuku
FOR INSERT
AS
	PRINT 'Data Telah Tersimpan !!!'

-- Menghapus Trigger
DROP TRIGGER tgInsertBuku

