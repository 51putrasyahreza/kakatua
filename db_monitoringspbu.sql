-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17 Nov 2019 pada 05.08
-- Versi Server: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_monitoringspbu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_control`
--

CREATE TABLE `admin_control` (
  `id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` int(5) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin_control`
--

INSERT INTO `admin_control` (`id`, `nama`, `jabatan`, `userId`, `password`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
(1, 'ican', 1, 'ican', 'e39c9ba129e2469865029606eb21120a', 0, '2019-11-14 00:00:00', 0, '2019-11-14 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_hakaksescontrol`
--

CREATE TABLE `admin_hakaksescontrol` (
  `id` int(5) NOT NULL,
  `idAdmin` int(5) NOT NULL,
  `idMenu` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_dispenser`
--

CREATE TABLE `mst_dispenser` (
  `id` int(5) NOT NULL,
  `idBahanBakar` int(5) NOT NULL,
  `namaDispenser` varchar(20) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_dispenser`
--

INSERT INTO `mst_dispenser` (`id`, `idBahanBakar`, `namaDispenser`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
(1, 1, 'mesin 1a', 0, '2019-11-14 00:00:00', 0, '2019-11-14 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_jabatan`
--

CREATE TABLE `mst_jabatan` (
  `id` int(5) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_jabatan`
--

INSERT INTO `mst_jabatan` (`id`, `jabatan`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
(1, 'super admin', 0, '2019-11-14 00:00:00', 0, '2019-11-14 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_jenisbahanbakar`
--

CREATE TABLE `mst_jenisbahanbakar` (
  `id` int(5) NOT NULL,
  `namaBahanBakar` varchar(20) NOT NULL,
  `status` int(5) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_jenisbahanbakar`
--

INSERT INTO `mst_jenisbahanbakar` (`id`, `namaBahanBakar`, `status`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
(1, 'pertamax', 1, 0, '2019-11-14 00:00:00', 0, '2019-11-14 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_karyawan`
--

CREATE TABLE `mst_karyawan` (
  `id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenisKelamin` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `agama` varchar(10) NOT NULL,
  `pendidikanTerakhir` varchar(10) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `tanggalMulaiKerja` datetime NOT NULL,
  `tanggalBerhentiKerja` datetime NOT NULL,
  `status` int(5) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_karyawan`
--

INSERT INTO `mst_karyawan` (`id`, `nama`, `jenisKelamin`, `alamat`, `agama`, `pendidikanTerakhir`, `tanggalLahir`, `tanggalMulaiKerja`, `tanggalBerhentiKerja`, `status`, `createdBy`, `createdDate`, `modifiedBy`, `modifiedDate`) VALUES
(1, 'karyawan 1', 'Laki-Laki', 'gadog', 'islam', 'SMA', '2019-11-01', '2019-11-02 00:00:00', '2019-11-03 00:00:00', 1, 0, '2019-11-02 00:00:00', 0, '2019-11-03 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_menu`
--

CREATE TABLE `mst_menu` (
  `id` int(5) NOT NULL,
  `namaMenu` varchar(20) NOT NULL,
  `parentMenu` int(5) NOT NULL,
  `childMenu` int(5) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_dispenser`
--

CREATE TABLE `tr_dispenser` (
  `id` int(5) NOT NULL,
  `idDispenser` int(5) NOT NULL,
  `idStokGudang` int(5) NOT NULL,
  `jumlahLiter` decimal(20,0) NOT NULL,
  `hargaJual` decimal(20,0) NOT NULL,
  `idShiftKerja` int(5) NOT NULL,
  `tanggalKerja` datetime NOT NULL,
  `literTerjual` decimal(20,0) NOT NULL,
  `hargaLiterTerjual` decimal(20,0) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_stokgudang`
--

CREATE TABLE `tr_stokgudang` (
  `id` int(5) NOT NULL,
  `idStokGudang` int(5) NOT NULL,
  `tanggalMasuk` datetime NOT NULL,
  `jumlahLiter` decimal(20,0) NOT NULL,
  `stokTangkiLama` decimal(20,0) NOT NULL,
  `stokTangki` decimal(20,0) NOT NULL,
  `hargaMentah` decimal(20,0) NOT NULL,
  `hargaMentahTotal` decimal(20,0) NOT NULL,
  `hargaJual` decimal(20,0) NOT NULL,
  `createdBy` int(5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedBy` int(5) NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_control`
--
ALTER TABLE `admin_control`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indexes for table `admin_hakaksescontrol`
--
ALTER TABLE `admin_hakaksescontrol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_dispenser`
--
ALTER TABLE `mst_dispenser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_jabatan`
--
ALTER TABLE `mst_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_jenisbahanbakar`
--
ALTER TABLE `mst_jenisbahanbakar`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mst_karyawan`
--
ALTER TABLE `mst_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_menu`
--
ALTER TABLE `mst_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_dispenser`
--
ALTER TABLE `tr_dispenser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_stokgudang`
--
ALTER TABLE `tr_stokgudang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_control`
--
ALTER TABLE `admin_control`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_hakaksescontrol`
--
ALTER TABLE `admin_hakaksescontrol`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mst_dispenser`
--
ALTER TABLE `mst_dispenser`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mst_jabatan`
--
ALTER TABLE `mst_jabatan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mst_jenisbahanbakar`
--
ALTER TABLE `mst_jenisbahanbakar`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mst_karyawan`
--
ALTER TABLE `mst_karyawan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mst_menu`
--
ALTER TABLE `mst_menu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tr_dispenser`
--
ALTER TABLE `tr_dispenser`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tr_stokgudang`
--
ALTER TABLE `tr_stokgudang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
