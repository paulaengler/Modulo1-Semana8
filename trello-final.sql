create table Departamento(
id serial primary key not null,
nome varchar(200) not null,
dataCriacao date not null
);

select * from departamento

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


insert into departamento (nome, dataCriacao) 
values ('Financeiro', '2024-01-01');
insert into departamento (nome, dataCriacao) 
values ('Comercial', '2023-02-11');
insert into departamento (nome, dataCriacao) 
values ('RH', '2022-10-05');

insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Paula', 39, 'Farmacêutica', 5000, 1);
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Davy', 40, 'Enfermeiro', 4000, 2);
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Beatriz', 29, 'Médica', 15000, 3);

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

select * from funcionarios as f inner join departamento as d
on f.iddepartamento = d.id

update funcionarios set idade = 18 where id = 3
update departamento set nome = 'Direção' where id = 2

delete from funcionarios where idDepartamento = 1

drop table funcionarios
drop table departamento
