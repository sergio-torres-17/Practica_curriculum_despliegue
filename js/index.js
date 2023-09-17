// variables for base information
var nombre, apellidos, puesto, email, telefono, direccion, descripcionPersona;
nombre = document.getElementById('nombre');
apellidos = document.getElementById('apellidos');
puesto = document.getElementById('puesto');
email = document.getElementById('correo');
telefono = document.getElementById('telefono');
direccion = document.getElementById('ciudad');
descripcionPersona = document.getElementById('descripcionPersona');

let jsonMasterParsed;
let basicInformation;
let laboralExperience;
let programSkills;

function extractBasicInfo(jsonMaster){
    basicInformation = JSON.parse(jsonMaster.BasicInfo)[0];
    nombre.textContent = basicInformation.Nombre;
    apellidos.textContent = basicInformation.apellido;
    puesto.textContent = basicInformation.descripcion;
    email.textContent = basicInformation.email;
    telefono.textContent = basicInformation.Telefono;
    direccion.textContent = basicInformation.direccion;
    descripcionPersona.textContent = basicInformation.descripcion;
}
function extractLaboralExperience(jsonMaster){
    laboralExperience = JSON.parse(jsonMaster.LaboralExperience);
}
function extractProgramSkills(jsonMaster){
    programSkills = JSON.parse(jsonMaster.ProgramSkills);
}
window.onload = function () {
    var request = new XMLHttpRequest();
    request.open('GET', 'http://localhost/proyectosmateriaweb/practica_curriculum/php/getinfo.php');
    request.send();
    request.onload = function () {
        jsonMasterParsed = JSON.parse(request.responseText);
        extractBasicInfo(jsonMasterParsed);
        extractLaboralExperience(jsonMasterParsed);
        extractProgramSkills(jsonMasterParsed);
    }
}
