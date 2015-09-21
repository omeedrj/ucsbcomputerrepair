$(document).ready(function(){
	var $sigdiv = $("#signature");

	$("#step_2_button").click(function(){
		$("#step_1_div").hide();
		$("#step_3_div").hide();
		$("#step_4_div").hide();
		$("#step_2_div").show();
	})

	$("#step_3_button").click(function(){
		$("#step_1_div").hide();
		$("#step_2_div").hide();
		$("#step_4_div").hide();
		$("#step_3_div").show();
	})

	$("#step_4_button").click(function(){
		$("#step_1_div").hide();
		$("#step_2_div").hide();
		$("#step_3_div").hide();
		$("#step_4_div").show();
		
		$("#review_customer_first_name").text($("#repair_customer_first_name").val());
    $("#review_customer_last_name").text($("#repair_customer_last_name").val());
    $("#review_customer_id_number").text($("#repair_customer_id_number").val());
    $("#review_customer_email").text($("#repair_customer_email").val());
    $("#review_customer_phone_number").text($("#repair_customer_phone_number").val());
    $("#review_device_description").text($("#repair_device_description").val());
    $("#review_device_serial_number").text($("#repair_device_serial_number").val());
    $("#review_accessories_description").text($("#repair_accessories_description").val());
    $("#review_device_problem_description").text($("#repair_device_problem_description").val());

		$sigdiv.jSignature();

		// Also add the form values into the appropriate DOM fields
	})


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