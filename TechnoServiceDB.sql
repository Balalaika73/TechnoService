create database TechnoService

use TechnoService

create table roles (
	idRole int not null primary key,
	nameRole VARCHAR(15)
);

create table typeEquip (
	idtypeEquip int not null primary key,
	nametypeEquip VARCHAR(50)
);

create table typeProblem (
	idtypeProblem int not null primary key,
	nametypeProblem VARCHAR(50)
);


create table users (
	idUser int not null primary key,
	userLogin VARCHAR(32) not null,
	userPassword VARCHAR(32) not null,
	roleId int not null,
	FOREIGN KEY (roleId) REFERENCES roles (idRole)
);

create table equipment (
	idEquip int not null primary key,
	serialNumb varchar(8) not null,
	typeEquipId int not null,
	FOREIGN KEY (typeEquipId) REFERENCES typeEquip (idtypeEquip)
);

create table respPriority(
	idNamePrior int not null primary key,
	namePrior varchar (15) not null
);

create table statuses (
	idNameStat int not null primary key,
	nameStat varchar (15) not null
);

create table response (
	idResponse int not null primary key,
	dateResponse date not null,
	numbResponse varchar(8) not null,
	equipId int not null,
	discr varchar (200) not null,
	userId int not null,
	statusId int not null,
	priorId int null,
	typeProblemId int not null,
	FOREIGN KEY (equipId) REFERENCES equipment (idEquip),
	FOREIGN KEY (userId) REFERENCES users (idUser),
	FOREIGN KEY (statusId) REFERENCES statuses (idNameStat),
	FOREIGN KEY (priorId) REFERENCES respPriority (idNamePrior),
	FOREIGN KEY (typeProblemId) REFERENCES typeProblem (idtypeProblem)
);