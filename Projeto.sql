--Criando cadastro Associados
CREATE TABLE Associados
( Id_Associados int identity(1,1) primary key,
  Nome_as varchar(200) not null ,
  Cpf varchar (11) not null,
  Data_Nascimento datetime
);

--drop table Associados;

--Criando cadastro de Empresas
CREATE TABLE Empresas
(Id_Empresas int identity(1,1) primary key,
Nome_em varchar(200) not null,
CNPJ varchar (14) not null
);

--drop table Empresas;

--Criando relacionamento N:N
CREATE TABLE Em_AS_V
( id_em int , 
  id_as int ,
 );

 --drop table Em_As_V;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Visualização de restrições
select A.Id_Associados ,A.Nome_as, E.id_Empresas, E.Nome_em,A.Data_Nascimento as Cliente_Nascel
from Associados a
inner join DBO.EMPRESAS E ON A.Id_Associados = e.Id_Empresas;

select A.id_associados, A.Nome_as, a.Cpf, a.Data_Nascimento,  
       e.nome_em,Cnpj
from  Associados a, Empresas e
order by 4 asc;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Criando chave estrangeira para empresas vinculadas
alter table EM_AS_V
ADD CONSTRAINT fk_Empresas foreign key (id_em) references empresas (id_empresas);

--Criando chave estrangeira para associados vinculados
alter table EM_AS_V
ADD CONSTRAINT fk_Associado foreign key (id_as) references associados(id_associados);

/*ALTER TABLE EM_AS_V
DROP CONSTRAINT fk_Associado;

ALTER TABLE EM_AS_V
DROP CONSTRAINT FK_EMPRESAS;*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Incerindo informações tabela Associados
insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Joana Andrade de Alcantara','674.961.454','12/03/1995');

insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Paula Alcantara','674.961.454',11/03/1988);

insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Fernanda Monte Negro','674.961.454',15/02/1999);

insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Luana Piovane','674.961.454',14/05/1998);

insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Paulo Andrade da Cunha','684.941.444',11/08/2000);

insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Neuda Fernandes','014.541.474',15/08/1999);

insert into Associados(Nome_as,Cpf,Data_Nascimento) values
('Luana Andrade da Rocha','674.011.454',14/04/1998);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Incerindo informações tabela Empresas
insert into Empresas(Nome_em,CNPJ) values
('LPCV',' 15.774.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Uece',' 15.774.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Ufc',' 15.774.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Ufrj',' 15.774.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Mc Donalds',' 15.714.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Ibyte',' 15.654.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Nagem',' 15.720.446/01');

insert into Empresas(Nome_em,CNPJ) values
('Coca-Cola',' 15.745.446/01');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Incerindo informações tabela Em_AS_V
insert into Em_AS_V (id_em,id_as) values 
(1,2);
insert into Em_AS_V (id_em,id_as) values 
(2,1);
insert into Em_AS_V (id_em,id_as) values 
(3,2);
insert into Em_AS_V (id_em,id_as) values 
(4,1);
insert into Em_AS_V (id_em,id_as) values 
(4,2);
insert into Em_AS_V (id_em,id_as) values 
(7,4);
insert into Em_AS_V (id_em,id_as) values 
(6,5);
insert into Em_AS_V (id_em,id_as) values 
(8,5);
insert into Em_AS_V (id_em,id_as) values 
(5,7);
insert into Em_AS_V (id_em,id_as) values 
(7,5);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 

Select *From Empresas;
Select * From Associados;
Select* From Em_AS_V;

--Associados Vinculados Com Empresas
Select ea.id_em as Id_Empresa, e.Nome_em AS Empresa,ea.id_as as Id_Associado,
a.Nome_as as Cliente,CONCAT(a.Cpf ,' - ', e.CNPJ) as "CPF - CNPJ"
from Em_AS_V ea
inner join dbo.Associados a on a.Id_Associados = ea.id_as
inner join dbo.Empresas e on e.Id_Empresas = ea.id_em
group by e.Nome_em,a.Nome_as,a.Cpf,e.CNPJ,ea.id_as,ea.id_em;

--Associados que Não estão vinculados a Empresa
Select ea.id_em as Id_Empresa, e.Nome_em AS Empresa,ea.id_as as Id_Associado,
a.Nome_as as Cliente,CONCAT (a.Cpf,' - ',e.CNPJ) as "CPF - CNPJ"
from Em_AS_V ea
inner join dbo.Associados a on a.Id_Associados <> ea.id_as
inner join dbo.Empresas e on e.Id_Empresas <> ea.id_em
group by e.Nome_em,a.Nome_as,a.Cpf,e.CNPJ,ea.id_as,ea.id_em;



--Consulta id Empresas

select *  
from Empresas e
where e.Id_Empresas = '1';

--Consulta por id de Associados

select *  
from Associados a
where a.Id_Associados = '1';