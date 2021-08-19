<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-07-15 11:33:48 --> 404 Page Not Found: Public/images
ERROR - 2021-07-15 11:34:32 --> 404 Page Not Found: Assets/images
ERROR - 2021-07-15 11:34:59 --> 404 Page Not Found: Assets/images
ERROR - 2021-07-15 11:51:19 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 36
ERROR - 2021-07-15 11:51:19 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 37
ERROR - 2021-07-15 11:51:19 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 38
ERROR - 2021-07-15 11:51:28 --> Severity: Warning --> count(): Parameter must be an array or an object that implements Countable E:\xamp\htdocs\mini-inventory2\application\controllers\Transactions.php 71
ERROR - 2021-07-15 11:51:29 --> Severity: Warning --> count(): Parameter must be an array or an object that implements Countable E:\xamp\htdocs\mini-inventory2\application\controllers\Transactions.php 71
ERROR - 2021-07-15 11:51:30 --> Severity: Warning --> count(): Parameter must be an array or an object that implements Countable E:\xamp\htdocs\mini-inventory2\application\controllers\Transactions.php 71
ERROR - 2021-07-15 11:51:30 --> Severity: Warning --> count(): Parameter must be an array or an object that implements Countable E:\xamp\htdocs\mini-inventory2\application\controllers\Transactions.php 71
ERROR - 2021-07-15 11:52:07 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 36
ERROR - 2021-07-15 11:52:07 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 37
ERROR - 2021-07-15 11:52:07 --> Severity: Notice --> A non well formed numeric value encountered E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 38
ERROR - 2021-07-15 12:10:04 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 12:10:08 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 12:10:09 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 12:10:09 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 12:16:46 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 12:19:23 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ERROR - 2021-07-15 12:20:07 --> Severity: error --> Exception: Too few arguments to function Transaction::getAll(), 0 passed in E:\xamp\htdocs\mini-inventory2\application\controllers\Transactions.php on line 70 and exactly 4 expected E:\xamp\htdocs\mini-inventory2\application\models\Transaction.php 33
ERROR - 2021-07-15 12:24:21 --> Query error: Column 'quantity' in field list is ambiguous - Invalid query: SELECT `transId`, `itemCode`, `totalPrice`, `ref`, `itemName`, `quantity`, `totalMoneySpent`, `modeOfPayment`, `staffId`, `items`.`item_image`, `transDate`, `lastUpdated`, `amountTendered`, `cancelled`, `changeDue`, `admin`.`first_name`, `admin`.`last_name`, `cust_name`, `cust_phone`, `cust_email`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 12:52:23 --> Severity: Notice --> Undefined property: stdClass::$itemName E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 34
ERROR - 2021-07-15 13:07:38 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '[itemImage], GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_C' at line 1 - Invalid query: SELECT GROUP_CONCAT(DISTINCT transId) AS transId, `transactions`.`itemCode`, GROUP_CONCAT(DISTINCT totalPrice) AS totalPrice, `transactions`.`ref`, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName", GROUP_CONCAT(DISTINCT transactions.totalMoneySpent) AS totalMoneySpent, GROUP_CONCAT(DISTINCT transactions.modeOfPayment) AS modeOfPayment, GROUP_CONCAT(DISTINCT transactions.staffId) AS staffId, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as [itemImage], GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINCT transactions.lastUpdated) AS lastUpdated, GROUP_CONCAT(DISTINCT transactions.amountTendered) AS amountTendered, GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled, GROUP_CONCAT(DISTINCT transactions.changeDue) AS changeDue, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT admin.first_name), GROUP_CONCAT(DISTINCT admin.last_name)) as "staffName", GROUP_CONCAT(DISTINCT transactions.cust_name) AS cust_name, GROUP_CONCAT(DISTINCT transactions.cust_phone) AS cust_phone, GROUP_CONCAT(DISTINCT transactions.cust_email) AS cust_email, SUM(`transactions`.`quantity`) AS `quantity`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
GROUP BY `ref`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 13:08:24 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(itemImage), GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_C' at line 1 - Invalid query: SELECT GROUP_CONCAT(DISTINCT transId) AS transId, `transactions`.`itemCode`, GROUP_CONCAT(DISTINCT totalPrice) AS totalPrice, `transactions`.`ref`, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT transactions.itemName)) as "itemName", GROUP_CONCAT(DISTINCT transactions.totalMoneySpent) AS totalMoneySpent, GROUP_CONCAT(DISTINCT transactions.modeOfPayment) AS modeOfPayment, GROUP_CONCAT(DISTINCT transactions.staffId) AS staffId, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as (itemImage), GROUP_CONCAT(DISTINCT transactions.transDate) AS transDate, GROUP_CONCAT(DISTINCT transactions.lastUpdated) AS lastUpdated, GROUP_CONCAT(DISTINCT transactions.amountTendered) AS amountTendered, GROUP_CONCAT(DISTINCT transactions.cancelled) AS cancelled, GROUP_CONCAT(DISTINCT transactions.changeDue) AS changeDue, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT admin.first_name), GROUP_CONCAT(DISTINCT admin.last_name)) as "staffName", GROUP_CONCAT(DISTINCT transactions.cust_name) AS cust_name, GROUP_CONCAT(DISTINCT transactions.cust_phone) AS cust_phone, GROUP_CONCAT(DISTINCT transactions.cust_email) AS cust_email, SUM(`transactions`.`quantity`) AS `quantity`
FROM `transactions`
LEFT JOIN `admin` ON `transactions`.`staffId` = `admin`.`id`
LEFT JOIN `items` ON `transactions`.`itemCode` = `items`.`code`
GROUP BY `ref`
ORDER BY `transId` DESC
 LIMIT 10
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 13:14:56 --> Severity: Warning --> Invalid argument supplied for foreach() E:\xamp\htdocs\mini-inventory2\application\views\transactions\transtable.php 35
ERROR - 2021-07-15 16:14:21 --> 404 Page Not Found: Assets/images
