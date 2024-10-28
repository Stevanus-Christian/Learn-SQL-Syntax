-- Nama : Stevanus Christian
-- NPM  : 1923240059
-- Kelas: SI-42

-- Nomor 1
CREATE DATABASE dbUTSStevanus_Christian
GO
USE dbUTSStevanus_Christian
GO

-- Nomor 2
CREATE TABLE tbDokter (
	kodeDokter CHAR (4) PRIMARY KEY,
	namaDokter VARCHAR (30),
	alamat VARCHAR (50),
	jenisKelamin CHAR (1),
	noTelp VARCHAR (20),
	Spesialis VARCHAR (20),
)
GO
INSERT INTO tbDokter VALUES
('D001', 'dr. Abbas, Sp. M', 'Jl Jend Sudirman No 1', 'L', '081233445566', 'Mata'),
('D002', 'drg. Novita Azhari', 'Jl Bangau No 2', 'P', '098982736411', 'Gigi'),
('D003', 'dr. Samsul, SPPD', 'Jl Sekip No 3', 'L', '088212345678', 'Penyakit Dalam')
GO
CREATE TABLE tbPasien (
	noPasien CHAR (4) PRIMARY KEY,
	namaPasien VARCHAR (30),
	alamat VARCHAR (50),
	usia CHAR (2),
	jenisKelamin CHAR (1),
	noTelp VARCHAR (20),
)
GO
INSERT INTO tbPasien VALUES
('P001', 'Joko Susanto', 'Jl Punai No 1', '50', 'L', '0711345672'),
('P002', 'Desi Natalia', 'Jl Beringin No 2', '15', 'P', '081275921232'),
('P003', 'Purnomo', 'Jl Kampus No 3', '25', 'L', '0711347821'),
('P004', 'Veronika', 'Jl Balap Sepeda No 4', '20', 'P', '089612345566')
GO
CREATE TABLE tbKunjungan (
	noKunjungan CHAR (9) PRIMARY KEY,
	tglKunjungan DATE,
	noPasien CHAR (4) REFERENCES tbPasien (noPasien),
	kodeDokter CHAR (4) REFERENCES tbDokter (kodeDokter),
	Keluhan VARCHAR (30),
)
GO
INSERT INTO tbKunjungan VALUES
('M30032101', '03-30-2021', 'P001', 'D001', 'Mata Katarak'),
('G30032101', '03-30-2021', 'P002', 'D002', 'Sakit Gigi'),
('U30032101', '03-30-2021', 'P003', 'D003', 'Sesak Nafas'),
('M30032102', '03-30-2021', 'P004', 'D001', 'Mata Pedih dan Kabur')
GO

-- Nomor 3
-- a. 
SELECT noPasien, namaPasien,
	CASE SUBSTRING(jenisKelamin, 1, 1)
		WHEN 'L' THEN 'Laki-Laki'
		WHEN 'P' THEN 'Perempuan'
	END AS jenisKelamin, usia FROM tbPasien
-- b.
SELECT * FROM tbDokter WHERE Spesialis = 'Mata'
GO
-- c.
SELECT * FROM tbKunjungan WHERE kodeDokter = 'D002'
GO
SELECT * FROM tbKunjungan WHERE Keluhan LIKE '%Gigi%'
GO
-- d.
SELECT COUNT(noPasien) AS jumlahPasien FROM tbKunjungan WHERE Keluhan LIKE '%Mata%'
-- e.
SELECT * FROM tbPasien WHERE usia > 20
-- f.
SELECT namaPasien, alamat, usia FROM tbPasien  WHERE namaPasien LIKE '%U%' 
-- g.
SELECT noKunjungan, 
	CASE SUBSTRING(nokunjungan, 1, 1)
		WHEN 'M' THEN 'Mata'
		WHEN 'G' THEN 'Gigi'
		WHEN 'U' THEN 'Umum'
	END AS poliklinik, tglKunjungan,
	CASE SUBSTRING(nokunjungan, 9, 1)
		WHEN '1' THEN '01'
		WHEN '2' THEN '02'
	END AS nomorurutantrian FROM tbKunjungan