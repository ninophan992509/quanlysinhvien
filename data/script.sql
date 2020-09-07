-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2020 lúc 06:25 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlydiem`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `han_phuc_khao`
--

CREATE TABLE `han_phuc_khao` (
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuckhao`
--

CREATE TABLE `phuckhao` (
  `MaPK` int(11) NOT NULL,
  `MSSV` int(11) DEFAULT NULL,
  `MaMH` varchar(255) DEFAULT NULL,
  `CotPK` varchar(255) DEFAULT NULL,
  `Diem` float DEFAULT NULL,
  `LiDo` varchar(255) DEFAULT NULL,
  `TinhTrang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `STT` int(11) DEFAULT NULL,
  `MSSV` int(11) NOT NULL,
  `MaLop` varchar(255) NOT NULL,
  `HoTen` varchar(255) DEFAULT NULL,
  `CMND` int(11) DEFAULT NULL,
  `GioiTinh` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien_monhoc`
--

CREATE TABLE `sinhvien_monhoc` (
  `MSSV` int(11) NOT NULL,
  `MaMH` varchar(255) NOT NULL,
  `DiemGK` float NOT NULL,
  `DiemCK` float NOT NULL,
  `DiemKhac` float NOT NULL,
  `DiemTong` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`username`, `password`) VALUES
('giaovu', 'giaovu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thoikhoabieu`
--

CREATE TABLE `thoikhoabieu` (
  `MaLop` varchar(255) NOT NULL,
  `MaMH` varchar(255) NOT NULL,
  `TenMH` varchar(255) NOT NULL,
  `PhongHoc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `han_phuc_khao`
--
ALTER TABLE `han_phuc_khao`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phuckhao`
--
ALTER TABLE `phuckhao`
  ADD PRIMARY KEY (`MaPK`),
  ADD KEY `MSSV` (`MSSV`,`MaMH`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MSSV`);

--
-- Chỉ mục cho bảng `sinhvien_monhoc`
--
ALTER TABLE `sinhvien_monhoc`
  ADD PRIMARY KEY (`MSSV`,`MaMH`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `thoikhoabieu`
--
ALTER TABLE `thoikhoabieu`
  ADD PRIMARY KEY (`MaLop`,`MaMH`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `han_phuc_khao`
--
ALTER TABLE `han_phuc_khao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `phuckhao`
--
ALTER TABLE `phuckhao`
  MODIFY `MaPK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `phuckhao`
--
ALTER TABLE `phuckhao`
  ADD CONSTRAINT `phuckhao_ibfk_1` FOREIGN KEY (`MSSV`,`MaMH`) REFERENCES `sinhvien_monhoc` (`MSSV`, `MaMH`);

--
-- Các ràng buộc cho bảng `sinhvien_monhoc`
--
ALTER TABLE `sinhvien_monhoc`
  ADD CONSTRAINT `sinhvien_monhoc_ibfk_1` FOREIGN KEY (`MSSV`) REFERENCES `sinhvien` (`MSSV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
