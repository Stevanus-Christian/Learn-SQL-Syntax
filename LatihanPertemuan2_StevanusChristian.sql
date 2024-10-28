--Nama  : Stevanus Christian
--NPM   : 1923240059
--Kelas : SI42

CREATE DATABASE dbLatihanPertemuan2

USE dbLatihanPertemuan2

CREATE TABLE tbKaryawan(
	NIK CHAR(3) PRIMARY KEY,
	NamaKaryawan VARCHAR(20),
	Jabatan VARCHAR(15),
	NoTelp VARCHAR(15)
)

INSERT INTO tbKaryawan VALUES ('001', 'Stevanus Christian', 'CEO', '08982300710')
INSERT INTO tbKaryawan VALUES ('002', 'Adeta Arya', 'Engineer', '081272101177')
INSERT INTO tbKaryawan VALUES ('003', 'Stefen Wijaya', 'Staff', '085101396891')
INSERT INTO tbKaryawan VALUES ('004', 'Shendy Gunawan', 'Admin', '087769670899')
INSERT INTO tbKaryawan VALUES ('005', 'M. Ikhsanul Iman', 'Purchasing', '081979157402')
INSERT INTO tbKaryawan VALUES ('006', 'Tasya Christina', 'Warehouse', '081278906060')
INSERT INTO tbKaryawan VALUES ('007', 'Philip Jonatan', 'Keuangan', '082279784582')
INSERT INTO tbKaryawan VALUES ('008', 'Ana Natalia', 'Ekspedisi', '083170227604')
INSERT INTO tbKaryawan VALUES ('009', 'Mgs. Bintang', 'Sales', '09650619092')
INSERT INTO tbKaryawan VALUES ('010', 'Sapta Tandi', 'Marketing', '089563718495')

SELECT * FROM tbKaryawan