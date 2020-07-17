$(".boton-modificar").click(function (event) {
    event.preventDefault();
    $('input').prop("disabled", false); // Element(s) are now enabled.
    $('.boton-descartar').toggleClass('apagado');
    $('.boton-guardar').toggleClass('apagado');
    $(this).toggleClass('apagado');
});


$(".boton-descartar").click(function(event){
    event.preventDefault();
    $('input').prop("disabled", true);
    $('.boton-modificar').toggleClass('apagado');
    $('.boton-guardar').toggleClass('apagado');
    $(this).toggleClass('apagado');
})

$(".nueva-direccion").click(function (event) {
    event.preventDefault();
    $('.formulario-nueva-direccion').toggleClass('apagado');
    $('.cerrar-nueva-direccion').toggleClass('apagado');
    $(this).toggleClass('apagado');
})

$(".cerrar-nueva-direccion").click(function (event) {
    event.preventDefault();
    $('.formulario-nueva-direccion').toggleClass('apagado');
    $('.nueva-direccion').toggleClass('apagado');
    $(this).toggleClass('apagado');
})

 $(document).ready(function () {
     $('.collapsible').collapsible();
 });

    let form = document.querySelector("#NewAdress");
    let alerta = document.querySelector(".errores-true");

    function myFunction() {
        var elmnt = document.getElementById("NewAdress");
        elmnt.scrollIntoView();
    }
       
    if(alerta.innerHTML == "hay errores"){
        $('#mis-direcciones').toggleClass('active');
        $('.formulario-nueva-direccion').toggleClass('apagado');
        $('.cerrar-nueva-direccion').toggleClass('apagado');
        $(".nueva-direccion").toggleClass('apagado'); 
         $(document).ready(function () {
             $('#NewAdress').scrollIntoView();
         });
    }



