<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>

<ul id="error_message_box" class="error_message_box"></ul>

<?php echo form_open('expenses/save/'.$expenses_info->expense_id, array('id'=>'expenses_edit_form', 'class'=>'form-horizontal')); ?>
	<fieldset id="item_basic_info">
		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_info'), 'expenses_info', array('class'=>'control-label col-xs-3')); ?>
			<?php echo form_label(!empty($expenses_info->expense_id) ? $this->lang->line('expenses_expense_id') . ' ' . $expenses_info->expense_id : '', 'expenses_info_id', array('class'=>'control-label col-xs-8', 'style'=>'text-align:left')); ?>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_date'), 'date', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<div class="input-group">
					<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-calendar"></span></span>
					<?php echo form_input(array(
							'name'=>'date',
							'class'=>'form-control input-sm datetime',
 							'value'=>to_datetime(strtotime($expenses_info->date)),
                            'readonly'=>'readonly')
							);?>
				</div>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_consignmenter_name'), 'consignmenter_name', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<?php echo form_input(array(
						'name'=>'consignmenter_name',
						'id'=>'consignmenter_name',
						'class'=>'form-control input-sm',
						'value'=>$this->lang->line('expenses_start_typing_consignmenter_name'))
					);
					echo form_input(array(
						'type'=>'hidden',
						'name'=>'consignmenter_id',
						'id'=>'consignmenter_id')
						);?>
			</div>
			<div class="col-xs-2">
				<a id="remove_consignmenter_button" class="btn btn-danger btn-sm" title="Remove Consignmenter">
					<span class="glyphicon glyphicon-remove"></span>
				</a>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_consignmenter_tax_code'), 'consignmenter_tax_code', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<?php echo form_input(array(
						'name'=>'consignmenter_tax_code',
						'id'=>'consignmenter_tax_code',
						'class'=>'form-control input-sm',
						'value'=>$expenses_info->consignmenter_tax_code)
						);?>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_amount'), 'amount', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<div class="input-group input-group-sm">
					<?php if (!currency_side()): ?>
						<span class="input-group-addon input-sm"><b><?php echo $this->config->item('currency_symbol'); ?></b></span>
					<?php endif; ?>
					<?php echo form_input(array(
							'name'=>'amount',
							'id'=>'amount',
							'class'=>'form-control input-sm',
							'value'=>to_currency_no_money($expenses_info->amount))
							);?>
					<?php if (currency_side()): ?>
						<span class="input-group-addon input-sm"><b><?php echo $this->config->item('currency_symbol'); ?></b></span>
					<?php endif; ?>
				</div>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_tax_amount'), 'tax_amount', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<div class="input-group input-group-sm">
					<?php if (!currency_side()): ?>
						<span class="input-group-addon input-sm"><b><?php echo $this->config->item('currency_symbol'); ?></b></span>
					<?php endif; ?>
					<?php echo form_input(array(
							'name'=>'tax_amount',
							'id'=>'tax_amount',
							'class'=>'form-control input-sm',
							'value'=>to_currency_no_money($expenses_info->tax_amount))
							);?>
					<?php if (currency_side()): ?>
						<span class="input-group-addon input-sm"><b><?php echo $this->config->item('currency_symbol'); ?></b></span>
					<?php endif; ?>
				</div>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_payment'), 'payment_type', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<?php echo form_dropdown('payment_type', $payment_options, $expenses_info->payment_type, array('class'=>'form-control', 'id'=>'payment_type'));?>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_categories_name'), 'category', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<?php echo form_dropdown('expense_category_id', $expense_categories, $expenses_info->expense_category_id, array('class'=>'form-control', 'id'=>'category')); ?>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_employee'), 'employee', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<?php echo form_dropdown('employee_id', $employees, $expenses_info->employee_id, 'id="employee_id" class="form-control"');?>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('expenses_description'), 'description', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<?php echo form_textarea(array(
					'name'=>'description',
					'id'=>'description',
					'class'=>'form-control input-sm',
					'value'=>$expenses_info->description)
					);?>
			</div>
		</div>

		<?php
		if(!empty($expenses_info->expense_id))
		{
		?>
			<div class="form-group form-group-sm">
				<?php echo form_label($this->lang->line('expenses_is_deleted').':', 'deleted', array('class'=>'control-label col-xs-3')); ?>
				<div class='col-xs-5'>
					<?php echo form_checkbox(array(
						'name'=>'deleted',
						'id'=>'deleted',
						'value'=>1,
						'checked'=>($expenses_info->deleted) ? 1 : 0)
					);?>
				</div>
			</div>
		<?php
		}
		?>
	</fieldset>
<?php echo form_close(); ?>

<script type='text/javascript'>
//validation and submit handling
$(document).ready(function()
{
	<?php $this->load->view('partial/datepicker_locale'); ?>

	var amount_validator = function(field) {
		return {
			url: "<?php echo site_url($controller_name . '/ajax_check_amount')?>",
			type: 'POST',
			dataFilter: function(data) {
				var response = JSON.parse(data);
				return response.success;
			}
		}
	}

	$('#consignmenter_name').click(function() {
		$(this).attr('value', '');
	});

	$('#consignmenter_name').autocomplete({
		source: '<?php echo site_url("consignmenters/suggest"); ?>',
		minChars:0,
		delay:10,
		select: function (event, ui) {
			$('#consignmenter_id').val(ui.item.value);
			$(this).val(ui.item.label);
			$(this).attr('readonly', 'readonly');
			$('#remove_consignmenter_button').css('display', 'inline-block');
			return false;
		}
	});

	$('#consignmenter_name').blur(function() {
		$(this).attr('value',"<?php echo $this->lang->line('expenses_start_typing_consignmenter_name'); ?>");
	});

	$('#remove_consignmenter_button').css('display', 'none');

	$('#remove_consignmenter_button').click(function() {
		$('#consignmenter_id').val('');
		$('#consignmenter_name').removeAttr('readonly');
		$('#consignmenter_name').val('');
		$(this).css('display', 'none');
	});

	<?php
	if(!empty($expenses_info->expense_id))
	{
	?>
		$('#consignmenter_id').val('<?php echo $expenses_info->consignmenter_id ?>');
		$('#consignmenter_name').val('<?php echo $expenses_info->consignmenter_name ?>').attr('readonly', 'readonly');
		$('#remove_consignmenter_button').css('display', 'inline-block');
	<?php
	}
	?>

	$('#expenses_edit_form').validate($.extend({
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				success: function(response)
				{
					dialog_support.hide();
					table_support.handle_submit("<?php echo site_url($controller_name); ?>", response);
				},
				dataType: 'json'
			});
		},

		errorLabelContainer: '#error_message_box',

		ignore: '',

		rules:
		{
			category: 'required',
			date:
			{
				required: true
			},
			amount:
			{
				required: true,
				remote: amount_validator('#amount')
			},
			tax_amount:
			{
				remote: amount_validator('#tax_amount')
			}
		},

		messages:
		{
			category: "<?php echo $this->lang->line('expenses_category_required'); ?>",
			date:
			{
				required: "<?php echo $this->lang->line('expenses_date_required'); ?>"

			},
			amount:
			{
				required: "<?php echo $this->lang->line('expenses_amount_required'); ?>",
				remote: "<?php echo $this->lang->line('expenses_amount_number'); ?>"
			},
			tax_amount:
			{
				remote: "<?php echo $this->lang->line('expenses_tax_amount_number'); ?>"
			}
		}
	}, form_support.error));
});
</script>
