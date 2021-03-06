<?php defined('BASEPATH') OR exit('') ?>

<?= isset($range) && !empty($range) ? $range : ""; ?>
<div class="panel panel-primary">
    <!-- Default panel contents -->
    <div class="panel-heading">TRANSACTIONS</div>
    <?php if($allTransactions): ?>
    <div class="table table-responsive">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>SN</th>
                    <th>Receipt No</th>
                    <th>Total Items</th>
                    <th>Items</th>
                    <th>Image</th>
                    <th>Total Value</th>
                    <th>Discount </th>
                    <th>VAT</th>
                    <th>Total Paid(Rwf)</th>
                    <th>Mode of Payment</th>
                    <th>Staff</th>
                    <th>Customer</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($allTransactions as $get): ?>
                    <th><?= $sn ?>.</th>
                    <td><a class="pointer vtr" title="Click to view receipt"><?= $get->ref ?></a></td>
                    <td><?= $get->quantity ?></td>
                    <td>
                    <?php $item= explode(",",$get->itemName); 
                        for($i=0; $i < count($item);$i++ ) {
                            echo $item [$i]." ";   
                            echo "<br>" ;
                            echo "<br>" ;
                        }  
                    ?>
                    </td>
                    <td>
                    <?php $image= explode(",",$get->itemImage); 
                        for($i=0; $i < count($image);$i++ ) { ?>
                    <img class="thumbnail" style="height: 60px; width: 60px;" src="<?php echo base_url() ?>assets/images/<?php echo $image[$i]?>"> 
                    <?php } ?>
                    </td>
                    <td> <?= number_format($get->totalPrice, 2) ?></td>
                    <td> <?= number_format($get->discount, 2) ?></td>
                    <td> <?= number_format($get->vat, 2) ?></td>
                    <td> <?= number_format($get->totalMoneySpent, 2) ?></td>
                    <td><?=  str_replace("_", " ", $get->modeOfPayment)?></td>
                    <td><?=$get->staffName?></td>
                    <td><?=$get->cust_name?> - <?=$get->cust_phone?> - <?=$get->cust_email?></td>
                    <td><?= date('jS M, Y h:ia', strtotime($get->transDate)) ?></td>
                </tr>
                <?php $sn++; ?>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
<!-- table div end-->
    <?php else: ?>
        <ul><li>No Transactions</li></ul>
    <?php endif; ?>
    
    <!--Pagination div-->
    <div class="col-sm-12 text-center">
        <ul class="pagination">
            <?= isset($links) ? $links : "" ?>
        </ul>
    </div>
</div>
<!-- panel end-->