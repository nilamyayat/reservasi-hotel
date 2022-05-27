-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2022 at 04:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_applogin`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `namauser` varchar(30) NOT NULL,
  `leveluser` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`, `namauser`, `leveluser`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 'admin', 'admin'),
('nilam', '202cb962ac59075b964b07152d234b70', 'Nilam Damayanti', 'admin'),
('petugas', '202cb962ac59075b964b07152d234b70', 'petugas', 'petugas'),
('rose', '202cb962ac59075b964b07152d234b70', 'rose', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_kamar`
--

CREATE TABLE `tbl_detail_kamar` (
  `id_detail_kamar` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `id_fasilitas_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_detail_kamar`
--

INSERT INTO `tbl_detail_kamar` (`id_detail_kamar`, `id_kamar`, `id_fasilitas_kamar`) VALUES
(57, 8, 21),
(58, 8, 23),
(59, 4, 21),
(60, 4, 23),
(61, 4, 24),
(65, 9, 21),
(66, 9, 23),
(67, 9, 24),
(74, 10, 21),
(75, 10, 23),
(76, 10, 26);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fasilitas_hotel`
--

CREATE TABLE `tbl_fasilitas_hotel` (
  `id_fasilitas_hotel` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `deskripsi_fasilitas` varchar(150) NOT NULL,
  `foto_fasilitas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_fasilitas_hotel`
--

INSERT INTO `tbl_fasilitas_hotel` (`id_fasilitas_hotel`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(11, 'Kolam renang', 'Dapat melihat matahari terbit dan terbenam sambil berenang bahagia', 'kolam renang.jpeg'),
(12, 'lapangan golf', 'tersedia satu lapangan golf', 'lapangan golf.jpg'),
(13, 'Sauna', 'Cocok untuk menghangatkan badan', 'sauna.jpg'),
(14, 'Ruang Meeting', 'Anda dapat melakukan meeting dengan nyaman dan tenang', 'ruang meeting.jpg'),
(15, 'Tempat Parkir', 'Tempat parkir yang luas', 'parkir.JPG'),
(21, 'gym', 'sarana olahraga di pagi,siang dan malam hari', 'gymhotel.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fasilitas_kamar`
--

CREATE TABLE `tbl_fasilitas_kamar` (
  `id_fasilitas_kamar` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `deskripsi_fasilitas` varchar(150) NOT NULL,
  `foto_fasilitas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_fasilitas_kamar`
--

INSERT INTO `tbl_fasilitas_kamar` (`id_fasilitas_kamar`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(21, 'tv', 'menyediakan tv untuk sarana menonton segala film animasi dengan nyaman', 'tv.jpg'),
(23, 'wifi', 'menyediakan wifi untuk sarana internet dan terdapat disetiap kamarnya', '1wifi.jpg'),
(24, 'Kulkas mini', 'menyediakan kulkas mini untuk mendinginkan makanan atau minuman dan dapat mengawetkan makanan', 'kulkas.jpg'),
(25, 'sofa', 'sebagai tempat berkumpul ketika ada keluarga datang', 'sofahotel.jpg'),
(26, 'meja', 'dapat digunakan untuk belajar atau menyimpan barang dan makanan', 'mejahotel.jpg'),
(27, 'lemari', 'digunakan untuk menyimpan pakaian dan barang lainnya', 'lemaribaju.jpg');

--
-- Triggers `tbl_fasilitas_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusFasilitasKamar` AFTER DELETE ON `tbl_fasilitas_kamar` FOR EACH ROW DELETE FROM tbl_detail_kamar WHERE id_fasilitas_kamar=OLD.id_fasilitas_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `tipe_kamar` enum('standar','single','deluxe','suite') NOT NULL,
  `foto_kamar` varchar(150) NOT NULL,
  `jml_kamar` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `harga_kamar`, `tipe_kamar`, `foto_kamar`, `jml_kamar`) VALUES
(4, 550000, 'suite', 'suitekamar.jpg', 5),
(8, 300000, 'single', 'single.jpg', 5),
(9, 600000, 'deluxe', 'deluxe.jpg', 7),
(10, 300000, 'standar', 'standaroom.jpg', 6);

--
-- Triggers `tbl_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusDetailKamar` AFTER DELETE ON `tbl_kamar` FOR EACH ROW delete from tbl_detail_kamar where tbl_detail_kamar.id_kamar=old.id_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `nama_pemesan` varchar(100) NOT NULL,
  `no_handphone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `jml_kamar_dipesan` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `tgl_cek_in` date NOT NULL,
  `tgl_cek_out` date NOT NULL,
  `status` enum('in','out') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`id_reservasi`, `nama_pemesan`, `no_handphone`, `email`, `nama_tamu`, `jml_kamar_dipesan`, `id_kamar`, `tgl_cek_in`, `tgl_cek_out`, `status`) VALUES
(13, 'Nilam', '083101250091', 'nilam@gmail.com', 'nilam', 4, 9, '2022-05-24', '2022-05-26', 'out'),
(14, 'Helva', '0813129390', 'hel@gmail.com', 'haha', 1, 9, '2022-05-24', '2022-05-25', 'out'),
(15, 'Nilam', '083101250091', 'nilam@gmail.com', 'nilam', 1, 10, '2022-05-25', '2022-05-27', NULL),
(16, 'Nana', '0813131313', 'na@gmail.com', 'nana', 1, 4, '2022-05-24', '2022-05-25', 'out'),
(17, 'Pa Yayat', '081234590', 'yayaat@gmail.com', 'yayat', -3, 9, '2022-05-25', '2022-05-26', 'in');

--
-- Triggers `tbl_reservasi`
--
DELIMITER $$
CREATE TRIGGER `infoJmlKamar` AFTER UPDATE ON `tbl_reservasi` FOR EACH ROW BEGIN
   	 IF (NEW.status='in') THEN
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar-OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;
   	 ELSE
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar+OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;   	 
   	 END IF;    
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  ADD PRIMARY KEY (`id_detail_kamar`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_fasilitas_kamar` (`id_fasilitas_kamar`);

--
-- Indexes for table `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  ADD PRIMARY KEY (`id_fasilitas_hotel`);

--
-- Indexes for table `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas_kamar`);

--
-- Indexes for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  MODIFY `id_detail_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  MODIFY `id_fasilitas_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  MODIFY `id_fasilitas_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
