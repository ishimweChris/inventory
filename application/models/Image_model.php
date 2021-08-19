<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Image_model extends CI_Model {
 public function insert_image($image)
 {
  // assign the data to an array
  $data = array('name'=> $this->input->post('itemName'),
   'quantity'=> $this->input->post('itemQuantity'), 
   'unitPrice'=>$this->input->post('itemPrice'), 
   'description'=>$this->input->post('itemDescription'),
   'item_image' => $image,
    'code'=>$this->input->post('itemCode')
 );
 
  //insert image to the database
  $this->db->insert('items', $data);
 }
  // Updated image
 public function edit_image($itemId, $itemName, $itemDesc, $itemPrice,$image1){
   $data = ['name'=>$itemName, 'unitPrice'=>$itemPrice,'item_image'=>$image1, 'description'=>$itemDesc];
   $this->db->where('id', $itemId);
   $this->db->update('items', $data);
   
   return TRUE;
}
 //get images from database
 public function get_images()
 {
  $this->db->select('*');
  $this->db->order_by('image_id');
  $query = $this->db->get('image_data');
  return $query->result();
 }
}