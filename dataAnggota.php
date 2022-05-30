<?php
include "config/koneksi.php";
$show_kode_anggota = $_POST['show_kode_anggota'];

if($show_kode_anggota!=""){
	$sql = "SELECT * 
			FROM t_anggota WHERE kode_anggota='$show_kode_anggota'";
	$data = mysql_query($sql);
	if($d = mysql_fetch_object($data)){
		$arr = array("NAMA_ANGGOTA"=>$d->nama_anggota
    );
	}else{
		$arr = array("NAMA_ANGGOTA"=>"");
	}
	$arr = json_encode($arr);
	exit($arr);
}
?>
