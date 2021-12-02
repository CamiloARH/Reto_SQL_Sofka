use camiloRodriguez_2_12_2021;

drop view if exists vista_cliente_costos;
create view vista_cliente_costos as
select
	concat(p.primerNombre, ' ', p.segundoNombre) as "Nombre Cliente",
    concat(p.idpaciente, '-', i.consecutivo) as "Historial Medico",
    concat(fac.primerNombre,' ', fac.segundoNombre) as "Nombre Especialista",
    i.costoDiagnostico as "Costo Diagnostico",
    s.tipoServicio as "Consulta",
    s.costoServicio as "Costo Servicio",
    sum(f.precioUnidosis*icf.cantidadDosisAdministradas) as "Costo Medicamento",
    i.costoDiagnostico + s.costoServicio + sum(f.precioUnidosis*icf.cantidadDosisAdministradas) as "Total a Pagar"
    
from 
	paciente p inner join ingreso i on p.idpaciente = i.idpaciente
    inner join facultativos fac on i.numeroColegiado = fac.numeroColegiado
    inner join servicio s on fac.numeroColegiado = s.numeroColegiado    
    inner join informeConsumo ic on s.tipoServicio = ic.tipoServicio
    inner join informeConsumo_farmacos icf on ic.informeConsumoId = icf.informeConsumoId
    inner join farmacos f on icf.numeroRegistroFarmaco = f.numeroRegistroFarmaco 
group by
	ic.fechaConsumo  
;
select* from vista_cliente_costos;

drop view if exists vista_servicios_costos;
create view vista_servicios_costos as
select
	concat(fac.primerNombre,' ', fac.segundoNombre) as "Nombre Especialista",
	s.tipoServicio as "Consulta",
    s.costoServicio as "Costo Servicio",
    sum(f.precioUnidosis*icf.cantidadDosisAdministradas) as "Costo Medicamento",
    s.costoServicio + sum(f.precioUnidosis*icf.cantidadDosisAdministradas) as "Total a Pagar"

from 
	facultativos fac inner join servicio s on fac.numeroColegiado = s.numeroColegiado    
    inner join informeConsumo ic on s.tipoServicio = ic.tipoServicio
    inner join informeConsumo_farmacos icf on ic.informeConsumoId = icf.informeConsumoId
    inner join farmacos f on icf.numeroRegistroFarmaco = f.numeroRegistroFarmaco 
group by
	ic.fechaConsumo  
;
select* from vista_servicios_costos