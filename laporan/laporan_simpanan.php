<?php 
	include "config/koneksi.php";
	include "fungsi/fungsi.php";

	$aksi=$_GET['aksi'];
	$kategori = ($kategori=$_POST['kategori'])?$kategori : $_GET['kategori'];
	$cari = ($cari = $_POST['input_cari'])? $cari: $_GET['input_cari'];
?>

<?php
	// **STYLE FORM
?>
<script language="javascript" type="text/javascript" src="js/niceforms.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme1.css" />

<?php
	if(empty($aksi)){
?>
<body>
<div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                    <h4 class="mb"><span class='glyphicon glyphicon-briefcase'></span> Laporan Simpanan 
                    <?php
                        $am=mysql_query("select*from t_anggota");
                        $jum=mysql_num_rows($am);
						$level=$_SESSION['level'];
                    echo'<kbd style="background-color:#d9534f;">'.$jum.'</kbd>';
                    echo '<span style="float:right;">';	
      if($level=='anggota')
      {
		echo '';
      }
	  else {
		echo '<a href="laporan/print_simpanan.php" target="_blank" class="btn btn-primary"> Print</a>';
	  } ?>
				
                    </span></h4>
<form class="form-inline" role="form">
  <table class="table table-bordered table-striped table-condensed">
    <thead>
		<tr class="info">
			<th rowspan="2"><a href="#">No</a></th>
			<th rowspan="2" width="220"><a href="#">Nama</a></th>
			<th rowspan="2"><a href="#">Pokok</a></th>	
			<th rowspan="2"><a href="#">Wajib</a></th>	
			<th rowspan="2"><a href="#">Sukarela</a></th>	
			<th rowspan="2"><a href="#">Total Simpanan</a></th>	
			<th rowspan="2"><a href="#">Aksi</a></th>					
		</tr>
    </thead>
<?php
	if ($_SESSION['level']=='anggota') {
		$kode=$_SESSION['kopid'];
		$getkode = mysql_query("SELECT * FROM t_user where kode_user='$kode'");
		while($data=mysql_fetch_array($getkode)){
			$kodang=$data['kode_anggota'];
		$query = mysql_query("SELECT * from t_anggota WHERE kode_anggota = '$kodang'");
		}
	}else {
		$query = mysql_query("SELECT * from t_anggota");
	}
	echo '<tbody id="fbody">';
	$no=1;	
	while($data=mysql_fetch_array($query)){
		$kode_ang=$data['kode_anggota'];
?>

    	<tr>
			<td><?php echo $no?></td>
			<td style="text-align:left"><?php echo $data['nama_anggota'];?></td>
			<?php $d=mysql_fetch_array(mysql_query("SELECT SUM(besar_simpanan) as pokok from t_simpan where kode_anggota='$kode_ang' and jenis_simpan='pokok'")); ?>
			<td>Rp. <?php echo number_format($d['pokok']);?></td>
			<?php $e=mysql_fetch_array(mysql_query("SELECT SUM(besar_simpanan) as wajib from t_simpan where kode_anggota='$kode_ang' and jenis_simpan='wajib'")); ?>
			<td>Rp. <?php echo number_format($e['wajib']);?></td>
			<?php $f=mysql_fetch_array(mysql_query("SELECT SUM(besar_simpanan) as sukarela from t_simpan where kode_anggota='$kode_ang' and jenis_simpan='sukarela'")); ?>
			<td>Rp. <?php echo number_format($f['sukarela']);?></td>
			<?php $total=$d['pokok']+$e['wajib']+$f['sukarela']; ?>
			<td>Rp. <?php echo number_format($total);?></td>
			<td>
	<a class="btn btn-primary btn-xs" href=index.php?pilih=3.2&aksi=show&kode_anggota=<?php echo $data['kode_anggota'];?>><i class="glyphicon glyphicon-eye-open"></i> Detail</a></td>
        </tr>
<?php
	$no++;}
?>
</tbody>  
</table>
</div>
</div>
</div>
	
<?php
	}elseif($aksi=='show'){
	$kode=$_GET['kode_anggota'];
	$q=mysql_query("SELECT S.*, A.nama_anggota FROM t_simpan S, t_anggota A
					WHERE S.kode_anggota = A.kode_anggota AND S.kode_anggota = '$kode'");
	$ang=mysql_fetch_array($q);
?>

<div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                    <h4 class="mb"><span class='glyphicon glyphicon-briefcase'></span> Laporan Simpanan Anggota "<?php echo $ang['nama_anggota'];?>" 
                    <?php
                        $am=mysql_query("SELECT * FROM t_simpan where kode_anggota='$kode'");
                        $jum=mysql_num_rows($am);
                    echo'<kbd style="background-color:#d9534f;">'.$jum.'</kbd>';?>
                    <span style="float:right;">
<a href="laporan/print_show_simpanan.php?kode=<?php echo $ang['kode_anggota'];?>" target="_blank" class="btn btn-primary"><span class='glyphicon glyphicon-print'></span> Print</a> 
                    </span></h4>
<form class="form-inline" role="form">
  <table class="table table-bordered table-striped table-condensed">
    <thead>
		<tr class="info">
             <th rowspan="2"><a href="#">No</a></th>
             <th><a href="#">Tanggal Simpan</a></th>
             <th><a href="#">Nama Simpanan</a></th>
			 <th><a href="#">Besar Simpanan</a></th>
       	</tr>
    </thead>
    <tbody>
<?php
$query = mysql_query("SELECT * from t_simpan where kode_anggota='$kode'");
	echo '';	
	$no=1;
	while($data=mysql_fetch_array($query)){
?>
    	<tr>
			<td><?php echo $no;?></td>
			<td><?php echo Tgl($data['tgl_entri']);?></td>
			<td><?php echo $data['jenis_simpan'];?></td>
            <td>Rp. <?php echo Rp($data['besar_simpanan']);?></td>
        </tr> 
<?php
	$no++;}
?>
<tr  class="info"><td colspan="3" align="center">Total</td>
  <td>Rp. <?php $bu=mysql_fetch_array(mysql_query("SELECT sum(besar_simpanan) as besar_simpan from t_simpan where kode_anggota='$kode'")); echo number_format($bu['besar_simpan']);
  echo '</td>';?>
</tr>
</tbody>   
</table>
</div>
</div>
</div>
<?php
}
?>

</body>