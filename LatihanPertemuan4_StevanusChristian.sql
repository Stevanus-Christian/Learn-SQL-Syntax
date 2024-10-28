CREATE DATABASE dbLatihanPertemuan4_Stevanus
GO
USE dbLatihanPertemuan4_Stevanus
GO
CREATE TABLE tbBarang (
	kodebarang VARCHAR (4) PRIMARY KEY,
	namabarang VARCHAR (50),
	harga INT,
	jumlah INT,
)
GO
INSERT INTO tbBarang VALUES
('B001', 'Pasta Gigi Formula Charcoal 160gr', 14400, 23),
('B002', 'Tissue Nice 1000gram', 38900, 15),
('B003', 'Lux Sakura Blossom 450ml', 18000, 2),
('B004', 'Sikat Gigi Pepsodent Soft', 5000, 17),
('B005', 'Lifebouy Hand Wash 200ml', 19000, 30)
GO
UPDATE tbBarang SET jumlah = 10 WHERE kodebarang = 'B003'
UPDATE tbBarang SET harga = 15000, jumlah = 100 WHERE kodebarang = 'B001'
GO
DELETE FROM tbBarang WHERE kodebarang = 'B005'
GO
SELECT * FROM tbBarang
GO