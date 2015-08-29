// Change to jquery

var more_details = document.getElementById("more_details");
var more_details_button = document.getElementById("more_details_button");

var delete_button_container = document.getElementById("delete_button_container");
var show_delete_button = document.getElementById("show_delete_button");

more_details_button.onclick = function () {
	if (more_details.style.display == "none") {
		more_details_button.firstChild.data = "Hide details"
		more_details.style.display = "inline";
	}
	else {
		more_details_button.firstChild.data = "Edit details"
		more_details.style.display = "none";
	}
}

show_delete_button.onclick = function () {
	if (delete_button_container.style.display == "none") {
		show_delete_button.firstChild.data = "Hide Delete Button"
		delete_button_container.style.display = "inline";
	}
	else {
		show_delete_button.firstChild.data = "Show Delete Button"
		delete_button_container.style.display = "none";
	}
}