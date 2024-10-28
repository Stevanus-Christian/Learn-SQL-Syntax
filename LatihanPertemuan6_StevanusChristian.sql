USE dbPerpustakaan
GO
SELECT kodebuku, judulbuku, pengarang, penerbit FROM tbBuku ORDER BY penerbit ASC
GO
SELECT npm, namamahasiswa, jeniskelamin FROM tbMahasiswa ORDER BY namamahasiswa DESC
GO
SELECT * FROM tbMahasiswa GROUP BY npm, namamahasiswa, jeniskelamin, alamat, notelp HAVING alamat = 'Jl Nuri No 11'
GO
SELECT npm, namamahasiswa FROM tbMahasiswa GROUP BY npm, namamahasiswa HAVING npm = '1821110001'
GO