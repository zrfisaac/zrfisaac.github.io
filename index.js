// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ javascript ]
function fnMenu() {
	var _menu = document.getElementById("pn_menu");
	if (_menu.className.indexOf("w3-show") == -1) {
		_menu.className += " w3-show";
	} else { 
		_menu.className = _menu.className.replace(" w3-show", "");
	}
}
