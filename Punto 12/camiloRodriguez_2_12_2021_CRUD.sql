use camiloRodriguez_2_12_2021;

/*Create*/

insert into paciente values("1255col", "1989/05/10", "5682250sh", "3050045121", "Carlos", "Andres", "Villegas", "Gomez", "Carrera 25 #35a", "202", "1");
insert into farmacos values("11", 100, "Curas", "10211med", "Curas", 10000, 100, "Plastico y pegante", "12Fk15");
insert into facultativos values("511med", "3134060943",	"Juana","", "Torres", "Vergara", "Calle 12 – 20f","10","10");
insert into ingreso values("1255col", 12, "2021/11/30 13:25:12", "2021/12/01 11:25:12", "Cita oftamologica", 200000, "502med");
insert into servicio values("Emergencias2.1","50000","511med");
insert into informeConsumo values("5b", "2021/11/30 13:35:12", "Oftalmologia", "1255col",12);
insert into informeConsumo_farmacos values("5b", "11", 2);

/*Read*/
select * from paciente;
select concat(primerNombre, ' ', segundoNombre) As "Nombre Cliente" from paciente;
select nombreClinico, nombreComercial, precioUnidosis from farmacos;
select * from facultativos;
select * from ingreso;
select * from servicio;
select * from informeConsumo;
select * from informeConsumo_farmacos;

/*Update*/

update paciente set segundoNombre = "Maria" where idpaciente = "1247col";
update farmacos set nombreComercial = "Cure band" where numeroRegistroFarmaco = "11";
update facultativos set primerNombre = "Juliana" where numeroColegiado = "511med";
update ingreso set fechaIngreso = "2021/11/30 13:25:13", fechaAlta =  "2021/12/01 11:27:10" where idPaciente = "1255col";
update servicio set tipoServicio = "Emergencias3" where tipoServicio = "Emergencias2.1";
update informeConsumo set fechaConsumo = "2021/11/30 13:38:58" where informeConsumoID = "5b";
update informeConsumo_farmacos set cantidadDosisAdministradas = 4 where informeConsumoID = "5b";

/*Delete*/

delete from informeConsumo_farmacos where informeConsumoID = "5b";
delete from informeConsumo where informeConsumoID = "5b";
delete from servicio where tipoServicio = "Emergencias3";
delete from ingreso where idPaciente = "1255col";
delete from facultativos where numeroColegiado = "511med";
delete from farmacos where numeroRegistroFarmaco = "11";
delete from paciente where idpaciente = "1255col";
