


function funcionIngresar(){
	
		const nombreUsuario = document.querySelector("#nombreUsuario");
	console.log(nombreUsuario.value);
	
	
	if(nombreUsuario.value == "user"){

    location.href= "views/user/user.jsp"

} else if(nombreUsuario.value == "admin"){

    location.href= "views/admin/admin.jsp"

} else {
	
  document.getElementById("textoOculto").innerHTML = "El usuario no existe!!";
	
	
}
	
	
};


/////////////////////////



function ir_a_index(){

    location.href= "../../index.jsp"
	
	
};

function ir_a_atracciones(){

    location.href= "../atracciones.html"
	
	
};

function volver_pagina_anterior(){

    location.href= history.go(-1);
	
	
};



function ir_a_createuser(){

    location.href= "../createuser.html";
	
	
};

