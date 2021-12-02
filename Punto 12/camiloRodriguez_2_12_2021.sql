create database camiloRodriguez_2_12_2021;
use camiloRodriguez_2_12_2021;

create table paciente(
	idPaciente varchar(255) not null,
    fechaNacimiento date not null,
    seguridadSocial varchar(50),
    telefono varchar(20) not null,
	primerNombre varchar(50) not null,
    segundoNombre varchar(50),
	primerApellido varchar(50) not null,
    segundoApellido varchar(50) not null,
    calle varchar(255) not null,
    numero varchar(4) not null,
	piso varchar(3) not null,

	primary key(idPaciente)
);

create table farmacos(
	numeroRegistroFarmaco varchar(50) not null,
    cantidadDosis int not null,
    nombreClinico varchar(100) not null,
    codigoProveedor varchar(100) not null,
    nombreComercial varchar(100) not null,
    precioTotal decimal not null,
    precioUnidosis decimal not null default(precioTotal/cantidadDosis),
    compuestoQuimico varchar(500) not null,
    ubicacion varchar(50) not null,

	primary key(numeroRegistroFarmaco)
);

create table facultativos(
	numeroColegiado varchar(255) not null,
	telefono varchar(20) not null,
	primerNombre varchar(50) not null,
    segundoNombre varchar(50),
	primerApellido varchar(50) not null,
    segundoApellido varchar(50) not null,
    calle varchar(255) not null,
    numero varchar(4) not null,
	piso varchar(3) not null,
    
	primary key(numeroColegiado)
);

create table ingreso(
	idPaciente  varchar(255) not null,
	consecutivo  int not null, 
	fechaIngreso  datetime not null,
	fechaAlta datetime,
	diagnostico varchar(500) not null,
    costoDiagnostico decimal not null,
    
    numeroColegiado varchar(50) not null,
    
	primary key(idPaciente , consecutivo),
	foreign key(idPaciente) references paciente(idPaciente),
	constraint fk_ingreso
	foreign key(numeroColegiado) references facultativos(numeroColegiado)
);

create table servicio(
	tipoServicio varchar(150) not null,
    costoServicio varchar(50) not null,
    numeroColegiado varchar(255) not null,
    
    primary key(tipoServicio),
    foreign key(numeroColegiado) references facultativos(numeroColegiado)
);

create table informeConsumo(
	informeConsumoId  varchar(50) not null,
	fechaConsumo  datetime not null,
    
    tipoServicio varchar(150) not null,
    idPaciente  varchar(255) not null,
    
	consecutivo  int,
    
	primary key(informeConsumoId),
    foreign key(tipoServicio) references servicio(tipoServicio),
    constraint fk_informeConsumo
	foreign key(idPaciente, consecutivo) references ingreso(idPaciente,consecutivo)
);

create table informeConsumo_farmacos(
	informeConsumoId  varchar(50) not null,
    numeroRegistroFarmaco varchar(50) not null,
    cantidadDosisAdministradas int not null,

	primary key(informeConsumoId, numeroRegistroFarmaco),
    foreign key(informeConsumoId) references informeConsumo(informeConsumoId),
    constraint fk_informeConsumo_farmacos
    foreign key(numeroRegistroFarmaco) references farmacos(numeroRegistroFarmaco)
);
