document.addEventListener('DOMContentLoaded', function(){
	var crearFormulario = document.getElementsByTagName("input")[0];
	crearFormulario.addEventListener("click",mostrarFormularioCreacionUsuario);
});


function mostrarFormularioCreacionUsuario(){
	var elementDiv = document.getElementsByTagName("div")[0];
    elementDiv.hidden = false;
}
    