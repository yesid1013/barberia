const url = "http://localhost:8080/barbero/";
const urll = "http://localhost:8080/barbero/list";
const contenedor = document.querySelector("tbody");
let resultados = "";

const modalBarbero = new bootstrap.Modal(document.getElementById("modalBarbero"));
const formBarbero = document.querySelector("form");
const idBarbero = document.getElementById("id");
const nombreBarbero = document.getElementById("nombre");
const correoBarbero = document.getElementById("email");
let opcion = "";

btnCrear.addEventListener("click",() => {
    idBarbero.value = "";
    nombreBarbero.value="";
    correoBarbero.value="";
    idBarbero.disabled= false;
    modalBarbero.show();
    opcion="crear";
});

btnCerrar.addEventListener("click",() => {
    modalBarbero.hide();
});

btnclose.addEventListener("click",() => {
    modalBarbero.hide();
});

const mostrar = (barberos) => {
    barberos.forEach(barbero => {
        resultados += `<tr>
                        <td>${barbero.id_barbero}</td>
                        <td>${barbero.nom_barbero}</td>
                        <td>${barbero.correo_barbero}</td>
                        <td class="text-center" width="20%"><a class="btnEditar btn btn-primary">Editar</a><a class="btnBorrar btn btn-danger">Borrar</a></td>
                    </tr>`
    })

    contenedor.innerHTML = resultados;
};

//procedimiento mostrar registros
fetch(urll)
    .then(response => response.json())
    .then(data => mostrar(data))
    .catch(error => console.log(error));
    
const on = (element, event, selector, handler) => {
    element.addEventListener(event, e => {
        if (e.target.closest(selector))
            handler(e)
    })
};

on(document, 'click', '.btnBorrar', e => {
    const fila = e.target.parentNode.parentNode
    const id = fila.firstElementChild.innerHTML
    console.log(id)
    
    alertify.confirm("Desea eliminar el Barbero: "+id,
        function () {
            fetch(url + id, {
                method: 'DELETE'
            })
                .then(() => location.reload())
        },
        function () {
            alertify.error('Cancelado')
        });
});

let idForm = 0;
on(document, 'click', '.btnEditar', e => {
    const fila = e.target.parentNode.parentNode;
    idForm = fila.children[0].innerHTML;
    const nombre = fila.children[1].innerHTML;
    const email = fila.children[2].innerHTML;
    idBarbero.value = idForm;
    nombreBarbero.value = nombre;
    correoBarbero.value = email;
    idBarbero.disabled = true;
    opcion = 'editar';
    modalBarbero.show();
});
                    
formBarbero.addEventListener('submit', (e) => {
    e.preventDefault()

        if (opcion == 'crear') {
            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    id_barbero: idBarbero.value,
                    nom_barbero: nombreBarbero.value,
                    correo_barbero: correoBarbero.value
                })
            })
                .then(response => response.json())
                .then(data => {
                    const nuevoBarbero = [];
                    nuevoBarbero.push(data);
                    mostrar(nuevoBarbero);
                })
        }
        if (opcion == 'editar') {

            fetch(url, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    id_barbero: idForm,
                    nom_barbero: nombreBarbero.value,
                    correo_barbero: correoBarbero.value
                })
            })
                .then(response => location.reload())

        }
        modalbarbero.hide();
});        