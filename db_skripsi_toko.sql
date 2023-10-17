-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2023 pada 06.13
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skripsi_toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Tenda'),
(2, 'HandLamp'),
(3, 'Kompor'),
(6, 'Sleeping Bag');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(100) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'doddy@gmail.com', 'doddy', 'Doddy Setiawan', '08888123123', ''),
(2, 'erik@gmail.com', 'erik', 'Erik Candra', '0888111111', ''),
(3, 'yudi@contoh.com', '1234', 'Yudi Saputra', '0746356643', 'Jogja'),
(4, 'doni@contoh.com', '1234', 'Doni', '0761888888', 'Semarang'),
(5, 'erwin@contoh.com', '1234', 'Erwin', '088867553', 'Demak'),
(6, 'sal@sal', 'sal', 'sal', '082674365842', 'jl. h nawi no 7. jakarta, indonesia'),
(7, 'nang@nang', 'nang', 'nang', '087767768', 'jakarta'),
(8, 'lala@lala', 'lala', 'afeef', '525', 'afvawf'),
(9, 'aris@mail.com', 'aris', 'aris', '082274937534', 'jakarta city');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_book` date NOT NULL,
  `id_produk` int(11) NOT NULL,
  `alamat_book` text NOT NULL,
  `nama_paket` varchar(100) NOT NULL DEFAULT 'pending',
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_book`, `id_produk`, `alamat_book`, `nama_paket`, `tgl_pesan`) VALUES
(8, 6, '2023-10-05', 20, '', 'pending', '2023-10-17'),
(9, 6, '2023-11-03', 20, 'jl. h nawi no 7. jakarta, indonesia', 'pending', '2023-10-17'),
(10, 6, '2023-10-10', 20, 'jl. h nawi no 7. jakarta, indonesia', 'PAKET WEDDING 13', '2023-10-17'),
(11, 6, '2023-11-02', 25, 'jl. h nawi no 7. jakarta, indonesia', 'PAKET WEDDING 4', '2023-10-17'),
(12, 6, '2023-10-31', 25, 'jl. h nawi no 7. jakarta, indonesia', 'PAKET WEDDING 2', '2023-10-17'),
(13, 6, '2023-10-07', 19, 'jl. h nawi no 7. jakarta, indonesia', 'PAKET WEDDING 1', '2023-10-17'),
(14, 9, '2023-11-10', 19, 'jakarta city', 'Tenda Camping Compass Alloy 2-3P', '2023-10-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(19, 1, 'Tenda Camping Compass Alloy 2-3P', 600000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.35.jpeg', 'Tenda Ultralight dengan bobot sangat ringan dan harganya pun tidak berat, berat hanya 1,9 kg sangat cocok untuk anda yang mendambakan tenda Ultralight yang ringan dengan harga bersahabat, dengan frame yang sudah alloy. tenda ini mirip dengan tenda Great outdoor fly air, dengan type dan speksifikasi yang mirip tapi harganya lebih murah.\r\n\r\nSpeksifikasi :\r\nCap : 2-3 Person\r\nUkuran : 210x(140+50)x110Cm\r\nFlysheet: 210T polyester PU3000mm\r\nInner : mesh\r\nFloor : 210T polyester PU3000mm\r\nPole : D7.9mm x 2 pcs 7001 Alumunium\r\nPasak : 4mm x 18cm x 10 pcs steel\r\nPacking size : 40 x 16 x 16cm\r\n\r\nready stok warna biru aja seperti gambar', 3),
(20, 1, 'Tenda Camping Compass Fiber 4-5P', 630000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.36.jpeg', 'Ready Tenda Lwy Compass Fiber Kapasitas 4-5 Orang ,Double Layer, Alas Terpal, Frame Fiberglass ,Double Pintu Dan Frame / Tiang Tambahan Untuk Kanopi Teras \r\nCek Gambar. \r\n\r\n- Spek :\r\n- Warna: orange dan biru\r\n\r\n- Tenda Lwy Compass 4org (Muat 5org) Original.\r\n(Sesuai Digambar)\r\n- Size : 210 x 210 x 140cm \r\n- Material Outter : 100% Polyester PU3000mm\r\n- Inner Lapisan Jaring\r\n- Cloth : 190T Waterproof\r\n- Double Pintu\r\n- Pole : 7,9mm Fiberglass\r\n- Terdapat Frame / Tiang Tambahan (Untuk Kanopi Depan)\r\n- Weight : 4,1kgs\r\n- Packing Size : 60cm x 15cm x 15cm\r\n\r\n- Sangat Cocok Untuk Kegiatan Camping, Outdoor, Hiking , Holiday Dan Traveling\r\n(Keep Safety Your Trip)', 0),
(23, 1, 'Tenda Camping Cotrex M27 Fiber 4-5P', 850000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.40.jpeg', 'SPESIFIKASI PRODUCT\r\n\r\n190TPu 1500mm Polyester\r\nInner : Polyester Breathable\r\nFloor : 210TPu 3500mm Polyester\r\nPole : dia 8,5mm 2 pc\r\n+1 pc fibergalss\r\nAPPROXIMATE PACKED SIZE ; \r\n- Inner: 50+150+50*220*120 cm, fly \r\n- Outer: L250*W220*H120cm \r\n\r\nFEATURE :\r\n* Two person Operation\r\n* UV protected\r\n* Mould Resistant\r\n* Wont Rust\r\nKapasitas 4 Orang\r\nFull Layer, Waterproof\r\n\r\n\r\nBenefits Product : \"mempunyai durability yang tinggi di design tahan dalam 2 tahun penggunaan\" dibuat melalui sistem pabrikasi dengan teknologi modern.\r\nRegion Manufaktur : \" Made In Indonesia\"', 4),
(24, 1, 'Tenda Camping Bestway Monodome Pavillo 2-3P', 260000, 1900, 'WhatsApp Image 2022-07-18 at 13.18.40 (1).jpeg', 'Bestway Tenda Monodome Pavillo X2 Tent\r\n\r\nPerjalanan berkemah menjadi lebih mudah dan nyaman dengan Bestway Monodome X2 Tent.\r\n\r\nTenda ini memiliki perlindungan dasar PE tahan air yang membuat kelembaban di dalam tenda.  Tenda juga dilengkapi dengan saku dalam sehingga Anda akan memiliki tempat untuk menyimpan barang-barang pribadi Anda.\r\n\r\nBestway Monodome X2 mudah untuk setup dan pemasangannya. \r\n\r\nFitur - Kokoh, pintu jaring anti-serangga.\r\nBahan: 170T polyester PA300mm dilapisi.\r\nAlas/ Perlindungan tanah: 110G / M2 PE.\r\n\r\nMudah untuk pemasangan dan nyaman untuk dibawa.\r\nKualitas, Kenyamanan dan Keamanan Tinggi Bestway Product suduh lulus uji standard international untuk kenyamanan, kelayakan dan keamanan. Terbuat dari bahan berkualitas tinggi dan desain yang spesial. Memberikan Manfaat Lebih Bestway Product sudah terbukti sangat bermanfaat bagi banyak penggunanya, mulai dari kasur angin/ airbed, sleeping bag, sofa angin/ air sofabed, berbagai macam kolam, kacamata renang, arena bermain anak, tenda camping, perahu karet, dsb.', 4),
(25, 2, 'Headlamp Jaks 6', 40000, 500, 'WhatsApp Image 2022-07-18 at 13.18.47.jpeg', 'Lampu dengan 3 mode pencahayaan, Headlamp ini berbentuk mini dan dapat di ikatkan di kepala Anda, membantu penelusuran di tempat gelap, dan perjalanan di malam hari.\r\n\r\nFEATURES\r\n3 Modes Headlight\r\nTerdapat 3 mode pencahayaan lampu yang dapat Anda gunakan untuk menerangi perjalanan Anda dimalam hari atau di tempat gelap.\r\n\r\n45 Degree Rotate\r\nSenter kepala ini sangat fleksibel, dapat digerakkan sebanyak 45 derajat untuk keperluan menyinari area yang Anda inginkan tanpa harus memaksakan kepala Anda mengarah ke arah yang dituju.\r\n\r\nAdjustable Headstrap\r\nIkatan kepala dari Headlamp LED flashlight ini dapat diatur menyesuaikan dengan bentuk kepala Anda.\r\n\r\n18650 Batteries\r\nAnda dapat menggunakan 18650 batteries untuk penjelajahan yang lebih lama dengan headlamp ini, Anda bisa mengkombinasikan kapasitas baterai agar dapat digunakan dalam jangka waktu yang lama.\r\n\r\nPACKAGE CONTENTS\r\nBarang-barang yang anda dapat dalam kotak produk:\r\n\r\n1 x Headlamp Flashlight Headlight LED 3 Modes COB - KX-1804\r\n\r\nLED	Model of LED: 1*XPE +1*COB\r\nLuminious Flux	Lumens: 180lm (COB), 100lm (XPE)\r\nBattery Type	18650\r\nLength	8.5cm x 3.8cm x 4cm\r\nOthers	splashproof', 5),
(26, 2, 'awda', 342, 42, 'WhatsApp Image 2022-07-18 at 13.18.35.jpeg', '                              gvegefa                        ', 23),
(28, 2, 'KARYATI', 242, 242, 'WhatsApp Image 2022-07-18 at 13.18.43.jpeg', '                    afawfaw                ', 424),
(29, 3, 'Evi Sundari', 424, 1241, 'WhatsApp Image 2022-07-18 at 13.18.43 (1).jpeg', '                    afafawf                ', 424),
(30, 3, 'gsee', 42, 42, 'WhatsApp Image 2022-07-18 at 13.18.36.jpeg', '                    afaf                ', 424),
(31, 3, 'rgsrg', 4221, 424, 'WhatsApp Image 2022-07-18 at 13.18.40.jpeg', '                    efeaf                ', 44),
(32, 3, 'drhfh', 24, 242, 'WhatsApp Image 2022-07-18 at 13.18.40 (1).jpeg', '                    gsg                ', 243),
(33, 6, 'hdrhs', 342, 3424, 'WhatsApp Image 2022-07-18 at 13.18.43.jpeg', '                    rdb                ', 43),
(34, 6, 'hmhg', 24, 34, 'WhatsApp Image 2022-07-18 at 13.18.47.jpeg', '                    sgg                ', 42);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(18, 19, 'gg.png'),
(19, 20, 'gg.png'),
(20, 21, 'GoQua.png'),
(21, 22, 'nang.jpg'),
(22, 23, 'gg.png'),
(23, 24, 'gg.png'),
(24, 25, 'gg.png'),
(25, 26, 'gg.png'),
(26, 27, 'gg.png'),
(27, 28, 'gg.png'),
(28, 29, 'gg.png'),
(29, 30, 'gg.png'),
(30, 31, 'gg.png'),
(31, 32, 'gg.png'),
(32, 33, 'gg.png'),
(33, 34, 'gg.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
