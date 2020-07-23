let btnCrear = document.querySelector(".crear-nuevo");
let btnCerrar = document.querySelector(".boton-cerrar");
let txt = document.querySelectorAll(".helper-text");

btnCrear.addEventListener("click", function(){
    document.querySelector("#test2").style.display = "flex"

})

btnCerrar.addEventListener("click", function(){
    document.querySelector("#test2").style.display = "none"
})

document.addEventListener('DOMContentLoaded', function () {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
});

if (txt.length > 0) {
    document.querySelector("#test2").style.display = "flex"
}

 document.addEventListener('DOMContentLoaded', function () {
     var elems = document.querySelectorAll('.collapsible');
     var instances = M.Collapsible.init(elems, options);
 });