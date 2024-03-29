<?php

// Koneksi ke database
include 'koneksi.php';
include 'navbar.php';
// Mendapatkan id_produk dari url
$id_produk = $_GET['idprod'];
$iduser = $_GET['iduser'];

// Query ambil data
$ambil = $koneksi->query("SELECT * FROM produk,pelanggan WHERE produk.id_produk='$id_produk' AND pelanggan.id_pelanggan='$iduser'");
$detail = $ambil->fetch_assoc();

// cek ada inputan
if(isset($_POST['booknow'])){
    // Get tanggal
    $tglbook = $_POST['tgl_booking'];
    // cek ke database
    $cektgl = $koneksi->query("SELECT * FROM pembelian WHERE tanggal_book='$tglbook' ");
    // cek ketersediaan tanggal
  $tgl_tersedia = $cektgl->num_rows;

    //   validasi
  if($tgl_tersedia == 1){
    echo "<div class='alert alert-danger'>Tanggal Book tidak tersedia</div>";
  }else{

    //    inisialisasi
    $tglpesan = date("Y-m-d");
    $tglbook = $_POST['tgl_booking'];
    $nama=$_POST['nama_pelanggan'];
    $nopel=$detail['telepon_pelanggan'];
    $alamat=$_POST['alamat_pelanggan'];
    $namprod=$detail['nama_produk'];
    // insert ke db
    $sqlll = $koneksi->query("INSERT INTO pembelian(id_pelanggan,id_produk,tanggal_book,alamat_book,nama_paket, tgl_pesan) VALUES('$iduser','$id_produk','$tglbook','$alamat','$namprod', '$tglpesan')");
    // cek query berhasil atau tidak
    if($sqlll){
        // kondisi sukses input data ke db langsung redirect ke wa
        echo '<script>window.location.replace("https://wa.me/6285811000675?text=Halo%20saya%20ingin%20pesan=||Nama='.$nama.'|No.%20HP='.$nopel.'|Alamat='.$alamat.'|Paket='.$namprod.'")</script>';
    }else{
        // kondisi gagal input ke database
        echo "<div class='alert alert-success'>Tanggal Tersedia</div>";
    }
  }
}

?>
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="index.php"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a>
            </li>
            <li class="active">Pemesanan</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->

<div class="single">

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-2 ">
                </div>
                <div class="col-md-12 ">
                    <!-- <div class="col-md-5 animated wow slideInUp"> -->

                    <!-- <img src="foto_produk/<?= $detail['foto_produk']; ?>" class="img-responsive"> -->
                    <!-- </div> -->
                    <div class="col-md-7  animated wow slideInUp">
                        <center>
                            <h2>FORM PEMESANAN</h2>
                        </center>
                        <form method="POST">
                            <div class="form-group">
                                <label for="nama_paket">Nama Paket</label>
                                <input type="text" class="form-control" id="nama_paket" required
                                    value="<?=$detail['nama_produk']?>" disabled>
                            </div>
                            <div class="form-group">
                                <label for="harga_paket">Harga Paket</label>
                                <input type="text" class="form-control" id="harga_paket" required
                                    value="<?=$detail['harga_produk']?>" disabled>
                            </div>
                            <div class="form-group">
                                <label for="Nama">Nama</label>
                                <input type="text" class="form-control" id="Nama" name="nama_pelanggan" required
                                    value="<?=$detail['nama_pelanggan']?>">
                            </div>
                            <div class="form-group">
                                <label for="alamat">Alamat</label>
                                <input type="text" class="form-control" id="alamat" name="alamat_pelanggan" required
                                    value="<?=$detail['alamat_pelanggan']?>">
                            </div>
                            <div class="form-group">
                                <label for="tgl_booking">Tangal Booking</label>
                                <input type="date" class="form-control" id="tgl_booking" name="tgl_booking" required>
                            </div>

                            <button type="submit" name="booknow" class="btn btn-primary">Pesan Sekarang</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php
	include 'footer.php';
    
	?>