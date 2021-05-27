function validarEmail(){
    var email = document.querySelector('#email');
    var error = document.querySelector('#error-email');

  if(!email.checkValidity()){
  error.innerHTML = "Email invalido";  
 }

}

   function redefinirMsg(){
   var error = document.querySelector('#error-email');
   if (error.innerHTML == "Email invalido"){
   error.innerHTML = "";
 }
}
    

    function bloqueiaNumero(texto)
{
 var tecla = new String();

 if (window.event) {
  tecla = texto.keyCode;
 }
 else if (texto.which) {
  tecla = texto.which;
 }
 else {
  return true;
 }

    if (((tecla < 48) || (tecla > 57)) && (tecla = 8))
    {
        return true;
    }

    else
    {
      return false;
    }

}

  
function mascaraData( campo, e )
{
var kC = (document.all) ? event.keyCode : e.keyCode;
var data = campo.value;

if( kC!=8 && kC!=46 )
{
  if( data.length==2 )
  {
      campo.value = data += '/';
  }
  else if( data.length==5 )
  {
      campo.value = data += '/';
  }
  else
      campo.value = data;
}
}
    

function validar() {

var nome = document.getElementById("nome").value;
var sobrenome = document.getElementById("sobrenome").value;
var email = document.getElementById("email").value;
var data = document.getElementById("data").value;
var nsenha = document.getElementById("nsenha").value;
var cnsenha = document.getElementById("cnsenha").value;




if(nome == ""){
    alert("Nome não informado.");    		
    document.getElementById('nome').focus();
    return;
    
}


if(sobrenome == ""){
    alert("Sobrenome não informado.")
    document.getElementById('sobrenome').focus();
    return;     
   }


if(email == ""){
   alert("Email não informado.")
   document.getElementById('email').focus();
   return;          
}

if(data == ""){
    alert("Data não informada.")
    document.getElementById('data').focus();
    return;
}
if(nsenha == "") {
    alert("Crie sua senha!")
    document.getElementById('senha').focus();
    return;
}

if(cnsenha == "") {
    alert("Confirme sua senha!")
    document.getElementById('csenha').focus();
    return;
}

if (nsenha!= cnsenha) {
  alert("SENHAS DIFERENTES!\nFAVOR DIGITAR SENHAS IGUAIS");
  document.getElementById('cnsenha').focus();
  return; 
}

formulario.submit();
}