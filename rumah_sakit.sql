-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2020 pada 07.16
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_sakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `kode_kamar` varchar(10) NOT NULL,
  `nama_kamar` varchar(20) NOT NULL,
  `fasilitas` varchar(20) NOT NULL,
  `harga` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`kode_kamar`, `nama_kamar`, `fasilitas`, `harga`) VALUES
('1', 'MELATI', 'TV Rp. 60.000 ,-', '50000'),
('2', 'MELATI', 'WIFI Rp. 50.000 ,-', '50000'),
('3', 'MELATI', 'TV', '60000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan`
--

CREATE TABLE `kunjungan` (
  `tanggal` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `kode_pasien` varchar(20) NOT NULL,
  `no_kunjungan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `nama` varchar(20) NOT NULL,
  `penyakit` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kode_pasien` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `regis`
--

CREATE TABLE `regis` (
  `kode_pasien` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `ttl` varchar(50) NOT NULL,
  `nope` int(11) NOT NULL,
  `kode_kamar` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `regis`
--

INSERT INTO `regis` (`kode_pasien`, `nama`, `jk`, `alamat`, `ttl`, `nope`, `kode_kamar`) VALUES
('1', 'asd', 'Laki - Laki', 'qwe', '1980', 213, '1'),
('2', 'Helmi', 'Laki - Laki', 'hef', '1980', 82323, '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `no_kunjungan` varchar(5) NOT NULL,
  `nama_t` varchar(50) NOT NULL,
  `tgl_jenguk` varchar(10) NOT NULL,
  `kode_pasien` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `unreg`
--

CREATE TABLE `unreg` (
  `kode_pasien` varchar(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` varchar(20) DEFAULT NULL,
  `kode_kamar` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kode_kamar`);

--
-- Indeks untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD KEY `no_kunjungan` (`no_kunjungan`),
  ADD KEY `kode_pasien` (`kode_pasien`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD KEY `kode_pasien` (`kode_pasien`);

--
-- Indeks untuk tabel `regis`
--
ALTER TABLE `regis`
  ADD PRIMARY KEY (`kode_pasien`),
  ADD KEY `kode_kamar` (`kode_kamar`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`no_kunjungan`),
  ADD KEY `kode_pasien` (`kode_pasien`);

--
-- Indeks untuk tabel `unreg`
--
ALTER TABLE `unreg`
  ADD PRIMARY KEY (`kode_pasien`),
  ADD KEY `kode_kamar` (`kode_kamar`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`kode_pasien`) REFERENCES `regis` (`kode_pasien`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`no_kunjungan`) REFERENCES `tamu` (`no_kunjungan`);

--
-- Ketidakleluasaan untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kode_pasien`) REFERENCES `regis` (`kode_pasien`);

--
-- Ketidakleluasaan untuk tabel `regis`
--
ALTER TABLE `regis`
  ADD CONSTRAINT `regis_ibfk_1` FOREIGN KEY (`kode_kamar`) REFERENCES `kamar` (`kode_kamar`);

--
-- Ketidakleluasaan untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD CONSTRAINT `tamu_ibfk_1` FOREIGN KEY (`kode_pasien`) REFERENCES `regis` (`kode_pasien`);

--
-- Ketidakleluasaan untuk tabel `unreg`
--
ALTER TABLE `unreg`
  ADD CONSTRAINT `unreg_ibfk_1` FOREIGN KEY (`kode_kamar`) REFERENCES `kamar` (`kode_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
