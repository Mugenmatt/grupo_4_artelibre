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