<?php $this->load->view("partial/header"); ?>

<?php
if (isset($error)) {
    echo "<div class='alert alert-dismissible alert-danger'>" . $error . "</div>";
}

if (!empty($warning)) {
    echo "<div class='alert alert-dismissible alert-warning'>" . $warning . "</div>";
}

if (isset($success)) {
    echo "<div class='alert alert-dismissible alert-success'>" . $success . "</div>";
}
?>

    <div id="register_wrapper">

        <!-- Top register controls -->

        <?php echo form_open($controller_name . "/change_mode", array('id' => 'mode_form', 'class' => 'form-horizontal panel panel-default')); ?>
        <div class="panel-body form-group">
            <ul>
                <li class="pull-left first_li">
                    <label class="control-label"><?php echo $this->lang->line('receivings_mode'); ?></label>
                </li>
                <li class="pull-left">
                    <?php echo form_dropdown('mode', $modes, $mode, array('onchange' => "$('#mode_form').submit();", 'class' => 'selectpicker show-menu-arrow', 'data-style' => 'btn-default btn-sm', 'data-width' => 'fit')); ?>
                </li>

                <?php
                if ($show_stock_locations) {
                    ?>
                    <li class="pull-left">
                        <label class="control-label"><?php echo $this->lang->line('receivings_stock_source'); ?></label>
                    </li>
                    <li class="pull-left">
                        <?php echo form_dropdown('stock_source', $stock_locations, $stock_source, array('onchange' => "$('#mode_form').submit();", 'class' => 'selectpicker show-menu-arrow', 'data-style' => 'btn-default btn-sm', 'data-width' => 'fit')); ?>
                    </li>

                    <?php
                    if ($mode == 'requisition') {
                        ?>
                        <li class="pull-left">
                            <label class="control-label"><?php echo $this->lang->line('receivings_stock_destination'); ?></label>
                        </li>
                        <li class="pull-left">
                            <?php echo form_dropdown('stock_destination', $stock_locations, $stock_destination, array('onchange' => "$('#mode_form').submit();", 'class' => 'selectpicker show-menu-arrow', 'data-style' => 'btn-default btn-sm', 'data-width' => 'fit')); ?>
                        </li>
                        <?php
                    }
                }
                ?>
            </ul>
        </div>
        <?php echo form_close(); ?>

        <?php echo form_open($controller_name . "/add", array('id' => 'add_item_form', 'class' => 'form-horizontal panel panel-default')); ?>
        <div class="panel-body form-group">
            <ul>
                <li class="pull-left first_li">
                    <label for="item" , class='control-label'>
                        <?php
                        if ($mode == 'receive' or $mode == 'requisition') {
                            ?>
                            <?php echo $this->lang->line('receivings_find_or_scan_item'); ?>
                            <?php
                        } else {
                            ?>
                            <?php echo $this->lang->line('receivings_find_or_scan_item_or_receipt'); ?>
                            <?php
                        }
                        ?>
                    </label>
                </li>
                <li class="pull-left">
                    <?php echo form_input(array('name' => 'item', 'id' => 'item', 'class' => 'form-control input-sm', 'size' => '50', 'tabindex' => '1')); ?>
                </li>
                <li class="pull-right">
                    <button id='new_item_button' class='btn btn-info btn-sm pull-right modal-dlg'
                            data-btn-submit='<?php echo $this->lang->line('common_submit') ?>'
                            data-btn-new='<?php echo $this->lang->line('common_new') ?>'
                            data-href='<?php echo site_url("items/view"); ?>'
                            title='<?php echo $this->lang->line('sales_new_item'); ?>'>
                        <span class="glyphicon glyphicon-tag">&nbsp</span><?php echo $this->lang->line('sales_new_item'); ?>
                    </button>
                </li>
            </ul>
        </div>
        <?php echo form_close(); ?>

        <!-- Receiving Items List -->

        <table class="sales_table_100" id="register">
            <thead>
            <tr>
                <th style="width:5%;"><?php echo $this->lang->line('common_delete'); ?></th>
                <th style="width:15%;"><?php echo $this->lang->line('sales_item_number'); ?></th>
                <th style="width:23%;"><?php echo $this->lang->line('receivings_item_name'); ?></th>
                <th style="width:10%;"><?php echo $this->lang->line('receivings_cost'); ?></th>
                <th style="width:8%;"><?php echo $this->lang->line('receivings_quantity'); ?></th>
                <th style="width:10%;"><?php echo $this->lang->line('receivings_ship_pack'); ?></th>
                <th style="width:14%;"><?php echo $this->lang->line('receivings_fee'); ?></th>
                <th style="width:10%;"><?php echo $this->lang->line('receivings_total'); ?></th>
                <th style="width:5%;"><?php echo $this->lang->line('receivings_update'); ?></th>
            </tr>
            </thead>

            <tbody id="cart_contents">
            <?php
            if (count($cart) == 0) {
                ?>
                <tr>
                    <td colspan='9'>
                        <div class='alert alert-dismissible alert-info'><?php echo $this->lang->line('sales_no_items_in_cart'); ?></div>
                    </td>
                </tr>
                <?php
            } else {
                foreach (array_reverse($cart, TRUE) as $line => $item) {
                    ?>
                    <?php echo form_open($controller_name . "/edit_item/$line", array('class' => 'form-horizontal', 'id' => 'cart_' . $line)); ?>
                    <tr>
                        <td><?php echo anchor($controller_name . "/delete_item/$line", '<span class="glyphicon glyphicon-trash"></span>'); ?></td>
                        <td><?php echo $item['item_number']; ?></td>
                        <td style="align:center;">
                            <?php echo $item['name'] . ' ' . implode(' ', array($item['attribute_values'], $item['attribute_dtvalues'])); ?>
                            <br/> <?php echo '[' . to_quantity_decimals($item['in_stock']) . ' in ' . $item['stock_name'] . ']'; ?>
                            <?php echo form_hidden('location', $item['item_location']); ?>
                        </td>

                        <?php
                        if ($items_module_allowed && $mode != 'requisition') {
                            ?>
                            <td><?php echo form_input(array('name' => 'price', 'class' => 'form-control input-sm', 'value' => to_currency_no_money($item['price']))); ?></td>
                            <?php
                        } else {
                            ?>
                            <td>
                                <?php echo $item['price']; ?>
                                <?php echo form_hidden('price', to_currency_no_money($item['price'])); ?>
                            </td>
                            <?php
                        }
                        ?>

                        <td><?php echo form_input(array('name' => 'quantity', 'class' => 'form-control input-sm', 'value' => to_quantity_decimals($item['quantity']))); ?></td>
                        <td><?php echo form_dropdown('receiving_quantity', $item['receiving_quantity_choices'], $item['receiving_quantity'], array('class' => 'form-control input-sm')); ?></td>

                        <?php
                        if ($items_module_allowed && $mode != 'requisition') {
                            ?>
                            <td>
                                <div class="input-group">
                                    <?php echo form_input(array('name' => 'discount', 'class' => 'form-control input-sm', 'value' => to_decimals($item['discount'], 0), 'onClick' => 'this.select();')); ?>
                                    <span class="input-group-btn">
										<?php echo form_checkbox(array('id' => 'discount_toggle', 'name' => 'discount_toggle', 'value' => 1, 'data-toggle' => "toggle", 'data-size' => 'small', 'data-onstyle' => 'success', 'data-on' => '<b>' . $this->config->item('currency_symbol') . '</b>', 'data-off' => '<b>%</b>', 'data-line' => $line, 'checked' => $item['discount_type'])); ?>
									</span>
                                </div>
                            </td>
                            <?php
                        } else {
                            ?>
                            <td><?php echo $item['discount']; ?></td>
                            <?php echo form_hidden('discount', $item['discount']); ?>
                            <?php
                        }
                        ?>
                        <td>
                            <?php echo to_currency(($item['discount_type'] == PERCENT) ? $item['price'] * $item['quantity'] * $item['receiving_quantity'] - $item['price'] * $item['quantity'] * $item['receiving_quantity'] * $item['discount'] / 100 : $item['price'] * $item['quantity'] * $item['receiving_quantity'] - $item['discount']); ?></td>
                        <td><a href="javascript:$('#<?php echo 'cart_' . $line ?>').submit();"
                               title=<?php echo $this->lang->line('receivings_update') ?>><span
                                        class="glyphicon glyphicon-refresh"></span></a></td>
                    </tr>
                    <tr>
                        <?php
                        if ($item['allow_alt_description'] == 1) {
                            ?>
                            <td style="color: #2F4F4F;"><?php echo $this->lang->line('sales_description_abbrv') . ':'; ?></td>
                            <?php
                        }
                        ?>
                        <td colspan='2' style="text-align: left;">
                            <?php
                            if ($item['allow_alt_description'] == 1) {
                                echo form_input(array('name' => 'description', 'class' => 'form-control input-sm', 'value' => $item['description']));
                            } else {
                                if ($item['description'] != '') {
                                    echo $item['description'];
                                    echo form_hidden('description', $item['description']);
                                } else {
                                    echo "<i>" . $this->lang->line('sales_no_description') . "</i>";
                                    echo form_hidden('description', '');
                                }
                            }
                            ?>
                        </td>
                        <td colspan='7'></td>
                    </tr>
                    <?php echo form_close(); ?>
                    <?php
                }
            }
            ?>
            </tbody>
        </table>
    </div>

    <!-- Overall Receiving -->

    <div id="overall_sale" class="panel panel-default">
        <div class="panel-body">
            <?php
            if (isset($consignmenter)) {
                ?>
                <table class="sales_table_100">
                    <tr>
                        <th style='width: 55%;'><?php echo $this->lang->line("receivings_consignmenter"); ?></th>
                        <th style="width: 45%; text-align: right;"><?php echo $consignmenter; ?></th>
                    </tr>
                    <?php
                    if (!empty($consignmenter_email)) {
                        ?>
                        <tr>
                            <th style='width: 55%;'><?php echo $this->lang->line("receivings_consignmenter_email"); ?></th>
                            <th style="width: 45%; text-align: right;"><?php echo $consignmenter_email; ?></th>
                        </tr>
                        <?php
                    }
                    ?>
                    <?php
                    if (!empty($consignmenter_address)) {
                        ?>
                        <tr>
                            <th style='width: 55%;'><?php echo $this->lang->line("receivings_consignmenter_address"); ?></th>
                            <th style="width: 45%; text-align: right;"><?php echo $consignmenter_address; ?></th>
                        </tr>
                        <?php
                    }
                    ?>
                    <?php
                    if (!empty($consignmenter_location)) {
                        ?>
                        <tr>
                            <th style='width: 55%;'><?php echo $this->lang->line("receivings_consignmenter_location"); ?></th>
                            <th style="width: 45%; text-align: right;"><?php echo $consignmenter_location; ?></th>
                        </tr>
                        <?php
                    }
                    ?>
                </table>

                <?php echo anchor(
                    $controller_name . "/remove_consignmenter",
                    '<span class="glyphicon glyphicon-remove">&nbsp</span>' . $this->lang->line('common_remove') . ' ' . $this->lang->line('consignmenters_consignmenter'),
                    array('class' => 'btn btn-danger btn-sm', 'id' => 'remove_consignmenter_button', 'title' => $this->lang->line('common_remove') . ' ' . $this->lang->line('consignmenters_consignmenter'))
                ); ?>
                <?php
            } else {
                ?>
                <?php echo form_open($controller_name . "/select_consignmenter", array('id' => 'select_consignmenter_form', 'class' => 'form-horizontal')); ?>
                <div class="form-group" id="select_customer">
                    <label id="consignmenter_label" for="consignmenter" class="control-label"
                           style="margin-bottom: 1em; margin-top: -1em;"><?php echo $this->lang->line('receivings_select_consignmenter'); ?></label>
                    <?php echo form_input(array('name' => 'consignmenter', 'id' => 'consignmenter', 'class' => 'form-control input-sm', 'value' => $this->lang->line('receivings_start_typing_consignmenter_name'))); ?>

                    <button id='new_consignmenter_button' class='btn btn-info btn-sm modal-dlg'
                            data-btn-submit='<?php echo $this->lang->line('common_submit') ?>'
                            data-href='<?php echo site_url("consignmenters/view"); ?>'
                            title='<?php echo $this->lang->line('receivings_new_consignmenter'); ?>'>
                        <span class="glyphicon glyphicon-user">&nbsp</span><?php echo $this->lang->line('receivings_new_consignmenter'); ?>
                    </button>

                </div>
                <?php echo form_close(); ?>
                <?php
            }
            ?>

            <table class="sales_table_100" id="sale_totals">
                <tr>
                    <?php
                    if ($mode != 'requisition') {
                        ?>
                        <th style="width: 55%;"><?php echo $this->lang->line('sales_total'); ?></th>
                        <th style="width: 45%; text-align: right;"><?php echo to_currency($total); ?></th>
                        <?php
                    } else {
                        ?>
                        <th style="width: 55%;"></th>
                        <th style="width: 45%; text-align: right;"></th>
                        <?php
                    }
                    ?>
                </tr>
            </table>

            <?php
            if (count($cart) > 0) {
                ?>
                <div id="finish_sale">
                    <?php
                    if ($mode == 'requisition') {
                        ?>
                        <?php echo form_open($controller_name . "/requisition_complete", array('id' => 'finish_receiving_form', 'class' => 'form-horizontal')); ?>
                        <div class="form-group form-group-sm">
                            <label id="comment_label"
                                   for="comment"><?php echo $this->lang->line('common_comments'); ?></label>
                            <?php echo form_textarea(array('name' => 'comment', 'id' => 'comment', 'class' => 'form-control input-sm', 'value' => $comment, 'rows' => '4')); ?>

                            <div class="btn btn-sm btn-danger pull-left" id='cancel_receiving_button'><span
                                        class="glyphicon glyphicon-remove">&nbsp</span><?php echo $this->lang->line('receivings_cancel_receiving'); ?>
                            </div>

                            <div class="btn btn-sm btn-success pull-right" id='finish_receiving_button'><span
                                        class="glyphicon glyphicon-ok">&nbsp</span><?php echo $this->lang->line('receivings_complete_receiving'); ?>
                            </div>
                        </div>
                        <?php echo form_close(); ?>
                        <?php
                    } else {
                        ?>
                        <?php echo form_open($controller_name . "/complete", array('id' => 'finish_receiving_form', 'class' => 'form-horizontal')); ?>
                        <div class="form-group form-group-sm">
                            <label id="comment_label"
                                   for="comment"><?php echo $this->lang->line('common_comments'); ?></label>
                            <?php echo form_textarea(array('name' => 'comment', 'id' => 'comment', 'class' => 'form-control input-sm', 'value' => $comment, 'rows' => '4')); ?>
                            <div id="payment_details">
                                <table class="sales_table_100">
                                    <tr>
                                        <td><?php echo $this->lang->line('receivings_print_after_sale'); ?></td>
                                        <td>
                                            <?php echo form_checkbox(array('name' => 'recv_print_after_sale', 'id' => 'recv_print_after_sale', 'class' => 'checkbox', 'value' => 1, 'checked' => $print_after_sale)); ?>
                                        </td>
                                    </tr>
                                    <?php
                                    if ($mode == "receive") {
                                        ?>
                                        <tr>
                                            <td><?php echo $this->lang->line('expiration_date'); ?></td>
                                            <td>
                                                <div class="form-group">
                                                    <div class="input-group date" id="expiration_date_time_picker"
                                                         data-date-format="dd/mm/yyyy">
                                                        <?php echo form_input(array('name' => 'expiration_date', 'class' => 'form-control', 'id' => 'expiration_date_time_picker_input', 'autocomplete' => 'off')); ?>
                                                        <span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('receivings_reference'); ?></td>
                                            <td>
                                                <?php echo form_input(array('name' => 'recv_reference', 'id' => 'recv_reference', 'class' => 'form-control input-sm', 'value' => $reference, 'size' => 5)); ?>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                    ?>
                                    <tr>
                                        <td><?php echo $this->lang->line('sales_payment'); ?></td>
                                        <td>
                                            <?php echo form_dropdown('payment_type', $payment_options, array(), array('id' => 'payment_types', 'class' => 'selectpicker show-menu-arrow', 'data-style' => 'btn-default btn-sm', 'data-width' => 'auto')); ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->lang->line('sales_amount_tendered'); ?></td>
                                        <td>
                                            <?php echo form_input(array('name' => 'amount_tendered', 'value' => '', 'class' => 'form-control input-sm', 'size' => '5')); ?>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class='btn btn-sm btn-danger pull-left' id='cancel_receiving_button'><span
                                        class="glyphicon glyphicon-remove">&nbsp</span><?php echo $this->lang->line('receivings_cancel_receiving') ?>
                            </div>

                            <div class='btn btn-sm btn-success pull-right' id='finish_receiving_button'><span
                                        class="glyphicon glyphicon-ok">&nbsp</span><?php echo $this->lang->line('receivings_complete_receiving') ?>
                            </div>
                        </div>
                        <?php echo form_close(); ?>
                        <?php
                    }
                    ?>
                </div>
                <?php
            }
            ?>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#item").autocomplete({
                source: '<?php echo site_url($controller_name . "/stock_item_search"); ?>',
                minChars: 0,
                delay: 10,
                autoFocus: false,
                select: function (a, ui) {
                    $(this).val(ui.item.value);
                    $("#add_item_form").submit();
                    return false;
                }
            });

            $('#item').focus();

            $('#item').keypress(function (e) {
                if (e.which == 13) {
                    $('#add_item_form').submit();
                    return false;
                }
            });

            $('#item').blur(function () {
                $(this).attr('value', "<?php echo $this->lang->line('sales_start_typing_item_name'); ?>");
            });

            $('#comment').keyup(function () {
                $.post('<?php echo site_url($controller_name . "/set_comment"); ?>', {
                    comment: $('#comment').val()
                });
            });

            $('#recv_reference').keyup(function () {
                $.post('<?php echo site_url($controller_name . "/set_reference"); ?>', {
                    recv_reference: $('#recv_reference').val()
                });
            });

            $("#recv_print_after_sale").change(function () {
                $.post('<?php echo site_url($controller_name . "/set_print_after_sale"); ?>', {
                    recv_print_after_sale: $(this).is(":checked")
                });
            });

            $('#item,#consignmenter').click(function () {
                $(this).attr('value', '');
            });

            $("#consignmenter").autocomplete({
                source: '<?php echo site_url("consignmenters/suggest"); ?>',
                minChars: 0,
                delay: 10,
                select: function (a, ui) {
                    $(this).val(ui.item.value);
                    $("#select_consignmenter_form").submit();
                }
            });

            dialog_support.init("a.modal-dlg, button.modal-dlg");

            $('#consignmenter').blur(function () {
                $(this).attr('value', "<?php echo $this->lang->line('receivings_start_typing_consignmenter_name'); ?>");
            });

            $("#finish_receiving_button").click(function () {
                $('#finish_receiving_form').submit();
            });

            $("#cancel_receiving_button").click(function () {
                if (confirm('<?php echo $this->lang->line("receivings_confirm_cancel_receiving"); ?>')) {
                    $('#finish_receiving_form').attr('action', '<?php echo site_url($controller_name . "/cancel_receiving"); ?>');
                    $('#finish_receiving_form').submit();
                }
            });

            $("#cart_contents input").keypress(function (event) {
                if (event.which == 13) {
                    $(this).parents("tr").prevAll("form:first").submit();
                }
            });

            table_support.handle_submit = function (resource, response, stay_open) {
                if (response.success) {
                    if (resource.match(/consignmenters$/)) {
                        $("#consignmenter").val(response.id);
                        $("#select_consignmenter_form").submit();
                    } else {
                        $("#item").val(response.id);
                        if (stay_open) {
                            $("#add_item_form").ajaxSubmit();
                        } else {
                            $("#add_item_form").submit();
                        }
                    }
                }
            }

            $('[name="price"],[name="quantity"],[name="receiving_quantity"],[name="discount"],[name="description"],[name="serialnumber"]').change(function () {
                $(this).parents("tr").prevAll("form:first").submit()
            });

            $('[name="discount_toggle"]').change(function () {
                var input = $("<input>").attr("type", "hidden").attr("name", "discount_type").val(($(this).prop('checked')) ? 1 : 0);
                $('#cart_' + $(this).attr('data-line')).append($(input));
                $('#cart_' + $(this).attr('data-line')).submit();
            });

            $.fn.datetimepicker.dates['<?php echo current_language_code(); ?>'] = {
                days: [
                    "<?php echo $this->lang->line("cal_sunday"); ?>",
                    "<?php echo $this->lang->line("cal_monday"); ?>",
                    "<?php echo $this->lang->line("cal_tuesday"); ?>",
                    "<?php echo $this->lang->line("cal_wednesday"); ?>",
                    "<?php echo $this->lang->line("cal_thursday"); ?>",
                    "<?php echo $this->lang->line("cal_friday"); ?>",
                    "<?php echo $this->lang->line("cal_saturday"); ?>",
                    "<?php echo $this->lang->line("cal_sunday"); ?>"
                ],
                daysShort: [
                    "<?php echo $this->lang->line("cal_sun"); ?>",
                    "<?php echo $this->lang->line("cal_mon"); ?>",
                    "<?php echo $this->lang->line("cal_tue"); ?>",
                    "<?php echo $this->lang->line("cal_wed"); ?>",
                    "<?php echo $this->lang->line("cal_thu"); ?>",
                    "<?php echo $this->lang->line("cal_fri"); ?>",
                    "<?php echo $this->lang->line("cal_sat"); ?>"
                ],
                daysMin: [
                    "<?php echo $this->lang->line("cal_su"); ?>",
                    "<?php echo $this->lang->line("cal_mo"); ?>",
                    "<?php echo $this->lang->line("cal_tu"); ?>",
                    "<?php echo $this->lang->line("cal_we"); ?>",
                    "<?php echo $this->lang->line("cal_th"); ?>",
                    "<?php echo $this->lang->line("cal_fr"); ?>",
                    "<?php echo $this->lang->line("cal_sa"); ?>"
                ],
                months: [
                    "<?php echo $this->lang->line("cal_january"); ?>",
                    "<?php echo $this->lang->line("cal_february"); ?>",
                    "<?php echo $this->lang->line("cal_march"); ?>",
                    "<?php echo $this->lang->line("cal_april"); ?>",
                    "<?php echo $this->lang->line("cal_may"); ?>",
                    "<?php echo $this->lang->line("cal_june"); ?>",
                    "<?php echo $this->lang->line("cal_july"); ?>",
                    "<?php echo $this->lang->line("cal_august"); ?>",
                    "<?php echo $this->lang->line("cal_september"); ?>",
                    "<?php echo $this->lang->line("cal_october"); ?>",
                    "<?php echo $this->lang->line("cal_november"); ?>",
                    "<?php echo $this->lang->line("cal_december"); ?>"
                ],
                monthsShort: [
                    "<?php echo $this->lang->line("cal_jan"); ?>",
                    "<?php echo $this->lang->line("cal_feb"); ?>",
                    "<?php echo $this->lang->line("cal_mar"); ?>",
                    "<?php echo $this->lang->line("cal_apr"); ?>",
                    "<?php echo $this->lang->line("cal_may"); ?>",
                    "<?php echo $this->lang->line("cal_jun"); ?>",
                    "<?php echo $this->lang->line("cal_jul"); ?>",
                    "<?php echo $this->lang->line("cal_aug"); ?>",
                    "<?php echo $this->lang->line("cal_sep"); ?>",
                    "<?php echo $this->lang->line("cal_oct"); ?>",
                    "<?php echo $this->lang->line("cal_nov"); ?>",
                    "<?php echo $this->lang->line("cal_dec"); ?>"
                ],
                today: "<?php echo $this->lang->line("datepicker_today"); ?>",
                <?php
                if (strpos($this->config->item('timeformat'), 'a') !== false) {
                ?>
                meridiem: ["am", "pm"],
                <?php
                } elseif (strpos($this->config->item('timeformat'), 'A') !== false) {
                ?>
                meridiem: ["AM", "PM"],
                <?php
                } else {
                ?>
                meridiem: [],
                <?php
                }
                ?>
                weekStart: <?php echo $this->lang->line("datepicker_weekstart"); ?>
            };

            $('#expiration_date_time_picker').datetimepicker({
                minView: 2,
                language: '<?php echo current_language_code(); ?>',
                pickerPosition: "top-left",
            });
            var now = new Date();
            if (now.getMonth() > 9) {
                now = new Date(now.getFullYear() + 1, 11 - now.getMonth() + 2, now.getDate())
            } else {
                now = new Date(now.getFullYear(), now.getMonth() + 2, now.getDate())
            }
            $('#expiration_date_time_picker_input').val($.datepicker.formatDate('dd/mm/yy', now));
        });
    </script>

<?php $this->load->view("partial/footer"); ?>