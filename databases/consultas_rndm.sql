show databases;
use f1telemetria;
show tables;
/* **************************************** *
 * RECOPILACION DE INFORMACION DE CIRCUITOS *
 * **************************************** */
update circuito set nombre = "Albert Parck - Melbourne", pais = "Australia" where id = 0;
update circuito set nombre = "China", pais = "China" where id = 2;
update circuito set nombre = "Barein", pais = "Barein" where id = 3;
update circuito set nombre = "Barcelona-Catalunya / Montmelo", pais = "España" where id = 4;
update circuito set nombre = "Hungria", pais = "Hungria" where id = 9;
update circuito set nombre = "Monza", pais = "Italia" where id = 11;
update circuito set nombre = "Interlagos / Sao Paulo", pais = "Brasil" where id = 16;
-- delete from circuito where id = 17; -- long: 4323 pit: 80 --  Ni idea de que circuito es
update circuito set nombre = "Autodromo internacional Hermanos Rodriguez", pais = "Mexico" where id = 19;
-- update circuito set nombre = "Azerbayan", pais = "Azerbayan" where id = 20; -- pasar al fichero de creacion de la db
update circuito set nombre = "Arabia Saudi", pais = "Arabia Saudi" where id = 29;
update circuito set nombre = "Miami", pais = "Estados Unidos" where id = 30;
update circuito set nombre = "Catar", pais = "Catar" where id = 32;
update circuito set nombre = "Austria Inverso", pais = "Austria" where id = 40;
update circuito set nombre = "Zamboort Inverso", pais = "Holanda" where id = 41;
select * from circuito;
select * from circuito order by pais;

select * from sesion;
-- 10 - Belgica ?
-- 15 - Belgica ? Texas ?
-- 
select circuitoId, uid from sesion where circuitoId not in (
	0, 2, 3, 4, 9, 11, 16, 19, 29, 30, 31, 32, 40, 41
) and uid not in (
	13230788898168738931,15929351939921892105,1678760252547137362,6778675355917430559,7037039976247099510,16255041336025846454,891231099412765074,206017810398958312,1864810291842021278,16509879377027740714,17445207283850056036,
    12199349439267909203,4710681267069632524,14463937074756350810,10209459912444528057,14651950656740999228
);
/* ******* *
 * EQUIPOS *
 * ******* */
-- update equipo set nombre = "Sin rival en (Time Trial)" where id = 0;
update equipo set nombre = "Mercedes" where id = 0; -- CONFIRMADO
update equipo set nombre = "Ferrari" where id = 1; -- CONFIRMADO
update equipo set nombre = "Red Bull" where id = 2; -- CONFIRMADO
update equipo set nombre = "Williams" where id = 3; -- CONFIRMADO
update equipo set nombre = "Aston Martin" where id = 4; -- CONFIRMADO
update equipo set nombre = "Alpine" where id = 5; -- CONFIRMADO
update equipo set nombre = "Racing Bulls" where id = 6; -- CONFIRMADO
update equipo set nombre = "Haas" where id = 7; -- CONFIRMADO
update equipo set nombre = "McLaren" where id = 8; -- CONFIRMADO
update equipo set nombre = "Sauber" where id = 9; -- CONFIRMADO
update equipo set nombre = "F1 World Generic" where id = 104; -- CONFIRAMDO
update equipo set nombre = "Campos 25" where id = 210; -- CONFIRMADO
update equipo set nombre = "Invicata 25" where id = 219; -- CONFIRMADO;
-- update equipo set nombre = "Rendimiento equivalente" where id = 1000;
select * from equipo;
delete from equipo where id in (0, 1, 2, 3, 5, 6, 7, 8, 9, 1000);
select * from equipo where id not in (
	0, 1000
);

/* CONSULTAS RAPIDAS */
select * from circuito;
select * from circuito order by pais;
select * from equipo;
select * from equipo where id > 9;
select * from sesion;
select circuitoId, uid from sesion where circuitoId not in (
	0, 2, 3, 4, 9, 11, 16, 29, 30, 31, 32, 40, 41
) and uid not in (
	13230788898168738931,15929351939921892105,1678760252547137362,6778675355917430559,7037039976247099510,16255041336025846454,891231099412765074,206017810398958312,1864810291842021278,16509879377027740714,17445207283850056036,
    12199349439267909203,4710681267069632524,14463937074756350810,10209459912444528057,14651950656740999228
);

/* ***************************************** *
 * CONSULTAS PARA EL GUARDADO DE LAS VUELTAS *
 * ***************************************** */

