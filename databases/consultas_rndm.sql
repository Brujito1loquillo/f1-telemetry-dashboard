show databases;
use f1telemetria;
show tables;
/* **************************************** *
 * RECOPILACION DE INFORMACION DE CIRCUITOS *
 * **************************************** */
update circuito set nombre = "Azerbayan", pais = "Azerbayan" where id = 20; -- pasar al fichero de creacion de la db
-- delete from circuito where id = 17; -- long: 4323 pit: 80 --  Ni idea de que circuito es

/* CONNFIRMADOS */
update circuito set nombre = "China", pais = "China" where id = 2;
update circuito set nombre = "Barein", pais = "Barein" where id = 3;
update circuito set nombre = "Barcelona-Catalunya / Montmelo", pais = "España" where id = 4;
update circuito set nombre = "Hungria", pais = "Hungria" where id = 9;
update circuito set nombre = "Monza", pais = "Italia" where id = 11;
update circuito set nombre = "Arabia Saudi", pais = "Arabia Saudi" where id = 29;
update circuito set nombre = "Catar", pais = "Catar" where id = 32;
update circuito set nombre = "Austria Inverso", pais = "Austria" where id = 40;
update circuito set nombre = "Zamboort Inverso", pais = "Holanda" where id = 41;
select * from circuito;

select * from sesion;
-- 10 - Belgica ?
-- 
select circuitoId, uid from sesion where circuitoId not in (
	2, 3, 4, 9, 11, 29, 31, 32, 40, 41
) and uid not in (
	13230788898168738931,15929351939921892105,1678760252547137362,6778675355917430559,7037039976247099510,16255041336025846454,891231099412765074,206017810398958312,1864810291842021278,16509879377027740714,17445207283850056036,
    12199349439267909203,4710681267069632524,14463937074756350810
);

/* ***************************************** *
 * CONSULTAS PARA EL GUARDADO DE LAS VUELTAS *
 * ***************************************** */
 
 