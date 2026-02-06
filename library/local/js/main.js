"use strict";
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	return new bootstrap.Tooltip(tooltipTriggerEl)
})
//if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
	document.body.setAttribute("data-theme", "dark")
//} else {
//	document.body.removeAttribute("data-theme");
//}
