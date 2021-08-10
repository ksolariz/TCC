<cfinclude template="topmenu.cfm">
<cfprocessingdirective pageEncoding="utf-8">
<cfif isdefined('form.hdn') eq 1>
  
    <cfquery name="usuario_intg"  datasource="Fitable">
    
      insert into tb_usuario(
        nome_usuario, 
        sobrenome_usuario,
        email,
        data_nascimento, 
        sexo,
        login,
        senha_usuario 
       )
    
    values(
       '#form.nome#',
       '#form.sobrenome#',
       '#form.email#',
       '#form.data#',  
       '#form.sexo#',
       '#form.login#',
       '#form.senha#'
      ) 
    
    </cfquery>
 </cfif>   
    
    <!DOCTYPE html>
<html lang="pt-br">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="cadastro.css">
    <link rel="stylesheet" type="text/css" href="css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="icon.ico" type="image/x-icon">
   
    <title>Cadastro</title>
  </head>
  <body>

    
    <div id="content">
    <form action="" id="formulario" method="POST" name="formulario" class="row g-3 needs-validation" novalidate>
        <input type="hidden" name="hdnSexo" id="hdnSexo">
        <input type="hidden" id="hdn" name="hdn" value="0">
       

            <div class="container">

                <div class="header">
                    <h2>Fitable</h2>
                    <h2 class="h2">Cadastre-se</h2>
                </div>
                <br>
                
                  <div class="row">
                      <div class="col-sm-6">
                        <label for="nome" class="form-label">Nome</label>
                        <input class="form-control" type="text" id="nome" name="nome" placeholder="Digite seu nome" required onKeyPress="return bloqueiaNumero(event);" maxlength="30">

                        <div class="invalid-feedback">
                            Preencha seu Nome
                        </div>
                      </div>

                      <div class="col-sm-6">
                        <label for="sobrenome" class="form-label">Sobrenome</label>
                        <input class="form-control" type="text" id="sobrenome" name="sobrenome" placeholder="Digite seu sobrenome" required onKeyPress="return bloqueiaNumero(event);" maxlength="40">
                        <div class="invalid-feedback">
                            Preencha seu Sobrenome
                         </div>

                      </div>


                    </div>
                  
                  <div class="row">
                      <div class="col-sm-6">
                          <label for="email" class="form-label">Email</label>
                          <input class="form-control" type="email" id="email" name="email" required placeholder="Digite seu email" required maxlength="35">
                          <div class="invalid-feedback">
                            Preencha seu Email
                         </div>
                      </div>

                        
                      <div class="col-sm-6">
                        <label for="data" class="form-label">Data Nascimento</label>
                        <input class="form-control" type="date" id="data" name="data" maxlength="10" min="2000-01-01" max="3000-12-12" required>
                        <div class="invalid-feedback">
                            Preencha com uma Data
                         </div>
                    </div>

                        <div class="invalid-feedback">
                            Preencha com sua data de Nascimento
                        </div>
                  </div>
                  <br>

                   
                     
                    <div class="row">
                        <div style="margin-right:88%" class="col-sm-3">
                            <label for="sexo">Sexo:</label>
                            <select id="sexo" name="sexo" class="form-control">
                                <option value="M">Masculino</option>
                                <option value="F">Feminino</option>
                            </select>
                        </div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-sm-4">
                        <label for="login" class="form-label">Login</label>
                        <input class="form-control" type="text" id="login" name="login" placeholder="Crie seu login" required maxlength="30">
                        <div class="invalid-feedback">
                            Crie seu Login
                         </div>
                        </div>

                        <div class="col-sm-4">
                        <label for="senha" class="form-label">Senha</label>
                        <input class="form-control" type="password" id="senha" name="senha" placeholder="Crie uma senha" required maxlength="30">
                        <div class="invalid-feedback">
                            Crie sua Senha
                         </div>
                        </div>

                        <div class="col-sm-4">
                        <label for="senha2" class="form-label">Confirme sua senha</label>
                        <input class="form-control" type="password" id="senha2" name="senha2" placeholder="Confirme sua senha" required onkeyup="check(this)" required maxlength="30">
                        <div class="invalid-feedback">
                            Confirme sua Senha
                         </div>
                           <error id="alert" style="color:#dc3545"></error>

                        </div>
                    </div>
                    <br>


                    <div class="row">
                        <div class="col-sm-12">
                            <button class="btn btn-primary" onclick="validar()">Cadastrar</button>
                        </div>
                        
                    </div>
                    
                    
                    
                
                </div>

        </form>
        </div>

    
        <script>
          
        (function validar() {
        

  
    var forms = document.querySelectorAll('.needs-validation')
    // trim remove os espaços em branco
	const nomeValue = nome.value.trim();
    const sobrenomeValue = sobrenome.value.trim();
	const emailValue = email.value.trim();
    const dataValue = data.value.trim();
    const loginValue = login.value.trim();
	const senhaValue = senha.value.trim();
	const senha2Value = senha2.value.trim();

 
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
            })
        })()

        for(let i = 0; i < sexo.length; i++){
        if(sexo[i].checked){
            document.getElementById('hdnSexo').value =  sexo[i].value;
        }
    }
         $('#hdn').val('1');
         $('#formulario').submit();
         location.href = "login/login.cfm";

        </script>

        <script type="text/javascript">
            var senha = document.getElementById('senha');
            function check(elem){
                if(elem.value.length > 0){
                    if(elem.value != senha.value){
                       document.getElementById('alert').innerText = "As senhas não coincidem"; 
                    }else{
                        document.getElementById('alert').innerText = "";
                    }
                }

            }
        </script>

        <script type="text/javascript">
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
        
        </script>

    </body>        
</html>