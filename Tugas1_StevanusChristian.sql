-- Nama : Stevanus Christian
-- NPM  : 1923240059
-- Kelas: SI-42

CREATE DATABASE dbKampusMerdeka
GO
USE dbKampusMerdeka
GO
CREATE TABLE tbMahasiswa (
	npm CHAR (10) PRIMARY KEY,
	nama VARCHAR (30),
	jenisKelamin CHAR (1),
)
GO
CREATE TABLE tbNilai (
	npm CHAR (10) REFERENCES tbMahasiswa(npm),
	nKuis NUMERIC DEFAULT 0,
	nTugas NUMERIC DEFAULT 0,
	nUTS NUMERIC DEFAULT 0,
	nUAS NUMERIC DEFAULT 0,
)
GO
INSERT INTO tbMahasiswa VALUES
('1923240059', 'Stevanus Christian', 'L'),
('1923240038', 'Octavianus Chandra', 'L'),
('1923240014', 'Jason Alexander', 'L'),
('1923240088', 'Irene Sukandar', 'P'),
('1923240085', 'Tasya Angelya', 'P')
GO
INSERT INTO tbNilai VALUES
('1923240088', 60, 70, 80, 90),
('1923240059', 90, 90, 95, 90),
('1923240085', 50, 50, 50, 50),
('1923240014', 70, 75, 70, 75),
('1923240038', 75, 83, 87, 95)
GO
SELECT npm, nama,
	CASE jenisKelamin
		WHEN 'L' THEN 'Laki-laki'
		WHEN 'P' THEN 'Perempuan'
	END AS 'jenisKelamin'
FROM tbMahasiswa
GO
SELECT npm, nKuis, nTugas, nUTS, nUAS, ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) 
AS 'Total Nilai' FROM tbNilai
GO
SELECT npm, nKuis, nTugas, nUTS, nUAS, ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) 
AS 'Total Nilai',
	CASE 
		WHEN ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) >= 80 THEN 'A'
		WHEN ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) >= 68 THEN 'B'
		WHEN ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) >= 56 THEN 'C'
		WHEN ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) >= 46 THEN 'D'
		WHEN ((0.1*nKuis)+(0.2*nTugas)+(0.3*nUTS)+(0.4*nUAS)) < 46 THEN 'E'
	END AS 'Grade'
FROM tbNilai
GO
