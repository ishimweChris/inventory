<?php
defined('BASEPATH') OR exit('');

/**
 * Description of Home
 *
 * @author Chris <ishimwechristian71@gmail.com>
 * @date 20th Rab. Awwal, 1437AH
 * @date 1st Jan, 2021
 */
class Audit extends CI_Controller{
    
    public function __construct(){
        parent::__construct();
        
        $this->genlib->checkLogin();
        
        $this->genlib->superOnly();
    }
    
    
    public function index(){
        $data['pageContent'] = $this->load->view('audit', '', TRUE);
        $data['pageTitle'] = "Audit";
        
        $this->load->view('main', $data);
    }
}