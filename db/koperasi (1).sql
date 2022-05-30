-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2022 pada 07.01
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_anggota`
--

CREATE TABLE `t_anggota` (
  `kode_anggota` char(5) NOT NULL,
  `kode_tabungan` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat_anggota` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `telp` varchar(12) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  `addedUser` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_anggota`
--

INSERT INTO `t_anggota` (`kode_anggota`, `kode_tabungan`, `nama_anggota`, `alamat_anggota`, `jenis_kelamin`, `pekerjaan`, `tgl_masuk`, `telp`, `tempat_lahir`, `tgl_lahir`, `status`, `u_entry`, `tgl_entri`, `addedUser`) VALUES
('A0001', 59, 'Rijal ALfauzi', 'Kp. Ngamplang Kec. Cikajang Kab. Garut', 'Laki-laki', 'wirausaha', '2022-05-27', '087739959392', 'Garut', '1997-10-26', 'aktif', 'Kang Admin', '2022-05-27', 1),
('A0002', 60, 'Anggota', 'Bandung', 'Laki-laki', 'Admin Slot', '2022-05-28', '085314383654', 'Bandung', '2022-05-25', 'aktif', 'Kang Admin', '2022-05-28', 1),
('A0004', 62, 'Anggoti', 'Bandung', 'Perempuan', 'Admin Slot', '2022-05-28', '085314383654', 'Bandung', '2022-05-18', 'aktif', 'Kang Admin', '2022-05-28', 1),
('A0005', 64, 'Anggoti', 'Bandung', 'Laki-laki', 'Admin Slot', '2022-05-28', '085314383654', 'Jonggol', '2022-05-24', 'aktif', 'Kang Admin', '2022-05-28', 0),
('A0006', 65, 'Anggoti', 'Bandung', 'Perempuan', 'Admin Slot', '2022-05-28', '085314383654', 'Jonggol', '0000-00-00', 'aktif', 'Kang Admin', '2022-05-28', 0),
('A0007', 66, 'Anggota', 'Bandung', 'Perempuan', 'Admin Slot', '2022-05-28', '085314383654', 'Jonggol', '0000-00-00', 'aktif', 'Kang Admin', '2022-05-28', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_angsur`
--

CREATE TABLE `t_angsur` (
  `kode_angsur` int(11) NOT NULL,
  `kode_pinjam` int(11) NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `sisa_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_angsur`
--

INSERT INTO `t_angsur` (`kode_angsur`, `kode_pinjam`, `angsuran_ke`, `besar_angsuran`, `denda`, `sisa_pinjam`, `kode_anggota`, `u_entry`, `tgl_entri`) VALUES
(159, 70, 1, 425000, 0, 1575000, 'A0001', 'Kang Admin', '2022-05-28'),
(160, 70, 2, 425000, 0, 1150000, 'A0001', 'Kang Admin', '2022-05-28'),
(161, 70, 3, 425000, 0, 725000, 'A0001', 'Kang Admin', '2022-05-28'),
(162, 70, 4, 425000, 0, 300000, 'A0001', 'Kang Admin', '2022-05-28'),
(163, 70, 5, 425000, 0, -125000, 'A0001', 'Kang Admin', '2022-05-28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis_pinjam`
--

CREATE TABLE `t_jenis_pinjam` (
  `kode_jenis_pinjam` char(5) NOT NULL,
  `nama_pinjaman` varchar(50) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `maks_pinjam` double NOT NULL,
  `bunga` int(11) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_jenis_pinjam`
--

INSERT INTO `t_jenis_pinjam` (`kode_jenis_pinjam`, `nama_pinjaman`, `lama_angsuran`, `maks_pinjam`, `bunga`, `u_entry`, `tgl_entri`) VALUES
('P0001', 'lansung', 5, 5000000, 25000, '', '2022-05-27'),
('P0002', 'barang', 8, 5000000, 25000, '', '2022-05-27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis_simpan`
--

CREATE TABLE `t_jenis_simpan` (
  `kode_jenis_simpan` char(5) NOT NULL,
  `nama_simpanan` varchar(50) NOT NULL,
  `besar_simpanan` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_jenis_simpan`
--

INSERT INTO `t_jenis_simpan` (`kode_jenis_simpan`, `nama_simpanan`, `besar_simpanan`, `u_entry`, `tgl_entri`) VALUES
('S0001', 'wajib', 100000, 'Kang Admin', '2022-05-27'),
('S0002', 'Sukarela', 100000, 'Kang Admin', '2022-05-27'),
('S0003', 'Pokok', 1000000, 'Kang Admin', '2022-05-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pengajuan`
--

CREATE TABLE `t_pengajuan` (
  `kode_pengajuan` int(4) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_jenis_pinjam` varchar(10) NOT NULL,
  `besar_pinjam` int(11) NOT NULL,
  `tgl_acc` date NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pengajuan`
--

INSERT INTO `t_pengajuan` (`kode_pengajuan`, `tgl_pengajuan`, `kode_anggota`, `kode_jenis_pinjam`, `besar_pinjam`, `tgl_acc`, `status`) VALUES
(1, '2022-05-28', 'A0001', 'P0001', 2000000, '2022-05-28', 'diterima'),
(2, '2022-05-29', 'A0007', 'P0001', 2000000, '2022-05-29', 'diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pengambilan`
--

CREATE TABLE `t_pengambilan` (
  `kode_ambil` int(5) NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_tabungan` int(5) NOT NULL,
  `besar_ambil` int(20) NOT NULL,
  `tgl_ambil` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pengambilan`
--

INSERT INTO `t_pengambilan` (`kode_ambil`, `kode_anggota`, `kode_tabungan`, `besar_ambil`, `tgl_ambil`) VALUES
(31, 'A0002', 58, 10000, '2022-05-27'),
(32, 'A0007', 66, 100000, '2022-05-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_petugas`
--

CREATE TABLE `t_petugas` (
  `kode_petugas` char(5) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `alamat_petugas` varchar(100) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_petugas`
--

INSERT INTO `t_petugas` (`kode_petugas`, `nama_petugas`, `alamat_petugas`, `no_telp`, `jenis_kelamin`, `u_entry`, `tgl_entri`) VALUES
('P0001', 'operator', 'Alamat Indonesia', '080041130522', 'Laki-laki', 'Kang Admin', '2017-02-16'),
('P0002', 'Operator 2', 'Alamat Indonesia', '082133455678', 'Perempuan', 'Kang Admin', '2020-12-09'),
('P0003', 'Operator 4', 'Alamat Indonesia', '081241130522', 'Laki-laki', 'Kang Admin', '2020-12-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pinjam`
--

CREATE TABLE `t_pinjam` (
  `kode_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `kode_jenis_pinjam` char(5) NOT NULL,
  `besar_pinjam` double NOT NULL,
  `besar_angsuran` double NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `sisa_angsuran` int(11) NOT NULL,
  `sisa_pinjaman` double NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  `tgl_tempo` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pinjam`
--

INSERT INTO `t_pinjam` (`kode_pinjam`, `kode_anggota`, `kode_jenis_pinjam`, `besar_pinjam`, `besar_angsuran`, `lama_angsuran`, `sisa_angsuran`, `sisa_pinjaman`, `u_entry`, `tgl_entri`, `tgl_tempo`, `status`) VALUES
(70, 'A0001', 'P0001', 2000000, 425000, 5, 5, -125000, '', '2022-05-28', '2022-10-25', 'lunas'),
(71, 'A0002', 'P0002', 2000000, 0, 8, 0, 0, 'Kang Admin', '2022-05-29', '2022-06-28', 'belum lunas'),
(72, 'A0006', 'P0001', 2000000, 0, 5, 0, 2000000, 'Kang Admin', '2022-05-29', '2022-06-28', 'belum lunas'),
(73, 'A0007', 'P0001', 2000000, 425000, 5, 0, 2000000, '', '2022-05-29', '2022-06-28', 'belum lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_simpan`
--

CREATE TABLE `t_simpan` (
  `kode_simpan` int(11) NOT NULL,
  `jenis_simpan` varchar(10) NOT NULL,
  `besar_simpanan` double NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_simpan`
--

INSERT INTO `t_simpan` (`kode_simpan`, `jenis_simpan`, `besar_simpanan`, `kode_anggota`, `u_entry`, `tgl_mulai`, `tgl_entri`) VALUES
(194, 'sukarela', 1000000, 'A0002', 'Operator Koperasi', '2022-05-27', '2022-05-27'),
(195, 'pokok', 0, 'A0001', 'Kang Admin', '2022-05-27', '2022-05-27'),
(196, 'pokok', 0, 'A0002', 'Kang Admin', '2022-05-28', '2022-05-28'),
(197, 'pokok', 0, 'A0003', 'Kang Admin', '2022-05-28', '2022-05-28'),
(198, 'pokok', 0, 'A0004', 'Kang Admin', '2022-05-28', '2022-05-28'),
(199, 'pokok', 0, 'A0005', 'Kang Admin', '2022-05-28', '2022-05-28'),
(200, 'pokok', 0, 'A0005', 'Kang Admin', '2022-05-28', '2022-05-28'),
(201, 'pokok', 0, 'A0006', 'Kang Admin', '2022-05-28', '2022-05-28'),
(202, 'pokok', 0, 'A0007', 'Kang Admin', '2022-05-28', '2022-05-28'),
(203, 'wajib', 100000, 'A0001', 'Kang Admin', '2022-06-04', '2022-05-28'),
(204, 'wajib', 100000, 'A0007', 'Kang Admin', '2022-06-05', '2022-05-29'),
(205, 'Pokok', 1000000, 'A0006', 'Operator Koperasi', '2022-05-29', '2022-05-29'),
(206, 'Pokok', 1000000, 'A0005', 'Kang Admin', '2022-05-29', '2022-05-29'),
(207, 'Pokok', 1000000, 'A0005', 'Kang Admin', '2022-05-29', '2022-05-29'),
(208, 'Pokok', 1000000, 'A0005', 'Kang Admin', '2022-05-29', '2022-05-29'),
(209, 'Pokok', 1000000, 'A0005', 'Kang Admin', '2022-05-29', '2022-05-29'),
(210, 'Pokok', 1000000, 'A0005', 'Kang Admin', '2022-05-29', '2022-05-29'),
(211, 'wajib', 100000, 'A0002', 'Rijal Alfauzi', '2022-06-05', '2022-05-29'),
(212, 'Pokok', 1000000, 'A0002', 'Rijal Alfauzi', '2022-05-29', '2022-05-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tabungan`
--

CREATE TABLE `t_tabungan` (
  `kode_tabungan` int(11) NOT NULL,
  `kode_anggota` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `besar_tabungan` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `t_tabungan`
--

INSERT INTO `t_tabungan` (`kode_tabungan`, `kode_anggota`, `tgl_mulai`, `besar_tabungan`) VALUES
(58, 'A0002', '2022-05-27', 2115000),
(59, 'A0001', '2022-05-27', 100000),
(60, 'A0002', '2022-05-28', 2115000),
(61, 'A0003', '2022-05-28', 0),
(62, 'A0004', '2022-05-28', 0),
(63, 'A0005', '2022-05-28', 5000000),
(64, 'A0005', '2022-05-28', 5000000),
(65, 'A0006', '2022-05-28', 1000000),
(66, 'A0007', '2022-05-28', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_user`
--

CREATE TABLE `t_user` (
  `kode_user` char(5) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `tgl_entri` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` char(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_user`
--

INSERT INTO `t_user` (`kode_user`, `kode_anggota`, `username`, `password`, `nama`, `tgl_entri`, `foto`, `level`) VALUES
('U0004', 'A0001', 'Rijal', 'Rijal1', 'Rijal Alfauzi', '2020-12-09', 'tidak ada', 'admin'),
('U0009', 'A0004', 'anggoti', 'anggoti', 'Anggoti', '2022-05-29', 'tidak ada', 'anggota'),
('U0007', 'A0007', 'Anggota', 'anggota', 'Anggota', '2022-05-28', 'tidak ada', 'operator'),
('U0008', 'A0002', 'anggota', 'Anggota', 'Anggota', '2022-05-29', 'tidak ada', 'anggota');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_anggota`
--
ALTER TABLE `t_anggota`
  ADD PRIMARY KEY (`kode_anggota`);

--
-- Indeks untuk tabel `t_angsur`
--
ALTER TABLE `t_angsur`
  ADD PRIMARY KEY (`kode_angsur`);

--
-- Indeks untuk tabel `t_jenis_pinjam`
--
ALTER TABLE `t_jenis_pinjam`
  ADD PRIMARY KEY (`kode_jenis_pinjam`);

--
-- Indeks untuk tabel `t_jenis_simpan`
--
ALTER TABLE `t_jenis_simpan`
  ADD PRIMARY KEY (`kode_jenis_simpan`);

--
-- Indeks untuk tabel `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  ADD PRIMARY KEY (`kode_pengajuan`);

--
-- Indeks untuk tabel `t_pengambilan`
--
ALTER TABLE `t_pengambilan`
  ADD PRIMARY KEY (`kode_ambil`);

--
-- Indeks untuk tabel `t_petugas`
--
ALTER TABLE `t_petugas`
  ADD PRIMARY KEY (`kode_petugas`);

--
-- Indeks untuk tabel `t_pinjam`
--
ALTER TABLE `t_pinjam`
  ADD PRIMARY KEY (`kode_pinjam`);

--
-- Indeks untuk tabel `t_simpan`
--
ALTER TABLE `t_simpan`
  ADD PRIMARY KEY (`kode_simpan`);

--
-- Indeks untuk tabel `t_tabungan`
--
ALTER TABLE `t_tabungan`
  ADD PRIMARY KEY (`kode_tabungan`);

--
-- Indeks untuk tabel `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`kode_user`),
  ADD KEY `kode_petugas` (`kode_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_angsur`
--
ALTER TABLE `t_angsur`
  MODIFY `kode_angsur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT untuk tabel `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  MODIFY `kode_pengajuan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_pengambilan`
--
ALTER TABLE `t_pengambilan`
  MODIFY `kode_ambil` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `t_pinjam`
--
ALTER TABLE `t_pinjam`
  MODIFY `kode_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `t_simpan`
--
ALTER TABLE `t_simpan`
  MODIFY `kode_simpan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT untuk tabel `t_tabungan`
--
ALTER TABLE `t_tabungan`
  MODIFY `kode_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
