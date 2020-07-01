let btnCrear = document.querySelector(".crear-nuevo");
let btnCerrar = document.querySelector(".boton-cerrar");

btnCrear.addEventListener("click", function(){
    document.querySelector("#test2").style.display = "flex"

})

btnCerrar.addEventListener("click", function(){
    document.querySelector("#test2").style.display = "none"
})