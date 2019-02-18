--
create database db_autoescola;
--
create table tb_usuarios (
id_usuario int primary key auto_increment,
tx_nome varchar(30) not null,
tx_email varchar(60) not null unique key,
tx_senha varchar(30) not null,
dt_criacao timestamp default current_timestamp
);
--
select * from tb_usuarios;
describe tb_usuarios;
--
insert into tb_usuarios (tx_nome, tx_email, tx_senha)
values ("Matheus Pereira", "matheusrmartins@outlook.com", "123123");
--
create table tb_alunos (
id_aluno int primary key auto_increment,
tx_nome varchar(50) not null,
tx_telefone varchar(15),
tx_email varchar(60),
tx_cpf varchar(11) unique key,
nr_cep int (8),
tx_logradouro varchar(60),
nr_numero int(6),
tx_complemento varchar(20),
tx_bairro varchar(50),
tx_cidade varchar(30),
dt_criacao timestamp default current_timestamp
); 
--
insert into tb_alunos (tx_nome,tx_telefone,
                       tx_email,tx_cpf,nr_cep,tx_logradouro,
                       nr_numero,tx_complemento,tx_bairro,tx_cidade)
values ("Cláudio Roberto da Silva Castro Pereira Junior","(13) 99130-4811",
        "claudiorobertoscastro@gmail.com","29466060074",11075270,"Rua Dr. Cesário Bastos",
        26,"Casa 1","Vila Belmiro","Santos");
--
select * from tb_alunos;
--
create table tb_professores (
id_professor int primary key auto_increment,
tx_nome varchar(30) not null,
tx_cpf varchar(11) not null unique key
); 
--
insert into tb_professores (tx_nome, tx_cpf)
values ("Benner","66355860088");
--
create table tb_veiculos (
id_veiculo int primary key auto_increment,
tx_modelo varchar(20) not null,
tx_cor varchar(15) not null,
tx_placa varchar(10) not null unique key,
tx_descricao varchar(40),
tx_categoria varchar(15) not null CHECK (tx_categoria IN ('Carro','Moto'))
); 
--
insert into tb_veiculos (tx_modelo, tx_cor, tx_placa, tx_descricao, tx_categoria)
values ("HB-20","Prata","FGD-4827","","Carro");
select * from tb_veiculos;
--
create table tb_aulas (
id_aula int primary key auto_increment,
id_aluno int not null,
id_usuario int not null,
id_professor int not null,
id_veiculo int not null,
dt_dia_aula date not null,
dt_hora_aula time not null,
dt_criacao timestamp default current_timestamp,
foreign key(id_aluno) references tb_alunos(id_aluno),
foreign key(id_usuario) references tb_usuarios(id_usuario),
foreign key(id_professor) references tb_professores(id_professor),
foreign key(id_veiculo) references tb_veiculos(id_veiculo)
); 
--
insert into tb_aulas (id_aluno,id_usuario, id_professor,id_veiculo,dt_dia_aula,dt_hora_aula)
values (1,1,1,3,"19-03-01", "17:00:00");

select * from tb_aulas;