<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>

<ul id="error_message_box" class="error_message_box"></ul>

<?php echo form_open($controller_name . '/save/' . $person_info->person_id, array('id'=>'consignmenter_form', 'class'=>'form-horizontal')); ?>
	<fieldset id="consignmenter_basic_info">
		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('consignmenters_consignmenter_name'), 'consignmenter_name', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
					'name'=>'consignmenter_name',
					'id'=>'consignmenter_name_input',
					'class'=>'form-control input-sm',
					'value'=>$person_info->consignmenter_name)
					);?>
			</div>
		</div>

		<?php $this->load->view("people/form_basic_info"); ?>

		<div class="form-group form-group-sm">	
			<?php echo form_label($this->lang->line('consignmenters_account_number'), 'account_number', array('class'=>'control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
					'name'=>'account_number',
					'id'=>'account_number',
					'class'=>'form-control input-sm',
					'value'=>$person_info->account_number)
					);?>
			</div>
		</div>
	</fieldset>
<?php echo form_close(); ?>

<script type="text/javascript">
//validation and submit handling
$(document).ready(function()
{
	$('#consignmenter_form').validate($.extend({
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
 
		rules:
		{
			consignmenter_name: 'required',
			email: 'email'
   		},

		messages: 
		{
			consignmenter_name: "<?php echo $this->lang->line('consignmenters_consignmenter_name_required'); ?>",
			email: "<?php echo $this->lang->line('common_email_invalid_format'); ?>"
		}
	}, form_support.error));
});
</script>
