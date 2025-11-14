show databases;
create database if not exists f1telemetria CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
show databases;
use f1telemetria;
show tables;

drop table if exists teams;
-- Version 1: Sin ver datos
/* create table if not exists teams (
	id int auto_increment,
    name varchar(100) not null,
    short_name varchar(10),
    country varchar(50),
    color varchar(10),
    created_at timestamp default current_timestamp,
    
    constraint PK_teams primary key (id)
);
*/
-- Version 3: Con los datos en fichero de eventos
create table if not exists equipo (
	id int not null,
    name varchar(250) default null,
    
    constraint PK_equipo primary key (id)
);
select * from teams;

drop table if exists drivers;
-- Version 1: Sin ver datos
/* create table if not exists drivers (
	id int auto_increment,
    name varchar(100) not null,
    code varchar(3) not null,
    number int,
    nationality varchar(50),
    team_id int,
    created_at timestamp default current_timestamp,
    
    constraint PK_drivers primary key (id),
    constraint FK_drivers_team_id foreign key (team_id) references teams(id)
);
*/
-- Version 3: Con los datos en fichero de eventos
create table if not exists poloto (
	name varchar(250) not null,
    raceNumber int not null,
    nationality int not null,
    
    constraint PK_piloto primary key (name)
);
select * from drivers;

drop table if exists tracks;
-- Version 1: Sin ver datos
/* create table if not exists tracks (
	id int auto_increment,
    name varchar(100) not null,
    location varchar(100),
    country varchar(50),
    length_km decimal(5,2),
    turns int,
    created_at timestamp default current_timestamp,
    
    constraint PK_tracks primary key (id)
); */
-- Version 3: Con los datos en fichero de eventos
create table if not exists circuito (
	id int not null,
    name varchar(50) default null,
    country varchar(50) default null,
    length int not null,
    pitSpeedLimit int not null,
    
    constraint PK_circuito primary key (id)
);
select * from tracks;

show tables;

drop table if exists sessions;
-- Version 1: Sin ver datos
/* create table if not exists sessions (
	id int auto_increment,
    track_id int not null,
    session_type enum("Practice", "Qualifying", "Sprint", "Race") not null,
    session_name varchar(50),
    session_date datetime default current_timestamp,
    weather enum("Dry", "Wet", "Mixed") default "Dry",
    air_temp decimal(4,1),
    track_temp decimal(4,1),
    laps_total int,
    created_at timestamp default current_timestamp,
    
    constraint PK_sessions primary key (id),
    constraint FK_sessions_track_id foreign key (track_id) references tracks(id)
);
*/
-- Version 3: Con los datos en fichero de eventos
create table if not exists sesion (
	uid varchar(20) not null,
    sessionType int not null, -- 18 -> TimeTrial
    trakId int, -- 19 -> Mexico
    weather int not null, -- 0 -> Despejado
    playerCarIndex int not null, -- Por si fuera necesario
    totalLaps int not null, -- 1 -> TimeTrial
    teamId int default null,    -- 7 -> Williams, 8 -> Haas
    -- trackTemperature int not null,
    -- airTemperature int not null,
	-- game int,
    -- packetFormat int,
	createdAt timestamp default current_timestamp,
    
    -- CHAPUZA TEMPORAL
    circuitLength int not null,
    circuitPitSpeedLimit int not null,
    
    constraint PK_sesion primary key (uid),
    constraint FK_sesion_trackID foreign key (trackId) references circuito (id)
);
select * from sessions;

delimiter $$

create trigger bi_sesion before insert on sesion
for each row
begin
	if not exists (select 1 from circuito where id = NEW.trackId) then
		insert into circuito (id, length, pitSpeedLimit) values (NEW.trackId, NEW.circuitLength, NEW.circuitPitSpeedLimit);
	end if;
end$$

delimiter ;

drop table if exists laps;
-- Version 1: Sin ver datos
/* create table if not exists laps (
    id int auto_increment,
    session_id int not null,
    driver_id int not null,
    lap_number int not null,
    lap_time_ms int, -- tiempo total en milisegundos
    sector1_ms int,
    sector2_ms int,
    sector3_ms int,
    tyre_compound ENUM('Soft', 'Medium', 'Hard', 'Inter', 'Wet'),
    is_valid boolean default true,
    is_fastest boolean default false,
    created_at timestamp default current_timestamp,
    
    constraint PK_laps primary key (id),
    constraint FK_laps_session_id foreign key (session_id) references sessions(id),
    constraint FK_laps_driver_id foreign key (driver_id) references drivers(id)
);
*/
-- Version 2: Probando a almacenar los datos directamente
-- Version 3: Con los datos en fichero de eventos
select * from laps;

drop table if exists lap_segments;
-- Version 1: Sin ver datos
/* CREATE TABLE lap_segments (
    id INT AUTO_INCREMENT,
    lap_id INT NOT NULL,
    segment_number INT NOT NULL,
    time_ms INT,
    throttle DECIMAL(4,2),
    brake DECIMAL(4,2),
    steering DECIMAL(5,2),
    speed_kph DECIMAL(6,2),
    gear INT,
    drs BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    constraint PK_lap_segments primary key (id),
    constraint FK_lap_segments_lap_id FOREIGN KEY (lap_id) REFERENCES laps(id)
);
*/
select * from lap_segments;

drop table if exists car_status;
-- Version 1: Sin ver datos
/* CREATE TABLE if not exists car_status (
    id INT AUTO_INCREMENT,
    lap_id INT NOT NULL,
    fuel_in_tank DECIMAL(5,2),
    ers_energy DECIMAL(5,2),
    engine_temp INT,
    tyre_wear_fl DECIMAL(4,2),
    tyre_wear_fr DECIMAL(4,2),
    tyre_wear_rl DECIMAL(4,2),
    tyre_wear_rr DECIMAL(4,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    constraint PK_car_status primary key (id),
    constraint FK_car_status_lap_id FOREIGN KEY (lap_id) REFERENCES laps(id)
);
*/
select * from car_status;

show tables;
