<?php
defined('BASEPATH') OR exit('');

/**
 * Description of Reports
 *
 * @author Chris <ishimwechristian71@gmail.com>
 * @date 20th Rab. Awwal, 1437AH
 * @date 1st Jan, 2021
 */
class Reports extends CI_Controller{
    
    public function __construct(){
        parent::__construct();
        
        $this->genlib->checkLogin();
        
        $this->genlib->superOnly();
    }
    
    
    /*
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    ********************************************************************************************************************************
    */
    
    public function index(){
        $data['pageContent'] = $this->load->view('reports', '', TRUE);
        $data['pageTitle'] = "Reports";
        
        $this->load->view('main', $data);
    }
}