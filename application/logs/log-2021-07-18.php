<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-07-18 17:29:36 --> 404 Page Not Found: Public/images
ERROR - 2021-07-18 18:04:37 --> Query error: Unknown column 'items.item_name' in 'field list' - Invalid query: SELECT GROUP_CONCAT(DISTINCT item_code) AS itemCode, GROUP_CONCAT(DISTINCT qty_damaged) AS qtyDamaged, CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_image)) as "itemImage", CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.item_name)) as "itemName", CONCAT_WS(" ", GROUP_CONCAT(DISTINCT items.quantity)) as "qtyRemaining"
FROM `damages`
LEFT JOIN `items` ON `damages`.`item_code` = `items`.`code`
ERROR - 2021-07-18 18:05:21 --> Severity: error --> Exception: syntax error, unexpected '(' E:\xamp\htdocs\mini-inventory2\application\models\Item.php 334
ERROR - 2021-07-18 18:39:07 --> Query error: Unknown column 'damages.qty_damaged*items.unitPrice' in 'field list' - Invalid query: SELECT `damages`.`item_code`, `damages`.`qty_damaged`, `damages`.`qty_damaged*items`.`unitPrice` AS `damagesValue`, `items`.`item_image`, `items`.`name`, `items`.`quantity`
FROM `damages`
LEFT JOIN `items` ON `damages`.`item_code` = `items`.`id`
