create table locais(
id serial primary key,
nome varchar(200) not null, 
endereco varchar(1000) not null, 
capacidade int not null default 1 check(capacidade>=1)
); 

create table eventos(
id serial primary key not null,  
nome varchar(200), 
data date not null CHECK (data > CURRENT_DATE),
local_id int not null, 
foreign key(local_id) references locais (id),
ativo boolean not null default true
) 

select * from locais;
select * from eventos;

insert into locais (nome, endereço, capacidade) 
values ('Faculdade', 'Rua da felicidade', 100);
insert into locais (nome, endereço, capacidade) 
values ('Lab365', 'Rua do Iano', 200);

insert into eventos (nome, data, ativo, local_id) 
values ('bingo universitário', '2024-03-26',true, 1);
insert into eventos (nome, data, ativo, local_id) 
values ('palestra', '2024-04-05', true, 2);

select
e.nome as nome_evento,
e.data,
l.nome as nome_local,
l.capacidade
from eventos as e
inner join locais as l
on e.local_id = l.id