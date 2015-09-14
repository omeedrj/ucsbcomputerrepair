$(document).ready(function(){
	var $sigdiv = $("#signature");
	$sigdiv.jSignature();

	if ($("#submit_button_div").is(":visible")) {
		$("#submit_button_div").hide();
	}


	$("#reset_signature_button").click(function(){
		$sigdiv.jSignature("reset");
		if ($("#submit_button_div").is(":visible")) {
			$("#submit_button_div").hide();
		}
	})

	$("#signature").bind('change', function(e){ 
		/* 'e.target' will refer to div with "#signature" */ 
		var signature_data_pair = $sigdiv.jSignature("getData", "svg");
		$("#repair_dropoff_signature_data").val(signature_data_pair[1]);
		if ($("#submit_button_div").is(":hidden")) {
			$("#submit_button_div").show();
		}
	})
})