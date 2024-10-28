-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jan 2021 pada 05.05
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_stevanuschristian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stevanuschristian`
--

CREATE TABLE `tb_stevanuschristian` (
  `NIP` varchar(10) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `JenisKelamin` varchar(1) NOT NULL,
  `Agama` varchar(10) NOT NULL,
  `Golongan` varchar(5) NOT NULL,
  `LokasiPelayanan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_stevanuschristian`
--

INSERT INTO `tb_stevanuschristian` (`NIP`, `Nama`, `JenisKelamin`, `Agama`, `Golongan`, `LokasiPelayanan`) VALUES
('0011223344', 'Stevanus Christian', 'L', 'Kristen', 'I.c', 'Sako'),
('0011225566', 'Justin', 'L', 'Hindu', 'II.d', 'Kemuning'),
('0022446688', 'Cindy Claudya', 'P', 'Buddha', 'III.a', 'Alang-alang Lebar');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_stevanuschristian`
--
ALTER TABLE `tb_stevanuschristian`
  ADD PRIMARY KEY (`NIP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
