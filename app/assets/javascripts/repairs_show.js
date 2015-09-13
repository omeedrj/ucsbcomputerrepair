$(document).ready(function(){
	$("#view_dropoff_signature_button").click(function(){
		if ($("#customer_dropoff_signature").is(":visible")) {
			$("#view_dropoff_signature_button").text("View Customer Dropoff Signature");
			$("#customer_dropoff_signature").hide();
		}
		else {
			$("#view_dropoff_signature_button").text("Hide Customer Dropoff Signature");
			$("#customer_dropoff_signature").show();
		}
	})
})