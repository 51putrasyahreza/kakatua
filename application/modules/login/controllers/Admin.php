<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		//cek login
		if($this->session->userdata('status') != "login"){
			redirect(base_url().'welcome?pesan=belumlogin');
		}
	}

	function index(){
		$this->load->view('admin/header');
		$this->load->view('admin/index');
		$this->load->view('admin/footer');
	}

	function logout(){
		$this->session->sess_destroy();
		redirect(base_url().'welcome?pesan=logout');
	}

	function ganti_password(){
		$this->load->view('admin/header');
		$this->load->view('admin/ganti_password');
		$this->load->view('admin/footer');
	}

	function ganti_password_act(){
		$pass_baru = $this->input->post('pass_baru');
		$ulang_pass = $this->input->post('ulang_pass');				
		$this->form_validation->set_rules('pass_baru','Password Baru','required|matches[ulang_pass]');
		$this->form_validation->set_rules('ulang_pass','Ulangi Password Baru','required');

		if($this->form_validation->run() != false){
			$data = array(
				'password' => md5($pass_baru)
			);
			$w = array(
				'id' => $this->session->userdata('id')
			);			
			$this->m_spbu->update_data($w,$data,'admin_control');			
			redirect(base_url().'admin/ganti_password?pesan=berhasil');						
		}else{
			$this->load->view('admin/header');
			$this->load->view('admin/ganti_password');
			$this->load->view('admin/footer');
		}
	}

	//CRUD Master Karyawan
	function mst_karyawan(){
		$data['mst_karyawan'] = $this->m_spbu->get_data('mst_karyawan')->result();
		$this->load->view('admin/header');
		$this->load->view('admin/mst_karyawan',$data);
		$this->load->view('admin/footer');
	}

	function mst_karyawan_add(){
		$this->load->view('admin/header');
		$this->load->view('admin/mst_karyawan_add');
		$this->load->view('admin/footer');
	}

	function mst_karyawan_add_act(){
		$nama = $this->input->post('nama');
		$jenisKelamin = $this->input->post('jenisKelamin');
		$alamat = $this->input->post('alamat');
		$agama = $this->input->post('agama');
		$pendidikanTerakhir = $this->input->post('pendidikanTerakhir');
		$tanggalLahir = $this->input->post('tanggalLahir');
		$tanggalMulaiKerja = $this->input->post('tanggalMulaiKerja');
		$tanggalBerhentiKerja = $this->input->post('tanggalBerhentiKerja');
		$status = $this->input->post('status');

		$this->form_validation->set_rules('pendidikanTerakhir','Pendidikan Terakhir','required');
		$this->form_validation->set_validation->set_rules('tanggalMulaiKerja','Tanggal Mulai Kerja','required');

		if($this->form_validation->run() != false){
			$data = array(
				'nama' => $nama,
				'jenisKelamin' => $jenisKelamin,
				'alamat' => $alamat,
				'agama' => $agama,
				'pendidikanTerakhir' => $pendidikanTerakhir,
				'tanggalLahir' => $tanggalLahir,
				'tanggalMulaiKerja' => $tanggalMulaiKerja,
				'tanggalBerhentiKerja' => $tanggalBerhentiKerja,
				'status' => $status
			);
		}
	}

}

?>