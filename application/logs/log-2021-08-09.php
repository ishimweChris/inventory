<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-08-09 07:48:44 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 44
ERROR - 2021-08-09 07:48:44 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 44
ERROR - 2021-08-09 07:48:44 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 44
ERROR - 2021-08-09 08:03:43 --> Query error: Invalid use of group function - Invalid query: SELECT GROUP_CONCAT(DISTINCT transId) AS transId, `transactions`.`itemCode`, GROUP_CONCAT(DISTINCT totalPrice) AS totalPrice, `transactions`.`ref`, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName", GROUP_CONCAT(DISTINCT transactions.totalMoneySpent) AS totalMoneySpent, GROUP_CONCAT(DISTINCT transactions.modeOfPayment) AS modeOfPayment, GROUP_CONCAT(DISTINCT transactions.staffId) AS staffId, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as "itemImage", GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINCT transactions.lastUpdated) AS lastUpdated, GROUP_CONCAT(DISTINCT SUM(transactions.totalPrice)) AS totalPrice, GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled, GROUP_CONCAT(DISTINCT transactions.changeDue) AS changeDue, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT admin.first_name), GROUP_CONCAT(DISTINCT admin.last_name)) as "staffName", GROUP_CONCAT(DISTINCT transactions.cust_name) AS cust_name, GROUP_CONCAT(DISTINCT transactions.cust_phone) AS cust_phone, GROUP_CONCAT(DISTINCT transactions.cust_email) AS cust_email, SUM(`transactions`.`quantity`) AS `quantity`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
GROUP BY `ref`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-08-09 08:12:12 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINC' at line 1 - Invalid query: SELECT GROUP_CONCAT(DISTINCT transId) AS transId, `transactions`.`itemCode`, GROUP_CONCAT(DISTINCT totalPrice) AS totalPrice, `transactions`.`ref`, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName", GROUP_CONCAT(DISTINCT transactions.totalMoneySpent) AS totalMoneySpent, GROUP_CONCAT(DISTINCT transactions.modeOfPayment) AS modeOfPayment, GROUP_CONCAT(DISTINCT transactions.staffId) AS staffId, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as "itemImage", transactions.discount_amount as discount  GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINCT transactions.lastUpdated) AS lastUpdated, SUM(transactions.totalPrice) AS totalPrice, GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled, GROUP_CONCAT(DISTINCT transactions.changeDue) AS changeDue, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT admin.first_name), GROUP_CONCAT(DISTINCT admin.last_name)) as "staffName", GROUP_CONCAT(DISTINCT transactions.cust_name) AS cust_name, GROUP_CONCAT(DISTINCT transactions.cust_phone) AS cust_phone, GROUP_CONCAT(DISTINCT transactions.cust_email) AS cust_email, SUM(`transactions`.`quantity`) AS `quantity`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
GROUP BY `ref`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-08-09 08:17:08 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINC' at line 1 - Invalid query: SELECT GROUP_CONCAT(DISTINCT transId) AS transId, `transactions`.`itemCode`, GROUP_CONCAT(DISTINCT totalPrice) AS totalPrice, `transactions`.`ref`, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName", GROUP_CONCAT(DISTINCT transactions.totalMoneySpent) AS totalMoneySpent, GROUP_CONCAT(DISTINCT transactions.modeOfPayment) AS modeOfPayment, GROUP_CONCAT(DISTINCT transactions.staffId) AS staffId, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as "itemImage", transactions.discount_amount  GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINCT transactions.lastUpdated) AS lastUpdated, SUM(transactions.totalPrice) AS totalPrice, GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled, GROUP_CONCAT(DISTINCT transactions.changeDue) AS changeDue, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT admin.first_name), GROUP_CONCAT(DISTINCT admin.last_name)) as "staffName", GROUP_CONCAT(DISTINCT transactions.cust_name) AS cust_name, GROUP_CONCAT(DISTINCT transactions.cust_phone) AS cust_phone, GROUP_CONCAT(DISTINCT transactions.cust_email) AS cust_email, SUM(`transactions`.`quantity`) AS `quantity`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
GROUP BY `ref`
ORDER BY `transId` DESC
 LIMIT 10
