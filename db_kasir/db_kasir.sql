-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2024 pada 05.02
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_02_28_022959_barang', 1),
(4, '2023_02_28_023014_jenis_barang', 1),
(5, '2023_02_28_023054_transaksi', 1),
(6, '2023_02_28_023102_detail_transaksi', 1),
(7, '2023_02_28_023726_diskon', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `id_jenis`, `nama_barang`, `harga`, `stok`, `created_at`, `updated_at`) VALUES
(7, 4, 'Roti Isi Srikaya', 6000, 190, '2024-02-11 23:07:01', '2024-02-11 23:12:29'),
(8, 5, 'Roti Sandwich Coklat', 8000, 196, '2024-02-11 23:07:28', '2024-02-11 23:12:29'),
(9, 6, 'Roti Tawar Kupas', 9000, 195, '2024-02-11 23:07:56', '2024-02-11 23:12:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_transaksi`
--

CREATE TABLE `tbl_detail_transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_transaksi` varchar(255) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_detail_transaksi`
--

INSERT INTO `tbl_detail_transaksi` (`id`, `no_transaksi`, `id_barang`, `qty`, `created_at`, `updated_at`) VALUES
(14, 'NT-001', 7, 10, '2024-02-11 23:12:29', '2024-02-11 23:12:29'),
(15, 'NT-001', 9, 5, '2024-02-11 23:12:29', '2024-02-11 23:12:29'),
(16, 'NT-001', 8, 4, '2024-02-11 23:12:29', '2024-02-11 23:12:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_diskon`
--

CREATE TABLE `tbl_diskon` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_belanja` bigint(20) NOT NULL,
  `diskon` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_diskon`
--

INSERT INTO `tbl_diskon` (`id`, `total_belanja`, `diskon`, `created_at`, `updated_at`) VALUES
(1, 100000, 10, NULL, '2024-02-11 23:08:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jenis_barang`
--

CREATE TABLE `tbl_jenis_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jenis` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_jenis_barang`
--

INSERT INTO `tbl_jenis_barang` (`id`, `nama_jenis`, `created_at`, `updated_at`) VALUES
(4, 'Roti Isi', '2024-02-11 23:06:15', '2024-02-11 23:06:15'),
(5, 'Roti Sandwich', '2024-02-11 23:06:32', '2024-02-11 23:06:32'),
(6, 'Roti Tawar', '2024-02-11 23:06:44', '2024-02-11 23:06:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_transaksi` varchar(255) NOT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `kembalian` bigint(20) DEFAULT NULL,
  `uang_pembeli` bigint(20) DEFAULT NULL,
  `total_bayar` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `no_transaksi`, `tgl_transaksi`, `subtotal`, `diskon`, `kembalian`, `uang_pembeli`, `total_bayar`, `created_at`, `updated_at`) VALUES
(8, 'NT-001', '2024-02-12', 137000, 13700, 26700, 150000, 123300, '2024-02-11 23:12:29', '2024-02-11 23:12:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','kasir') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$C.W62yA.cd1m.eofqDJap.oImUaEGPZ3.aucRJy0ccEZ.rqlHlKPu', 'admin', NULL, '2024-02-12 01:18:36'),
(2, 'kasir', 'kasir@gmail.com', '$2y$10$YcrO74DJmtsxEmhO.ZzBOeRr9vKJOGuWKFj5zxdu7mhZ8jRBSiDDq', 'kasir', NULL, '2024-02-11 23:11:07'),
(8, 'admin2', 'admin2@gmail.com', '$2y$10$QnXV8yZWSz7D6TOY4tb9De2gKj4Vz0trdD9DyetkHPCcD68YxaoFq', 'admin', '2024-02-12 01:19:17', '2024-02-12 01:19:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_detail_transaksi`
--
ALTER TABLE `tbl_detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_diskon`
--
ALTER TABLE `tbl_diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_jenis_barang`
--
ALTER TABLE `tbl_jenis_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_detail_transaksi`
--
ALTER TABLE `tbl_detail_transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tbl_diskon`
--
ALTER TABLE `tbl_diskon`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_jenis_barang`
--
ALTER TABLE `tbl_jenis_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
