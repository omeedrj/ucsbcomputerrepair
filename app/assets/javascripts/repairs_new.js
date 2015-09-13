$(document).ready(function(){
	var $sigdiv = $("#signature")
	$sigdiv.jSignature()

	$("#reset_signature_button").click(function(){
		$sigdiv.jSignature("reset")
	})

	$("#signature").bind('change', function(e){ 
		/* 'e.target' will refer to div with "#signature" */ 
		var signature_data_pair = $sigdiv.jSignature("getData", "svg")
		$("#repair_dropoff_signature_data").val(signature_data_pair[1])
	})
})