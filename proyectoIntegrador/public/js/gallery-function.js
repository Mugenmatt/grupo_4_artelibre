$(document).ready(function () {
    $('.collapsible').collapsible();
});

let inputBox=document.querySelector('#myInput')
let listaArtistas=document.querySelector('.listaArtistas')

inputBox.addEventListener('input',()=>{
    fetch('http://localhost:3000/gallery/api')
    .then(function(respuesta){return respuesta.json()})
    .then(function(informacion){
        let listaModificada= informacion.filter((elemento)=>{
            return elemento.username.toLowerCase().startsWith(inputBox.value.toLowerCase())
        })
        let cambios="";

        listaModificada.forEach(element => {
            cambios += `<li><a href="/gallery/${element.id}"> ${element.username} </a></li>`
        });


        listaArtistas.innerHTML = cambios;
    })

})

inputBox.addEventListener('click', ()=>{
    let desplegable = document.querySelector(".collapsible-body");
    desplegable.style.display = "block";
})

