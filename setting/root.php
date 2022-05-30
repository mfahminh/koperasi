<?php
class root
{
	function __construct()
	{
		mysql_connect('localhost','root','');
		mysql_select_db('koperasi');
	}
	public function tambahpinjam($kode,$kode_jenis_pinjam,$nama_pinjaman,$lama_angsur,$maks_pinjam,$u_entry,$bunga,$c,$tgl_entri)
	{
		$verida=mysql_query("INSERT INTO t_jenis_pinjam VALUES('$kode_jenis_pinjam','$nama_pinjaman','$lama_angsur','$maks_pinjam','$c','$u_entry','$tgl_entri')");
		if($verida)
		{
			header("location:../index.php?pilih=4.2");
		}
	}
	public function ubahpinjam($kode,$kode_jenis_pinjam,$nama_pinjaman,$lama_angsur,$maks_pinjam,$u_entry,$bunga,$c,$tgl_entri)
	{
		$qubah=mysql_query("UPDATE t_jenis_pinjam SET nama_pinjaman='$nama_pinjaman',lama_angsuran='$lama_angsur',maks_pinjam='$maks_pinjam',bunga='$c',u_entry='$u_entry',tgl_entri='$tgl_entri' WHERE kode_jenis_pinjam='$kode_jenis_pinjam'");
			if($qubah){
				header("location:../index.php?pilih=4.2");
			}else{
				echo "Edit Data Gagal!!!";
			}
	}
	public function hapuspinjam($kode,$kode_jenis_pinjam,$nama_pinjaman,$lama_angsur,$maks_pinjam,$u_entry,$bunga,$c,$tgl_entri)
	{
		$qdelete=mysql_query("DELETE FROM t_jenis_pinjam WHERE kode_jenis_pinjam='$kode'");
			if($qdelete){
				header("location:../index.php?pilih=4.2");
			}else{
				echo "Hapus Data Gagal!!!!";
			}
	}
	public function tambahsimpan($kode_j,$kode_jenis_simpan,$nama_simpanan,$besar_simpanan,$u_entry,$tgl_entri)
	{
		$qtambah=mysql_query("INSERT INTO t_jenis_simpan values('$kode_jenis_simpan','$nama_simpanan','$besar_simpanan','$u_entry','$tgl_entri')");
		if($qtambah)
		{
			header("location:../index.php?pilih=4.1");
		}
	}
	public function ubahsimpan($kode_j,$kode_jenis_simpan,$nama_simpanan,$besar_simpanan,$u_entry,$tgl_entri)
	{
		$qubah=mysql_query("UPDATE t_jenis_simpan SET nama_simpanan='$nama_simpanan',besar_simpanan='$besar_simpanan',u_entry='$u_entry',tgl_entri='$tgl_entri' WHERE kode_jenis_simpan='$kode_jenis_simpan'");
			if($qubah){
				header("location:../index.php?pilih=4.1");
			}else{
				echo "Edit Data Gagal!!!";
			}
	}
	public function hapussimpan($kode_j,$kode_jenis_simpan,$nama_simpanan,$besar_simpanan,$u_entry,$tgl_entri)
	{
		$qdelete=mysql_query("DELETE FROM t_jenis_simpan WHERE kode_jenis_simpan='$kode_j'");
			if($qdelete){
				header("location:../index.php?pilih=4.1");
			}else{
				echo "Hapus Data Gagal!!!!";
			}
	}
	public function tambahuser($kode,$kode_user,$kode_anggota,$kode_petugas,$level,$username,$password,$tgl_entri,$nama)
	{
		$sql=mysql_query("UPDATE t_anggota SET addedUser='1' WHERE kode_anggota='$kode_anggota'");
		$qtambah=mysql_query("INSERT INTO t_user VALUES('$kode_user','$kode_anggota','$username','$password','$nama','$tgl_entri','tidak ada','$level')");
				if($qtambah & $sql)
				{
					header("location:../index.php?pilih=4.3");
				}
				else
				{
					echo 'gagal';
				}
	}
	public function ubahuser($kode,$kode_user,$kode_petugas,$level,$username,$password,$tgl_entri,$nama)
	{
		$qubah=mysql_query("UPDATE t_user SET username='$username',password='$password',nama='$nama',tgl_entri='$tgl_entri',level='$level' WHERE kode_user='$kode_user'");
			if($qubah){
				header("location:../index.php?pilih=4.3");
			}else{
				echo "Edit Data Gagal!!!";
			}
	}
	public function hapususer($kode,$kode_user,$kode_petugas,$level,$username,$password,$tgl_entri,$nama)
	{
		$qdelete=mysql_query("DELETE FROM t_user WHERE kode_user='$kode'");
			if($qdelete){
				header("location:../index.php?pilih=4.3");
			}else{
				echo "Hapus Data Gagal!!!!";
			}
	}

}

?>