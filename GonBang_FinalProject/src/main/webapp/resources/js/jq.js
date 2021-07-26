$(function() {
	$('#apibtn').click(function() {
		$.ajax({
			url: './jq/kakaopay.cls?',
			dataType: 'json',
			success: function(data) {
				alert(JSON.stringify(data));
				var box = data.next_redirect_pc_url;
				window.open(box);
			},
			error: function(error) {
				alert(JSON.stringify(error));
			}
		});
	});
});


$(function(){
	$('#basket').click(function(){
		$.ajax({
			url: 'kakaopapyFrm',
			dateType: 'GET',
			success: function(date){
				alert(date);
			},
		});
	});
});