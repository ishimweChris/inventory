<?php

defined('BASEPATH') OR exit('');

/**
 * Description of Transaction
 *
 * @author Chris <ishimwechristian71@gmail.com>
 * @date 27th RabAwwal, 1437A.H (8th Jan., 2021)
 */
class Transaction extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    /**
     * Get all transactions
     * @param type $orderBy
     * @param type $orderFormat
     * @param type $start
     * @param type $limit
     * @return boolean
     */
    public function getAll($orderBy, $orderFormat, $start, $limit) {
        if ($this->db->platform() == "sqlite3") {
            $q = "SELECT transactions.ref, transactions.totalMoneySpent,transactions.itemName, items.item_image,transactions.modeOfPayment, transactions.staffId,
                transactions.transDate, transactions.lastUpdated, transactions.amountTendered, transactions.changeDue,
                admin.first_name || ' ' || admin.last_name AS 'staffName', SUM(transactions.quantity) AS 'quantity',
                transactions.cust_name, transactions.cust_phone, transactions.cust_email, transactions.cancelled
                FROM transactions
                LEFT OUTER JOIN admin ON transactions.staffId = admin.id
                GROUP BY ref
                ORDER BY {$orderBy} {$orderFormat}
                LIMIT {$limit} OFFSET {$start}";

            $run_q = $this->db->query($q);
        }
        else {
            $this->db->select('GROUP_CONCAT(DISTINCT transId) AS transId,transactions.itemCode, GROUP_CONCAT(DISTINCT totalPrice) AS totalPrice, 
            transactions.ref,CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName", 
            GROUP_CONCAT(DISTINCT transactions.totalMoneySpent) AS totalMoneySpent, 
                GROUP_CONCAT(DISTINCT transactions.modeOfPayment) AS modeOfPayment, GROUP_CONCAT(DISTINCT transactions.staffId) AS staffId,
                 CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as "itemImage",transactions.discount_amount as discount,transactions.vatAmount as vat,
                  GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, 
                GROUP_CONCAT(DISTINCT transactions.lastUpdated) AS lastUpdated, SUM(transactions.totalPrice) AS totalPrice, GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled,
                GROUP_CONCAT(DISTINCT transactions.changeDue) AS changeDue, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT admin.first_name), GROUP_CONCAT(DISTINCT admin.last_name)) as "staffName",
                GROUP_CONCAT(DISTINCT transactions.cust_name) AS cust_name, GROUP_CONCAT(DISTINCT transactions.cust_phone) AS cust_phone, GROUP_CONCAT(DISTINCT transactions.cust_email) AS cust_email');
            
            $this->db->select_sum('transactions.quantity');
            
            $this->db->join('admin', 'transactions.staffId = admin.id', 'LEFT');
            $this->db->join('items', 'transactions.itemCode = items.code', 'LEFT');
            $this->db->limit($limit, $start);
            $this->db->group_by('ref');
            $this->db->order_by($orderBy, $orderFormat);

            $run_q = $this->db->get('transactions');
        }

        if ($run_q->num_rows() > 0) {
            return $run_q->result();
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    /**
     * 
     * @param type $_iN item Name
     * @param type $_iC item Code
     * @param type $desc Desc
     * @param type $q quantity bought
     * @param type $_up unit price
     * @param type $_tp total price
     * @param type $_tas total amount spent
     * @param type $_at amount tendered
     * @param type $_cd change due
     * @param type $_mop mode of payment
     * @param type $_tt transaction type whether (sale{1} or return{2})
     * @param type $ref
     * @param float $_va VAT Amount
     * @param float $_vp VAT Percentage
     * @param float $da Discount Amount
     * @param float $dp Discount Percentage
     * @param {string} $cn Customer Name
     * @param {string} $cp Customer Phone
     * @param {string} $ce Customer Email
     * @return boolean
     */
    public function add($_iN, $_iC, $desc, $q, $_up, $_tp, $_tas, $_at, $_cd, $_mop, $_tt, $ref, $_va, $_vp, $da, $dp, $cn, $cp, $ce) {
        $data = ['itemName' => $_iN, 'itemCode' => $_iC, 'description' => $desc, 'quantity' => $q, 'unitPrice' => $_up, 'totalPrice' => $_tp,
            'amountTendered' => $_at, 'changeDue' => $_cd, 'modeOfPayment' => $_mop, 'transType' => $_tt,
            'staffId' => $this->session->admin_id, 'totalMoneySpent' => $_tas, 'ref' => $ref, 'vatAmount' => $_va,
            'vatPercentage' => $_vp, 'discount_amount'=>$da, 'discount_percentage'=>$dp, 'cust_name'=>$cn, 'cust_phone'=>$cp,
            'cust_email'=>$ce];

        //set the datetime based on the db driver in use
        $this->db->platform() == "sqlite3" ?
            $this->db->set('transDate', "datetime('now')", FALSE) :
            $this->db->set('transDate', "NOW()", FALSE);

        $this->db->insert('transactions', $data);

        if ($this->db->affected_rows()) {
            return $this->db->insert_id();
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    /**
     * Primarily used to check whether a particular transaction reference exists in db
     * @param type $ref
     * @return boolean
     */
    public function isRefExist($ref) {
        $q = "SELECT DISTINCT ref FROM transactions WHERE ref = ?";

        $run_q = $this->db->query($q, [$ref]);

        if ($run_q->num_rows() > 0) {
            return TRUE;
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    public function transSearch($value) {
        $this->db->select('transactions.ref, transactions.itemCode,transactions.itemName, 
        GROUP_CONCAT(DISTINCT items.item_image) AS itemImage,transactions.totalMoneySpent,transactions.itemCode, 
        transactions.modeOfPayment, transactions.staffId,transactions.discount_amount as discount,
        transactions.vatAmount as vat,
                transactions.transDate, transactions.lastUpdated,
                 transactions.amountTendered, transactions.changeDue,SUM(transactions.totalPrice) AS totalPrice,
                CONCAT_WS(" ", admin.first_name, admin.last_name) as "staffName",
                GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled,
                transactions.cust_name, transactions.cust_phone, transactions.cust_email');
        $this->db->select_sum('transactions.quantity');
        $this->db->join('admin', 'transactions.staffId = admin.id', 'LEFT');
        $this->db->join('items', 'transactions.itemCode = items.code', 'LEFT');
        $this->db->like('ref', $value);
        $this->db->or_like('itemName', $value);
        $this->db->or_like('itemCode', $value);
        $this->db->group_by('ref');

        $run_q = $this->db->get('transactions');

        if ($run_q->num_rows() > 0) {
            return $run_q->result();
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    /**
     * Get all transactions with a particular ref
     * @param type $ref
     * @return boolean
     */
    public function gettransinfo($ref) {
        $q = "SELECT * FROM transactions WHERE ref = ?";

        $run_q = $this->db->query($q, [$ref]);

        if ($run_q->num_rows() > 0) {
            return $run_q->result_array();
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    /**
     * selects the total number of transactions done so far
     * @return boolean
     */
    public function totalTransactions() {
        $q = "SELECT count(DISTINCT REF) as 'totalTrans' FROM transactions";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalTrans;
            }
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    /**
     * Calculates the total amount earned today
     * @return boolean
     */
    public function totalEarnedToday() {
        $q = "SELECT GROUP_CONCAT(DISTINCT totalMoneySpent) AS totalMoneySpent FROM transactions WHERE DATE(transDate) = CURRENT_DATE GROUP BY ref";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows()) {
            $totalEarnedToday = 0;

            foreach ($run_q->result() as $get) {
                $totalEarnedToday += $get->totalMoneySpent;
            }

            return $totalEarnedToday;
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */

    //Not in use yet
    public function totalEarnedOnDay($date) {
        $q = "SELECT SUM(totalPrice) as 'totalEarnedToday' FROM transactions WHERE DATE(transDate) = {$date}";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalEarnedToday;
            }
        }
        else {
            return FALSE;
        }
    }

    public function totalEarned() {
        $q = "SELECT SUM(totalMoneySpent) as 'totalEarned' FROM transactions ";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalEarned;
            }
        }
        else {
            return FALSE;
        }
    }
    public function totalVat() {
        $q = "SELECT SUM(vatAmount) as 'totalVat' FROM transactions ";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalVat;
            }
        }
        else {
            return FALSE;
        }
    }
    public function totalDiscount() {
        $q = "SELECT SUM(discount_amount) as 'totalDiscount' FROM transactions ";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalDiscount;
            }
        }
        else {
            return FALSE;
        }
    }
    public function totalTransValue() {
        $q = "SELECT SUM(totalPrice) as 'totalTransValue' FROM transactions ";

        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalTransValue;
            }
        }
        else {
            return FALSE;
        }
    }
    public function totalStockValue() {
        $q = "SELECT SUM(unitPrice*quantity) as totalStockValue FROM items ";
        $run_q = $this->db->query($q);

        if ($run_q->num_rows() > 0) {
            foreach ($run_q->result() as $get) {
                return $get->totalStockValue;
            }
        }
        else {
            return FALSE;
        }
    }

    /*
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     * *******************************************************************************************************************************
     */
    
    public function getDateRange($from_date, $to_date){
        if ($this->db->platform() == "sqlite3") {
            $q = "SELECT transactions.ref, transactions.itemName,transactions.totalMoneySpent,transactions.itemCode, transactions.modeOfPayment, transactions.staffId,
                transactions.transDate, transactions.lastUpdated, transactions.amountTendered, transactions.changeDue,
                admin.first_name || ' ' || admin.last_name AS 'staffName', SUM(transactions.quantity) AS 'quantity',
                transactions.cust_name, transactions.cust_phone, transactions.cust_email
                FROM transactions
                LEFT OUTER JOIN admin ON transactions.staffId = admin.id
                WHERE 
                date(transactions.transDate) >= {$from_date} AND date(transactions.transDate) <= {$to_date}
                GROUP BY ref
                ORDER BY transactions.transId DESC";

            $run_q = $this->db->query($q);
        }
        
        else {
            $this->db->select('transactions.ref,CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName",transactions.itemCode,
            GROUP_CONCAT(DISTINCT items.item_image) AS itemImage,
            transactions.totalMoneySpent, transactions.modeOfPayment, transactions.staffId,
                    transactions.transDate, transactions.lastUpdated,transactions.discount_amount as discount,
                    transactions.vatAmount as vat, transactions.amountTendered, transactions.changeDue, 
                    SUM(transactions.totalPrice) AS totalPrice,
                    CONCAT_WS(" ", admin.first_name, admin.last_name) AS "staffName",
                    transactions.cust_name, transactions.cust_phone, transactions.cust_email');

            $this->db->select_sum('transactions.quantity');

            $this->db->join('admin', 'transactions.staffId = admin.id', 'LEFT');
            $this->db->join('items', 'transactions.itemCode = items.code', 'LEFT');
            $this->db->where("DATE(transactions.transDate) >= ", $from_date);
            $this->db->where("DATE(transactions.transDate) <= ", $to_date);

            $this->db->order_by('transactions.transId', 'DESC');

            $this->db->group_by('ref');

            $run_q = $this->db->get('transactions');
        }
        
        return $run_q->num_rows() ? $run_q->result() : FALSE;
    }

    public function getDateRangeItems($from_date, $to_date){
        if ($this->db->platform() == "sqlite3") {
            $q = "SELECT *
                FROM items
                
                WHERE 
                date(items.lastUpdated) >= {$from_date} AND date(transactions.transDate) <= {$to_date}";

            $run_q = $this->db->query($q);
        }
        
        else {
            $this->db->select('items.code,items.name,items.item_image,items.description,
            items.quantity,items.unitPrice,items.lastUpdated');
            $this->db->where("DATE(items.lastUpdated) >= ", $from_date);
            $this->db->where("DATE(items.lastUpdated) <= ", $to_date);

            $run_q = $this->db->get('items');
        }
        
        return $run_q->num_rows() ? $run_q->result() : FALSE;
    }

      // **************************************************** 
      public function getAllItems(){
        
        $run_q = $this->db->get('items');
        
        if($run_q->num_rows() > 0){
            return $run_q->result();
        }
        
        else{
            return FALSE;
        }
    }
    
}


