var customer_info = document.getElementById("customer_info");
var static_customer_info = document.getElementById("static_customer_info");
var customer_info_button = document.getElementById("customer_info_button");

var device_info = document.getElementById("device_info");
var static_device_info = document.getElementById("static_device_info");
var device_info_button = document.getElementById("device_info_button");

var delete_button_container = document.getElementById("delete_button_container");
var show_delete_button = document.getElementById("show_delete_button");

customer_info_button.onclick = function () {
	if (customer_info.style.display == "none") {
		console.log("Customer Info Shown");
		customer_info_button.firstChild.data = "Hide Customer Info"
		customer_info.style.display = "inline";
	}
	else {
		console.log("Customer Info Hidden");
		customer_info_button.firstChild.data = "Click to edit Customer Info"
		customer_info.style.display = "none";
	}
}

device_info_button.onclick = function () {
	if (device_info.style.display == "none") {
		console.log("Device Info Shown");
		device_info_button.firstChild.data = "Hide Device Info"
		device_info.style.display = "inline";
	}
	else {
		console.log("Device Info Hidden");
		device_info_button.firstChild.data = "Click to edit Device Info"
		device_info.style.display = "none";
	}
}

show_delete_button.onclick = function () {
	if (delete_button_container.style.display == "none") {
		console.log("Delete Button Shown");
		show_delete_button.firstChild.data = "Hide Delete Button"
		delete_button_container.style.display = "inline";
	}
	else {
		console.log("Delete Button Hidden");
		show_delete_button.firstChild.data = "Show Delete Button"
		delete_button_container.style.display = "none";
	}
}
