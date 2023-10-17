<?php

// Koneksi ke database
include 'koneksi.php';
include 'navbar.php';
// Mendapatkan id_produk dari url
$id_produk = $_GET['id'];

// Query ambil data
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
$detail = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detail);
// echo "</pre>";

// Jika tombol beli di klik
if(isset($_POST['buynow'])){
    if(!isset($_SESSION['pelanggan']) OR empty($_SESSION['pelanggan'])){
        echo "<script>alert('Silahkan login');</script>";
        echo "<script>location='login.php';</script>";
        exit();
    }
    
  // Mendapatkan jumlah yang diinputkan
//   $jumlah = $_POST['id'];
//     $tgl = $_POST['tgl'];
    // $idpem = $_SESSION['pelanggan']['id_pelanggan'];
//     $nmprod = $_POST['nmprod'];
  // Masukkan ke keranjang belanja
// echo $idpem;
//   $_SESSION['keranjang'][$id_produk] = $jumlah;
// $koneksi->query("INSERT INTO pembelian(id_pelanggan,status_pembelian, tanggal_pembelian) VALUES('$idpem','$nmprod', '$tgl')");
// echo "<a href='https://wa.me/6285811000675?text=Nama%3A%0ANo.%20HP%3A%0AAlamat%3A%0APesanan%3A%0A' target='_blank'>
//     </a>";
// $headers =  getallheaders();
// foreach($headers as $key=>$val){
//   echo $key . ': ' . $val . '<br>';
// }

//   echo "<div class='alert alert-success'>Produk telah masuk ke keranjang</div>";
// header('Location: https://wa.me/6285811000675?text=Nama%3A%0ANo.%20HP%3A%0AAlamat%3A%0APesanan%3A%0A');
// echo "<script>window.location.replace('https://wa.me/6285811000675?text=Nama%3A%0ANo.%20HP%3A%0AAlamat%3A%0APesanan%3A%0A')</script>";
// header_remove();
// header("location:https://wa.me/6285811000675?text=Nama%3A%0ANo.%20HP%3A%0AAlamat%3A%0APesanan%3A%0A"); 
// ob_start();
//  header('https://wa.me/6285811000675?text=Nama%3A%0ANo.%20HP%3A%0AAlamat%3A%0APesanan%3A%0A'); exit;
//   echo "<meta http-equiv='refresh' content='1;url='https://wa.me/6285811000675?text=Nama%3A%0ANo.%20HP%3A%0AAlamat%3A%0APesanan%3A%0A'>";
}

?>
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="index.php"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a>
            </li>
            <li class="active">Detail Produk</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->

<div class="single">

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-2 products-left">
                </div>
                <div class="col-md-8 single-right">
                    <div class="col-md-5 single-right-left animated wow slideInUp">

                        <img src="foto_produk/<?= $detail['foto_produk']; ?>" class="img-responsive">
                    </div>
                    <div class="col-md-7 single-right-left animated wow slideInUp">
                        <h2><?= $detail['nama_produk']; ?></h2>
                        <h4>Rp. <?= number_format($detail['harga_produk']); ?>,-</h4>
                        <!-- <h5>Stok : <?= $detail['stok_produk']; ?></h5> -->
                        <!-- <form action="" method="post"> -->
                        <div class="form-group">
                            <div class="input-group">
                                <!-- <p>masukkan tanggal</p> -->
                                <!-- <input class="" type="date" name="tgl" id="tgl" required> -->
                            </div>
                            <input type="hidden" name="id" value="<?=$detail['id_produk'] ?>">
                            <input type="hidden" name="nmprod" value="<?=$detail['nama_produk'];?>">
                            <div class="input-group">
                                <!-- <input type="number" min="1" max="<?= $detail['stok_produk']; ?>"
                                        class="form-control" name="jumlah"> -->
                                <div class="input-group-btn">
                                    <button class="btn btn-primary ">
                                        <a clas="btn btn-primary"
                                            href="booking.php?idprod=<?=$detail['id_produk'] ?>&iduser=<?=$_SESSION['pelanggan']['id_pelanggan'];?>">Pesan</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- </form> -->
                        <div class="description">
                            <h5><i>Description</i></h5>
                            <p><?=$detail['deskripsi_produk'];?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="single-related-products">

        <div class="new-collections">
            <div class="container">
                <h3 class="animated wow zoomIn" data-wow-delay=".5s">Produk lainnya</h3>
                <?php
					$ambil = $koneksi->query("SELECT * FROM produk where id_kategori='$_GET[idk]'");
					while($perproduk = $ambil->fetch_assoc()):
					?>
                <div class="new-collections-grids">
                    <div class="col-md-4 new-collections-grid">

                        <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                            <a href="single.php" class="product-image"><img
                                    src="foto_produk/<?= $perproduk['foto_produk'];?>" alt=" "
                                    class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a
                                    href="single.php?id=<?=$perproduk['id_produk'];?>&idk=<?=$perproduk['id_kategori'];?>">Detail</a>
                            </div>

                            <h4><?= $perproduk['nama_produk']; ?></h4>
                            <div class="new-collections-grid1-left simpleCart_shelfItem">
                                <p><span class="item_price">Rp.
                                        <?= number_format($perproduk['harga_produk']); ?>,-</span><a class="item_add"
                                        href="beli.php?id=<?= $perproduk['id_produk']; ?>">Beli </a></p>
                            </div>
                        </div>

                    </div>

                </div>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
</div>
<!-- //single-related-products -->
<!-- footer -->
<?php
	include 'footer.php';
    
	?>