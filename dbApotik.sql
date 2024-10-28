CREATE DATABASE dbApotik
GO
USE dbApotik
GO

CREATE TABLE tbObat (
	kodeObat CHAR (5) PRIMARY KEY,
	namaObat VARCHAR (30),
	jenisObat VARCHAR (10),
	harga INT,
	stok INT,
)
GO
INSERT INTO tbObat VALUES
('OB001', 'Paracetamol 500mg', 'Tablet', 5000, 10),
('OB002', 'Mylanta Cair 150ml', 'Syrup', 40000, 15),
('OB003', 'Antasida Doen', 'Kapsul', 100000, 2),
('OB004', 'Panadol Flu & Batuk', 'Tablet', 3000, 20),
('OB005', 'Tempra Drops 25ml', 'Syrup', 37500, 15)
GO

CREATE PROCEDURE spKelolaObat
	@kodeObat CHAR (5),
	@namaObat VARCHAR (30),
	@jenisObat VARCHAR (10),
	@harga INT,
	@stok INT,
	@pilihan CHAR (1)
AS
	IF @pilihan = 'I'
		INSERT INTO tbObat VALUES (@kodeObat, @namaObat, 
		@jenisObat, @harga, @stok)
	ELSE IF @pilihan = 'U'
		UPDATE tbObat SET namaObat = @namaObat, jenisObat 
		= @jenisObat, harga = @harga, stok = @stok WHERE
		kodeObat = @kodeObat
	ELSE IF @pilihan = 'D'
		DELETE FROM tbObat WHERE kodeObat = @kodeObat
	ELSE IF @pilihan = 'S'
		SELECT * FROM tbObat

spKelolaObat 'OB006', 'Promag Cair', 'Syrup', 4000, 20, 'I'

spKelolaObat 'OB006', 'Procold Cold & Flu', 'Tablet', 3500, 12, 'U'

spKelolaObat 'OB006', '', '', '', '','D'

spKelolaObat '', '', '', '', '', 'S'
