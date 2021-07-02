<cfif isdefined('form.hdn') eq 1>
    <cfquery name="usuario_intg" datasource="#Tcc#">
    
      insert into tb_usuario(
        nome_usuario, 
        sobrenome_usuario,
        email,
        data_nascimento, 
        sexo, 
        senha_usuario 
       )
    
    values(
       '#form.nome#',
       '#form.sobrenome#',
       '#form.email#',
       '#form.data#',  
       '#form.hdnSexo#',
       '#form.login#'
       '#form.senha#'
      ) 
    
    </cfquery>
    <script>
      alert('Cadastro realizado com sucesso!');
    </script>
    </cfif>

<!DOCTYPE html>
<html lang="pt-br">
<head>

    <link rel="stylesheet" type="text/css" href="style2.css">
    <link rel="stylesheet" type="text/css" href="css/all.min.css">
   
    <meta charset="UTF-8">    
    <title>Fitable</title>
</head>
<body>


    
    
	<div class="container">
        <div class="header">
            <h2>Fitable</h2>
            <h2 class="h2">Cadastre-se</h2>
        </div>

        <form action="" id="formulario" method="POST" name="formulario">
        <input type="hidden" name="hdnSexo" id="hdnSexo">
        <input type="hidden" id="hdn" name="hdn" value="0">
       

            <div class="form-control">
                <label for="nome">Nome</label>
                <input type="text" placeholder="Digite o seu Nome" id="nome" name="nome" onKeyPress="return bloqueiaNumero(event);" />
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>

            <div class="form-control">
                <label for="nome">Sobrenome</label>
                <input type="text" placeholder="Digite o seu Sobrenome" id="sobrenome" name="sobrenome" onKeyPress="return bloqueiaNumero(event);"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>

            <div class="form-control">
                <label for="nome">Email</label>
                <input type="email" placeholder="Digite seu Email" name="email" id="email" maxlength="50"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>    
                

            <div class="form-control">
                <label for="nome">Data</label>
                <input type="text" placeholder="00/00/0000" id="data" name="data" maxlength="10"  onkeypress="mascaraData( this, event);return Onlynumbers(event)"/>
                 <i class="fas fa-check-circle"></i>
                 <i class="fas fa-exclamation-circle"></i>
                 <small>Error message</small>
            </div>
            
            <div class="dist">
                <label for="nome">Sexo:</label>
                <input id="m" type="radio"  name="sexo" checked value="M">Masculino
                <input id="f" type="radio"  name="sexo" value="F">Feminino
            </div>

            <div class="form-control">
                <label for="nome">Login</label>
                <input type="text" placeholder="Crie um Login" id="login" name="login" maxlength="30"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>    

           
            <div class="form-control">
                <label for="nome">Senha</label>
                <input type="password" placeholder="Senha" id="senha" name="login"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="nome">Confirmar senha</label>
                <input type="password" placeholder="Confirme sua senha" id="senha2"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <button type="submit">Cadastrar</button>
        </form>
    </div>
    



    <script type="text/javascript">

const form = document.getElementById('form');
const nome = document.getElementById('nome');
const sobrenome = document.getElementById('sobrenome');
const email = document.getElementById('email');
const data = document.getElementById('data');
const login = document.getElementById('login')
const senha= document.getElementById('senha');
const senha2 = document.getElementById('senha2');
const sexo = document.getElementsByTagName('sexo') 

form.addEventListener('submit', e => {
	e.preventDefault();
	
	checkInputs();
   
});

function checkInputs() {
	// trim remove os espaços em branco
	const nomeValue = nome.value.trim();
    const sobrenomeValue = sobrenome.value.trim();
	const emailValue = email.value.trim();
    const dataValue = data.value.trim();
    const dataValue = login.value.trim();
	const senhaValue = senha.value.trim();
	const senha2Value = senha2.value.trim();
	
	if(nomeValue === '') {
		setErrorFor(nome, 'Preencha este campo!');
	} else {
		setSuccessFor(nome);
	}

    if(sobrenomeValue === '') {
		setErrorFor(sobrenome, 'Preencha este campo!');
	} else {
		setSuccessFor(sobrenome);
	}
	
	if(emailValue === '') {
		setErrorFor(email, 'Preencha este campo!');
	} else if (!isEmail(emailValue)) {
		setErrorFor(email, 'Não é um email válido.');
	} else {
		setSuccessFor(email);
	}

    if(dataValue === '') {
		setErrorFor(data, 'Preencha este campo!');
	} else {
		setSuccessFor(data);
	}

    if(loginValue === '') {
		setErrorFor(login, 'Preencha este campo!');
	} else {
		setSuccessFor(login);
	}

	if(senhaValue === '') {
		setErrorFor(senha, 'Preencha este campo!');
	} else {
		setSuccessFor(senha);
	}
	
	if(senha2Value === '') {
		setErrorFor(senha2, 'Confirme sua senha!');
	} else if(senhaValue !== senha2Value) {
		setErrorFor(senha2, 'As senhas não são iguais');
	} else{
		setSuccessFor(senha2);
	}
}

for(let i = 0; i < sexo.length; i++){
        if(sexo[i].checked){
            document.getElementById('hdnSexo').value =  sexo[i].value;
          }
       }

         document.getElementById("hdn").value=1;
         document.getElementById("formulario").submit();

  
  
  

function setErrorFor(input, message) {
	const formControl = input.parentElement;
	const small = formControl.querySelector('small');
	formControl.className = 'form-control error';
	small.innerText = message;
}

function setSuccessFor(input) {
	const formControl = input.parentElement;
	formControl.className = 'form-control success';
}
	
function isEmail(email) {
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
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
     var tecla=new Number();
     
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

   function Onlynumbers(e)
{
	
	if(window.event) {
		tecla = e.keyCode;
	}
	else if(e.which) {
		tecla = e.which;
	}
	else {
		return true;
	}
	if((tecla >= "97") && (tecla <= "122")){
		return false;
	}
}



        </script>

        </form>
    </div>
    
</body>
</html>
