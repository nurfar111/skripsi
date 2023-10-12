<h2>Data Pemesanan</h2>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama Pelanggan</th>
            <th>Tanggal Pemesanan</th>
            <th>Nama Paket</th>
            <th>Nomer Telepon</th>
            <th>aksi</th>
        </tr>
    </thead>
    <tbody>

        <?php $no=1; ?>
        <!-- menggabungkan (join) tabel pelanggan dengan tabel pelanggan -->
        <?php $ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan = pelanggan.id_pelanggan"); ?>
        <?php while($pecah = $ambil->fetch_assoc()): ?>
        <tr>
            <td><?= $no; ?></td>
            <td><?= $pecah["nama_pelanggan"]; ?></td>
            <td><?= date("d F Y", strtotime($pecah["tanggal_pembelian"])); ?></td>
            <td><?= $pecah["status_pembelian"]; ?></td>
            <td><?= $pecah["telepon_pelanggan"] ?></td>
            <td>
                <a href="index.php?halaman=detail&id=<?= $pecah["id_pembelian"]; ?>"
                    class="btn btn-primary btn-xs">detail</a>
            </td>
        </tr>
        <?php $no++; ?>
        <?php endwhile; ?>

    </tbody>
</table>