<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Image extends CI_Controller {
 public function __construct()
 {
  parent::__construct();
  $this->load->model('Image_model');
 }
 public function index()
 {
  $this->load->view('image_upload');
 }
 // add image from form
 public function add_image()
 {
   // configurations from upload library
   $config['upload_path'] = './assets/images/';
   $config['overwrite'] = TRUE;
   $config['allowed_types'] = 'gif|jpg|png|jpeg';
   $config['max_size'] = '10240'; // max size in KB
   // load CI libarary called upload
   $this->load->library('upload', $config);
   // body of if clause will be executed when image uploading is failed
   if(!$this->upload->do_upload()){
    $errors = array('error' => $this->upload->display_errors());
    // This image is uploaded by deafult if the selected image in not uploaded
    $image = 'no_image.png';    
   }
   // body of else clause will be executed when image uploading is succeeded
   else{
    $data = array('upload_data' => $this->upload->data());
    $config['image_library'] = 'gd2';  
    $config['source_image'] = './assets/images/'.$_FILES['userfile']['name'];  
    $config['create_thumb'] = FALSE;  
    $config['maintain_ratio'] = FALSE;  
    $config['quality'] = '60%';  
    $config['width'] = 200;  
    $config['height'] = 200;  
    $config['new_image'] = './assets/images/'.$_FILES['userfile']['name'];  
    $this->load->library('image_lib', $config);  
    $this->image_lib->resize();
  
    $image = $_FILES['userfile']['name'];  //name must be userfile    
   }
   $this->Image_model->insert_image($image);
   redirect('Items');
  
 }

//  Edit image
 public function modify_image()
 {
  $this->genlib->ajaxOnly();
        
  $this->load->library('form_validation');

  $this->form_validation->set_error_delimiters('', '');
  
  $this->form_validation->set_rules('_iId', 'Item ID', ['required', 'trim', 'numeric']);
  $this->form_validation->set_rules('itemName', 'Item Name', ['required', 'trim', 
      'callback_crosscheckName['.$this->input->post('_iId', TRUE).']'], ['required'=>'required']);
  $this->form_validation->set_rules('itemCode', 'Item Code', ['required', 'trim', 
      'callback_crosscheckCode['.$this->input->post('_iId', TRUE).']'], ['required'=>'required']);
  $this->form_validation->set_rules('itemPrice', 'Item Unit Price', ['required', 'trim', 'numeric']);
  $this->form_validation->set_rules('itemDesc', 'Item Description', ['trim']);
  
  if($this->form_validation->run() !== FALSE){
   
   // configurations from upload library
   $config['upload_path'] = './assets/images/';
   $config['overwrite'] = TRUE;
   $config['allowed_types'] = 'gif|jpg|png|jpeg';
   $config['max_size'] = '10240'; // max size in KB
   // load CI libarary called upload
   $this->load->library('upload', $config);
   // body of if clause will be executed when image uploading is failed
   if(!$this->upload->do_upload()){
    $errors = array('error' => $this->upload->display_errors());
    // This image is uploaded by deafult if the selected image in not uploaded
    $image1 = 'no_image.png1';    
   }
   // body of else clause will be executed when image uploading is succeeded
   else{
    $data = array('upload_data' => $this->upload->data());
    $config['image_library'] = 'gd2';  
    $config['source_image'] = './assets/images/'.$_FILES['userfile']['name'];  
    $config['create_thumb'] = FALSE;  
    $config['maintain_ratio'] = FALSE;  
    $config['quality'] = '60%';  
    $config['width'] = 200;  
    $config['height'] = 200;  
    $config['new_image'] = './assets/images/'.$_FILES['userfile']['name'];  
    $this->load->library('image_lib', $config);  
    $this->image_lib->resize();
  
    $image1 = $_FILES['userfile']['name'];  //name must be userfile    
   }
   $itemId = set_value('_iId');
   $itemDesc = $_FILES['userfile']['name'];
   $itemPrice = set_value('itemPrice');
   $itemName = "test";
   $itemCode = $this->input->post('itemCode', TRUE);
   
   $this->Image_model->edit_image($itemId, $itemName, $itemDesc, $itemPrice,$image1);
   redirect('Items');
  }
 }
 // view images fetched from database
 public function view_images()
 {
  $data['images'] = $this->Image_model->get_images();
  $this->load->view('image_view', $data);
 }
}