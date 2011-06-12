
function setUpFields(){
	
	$(".textbox").each(function(){
		$(this).wrap('<div class="textbox_wrapper">');
	});
	
	$(".textarea").each(function(){
		$(this).wrap('<div class="textarea_wrapper">');
	});	
	
	$(".selectbox").each(function() {
		$(this).wrap('<div class="selectbox_wrapper '+$(this).attr('class').replace('selectbox', '')+'">');
		var name 	 = $(this).attr('name');
		var id   	 = $(this).attr('id');
		var xval	 = $(this).val().replace('"', '');
		var xtxt	 = $(this).find(':selected').html();
		var colors   = $(this).hasClass('colors');
		var	html	 = '';
		if (colors) {
			html += '<div class="select_value"><span class="product_color_'+xval+'">'+xtxt+'</span></div>';
		} else {
			html += '<div class="select_value">'+xtxt+'</div>';
		}
		html 	 	+= '<div class="select_arrow">&nbsp;</div>';
		html 	 	+= '<ul class="select_options">';
		$(this).find('option').each(function(){
			var color = colors ? ('class="product_color_'+$(this).attr('value')+'"') : '';
			html += ('<li><span '+color+'>'+$(this).html()+'</span><var>'+$(this).attr('value')+'</var></li>');
		});
		html += '</ul>';
		html += '<input type="text" name="'+name+'" id="'+id+'" class="textselect" value="'+xval+'" />';
		$(this).parents('.selectbox_wrapper').append(html);
		$(this).remove();
	});
	
	$(".select_value, .select_arrow").click(function(){
		
		var all = $('.selectbox_wrapper');
		var w   = $(this).parents('.selectbox_wrapper');
		
		if (w.hasClass('disabled')) {
			return false;
		}
		
		all.css('z-index', '999998');
		w.css('z-index', '999999');
		
		$('.select_options').css('display', 'none');
		
		var o = w.find('.select_options');
		
		if (w.hasClass('show')) {
			o.css('display', 'none');
			w.removeClass('show');
			all.removeClass('show');
		} else {
			o.css('display', 'block');
			w.addClass('show');
		}
		
		//w.find('.textselect').focus();
	});
	
	$(".select_options li").click(function() {
		var w = $(this).parents('.selectbox_wrapper');
		w.find('.textselect').val($(this).find('var').html());
		if (w.hasClass('colors')) {
			w.find('.select_value').html('<span class="product_color_'+$(this).find('var').html()+'">' + $(this).find('span').html() + '</span>');
		} else {
			w.find('.select_value').html($(this).find('span').html());
		}
		$(this).parents('.select_options').slideUp('fast');
	});
	
	$(".textselect").blur(function(e){
		//$(this).parents('.selectbox_wrapper').find('.select_options').slideUp('fast');
	});
	
}

$(document).ready(function(){
	setUpFields();
});