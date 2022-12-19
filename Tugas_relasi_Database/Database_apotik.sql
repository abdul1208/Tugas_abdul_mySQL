-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 02:56 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotik`
--

-- --------------------------------------------------------

--
-- Table structure for table `database_kasir`
--

CREATE TABLE `database_kasir` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_perusahaan_manufaktur`
--

CREATE TABLE `detail_perusahaan_manufaktur` (
  `id` int(10) NOT NULL,
  `pendiri` varchar(32) NOT NULL,
  `status_kepemilikan` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `instagram` int(11) DEFAULT NULL,
  `youtube` int(11) DEFAULT NULL,
  `twitter` int(11) DEFAULT NULL,
  `id_manufaktur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `harga(Rp)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `Merek/brand` varchar(90) NOT NULL,
  `Indikasi` text NOT NULL,
  `Kategori` varchar(78) NOT NULL,
  `Komposisi` text NOT NULL,
  `Manufaktur` varchar(120) DEFAULT NULL,
  `Tanggal_Produksi` date NOT NULL,
  `Tanggal_Kadaluarsa` date NOT NULL,
  `No_Bpom` int(11) NOT NULL,
  `HET_(Rp)` int(11) DEFAULT NULL,
  `id_Manufaktur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `Merek/brand`, `Indikasi`, `Kategori`, `Komposisi`, `Manufaktur`, `Tanggal_Produksi`, `Tanggal_Kadaluarsa`, `No_Bpom`, `HET_(Rp)`, `id_Manufaktur`) VALUES
(1, 'Fatigon Spirit', 'Membantu memulihkan tenaga akibat kelelahan sehabis bekerja dan berolahraga', 'Vitamin/Suplemen', 'L-carniting 400mg, BCAA 40 mg & Nano Ginseng', 'PT Kalbe Farma', '2021-12-15', '2024-12-10', 1, 6000, 3),
(2, 'FITUNO', 'Membantu memulihkan daya tahan tubuh', 'vitamin', 'Echinacea 150 mg, Phyllanthi 100mg, vit.B1 10 mg, vit.B6 5 mg', NULL, '2022-08-09', '2025-12-02', 777777, NULL, 1),
(4, 'IMBOOST', 'membantu memelihara daya tahan tubuh', 'vitamin/suplemen', 'echinacea 250 mg, Zinc Picolinate 10 mg ', NULL, '2020-09-08', '2024-12-11', 9, 35000, 4),
(5, 'Sanofi Aventis', 'Mengobati gejala alergi', 'obat keras', 'Fexofenadine Hcl 120 mg', NULL, '2021-05-19', '2026-12-20', 67, 135000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan_manufaktur`
--

CREATE TABLE `perusahaan_manufaktur` (
  `id` int(11) NOT NULL,
  `Nama_perusahaan` varchar(120) NOT NULL,
  `Tahun_pendirian` date DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `No_Telp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan_manufaktur`
--

INSERT INTO `perusahaan_manufaktur` (`id`, `Nama_perusahaan`, `Tahun_pendirian`, `Alamat`, `No_Telp`) VALUES
(1, 'PT kimia farma Tbk', '1971-08-16', 'jakarta', '021-232323-232'),
(2, 'PT AVENTIS PHARMA', '1972-08-03', 'Jakarta', '021-232323-232'),
(3, 'PT KALBE FARMA', NULL, 'Jakarta', '021-232-323-00'),
(4, 'PT Soho Industri Farmasi', '1956-08-27', 'Jakarta', '021-232323-444');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal penjualan` datetime NOT NULL,
  `jumlah/kuantitas` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `database_kasir`
--
ALTER TABLE `database_kasir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_perusahaan_manufaktur`
--
ALTER TABLE `detail_perusahaan_manufaktur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail` (`id_manufaktur`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `fk_detail_transaksi` (`id_obat`),
  ADD KEY `fk_transaksi_detail` (`id_transaksi`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_manufaktur` (`id_Manufaktur`);

--
-- Indexes for table `perusahaan_manufaktur`
--
ALTER TABLE `perusahaan_manufaktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kasir_relasi` (`id_kasir`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `database_kasir`
--
ALTER TABLE `database_kasir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_perusahaan_manufaktur`
--
ALTER TABLE `detail_perusahaan_manufaktur`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `perusahaan_manufaktur`
--
ALTER TABLE `perusahaan_manufaktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_perusahaan_manufaktur`
--
ALTER TABLE `detail_perusahaan_manufaktur`
  ADD CONSTRAINT `fk_detail` FOREIGN KEY (`id_manufaktur`) REFERENCES `perusahaan_manufaktur` (`id`);

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_transaksi_detail` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id`);

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `fk_manufaktur` FOREIGN KEY (`id_Manufaktur`) REFERENCES `perusahaan_manufaktur` (`id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_kasir_relasi` FOREIGN KEY (`id_kasir`) REFERENCES `database_kasir` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
