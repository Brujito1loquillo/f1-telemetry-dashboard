show databases;
create database if not exists f1telemetria CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
show databases;
use f1telemetria;
show tables;

-- EQUIPOS
create table if not exists equipo (
	id int not null,
    name varchar(250) default null,
    
    constraint PK_equipo primary key (id)
);

-- PILOTOS
create table if not exists piloto (
	name varchar(250) not null,
    raceNumber int not null,
    nationality int not null, -- 77 -> España
    
    -- techLevel int default null,
    -- platform int default null,
    
    constraint PK_piloto primary key (name)
);

-- CIRCUITOS
create table if not exists circuito (
	id int not null,
    name varchar(50) default null,
    country varchar(50) default null,
    length int not null,
    pitSpeedLimit int not null,
    
    constraint PK_circuito primary key (id)
);

-- SESIONES
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
    
    constraint PK_sesion primary key (uid),
    constraint FK_sesion_trackID foreign key (trackId) references circuito (id)
);

-- SESION-PARTICIPANTE
create table sesionParticipante (
	sesionUID varchar(20) not null,
    piloto varchar(250) not null,
    teamId int not null,
    participanteId int not null, -- Indice en el array m_participants
    ia boolean not null,
    yourTelemetry boolean not null default false, -- Indica si eres "tu"
    myTeam boolean not null default false, -- Indica si es "F1 World" o "Mi equipo"
    
    -- techLevel int default null,
    
    constraint PK_sesionParticipante primary key (sesionUID, piloto),
    constraint FK_sesionParticipante_sesionUID foreign key (sesionUID) references sesion (uid),
    constraint FK_sesionParticipante_piloto foreign key (piloto) references piloto (nombre),
    constraint FK_sesionParticipante_teamId foreign key (teamId) references equipo (id)
);

-- REGLAJES
create table if not exists reglaje (
	id varchar(64) not null, -- Hash codificado con el conjunto de los reglajes.
    frontWing int not null,
    rearWing int not null,
    onThrottle int not null,
    offThrottle int not null,
    frontCamber float not null,
    rearCamber float not null,
    frontToe float not null,
    rearToe float not null,
    frontSuspension int not null,
    rearSuspension int not null,
    frontAntiRollBar int not null,
    rearAntiRollBar int not null,
    frontSuspensionHeight int not null,
    rearSuspensionHeight int not null,
    breakePressure int not null,
    breakBias int not null,
    engineBraking int not null,
    rearLeftTyrePressure float not null,
    rearRightTyrePressure float not null,
    frontLeftTyrePressure float not null,
    frontRightTyrePressure float not null,
    ballast int not null,
    fuelLoad float not null,
    
    constraint PK_reglaje primary key (id)
);

-- SESION-REGLAJE
create table if not exists sesionReglaje (
	sesionUID varchar(20) not null,
    participanteId int not null,
    reglajeId varchar(64) not null,
    startLap int not null,
    endLap int default null,
    -- startTime float default null, -- tiempo exacto en segundos desde inicio de sesión (opcional)
    
    constraint PK_sesionReglaje primary key (sesionUID, participanteId, reglajeId, startLap),
    constraint FK_sesionReglaje_sesion foreign key (sesionUID) references sesion (uid),
    constraint FK_sesionReglaje_reglaje foreign key (reglajeId) references reglaje (id)
);

-- SESION-JUEGOS-PARTICIPANTE (NEUMATICOS)
create table if not exists sesionJuegosParticipante (
	id int not null auto_increment,
    participanteId int not null,
    -- actual boolean not null, -- Necesito saber cuando se cambian
    sesionUID varchar(20) not null,
    
    constraint PK_sesionJuegosParticipante (sesionUID, participanteId),
    constraint FK_sesionJuegosParticipante_participanteId foreign key (participanteId) references sesionParticipante (id)
);

-- JUEGO (NEUMATICOS)
create table if not exists juego (
	id bigint auto_increment not null,
    -- sesionUID varchar(20) not null, -- no seria necesario, juego -> sesionJuegoParticipante (sesionUID)
    -- participanteId varchar(250) not null, -- no seria necesario, juego -> sesionJuegoParticipante (participanteId)
    juegosId int not null,
    
    constraint PK_juego primary key (id),
    constraint 
);

-- VUELTAS

-- TROZOS DE VUELTA ?

-- ESTADO DEL COCHE ?
