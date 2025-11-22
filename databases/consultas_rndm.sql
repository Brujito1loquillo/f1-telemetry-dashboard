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
update circuito set nombre = "Red Bull Ring", pais = "Austria" where id = 17;
update circuito set nombre = "Autodromo internacional Hermanos Rodriguez", pais = "Mexico" where id = 19;
-- update circuito set nombre = "Azerbayan", pais = "Azerbayan" where id = 20; -- pasar al fichero de creacion de la db
update circuito set nombre = "Arabia Saudi", pais = "Arabia Saudi" where id = 29;
update circuito set nombre = "Miami", pais = "Estados Unidos" where id = 30;
update circuito set nombre = "Catar", pais = "Catar" where id = 32;
update circuito set nombre = "Red Bull Ring Inverso", pais = "Austria" where id = 40;
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
update equipo set nombre = "MP 25" where id = 215; -- CONFIRMADO;
update equipo set nombre = "Invicata 25" where id = 219; -- CONFIRMADO;
-- update equipo set nombre = "Rendimiento equivalente" where id = 1000;
select * from equipo;
delete from equipo where id in (0, 1, 2, 3, 5, 6, 7, 8, 9, 1000);
select * from equipo where id not in (
	0, 1000
);

/* UPDATES RAPIDAS */
update circuito set nombre = "Suzuka", pais = "Japon" where id = 13;
update equipo set nombre = "Hytech 25" where id = 214;
update equipo set nombre = "Prema 25" where id = 216;
update equipo set nombre = "Dams 25" where id = 213;
update circuito set nombre = "Imola", pais = "Italia" where id = 27;
update equipo set nombre = "ART 25" where id = 209;
update equipo set nombre = "Rodin 25" where id = 211;
update equipo set nombre = "AIX 25" where id = 212;
update equipo set nombre = "Trident 25" where id = 217;
update equipo set nombre = "VAR 25" where id = 218;
update equipo set nombre = "ART 24" where id = 158;
update equipo set nombre = "Prema 24" where id = 165;
update equipo set nombre = "Rodin 24" where id = 160;
update equipo set nombre = "Dams 24" where id = 162;
update equipo set nombre = "Invicta 24" where id = 168;
update equipo set nombre = "MP 24" where id = 164;
update equipo set nombre = "VAR 24" where id = 167;
update equipo set nombre = "Hitech 24" where id = 163;
update equipo set nombre = "Campos 24" where id = 159;
update equipo set nombre = "Trident 24" where id = 166;
update equipo set nombre = "PHM -> AIX 24" where id = 161;
insert into equipo values (129, "Konnersport");
update equipo set nombre = "APX GP" where id = 142;
-- EL EQUIPO 255 ha aparecido al hacer el test en silverstone de F1 LA PAELICULA sUID: 13760912565783648145
describe sesion;
alter table sesion modify tipo int null;

/* CONSULTAS RAPIDAS */
-- select * from circuito;
-- select * from circuito order by pais;
select * from circuito where pais is not null;
select * from circuito where pais is null;
select * from equipo;
select * from equipo where id > 9;
select * from equipo where id > 104 and id < 209;
-- select * from sesion;
select circuitoId, uid from sesion where circuitoId not in (
	0, 2, 3, 4, 9, 11, 13, 15, 16, 17, 19, 27, 29, 30, 31, 32, 40, 41
) and uid not in (
	13230788898168738931,15929351939921892105,1678760252547137362,6778675355917430559,7037039976247099510,16255041336025846454,891231099412765074,206017810398958312,1864810291842021278,16509879377027740714,17445207283850056036,
    12199349439267909203,4710681267069632524,14463937074756350810,10209459912444528057,14651950656740999228,13760912565783648145,4528472083073053233,6476286035685145569,8930011358685797355,10800285758750506205,4014983991911290662,
    7627437405711297536,8913332802210137238
);

/* ***************************************** *
 * CONSULTAS PARA EL GUARDADO DE LAS VUELTAS *
 * ***************************************** */

/* STORE PARTICIPANTS */
show tables;
select * from sesion;
describe sesion;
select * from sesionParticipaPiloto;
describe sesionParticipaPiloto;
select * from piloto;
describe piloto;