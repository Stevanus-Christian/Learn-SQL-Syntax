CREATE DATABASE dbStevanus_Christian
GO
USE dbStevanus_Christian
GO
CREATE TABLE tbBuku (
	KodeBuku CHAR (4) PRIMARY KEY,
	JudulBuku VARCHAR (50),
	Pengarang VARCHAR (50),
	Penerbit VARCHAR (50),
	Jumlah INT,
)
GO
INSERT INTO tbBuku VALUES
('B001', 'Sistem Basis Data', 'Edhy Sutanta', 'Graha Ilmu', 10),
('B002', 'SQL Server 2012', 'Wahana Komputer', 'Andi', 5),
('B003', 'Pemrograman Phyton', 'Jubilee Enterprise', 'Elex Media', 8)
GO
CREATE TABLE tbMahasiswa (
	NPM CHAR (10) PRIMARY KEY,
	NamaMahasiswa VARCHAR (50),
	JenisKelamin CHAR (1),
	Alamat VARCHAR (50),
	NoTelp VARCHAR (20),
)
GO
INSERT INTO tbMahasiswa VALUES
('1923240059', 'Stevanus Christian', 'L', 'Bumi Sako Damai', '08982300710')
GO
CREATE TABLE tbPeminjaman (
	KodePeminjaman CHAR (6) PRIMARY KEY,
	NPM CHAR (10) REFERENCES tbMahasiswa (NPM),
	tanggalpinjam DATE,
	tanggalkembali DATE,
)
GO
INSERT INTO tbPeminjaman VALUES
('PJ0001', '1923240059', '06-20-2021', '06-25-2021'),
('PJ0002', '1923240059', '06-20-2021', '06-25-2021'),
('PJ0003', '1923240059', '06-20-2021', '06-25-2021')
GO
CREATE TABLE tbDetailPeminjaman (
	KodePeminjaman CHAR (6) REFERENCES tbPeminjaman (KodePeminjaman),
	KodeBuku CHAR (4) REFERENCES tbBuku (KodeBuku),
	JumlahPinjam INT,
)
GO
INSERT INTO tbDetailPeminjaman VALUES
('PJ0001', 'B002', 1)
GO
SELECT * FROM tbBuku
SELECT * FROM tbMahasiswa
SELECT * FROM tbPeminjaman
SELECT * FROM tbDetailPeminjaman
GO
CREATE VIEW vwPeminjaman
AS
	SELECT tbDetailPeminjaman.KodePeminjaman, tbMahasiswa.NPM, 
	NamaMahasiswa, tbBuku.KodeBuku, JudulBuku, JumlahPinjam
	FROM tbMahasiswa, tbBuku, tbDetailPeminjaman
	WHERE tbDetailPeminjaman.KodeBuku = tbBuku.KodeBuku AND 
	tbDetailPeminjaman.KodePeminjaman = tbDetailPeminjaman.KodePeminjaman
GO
SELECT * FROM vwPeminjaman
GO
CREATE PROCEDURE spTampilDataMahasiswa
AS
	SELECT * FROM tbMahasiswa
GO
spTampilDataMahasiswa
GO
CREATE PROCEDURE spKelolaDataBuku
	@KodeBuku CHAR (4),
	@JudulBuku VARCHAR (50),
	@Pengarang VARCHAR (50),
	@Penerbit VARCHAR (50),
	@Jumlah INT,
	@Pilihan CHAR (1)
AS
	IF @Pilihan = 'I'
		INSERT INTO tbBuku VALUES (@KodeBuku, @JudulBuku, 
		@Pengarang, @Penerbit, @Jumlah)
	ELSE IF @Pilihan = 'U'
		UPDATE tbBuku SET JudulBuku = @JudulBuku, Pengarang 
		= @Pengarang, Penerbit = @Penerbit, Jumlah = @Jumlah WHERE
		KodeBuku = @KodeBuku
	ELSE IF @Pilihan = 'D'
		DELETE FROM tbBuku WHERE KodeBuku = @KodeBuku
	ELSE IF @Pilihan = 'S'
		SELECT * FROM tbBuku
GO
spKelolaDataBuku 'B004', 'Java', 'Steven', 'Gramedia', 2, 'I'
GO
spKelolaDataBuku 'B004', 'PHP', 'James', 'Platinum', 10, 'U'
GO
spKelolaDataBuku 'B004', '', '', '', '','D'
GO
spKelolaDataBuku '', '', '', '', '', 'S'
GO
CREATE TRIGGER triggerCekJumlahPeminjaman
ON tbDetailPeminjaman
FOR INSERT, UPDATE
AS
	DECLARE @JumlahPinjam int
	SELECT @JumlahPinjam = JumlahPinjam FROM INSERTED
	IF @JumlahPinjam > 3 
		BEGIN
			PRINT 'Transaksi Dibatalkan, Jumlah Buku Yang Boleh Dipinjam Max. 3'
			ROLLBACK TRANSACTION -- Membatalkan transaksi yang sudah dijalankan
		END
	ELSE
		BEGIN
			PRINT 'Transaksi Berhasil'
		END
GO
INSERT INTO tbDetailPeminjaman VALUES ('PJ0002', 'B001', 1)
GO
INSERT INTO tbDetailPeminjaman VALUES ('PJ0002', 'B003', 5)
GO