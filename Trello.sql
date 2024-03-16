/* [M1S08] Descrição dos exercícios da semana
Os exercícios da semana tem por finalidade a prática dos conceitos vistos em sala sobre bancos de dados.

Serão criadas duas classes: Funcionários e Departamento. Estas classes terão um relacionamento entre si. Os exercícios devem ser feitos em sequência.

Os exercícios devem ser realizados usando o PgAdmin e os comandos SQL utilizados devem ser copiados como resposta nos cards.*/


/* [M1S08] Ex. 1 - Criação tabela Departamento
Crie uma tabela chamada Departamento. A tabela deve conter as seguintes colunas:

id (chave primária, tipo serial)
nome (texto) - não nulo
dataCriacao(data) - não nulo */

create table Departamento(
id serial primary key not null,
nome varchar(200) not null,
dataCriacao date not null
);

select * from departamento

/*[M1S08] Ex. 2 - Criação tabela Funcionarios
Crie uma tabela chamada Funcionarios. A tabela deve conter as seguintes colunas:

id (chave primária, tipo serial)
nome (texto) - não nulo
idade (inteiro) - não nulo
cargo (texto) - não nulo
salario (decimal) - não nulo
idDepartamento (inteiro) - não nulo - chave estrangeira tabela Departamento*/

create table Funcionarios(
id serial primary key not null,
nome text not null,
idade int not null, 
check(idade >= 14),
cargo text not null,
salario decimal (10,4) not null,
idDepartamento int not null,
foreign key(idDepartamento) references Departamento (id)
);

select * from funcionarios

/* [M1S08] Ex. 3 - Inserindo valores na tabela Departamento
Crie três registros na tabela Departamento. */

insert into departamento (nome, dataCriacao) 
values ('Financeiro', '2024-01-01');
insert into departamento (nome, dataCriacao) 
values ('Comercial', '2023-02-11');
insert into departamento (nome, dataCriacao) 
values ('RH', '2022-10-05');

/* [M1S08] Ex. 4 - Inserindo valores na tabela Funcionários
Crie três registros na tabela Funcionarios. 
Lembre-se de adicionar um idDepartamento válido.*/

insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Paula', 39, 'Farmacêutica', 5000, 1);
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Davy', 40, 'Enfermeiro', 4000, 2);
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Beatriz', 29, 'Médica', 15000, 3);

/* [M1S08] Ex. 5 - Lendo valores das tabelas
Crie uma consulta usando o JOIN para exibir os dados da tabela Funcionarios junto as informações da tabela Departamento */

select
f.id as identificação,
d.nome,
d.dataCriacao as DataCriacao1,
f.nome, 
f.idade, 
f.cargo, 
f.salario
from funcionarios as f
inner join departamento as d
on f.idDepartamento = d.id

OU

select * from funcionarios as f inner join departamento as d
on f.iddepartamento = d.id

/*[M1S08] Ex. 6 - Atualizando valores
Crie um script de update para atualizar um registro na tabela Funcionarios e um na tabela de Departamento. 
O dado a ser deve ser o nome do Departamento e a idade do Funcionario */

update funcionarios set idade = 18 where id = 3
update departamento set nome = 'Direção' where id = 2

/*[M1S08] Ex. 7 - Removendo valores
Crie um script de delete para remover registros da tabela Funcionarios e Departamento.

O delete na tabela Funcionarios deve remover somente o registro na própria tabela. Porém ao usar o delete na tabela Departamento deve 
ser removido todos os registros na tabela Funcionarios que contenha uma referência a chave estrangeira idDepartamento, 
ou seja, remover todos os funcionários que foram cadastrados naquele departamento. */

delete from funcionarios where idDepartamento = 1

/*[M1S08] Ex. 8 - Apagando as tabelas
Crie um script para apagar a tabela Funcionarios e a tabela Departamento.*/

drop table funcionarios
drop table departamento
