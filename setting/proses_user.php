<?php
	include "../config/koneksi.php";
	require ('root.php');
	$lib = new root();
	$pros=$_GET['pros'];
	$kode=$_GET['kode_user'];
	$kode_user=$_POST['kode_user'];
	$kode_anggota=$_POST['kode_anggota'];
	$kode_petugas=$_POST['kode_petugas'];
	$level=$_POST['level'];	
	$username=$_POST['username'];
	$password=$_POST['password'];
	$tgl_entri=$_POST['tgl_entri'];
	$nama=$_POST['nama'];
//$kode,$kode_user,$kode_petugas,$level,$username,$password,$tgl_entri,$nama
	switch ($pros)
	{
		case "tambah" :
			$lib->tambahuser($kode,$kode_user,$kode_anggota,$kode_petugas,$level,$username,$password,$tgl_entri,$nama);
		break;
		
		case "ubah" :
			$lib->ubahuser($kode,$kode_user,$kode_petugas,$level,$username,$password,$tgl_entri,$nama);
		break;
		
		case "hapus" :
			$lib->hapususer($kode,$kode_user,$kode_petugas,$level,$username,$password,$tgl_entri,$nama);
		break;
		
		default : break; 
	}
	
?>