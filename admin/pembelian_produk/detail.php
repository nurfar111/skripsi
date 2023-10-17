<h2>Detail Pemesanan</h2>

<?php
$ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan = pelanggan.id_pelanggan WHERE pembelian.id_pembelian = '$_GET[id]'");
$detail = $ambil->fetch_assoc();

?>

<?php ?></pre>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Tanggal Order</th>
            <th>Tanggal Acara(booking)</th>
            <th>Tipe Paket</th>
            <th>Nama Pemesan</th>
            <th>Nomor Telepon</th>
            <th>Email</th>
            <th>Alamat</th>
        </tr>
    </thead>
    <tbody>


        <tr>
            <td>
                <?= $detail["tgl_pesan"]; ?><br>
            </td>
            <td>
                <?= $detail["tanggal_book"]; ?><br>
            </td>
            <td>
                <?= $detail["nama_paket"]; ?><br>
            </td>
            <td>
                <?= $detail["nama_pelanggan"]; ?><br>
            </td>
            <td>
                <?= $detail["telepon_pelanggan"]; ?><br>
            </td>
            <td>
                <?= $detail["email_pelanggan"]; ?><br>
            </td>
            <td>
                <?= $detail["alamat_pelanggan"]; ?><br>
            </td>

        </tr>

    </tbody>
</table>