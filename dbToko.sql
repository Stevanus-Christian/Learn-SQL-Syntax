CREATE DATABASE dbToko
GO
USE dbToko
GO
CREATE TABLE tbBarang (
	kodeBarang CHAR (5) PRIMARY KEY,
	namaBarang VARCHAR (30),
	harga INT,
	stok INT,
)
GO
CREATE TABLE tbPembelian (
	kodePembelian CHAR (5) PRIMARY KEY,
	tglPembelian DATE,
	totalBayar INT,
)
GO
CREATE TABLE tbDetailPembelian (
	kodePembelian CHAR (5) REFERENCES tbPembelian (kodePembelian),
	kodeBarang CHAR (5) REFERENCES tbBarang (kodeBarang),
	jumlahBeli INT,
)
GO

SELECT * FROM tbBarang
SELECT * FROM tbPembelian
SELECT * FROM tbDetailPembelian

CREATE TRIGGER tgInsertBarang
ON tbBarang
FOR INSERT
AS	
	PRINT 'Data Berhasil Disimpan'

INSERT INTO tbBarang VALUES ('B001', 'Buku Sidu', 30000, 20)

CREATE TRIGGER tgUpdateBarang
ON tbBarang
FOR UPDATE
AS	
	PRINT 'Data Berhasil Diubah'

UPDATE tbBarang SET namaBarang = 'Buku Tulis Sidu', harga = 35000, stok = 25
WHERE kodeBarang = 'B001'

CREATE TRIGGER tgDeleteBarang
ON tbBarang
FOR DELETE
AS	
	PRINT 'Data Berhasil Dihapus'

DELETE FROM tbBarang WHERE kodeBarang = 'B001'

-- filter stok barang minimum
CREATE TRIGGER triggerCekStokBarang
ON tbBarang
FOR INSERT, UPDATE
AS
	DECLARE @stok int
	SELECT @stok = stok FROM INSERTED
	IF @stok < 5 
		BEGIN
			PRINT 'Stok Barang Kurang Dari 5'
			PRINT 'Transaksi Tidak Dapat Dilakukan'
			ROLLBACK TRANSACTION -- Membatalkan transaksi yang sudah dijalankan
		END
	ELSE
		BEGIN
			PRINT 'Transaksi Berhasil'
		END

INSERT INTO tbBarang VALUES ('B003', 'Pena Pilot 1 Lusin', 23000, 1)

INSERT INTO tbBarang VALUES ('B004', 'Pena Standard 1 Lusin', 23000, 5)

-- Update stok barang masuk
CREATE TRIGGER triggerUpdateStokBarang
ON tbDetailPembelian
FOR INSERT, UPDATE
AS
	UPDATE tbBarang SET stok = stok + inserted.jumlahBeli
	FROM tbBarang, inserted
	WHERE tbBarang.kodeBarang = inserted.kodeBarang

INSERT INTO tbPembelian VALUES ('P001', getdate(), '525000')
GO
INSERT INTO tbDetailPembelian VALUES ('P001', 'B002', 15)

CREATE TABLE tbHistoryUpdateBarang (
	idHistory INT IDENTITY(1,1) -- identity = penomoran otomatis, formatnya = angka awal, penambahan
	, tglUpdate DATE
	, kodeBarang CHAR (5) REFERENCES tbBarang (kodeBarang)
	, namaBarang VARCHAR(30)
	, harga INT
	, stok INT
)

-- isi data ke tabel lain secara otomatis
CREATE TRIGGER triggerHistoryUpdateBarang
ON tbBarang
FOR INSERT, UPDATE, DELETE
AS
	DECLARE @kodeBarang char(5)
	, @namaBarang varchar(30)
	, @harga int
	, @stok int
	SELECT @kodeBarang = kodeBarang, @namaBarang =  namaBarang, @harga = harga, @stok = stok 
	FROM inserted
	INSERT INTO tbHistoryUpdateBarang 
	(tglUpdate, kodeBarang, namaBarang, harga, stok) VALUES
	(getDate(), @kodeBarang, @namaBarang, @harga, @stok)

INSERT INTO tbBarang VALUES ('B003', 'Penggaris 30cm', 5000, 100)
