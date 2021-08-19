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
        <title>Stock Report</title>
		
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
            
            <div class="row">
                <div class="col-xs-12 text-center">
                    <h4>New Stock Between <?=date('jS M, Y', strtotime($itemfrom))?> and <?=date('jS M, Y', strtotime($itemto))?></h4>
                </div>
            </div>
            
            <div class="row margin-top-5">
                <div class="col-xs-12 table-responsive">
                    <div class="panel panel-primary">
                        <!-- Default panel contents -->
                        <div class="panel-heading text-center">
                            New Stock Between <?=date('jS M, Y', strtotime($itemfrom))?> and <?=date('jS M, Y', strtotime($itemto))?>
                        </div>
                        <?php if($allItems): ?>
                        <div class="table table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Description</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total Value </th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($allItems as $get): ?>
                                    <tr>
                                        <td><?= $get->code ?></td>
                                        <td><?= $get->name ?></td>
                                        <td><img class="thumbnail" style="height: 60px; width: 60px;" src="<?php echo base_url() ?>assets/images/<?php echo $get->item_image ?>"></td>
                                        <td><?= $get->description ?></td>
                                        <td><?= $get->quantity ?></td>
                                        <td>Rwf <?= number_format($get->unitPrice, 2) ?></td>
                                        <td>Rwf <?= number_format($get->unitPrice*$get->quantity, 2) ?></td>
                                        <td><?= date('jS M, Y h:ia', strtotime($get->lastUpdated)) ?></td>
                                    </tr>
                                    <?php $total_value += $get->unitPrice*$get->quantity; ?>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- table div end--->
                        <?php else: ?>
                            <ul><li>No Items Found Within Specified Dates</li></ul>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            
            <div class="row" style="margin-bottom: 10px">
                <div class="col-xs-6">
                    <button class="btn btn-primary btn-sm hidden-print" onclick="window.print()">Print Report</button>
                </div>
                <div class="col-xs-6 text-right">
                    <h4>Stock Value: Rwf <?=number_format($total_value, 2)?></h4>
                </div>
            </div>
        </div>
        <!--- panel end-->
    </body>
</html>