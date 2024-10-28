CREATE DATABASE dbBarang
GO
USE dbBarang
GO
CREATE TABLE tbBarang (
	kodebarang char(4) Primary Key,
	jumlah int
)
GO
INSERT INTO tbBarang VALUES ('KL/A', 50)
INSERT INTO tbBarang VALUES ('TV/B', 33)
INSERT INTO tbBarang VALUES ('RD/A', 21)
INSERT INTO tbBarang VALUES ('KL/B', 13)
GO
SELECT * FROM tbBarang

-- Fungsi String 
-- 1. LEFT ==> mengambil karakter dari kiri
-- show kode,nama,jlh 2 krktr awal kodebrg
SELECT kodebarang, LEFT(kodebarang, 2) AS namabarang, jumlah FROM tbBarang

-- 2. RIGHT ==> mengambil karakter dari kanan
-- show kode,merek,jlh 1 krktr akhir kodebrg
SELECT kodebarang, RIGHT(kodebarang, 1) AS merekbarang, jumlah FROM tbBarang

-- combine left right
SELECT kodebarang, LEFT(kodebarang, 2) AS namabarang, RIGHT(kodebarang, 1) AS merekbarang, jumlah FROM tbBarang

-- SUBSTRING ==> mengambil karakter random
SELECT kodebarang, SUBSTRING(kodebarang, 1, 2) AS namabarang, jumlah FROM tbBarang

-- combine substring
SELECT kodebarang, SUBSTRING(kodebarang, 1, 2) AS namabarang, SUBSTRING(kodebarang, 3, 1) AS pemisah,SUBSTRING(kodebarang, 4, 1) AS merekbarang, jumlah FROM tbBarang

-- String & case

SELECT kodebarang, 
	CASE SUBSTRING(kodebarang, 1, 2)
		WHEN 'KL' THEN 'Kulkas'
		WHEN 'RD' THEN 'Radio'
		WHEN 'TV' THEN 'Televisi'
	END AS namabarang, jumlah FROM tbBarang

SELECT kodebarang, 
	CASE SUBSTRING(kodebarang, 4, 1)
		WHEN 'A' THEN 'Samsung'
		WHEN 'B' THEN 'Panasonic'
	END AS merekbarang, jumlah FROM tbBarang

SELECT kodebarang, 
	CASE SUBSTRING(kodebarang, 1, 2)
		WHEN 'KL' THEN 'Kulkas'
		WHEN 'RD' THEN 'Radio'
		WHEN 'TV' THEN 'Televisi'
	END AS namabarang, 
	CASE SUBSTRING(kodebarang, 4, 1)
		WHEN 'A' THEN 'Samsung'
		WHEN 'B' THEN 'Panasonic'
	END AS merekbarang, jumlah FROM tbBarang
