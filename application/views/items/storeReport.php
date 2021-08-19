<?php
defined('BASEPATH') OR exit('');

$total_value = 0;

/**
 * @fileName transReport
 * @author Ameer <amirsanni@gmail.com>
 * @date 06-Apr-2017
 */
?>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Store Report</title>
		
        <!-- Favicon -->
        <link rel="shortcut icon" href="<?=base_url()?>public/images/icon.ico">
        <!-- favicon ends --->
        
        <!--- LOAD FILES -->
        <?php if((stristr($_SERVER['HTTP_HOST'], "localhost") !== FALSE) || (stristr($_SERVER['HTTP_HOST'], "192.168.") !== FALSE)|| (stristr($_SERVER['HTTP_HOST'], "127.0.0.") !== FALSE)): ?>
        <link rel="stylesheet" href="<?=base_url()?>public/bootstrap/css/bootstrap.min.css">

        <?php else: ?>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <?php endif; ?>
        
        <!-- custom CSS -->
        <link rel="stylesheet" href="<?= base_url() ?>public/css/main.css">
    </head>

    <body>
        <div class="container margin-top-5">
            <div class="row">
                <div class="col-xs-12 text-right hidden-print">
                    <button class="btn btn-primary btn-sm" onclick="window.print()">Print Report</button>
                </div>
            </div>

            <div class="row margin-top-5">
                <div class="col-xs-12 table-responsive">
                    <div class="panel panel-primary">
                        <!-- Default panel contents -->
                        <div class="panel-heading text-center">
                             Store Report
                        </div>
                        <?php if($totalEarned): ?>
                        <div class="table table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                    <th>Current Stock Value</th>
                                    <th>Total Sales Value</th>
                                    <th>Total Discount</th>
                                    <th>Total VAT </th>
                                    <th>Total Sales Earned</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td> <span id="stockValue"><?=number_format($stockValue, 2)?></span></td>
                                        <td> <span id="transValue"><?=number_format($transValue, 2)?></span></td>
                                        <td> <span id="totalVat"><?=number_format($totalVat, 2)?></span></td>
                                        <td> <span id="totalDiscount"><?=number_format($totalDiscount, 2)?></span></td>
                                        <td> <span id="totalEarned"><?=number_format($totalEarned, 2)?></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- table div end--->
                        <?php else: ?>
                            <ul><li>Store Has No Data</li></ul>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            
            <div class="row" style="margin-bottom: 10px">
                <div class="col-xs-6">
                    <button class="btn btn-primary btn-sm hidden-print" onclick="window.print()">Print Report</button>
                </div>
            </div>
        </div>
        <!--- panel end-->
    </body>
</html>