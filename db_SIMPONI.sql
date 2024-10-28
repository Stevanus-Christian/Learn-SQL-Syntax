create database dbSIMPONI
go
use dbSIMPONI
go
create table tbMahasiswa (
	npm char(10) primary key
	, nama varchar(30)
	, jenisKelamin char(1)
)
go
Insert into tbMahasiswa values 
('1821240001','Fitri','P')
,('1821240002','Lijoy','L')
,('1821240003','Isnawati','P')
,('1821240004','Muliawan','L')
go
create table tbMataKuliah (
	idMataKuliah char(4) primary key
	, namaMataKuliah varchar(30)	
	, Sks int
)
go
Insert into tbMataKuliah values 
('I103','Basis Data Terapan','2')
,('I104','Sistem Basis Data','4')
go
create table tbJadwalKuliah	(
	idJadwalKuliah char(3) primary key
	, npm char(10) references tbMahasiswa(npm)
	, idMatakuliah char(4) references tbMataKuliah (idMatakuliah)
	, kelas char(4)
)
go
Insert into tbJadwalKuliah values 
('J1','1821240001','I103','SI3A')
,('J2','1821240002','I103','SI3A')
,('J3','1821240003','I104','SI3B')
,('J4','1821240004','I104','SI3B')
,('J5','1821240001','I104','SI3B')
go
select * from tbMahasiswa
select * from tbMataKuliah
select * from tbJadwalKuliah

-- Pertemuan 8
-- 1.	Tampilkan NPM, Nama Mahasiswa untuk mahasiswa yang mengambil kelas Basis Data Terapan
Select tbMahasiswa.npm, nama From tbMataKuliah, tbJadwalKuliah, tbMahasiswa
Where tbMataKuliah.idMataKuliah = tbJadwalKuliah.idMatakuliah
and tbJadwalKuliah.npm = tbMahasiswa.npm
and namaMataKuliah = 'Basis Data Terapan'
go

--2.	Tampilkan data mata kuliah yang diambil oleh Fitri
Select tbMataKuliah.idMatakuliah, namaMataKuliah, Sks From tbMataKuliah, tbJadwalKuliah, tbMahasiswa
Where tbMataKuliah.idMataKuliah = tbJadwalKuliah.idMatakuliah
and tbJadwalKuliah.npm = tbMahasiswa.npm
and nama = 'Fitri'
go

--3.	Tampilkan jadwal kuliah untuk mahasiswa yang bernama Lijoy
Select idJadwalKuliah, tbJadwalKuliah.idMatakuliah, kelas
From tbMahasiswa, tbJadwalKuliah
Where tbMahasiswa.npm = tbJadwalKuliah.npm
and nama = 'Lijoy'
go

--4.	Tampilkan idJadwalKuliah, nama mahasiswa, nama mata kuliah, dan kelas untuk nama mata kuliah adalah Sistem Basis Data
Select idJadwalKuliah, nama, namaMataKuliah, kelas From tbMataKuliah, tbJadwalKuliah, tbMahasiswa
Where tbMataKuliah.idMataKuliah = tbJadwalKuliah.idMatakuliah
and tbJadwalKuliah.npm = tbMahasiswa.npm
and namaMataKuliah = 'Sistem Basis Data'
go

--5.	Tampilkan data mahasiswa yang mengambil kelas SI3B
Select tbMahasiswa.npm, nama, jenisKelamin
From tbMahasiswa, tbJadwalKuliah
Where tbMahasiswa.npm = tbJadwalKuliah.npm
and kelas = 'SI3B'
go

-- Pertemuan 9
--1.	Tampilkan NPM, Nama Mahasiswa untuk mahasiswa yang mengambil kelas Basis Data Terapan
Select tbMahasiswa.npm, nama From tbMataKuliah INNER JOIN tbJadwalKuliah
ON tbMataKuliah.idMataKuliah = tbJadwalKuliah.idMatakuliah
INNER JOIN tbMahasiswa
ON tbJadwalKuliah.npm = tbMahasiswa.npm
WHERE namaMataKuliah = 'Basis Data Terapan'
go

--2.	Tampilkan data mata kuliah yang diambil oleh Fitri
Select tbMataKuliah.idMatakuliah, namaMataKuliah, Sks From tbMataKuliah INNER JOIN tbJadwalKuliah
ON tbMataKuliah.idMataKuliah = tbJadwalKuliah.idMatakuliah
INNER JOIN tbMahasiswa
ON tbJadwalKuliah.npm = tbMahasiswa.npm
WHERE nama = 'Fitri'
go

--3.	Tampilkan jadwal kuliah untuk mahasiswa yang bernama Lijoy
Select idJadwalKuliah, tbJadwalKuliah.idMatakuliah, kelas
From tbMahasiswa INNER JOIN tbJadwalKuliah
ON tbMahasiswa.npm = tbJadwalKuliah.npm
WHERE nama = 'Lijoy'
go

--4.	Tampilkan idJadwalKuliah, nama mahasiswa, nama mata kuliah, dan kelas untuk nama mata kuliah adalah Sistem Basis Data
Select idJadwalKuliah, nama, namaMataKuliah, kelas From tbMataKuliah INNER JOIN tbJadwalKuliah
ON tbMataKuliah.idMataKuliah = tbJadwalKuliah.idMatakuliah
INNER JOIN tbMahasiswa
ON tbJadwalKuliah.npm = tbMahasiswa.npm
WHERE namaMataKuliah = 'Sistem Basis Data'
go

--5.	Tampilkan data mahasiswa yang mengambil kelas SI3B
Select tbMahasiswa.npm, nama, jenisKelamin
From tbMahasiswa INNER JOIN tbJadwalKuliah
ON tbMahasiswa.npm = tbJadwalKuliah.npm
WHERE kelas = 'SI3B'
go