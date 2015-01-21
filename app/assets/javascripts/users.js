$(function(){

	if($('#change_password') > 0){
		var password_errors = $('#user_password_input').children('div.field_with_errors').length;
		var confirmation_errors = $('#user_password_confirmation_input').children('div.field_with_errors').length;
		
		if(password_errors + confirmation_errors == 0){
			$('#user_password_input').hide();
			$('#user_password_confirmation_input').hide();
			$('#user_password').val('');
			$('#user_password_confirmation').val('');
		} else {
			$('#change_password').attr('checked', 'checked');
		}
		
		$('#change_password').change(function(){
			var change_password = $(this).is(':checked');
			if(change_password){
				$('#user_password_input').show();
				$('#user_password_confirmation_input').show();
			} else {
				$('#user_password_input').hide();
				$('#user_password_confirmation_input').hide();
				$('#user_password').val('');
				$('#user_password_confirmation').val('');
			}	
		});
	}
});