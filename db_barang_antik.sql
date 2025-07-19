-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2025 pada 09.32
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barang_antik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_antik`
--

CREATE TABLE `barang_antik` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(150) NOT NULL,
  `tahun_pembuatan` year(4) DEFAULT NULL,
  `nilai_estimasi` decimal(15,2) DEFAULT NULL,
  `jenis_barang_id` int(11) DEFAULT NULL,
  `pemilik_id` int(11) DEFAULT NULL,
  `kuantitas` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `status_perawatan` enum('Terawat','Butuh Perawatan') DEFAULT 'Terawat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_antik`
--

INSERT INTO `barang_antik` (`id_barang`, `nama_barang`, `tahun_pembuatan`, `nilai_estimasi`, `jenis_barang_id`, `pemilik_id`, `kuantitas`, `created_at`, `status_perawatan`) VALUES
(1, 'guci', '1990', 2000000.00, 1, 1, 1, '2025-07-18 21:09:51', 'Terawat'),
(2, 'gelang', '1920', 1000000.00, 2, 1, 1, '2025-07-18 21:09:51', 'Butuh Perawatan'),
(3, 'kursi', '1970', 99988888.00, 1, 1, 1, '2025-07-18 21:09:51', 'Terawat'),
(4, 'guci', '1950', 500000000.00, 1, 1, 1, '2025-07-18 21:09:51', 'Terawat'),
(5, 'uang dolar kuno', '0000', 4382928889.00, 3, 2, 1, '2025-07-18 23:58:38', 'Butuh Perawatan'),
(6, 'monalisa', '0000', 8540000000.00, 9, 2, 1, '2025-07-18 23:59:24', 'Terawat'),
(7, 'bmw ', '0000', 780005000.00, 4, 4, 1, '2025-07-19 00:00:04', 'Terawat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `nama_jenis`) VALUES
(1, 'furnitur'),
(2, 'perhiasan'),
(3, 'uang'),
(4, 'otomotif'),
(5, 'aksesoris'),
(6, 'senjata'),
(7, 'alat musik'),
(8, 'pakaian'),
(9, 'lukisan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_barang`
--

CREATE TABLE `log_barang` (
  `id_log` int(11) NOT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `before` text DEFAULT NULL,
  `after` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_barang`
--

INSERT INTO `log_barang` (`id_log`, `barang_id`, `field`, `before`, `after`, `updated_at`) VALUES
(1, 1, 'nilai_estimasi', '2000.00', '2000000.00', '2025-07-18 14:08:14'),
(2, 1, 'nilai_estimasi', '2000000.00', '200000000.00', '2025-07-18 14:12:17'),
(3, 1, 'status_perawatan', 'Terawat', 'Butuh Perawatan', '2025-07-18 15:31:10'),
(4, 2, 'status_perawatan', 'Terawat', 'Butuh Perawatan', '2025-07-18 15:48:23'),
(5, 7, 'nilai_estimasi', '9999999999999.99', '780005000', '2025-07-18 17:09:05'),
(6, 1, 'nilai_estimasi', '200000000.00', '2000000', '2025-07-18 17:09:27'),
(7, 7, 'status_perawatan', 'Terawat', 'Butuh Perawatan', '2025-07-18 17:10:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `nama_pemilik` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `tanggal_terdaftar` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `nama_pemilik`, `alamat`, `kontak`, `tanggal_terdaftar`) VALUES
(1, 'alexander', 'jakarta', '08573893990', '2025-07-18 23:32:06'),
(2, 'intan', 'magelang', '09793782972', '2025-07-18 23:57:17'),
(3, 'eileen', 'hsybasjhb', '9826388298327', '2025-07-18 23:57:32'),
(4, 'nathan', 'hahahihu', '0297382921', '2025-07-18 23:57:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perawatan_barang`
--

CREATE TABLE `perawatan_barang` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `perawatan_barang`
--

INSERT INTO `perawatan_barang` (`id`, `barang_id`, `tanggal`, `catatan`) VALUES
(1, 1, '2025-07-31', 'perlu dibersihkan'),
(2, 7, '2025-07-26', 'harus di bersihkan'),
(3, 7, '2025-07-27', 'ya'),
(4, 7, '2025-07-30', 'oke');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `nama`, `no_telp`, `alamat`) VALUES
(1, 'admin', 'yewbubeu2@pehcho.com', '0192023a7bbd73250516f069df18b500', 'Administrator', '085700106524', 'hyhyhyh');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang_antik`
--
ALTER TABLE `barang_antik`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `jenis_barang_id` (`jenis_barang_id`),
  ADD KEY `pemilik_id` (`pemilik_id`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `log_barang`
--
ALTER TABLE `log_barang`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- Indeks untuk tabel `perawatan_barang`
--
ALTER TABLE `perawatan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang_antik`
--
ALTER TABLE `barang_antik`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `log_barang`
--
ALTER TABLE `log_barang`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `perawatan_barang`
--
ALTER TABLE `perawatan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_antik`
--
ALTER TABLE `barang_antik`
  ADD CONSTRAINT `barang_antik_ibfk_1` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`id_jenis`),
  ADD CONSTRAINT `barang_antik_ibfk_2` FOREIGN KEY (`pemilik_id`) REFERENCES `pemilik` (`id_pemilik`);

--
-- Ketidakleluasaan untuk tabel `perawatan_barang`
--
ALTER TABLE `perawatan_barang`
  ADD CONSTRAINT `perawatan_barang_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang_antik` (`id_barang`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
