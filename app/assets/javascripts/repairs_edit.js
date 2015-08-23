var customer_info = document.getElementById("customer_info");
var static_customer_info = document.getElementById("static_customer_info");
var customer_info_button = document.getElementById("customer_info_button");

var device_info = document.getElementById("device_info");
var static_device_info = document.getElementById("static_device_info");
var device_info_button = document.getElementById("device_info_button");

customer_info_button.onclick = function () {
	if (customer_info.style.display == "none") {
		console.log("Customer Info Shown");
		customer_info_button.firstChild.data = "Hide Customer Info"
		customer_info.style.display = "inline-block";
		//static_customer_info.style.display = "none";
	}
	else {
		console.log("Customer Info Hidden");
		customer_info_button.firstChild.data = "Click to edit Customer Info"
		customer_info.style.display = "none";
		static_customer_info.style.display = "inline-block";
	}
}

device_info_button.onclick = function () {
	if (device_info.style.display == "none") {
		console.log("Device Info Shown");
		device_info_button.firstChild.data = "Hide Device Info"
		device_info.style.display = "inline-block";
		//static_device_info.style.display = "none";
	}
	else {
		console.log("Device Info Hidden");
		device_info_button.firstChild.data = "Click to edit Device Info"
		device_info.style.display = "none";
		static_device_info.style.display = "inline-block";
	}
}
