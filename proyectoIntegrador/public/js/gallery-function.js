window.addEventListener('load',()=>{

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
        .then(()=>{
            console.log("carajoooooo");
        })
    
    })
    
    inputBox.addEventListener('click', ()=>{
        let desplegable = document.querySelector(".collapsible-body");
        desplegable.style.display = "block";
    })

    let formsAgregar= document.querySelectorAll('.formsAgregar');

    let data= {};
    let carrito = document.querySelector('.cart')
    let cantItems = document.querySelector('.cantItems')
    

    formsAgregar.forEach((formulario) => {
        formulario.querySelector('.boton-carrito').addEventListener('click',(e)=>{
            e.preventDefault()
            data.productId= formulario.querySelector('.productId').value

            let itemsEnCarrito;
            fetch('http://localhost:3000/cart/api')
            .then(respuesta=>{
                return respuesta.json()
            })
            .then(info=>{
                itemsEnCarrito = info;

               let yaAgregado= info.data.find(element=>{
                   return element.idProduct == data.productId
               })

               if (yaAgregado) {
                   if (! document.querySelector('.toastYaAgregado' + data.productId)) {
                       
                       M.toast({
                           html: 'Item ya está en carrito',
                           displayLength: 1000,
                           classes: "toastYaAgregado toastYaAgregado" + data.productId
                       
                       })
                   }
                   throw ("item estaba agregado")
               } else{
                    return fetch('http://localhost:3000/cart/api',{
                    method: 'POST',
                    body: JSON.stringify(data),
                    headers: {'Content-Type' : 'application/json'}
                })
               }
               
            })
            .then((response)=> {
                if(response.ok) {

                    if (!cantItems) {
                        carrito.innerHTML += `<span class="cantItems" style="background-color: var(--orangedark);
                        z-index: 2;
                        width: 21px;
                        height: 21px;
                        position: absolute;
                        top: 29px;
                        right: -3px;
                        border-radius: 50%;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        font-weight: bold;"> </span>`

                        cantItems = document.querySelector('.cantItems')
                    }
                    cantItems.innerText = itemsEnCarrito.meta.cantidad + 1;
                    if (! document.querySelector('.toastNuevoItem' + data.productId)) {

                        M.toast({
                            html: 'Item agregado al carrito',
                            displayLength: 1000,
                            classes: "toastNuevoItem toastNuevoItem"+ data.productId
                        
                        })
                    }

                } else {
                    throw "Error en la llamada Ajax";
                }
             
             })
             .catch(function(err) {
                console.log(err);
             });
            
            
        })
    });

})

