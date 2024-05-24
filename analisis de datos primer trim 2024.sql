-------------------analisis de datos primer trimestre 2024---------------- 
select cef.descripcion as esquema, 
sum(acciones) as acciones
from cubo_fovissste_bak cfb
join c_esquema_fovissste cef on cfb.id_esquema = cef.id 
where anio = 2024 and mes in (1,2,3)
group by cef.descripcion;

select clcf.descripcion  as esquema, 
sum(acciones) as acciones
from cubo_fovissste_bak cfb
join c_linea_credito_fovissste clcf on cfb.id_linea_credito = clcf.id 
where anio = 2024 and mes in (1,2,3)
group by clcf.descripcion;

select sum(acciones) from cubo_insus ci
where anio = 2024 --and mes in (1,2,3);

select sum(acciones) as "acciones shf" from cubo_financiamientos cf
where anio = 2024 and mes in (1,2,3) and cf.clave_organismo = '06610';

--infonavit
--Linea II
select cli.descripcion as linea, 
cs.descripcion as modalidad,
cei.descripcion,
sum(acciones) 
from cubo_infonavit_bak cib
join c_linea_infonavit cli on cib.id_linea = cli.id 
join c_subprograma cs on cib.id_modalidad = cs.id 
join c_esquema_infonavit cei on cib.id_esquema = cei.id 
where anio = 2024 and mes in (1,2,3) and cli.descripcion like 'Linea II'
group by cli.descripcion, cs.descripcion, cei.descripcion;

--LINEA III
select cli.descripcion as linea, 
cei.descripcion as esquema,
sum(acciones) as acciones
from cubo_infonavit_bak cib
join c_linea_infonavit cli on cib.id_linea = cli.id  
join c_esquema_infonavit cei on cib.id_esquema = cei.id 
where anio = 2024 and mes in (1,2,3) and cli.descripcion like 'Linea III'
group by cli.descripcion, cei.descripcion;

--Linea IV
select cli.descripcion as linea, 
cei.descripcion as esquema,
sum(acciones) as acciones
from cubo_infonavit_bak cib
join c_linea_infonavit cli on cib.id_linea = cli.id  
join c_esquema_infonavit cei on cib.id_esquema = cei.id 
where anio = 2024 and mes in (1,2,3) and cli.descripcion like 'Linea IV'
group by cli.descripcion, cei.descripcion;

--Linea V
select cli.descripcion as linea, 
sum(acciones) as acciones
from cubo_infonavit_bak cib
join c_linea_infonavit cli on cib.id_linea = cli.id
where anio = 2024 and mes in (1,2,3) and cli.descripcion like 'Linea V'
group by cli.descripcion;

-- CONAVI
select cpp.descripcion as "Programa presupuestal",
css.descripcion as modalidad,
sum(ccb.acciones) as aciones
from cubo_conavi_bak ccb 
join c_programa_presupuestal cpp on ccb.id_programa_presupuestal = cpp.id 
join c_subprograma_sniiv css on ccb.id_modalidad = css.id 
where anio = 2024 and mes in (1,2,3) and ccb.id_programa_presupuestal in (10,3,7,4)
group by cpp.descripcion, css.descripcion;
