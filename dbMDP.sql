-- Nomor 1
CREATE DATABASE dbMDP
GO
USE dbMDP
GO

-- Nomor 2
CREATE TABLE tbMHS(
	npm CHAR (10) PRIMARY KEY,
	nama VARCHAR (30),
	jenisKelamin CHAR (1),
)
GO
INSERT INTO tbMHS VALUES
('1821240001', 'Daffa', 'L'),
('1821240002',	'M. Arief',	'L'),
('1821240003',	'Athifah',	'P'),
('1821240004',	'Rahma',	'P'),
('1821240005',	'lulu',	'P')
GO

-- Nomor 3
CREATE TABLE tbNilai(
	npm CHAR (10) REFERENCES tbMHS (npm),
	nilaiKuis NUMERIC,
	nilaiTugas NUMERIC,
	nilaiUTS NUMERIC,
	nilaiUAS NUMERIC,
)
GO
INSERT INTO tbNilai VALUES
('1821240001',	80,	70,	60,	50),
('1821240002',	50,	60,	70,	50),
('1821240003',	100,0,	50,	100),
('1821240004',	50,	100,10,	50),
('1821240005',	70,	70,	75,	75)
GO

-- Nomor 4
CREATE VIEW vwMHS
AS
	SELECT * FROM tbMHS
GO
SELECT * FROM vwMHS

-- Nomor 5
CREATE VIEW vwNilaiMHS
AS
	SELECT tbNilai.npm, tbMHS.nama, nilaiKuis, nilaiTugas, nilaiUTS, nilaiUAS, 
	((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) 
	AS 'totalNilai' FROM tbNilai,tbMHS
	WHERE tbMHS.npm = tbNilai.npm
GO
SELECT * FROM vwNilaiMHS

-- Nomor 6
CREATE VIEW vwNilaiAkhir
AS
	SELECT npm, nama, nilaiKuis, nilaiTugas, nilaiUTS, nilaiUAS, 
	((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) 
	AS 'totalNilai',
	CASE 
		WHEN ((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) >= 80 THEN 'A'
		WHEN ((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) >= 68 THEN 'B'
		WHEN ((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) >= 56 THEN 'C'
		WHEN ((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) >= 46 THEN 'D'
		WHEN ((0.1*nilaiKuis)+(0.2*nilaiTugas)+(0.3*nilaiUTS)+(0.4*nilaiUAS)) < 46 THEN 'E'
	END AS 'nilaiHuruf' FROM vwNilaiMHS
GO
SELECT * FROM vwNilaiAkhir

-- Nomor 7
CREATE VIEW vwJenisKelaminMHS
AS
	SELECT npm, nama, 
	CASE 
		WHEN jenisKelamin = 'L' THEN 'Laki-laki'
		WHEN jenisKelamin = 'P' THEN 'Perempuan'
	END AS 'jenisKelamin' FROM vwMHS
GO
SELECT * FROM vwJenisKelaminMHS