$(document).ready(function(){
	var $sigdiv = $("#signature");
	if ($sigdiv.jSignature()) {
		console.log("jSignature initialized.");
	}
	else {
		console.log("jSignature did not initialize.");
	}

	$("#reset_signature_button").click(function(){
		$sigdiv.jSignature("reset");
	})

	$("#signature").bind('change', function(e){ 
		/* 'e.target' will refer to div with "#signature" */ 
		var signature_data_pair = $sigdiv.jSignature("getData", "svg");
		$("#repair_dropoff_signature_data").val(signature_data_pair[1]);
	})
})