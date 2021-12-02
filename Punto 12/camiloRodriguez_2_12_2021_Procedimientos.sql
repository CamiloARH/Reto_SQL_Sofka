use camiloRodriguez_2_12_2021;


DELIMITER $$
create procedure sp_insertar_paciente(
	in idPaciente varchar(255),
    in fechaNacimiento date,
    in seguridadSocial varchar(50),
    in telefono varchar(20),
	in primerNombre varchar(50),
    in segundoNombre varchar(50),
	in primerApellido varchar(50),
    in segundoApellido varchar(50),
    in calle varchar(255),
    in numero varchar(4),
	in piso varchar(3)
)
begin
	insert into paciente values(
		idPaciente,
		fechaNacimiento,
		seguridadSocial,
		telefono,
		primerNombre,
		segundoNombre,
		primerApellido,
		segundoApellido,
		calle,
		numero,
		piso
	);
end$$
DELIMITER ;
call sp_insertar_paciente("1256col", "1987/05/10", "5682251sh", "3750049128", "Juan", "Carlos", "Casa", "Gomez", "Carrera 255 #35c", "8", "5");

DELIMITER $$
create procedure sp_mostrar_pacientes()
begin
	select
		p.idPaciente as "ID",
		p.fechaNacimiento as "Fecha de Nacimiento",
		p.seguridadSocial as "Seguridad Social",
		p.telefono as "Telefono",
		p.primerNombre as "Nombre",
		p.segundoNombre as "Segundo Nombre",
		p.primerApellido as "Primer Apellido",
		p.segundoApellido as "Segundo Apellido",
		p.calle as "Calle",
		p.numero as "Numero",
		p.piso as "Piso"
	from
		paciente p;    
end$$
DELIMITER ;
call sp_mostrar_pacientes();

drop procedure if exists sp_borrar_pacientes
DELIMITER $$
create procedure sp_borrar_pacientes(
	in id varchar(255)    
)
begin
	delete
		from
			paciente p
		where
			p.idpaciente = id           
            ;    
end$$
DELIMITER ;
call sp_borrar_pacientes("1256col");
