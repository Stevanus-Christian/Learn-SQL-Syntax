--Aturan Penamaan:
--Database : db
--Tabel    : tb

--Tipe Data:
--# Angka
--1. Bilangan Bulat = INTEGER
--2. Bilangan Desimal (Pecahan) = DOUBLE, FLOAT, NUMERIC

--# Huruf + Angka
--1. Panjang tetap = CHAR
--2. Panjang tidak tetap = VARCHAR

--# Tanggal dan waktu
--1. Tanggal = DATE
--2. Waktu = TIME
--3. Tanggal dan waktu = DATETIME

--# Aturan Penulisan Tanggal:
--1. Bulan - Tanggal - Tahun atau Bulan / Tanggal / Tahun
--2. Tahun - Bulan - Tanggal atau Tahun / Bulan / Tanggal

--# Membuat Database
CREATE DATABASE dbBDT

--# Menggunakan/Mengaktifkan Database
USE dbBDT

--# Membuat Tabel
CREATE TABLE tbMahasiswa(
	npm CHAR(10) PRIMARY KEY,
	nama VARCHAR(30),
	alamat VARCHAR(50),
	notelp VARCHAR(15)
)

--# Melihat isi tabel
SELECT * FROM tbMahasiswa

--# Mengisi data (INSERT)
--1. Mengisi data ke seluruh field (kolom)
INSERT INTO tbMahasiswa VALUES ('1923240059', 'Stevanus Christian', 'BSD', '08982300710')

--2. Mengisi data ke field (kolom) tertentu
INSERT INTO tbMahasiswa (npm, nama, alamat, notelp) VALUES ('1923240085', 'Tasya Angelya', 'Unknown', '085367819898')

--# Menghapus tabel
DROP TABLE tbMahasiswa

--# Menghapus database
--Syarat:
--Database tidak sedang digunakan
USE master
GO
DROP DATABASE dbStevanusChristian

--Update (Mengubah Data)
--1. Mengubah seluruh data
UPDATE tbMahasiswa SET nama = 'Stefen William', alamat = 'Jakarta', notelp = '088888888888' WHERE npm = '1923240059'
--2. Mengubah data tertentu
UPDATE tbMahasiswa SET nama = 'Irene Kezia C' WHERE npm = '1923240085'
UPDATE tbMahasiswa SET alamat = 'Sako' WHERE npm = '1923240085'

--# Delete (Menghapus data)
--1. Menghapus data tertentu
DELETE FROM tbMahasiswa WHERE npm = '1923240085'
DELETE FROM tbMahasiswa WHERE nama = 'Irene Kezia C'
--2. Menghapus seluruh data
DELETE FROM tbMahasiswa

--# Mengubah struktur tabel
--1. Menambah Kolom
ALTER TABLE tbMahasiswa ADD programstudi CHAR (2)
--2. Mengubah tipe data atau lebar field
ALTER TABLE tbMahasiswa DROP COLUMN notelp CHAR (20)
--3. Menghapus kolom
ALTER TABLE tbMahasiswa DROP COLUMN programstudi
--4. Mengubah nama kolom
SP_RENAME 'tbMahasiswa.npm', 'npmmahasiswa', 'column'
SP_RENAME 'tbMahasiswa.nama', 'namamahasiswa', 'column'
SP_RENAME 'tbMahasiswa.alamat', 'alamatmahasiswa', 'column'
SP_RENAME 'tbMahasiswa.notelp', 'notelpmahasiswa', 'column'
--5. Mengubah nama tabel
SP_RENAME 'tbMahasiswa', 'tbMhs'
--6. Mengubah nama database
SP_RENAMEDB 'dbBDT', 'dbBasisDataTerapan'

--# Melihat informasi tabel
SP_HELP tbMahasiswa

--# Melihat informasi database
SP_HELPDB dbBDT

--# Operator Pembanding (<, >, =, <>, <=, >=)

--# Operator Aritmatika (+, -, *, /)

--# Operator Logika (AND, OR, NOT)
