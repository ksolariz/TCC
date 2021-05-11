Create database Monitoramento_Saude;

use Monitoramento_Saude;

create table tb_usuario(
id_usuario int primary key identity(1,1),
nome_usuario varchar(100),
sobrenome_usuario varchar(100),
email varchar(100),
data_Nascimento DATE,
--senha_usuario varchar(50), 
sexo char(2),
check(sexo in ('M','F'))
)

insert into tb_usuario values('João ','Victor','joao@gmail.com','26/01/2004','M');
insert into tb_usuario values('Kaue ','Soares','kauesoares@gmail.com','21/11/2003','M');
insert into tb_usuario values('Lara ','Pilli','Lara@hotmail.com','24/06/2003','F');
insert into tb_usuario values('Luiza ','Silva','luizasilva@outlook.com','01/01/2006','F');
insert into tb_usuario values('Vinicius ','Nogueira','nog139@aol.com','08/05/2003','M');
insert into tb_usuario values('Arthur','Campos','thursc@outlook.com','21/03/2004','M');
insert into tb_usuario values('Josefa','Luz','donajosefa@outlook.com','30/04/1978','F');
insert into tb_usuario values('Ivan ','Lucas','ivan@bol.com','11/12/2009','M');
insert into tb_usuario values('Paula','Abrel','paulinhabolos@outlook.com','27/08/1999','F');
insert into tb_usuario values('Julia ','Jane','comercialjane@gmail.com','09/10/2000','F');
insert into tb_usuario values('Pedro ','Machado','poetapedro@outlook.com','08/07/1988','M');

select * from tb_usuario


create table tb_servico(
id_servico int primary key identity(1,1),
nome_servico varchar(100),
descricao varchar(100));

insert into tb_servico values('IMC', 'Índice de Massa Corporal');
insert into tb_servico values('Sono', 'Monitoramento de Sono');


create table tb_usuario_servico(
id_usuario int,
id_servico int,
peso decimal(9,3),
altura decimal(9,2),
resultado decimal(9,2),
dt_atual datetime,
horario_sono_ini datetime,
horario_sono_fim datetime,
FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario),
FOREIGN KEY (id_servico) REFERENCES tb_servico(id_servico));

insert into tb_usuario_servico values(2,1,'66','1.83','22',GETDATE(),'','');
--insert into tb_usuario_servico values(1,2,'','','',null,GETDATE(),GETDATE());


SELECT        
tb_usuario.nome_usuario,
tb_usuario.sobrenome_usuario,
tb_usuario.data_Nascimento,
tb_usuario.email, 
tb_usuario.data_Nascimento,
tb_usuario.sexo,
tb_servico.nome_servico, 
tb_servico.descricao, 
tb_usuario_servico.peso, 
tb_usuario_servico.altura, 
tb_usuario_servico.resultado, 
tb_usuario_servico.dt_atual
FROM           
 tb_servico INNER JOIN
 tb_usuario_servico ON tb_servico.id_servico = tb_usuario_servico.id_servico INNER JOIN
 tb_usuario ON tb_usuario_servico.id_usuario = tb_usuario.id_usuario

 -- select avg(horario_sono_fim - horario_sono_ini) from tb_usuario_servico 