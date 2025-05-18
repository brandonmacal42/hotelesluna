/*
 * Script para la creación de la base de datos de Hoteles
 * 
 * Macal Cruz Brandon Brayan - 318085470
 * Pintor Muñoz Pedro Joshue - 420053796
 * */

-- Creacion del esquema

drop schema if exists public cascade;
create schema public;
SET datestyle TO 'SQL, DMY';

/*------------------------ CREACION DE TABLAS-------------------------*/ 


/*--------------- Hotel ---------------*/


CREATE TABLE Hotel (
  idhotel SERIAL PRIMARY KEY,
  nombreestablecimiento VARCHAR(50),
  calle VARCHAR(50),
  numerointerior INT,
  numeroexterior INT,
  colonia VARCHAR(50),
  estado VARCHAR(50),
  checkin DATE,
  checkout DATE,
  petfriendly BOOLEAN,
  servicio VARCHAR(50)
);


---- Restricciones ----

-- Dominio

/*
 * alter table: Modifica la tabla, en este caso hotel.
 * add constraint: Añade una restriccion.
 * no_vacio: Nombre de la restriccion
 * check: Especifica la condicion que se debe cumplir.
 * 
 * alter column: especificaria la columna que se va a modificar
 * Ejemplo : ALTER TABLE operador ALTER COLUMN horario SET NOT NULL;
 * 
 * references: hace referencia a la tabla Hotel, columna idHotel
 * Ejemplo : alter table TelefonoHotel add constraint TelefonoHotel_fkey foreign key (idHotel) REFERENCES Hotel(idHotel);
 * */

alter table Hotel alter column idHotel set not null;
ALTER TABLE Hotel ADD CONSTRAINT idHotelU UNIQUE (idHotel);

alter table Hotel add constraint no_vacio1 check (NombreEstablecimiento <> '');
alter table Hotel add constraint no_vacio2 check (Calle <> '');
alter table Hotel alter column numeroExterior set not null;
alter table Hotel add constraint no_cero check (NumeroExterior > 0);
alter table Hotel add constraint no_vacio3 check (Colonia <> '');
alter table Hotel add constraint no_vacio4 check (Estado <> '');
alter table Hotel alter column CheckIn set not null;
alter table Hotel alter column Checkout set not null;
alter table Hotel alter column PetFriendly set not null;
alter table Hotel add constraint no_vacio5 check (servicio <> '');

-- Entidad 
alter table Hotel add constraint Hotel_pkey primary key (idHotel);

-- Comentarios
COMMENT ON CONSTRAINT Hotel_pkey ON Hotel IS 'La llave primaria de la tabla Hotel';
COMMENT ON CONSTRAINT idHotelU ON Hotel IS 'Restriccion unique para el atributo identificador de hotel';

COMMENT ON TABLE Hotel IS 'Tabla que contiene los hoteles de la empresa Hoteles Luna';
COMMENT ON COLUMN Hotel.idHotel IS 'Identificador del hotel';
COMMENT ON COLUMN Hotel.NombreEstablecimiento IS'Nombre del hotel';
COMMENT ON COLUMN Hotel.Calle IS 'Calle en donde se encuentra el hotel';
COMMENT ON COLUMN Hotel.NumeroInterior IS 'Numero interior del edificio del hotel';
COMMENT ON COLUMN Hotel.NumeroExterior IS 'Numero exterior del hotel';
COMMENT ON COLUMN Hotel.Colonia IS 'Colonia en donde se encuentra el hotel';
COMMENT ON COLUMN Hotel.Estado IS 'Estado en donde se encuentra el hotel';
COMMENT ON COLUMN Hotel.CheckIn IS 'Hora de Check in';
COMMENT ON COLUMN Hotel.Checkout IS 'Hora de Check out';
COMMENT ON COLUMN Hotel.PetFriendly IS '¿El hotel es petfriendly?';
COMMENT ON COLUMN Hotel.Servicio IS 'Servicios que tiene el hotel';
COMMENT ON CONSTRAINT no_vacio1 ON Hotel IS 'Restriccion check que usamos para asegurar que NombreEstablecimiento no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Hotel IS 'Restriccion check que usamos para asegurar que la calle no sea vacia';
COMMENT ON CONSTRAINT no_vacio3 ON Hotel IS 'Restriccion check que usamos para asegurar que la colonia no sea vacia';
COMMENT ON CONSTRAINT no_vacio4 ON Hotel IS 'Restriccion check que usamos para asegurar que el estado no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Hotel IS 'Restriccion check que usamos para asegurar que los servicios no sean vacios';
COMMENT ON CONSTRAINT no_cero ON Hotel IS 'Restriccion check que usamos para asegurar que el Numero Exterior sea mayor a cero';



/*------------- TelefonoHotel ---------------*/

create table TelefonoHotel(
	idHotel int,
	idTelefonoHotel int8
);

--- Restricciones ---

-- Dominio
alter table TelefonoHotel alter column idHotel set not null;
alter table TelefonoHotel alter column idTelefonoHotel set not null;
ALTER TABLE TelefonoHotel ADD CONSTRAINT idTelefonoHotelU UNIQUE (idTelefonoHotel);

-- Entidad
alter table TelefonoHotel add constraint TelefonoHotel_pkey primary key (idTelefonoHotel, idHotel);

-- Referencial
alter table TelefonoHotel add constraint TelefonoHotel_fkey foreign key (idHotel) REFERENCES Hotel(idHotel) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT TelefonoHotel_pkey ON TelefonoHotel IS 'La llave compuesta para telefono del hotel';
COMMENT ON CONSTRAINT TelefonoHotel_fkey ON TelefonoHotel is 'Llave foranea de Telefono Hotel';
COMMENT ON CONSTRAINT idTelefonoHotelU ON TelefonoHotel IS 'Restriccion unique para el atributo Numero de telefono del hotel';

COMMENT ON TABLE TelefonoHotel IS 'Tabla que contiene los telefonos del hotel';
COMMENT ON COLUMN TelefonoHotel.idHotel IS 'Identificador foraneo del hotel';
COMMENT ON COLUMN TelefonoHotel.idTelefonoHotel is 'Numero de telefono del hotel';



/*------------- CorreoHotel ---------------*/

create table CorreoHotel(
	idHotel int,
	CorreoHotel varchar(50)
);

--- Restricciones ---

-- Dominio
alter table CorreoHotel add constraint de_la_forma check (correoHotel like '%_@_%._%');
alter table CorreoHotel alter column CorreoHotel set not null;
alter table CorreoHotel alter column idHotel set not null;

-- Entidad
alter table CorreoHotel add constraint CorreoHotel_pkey primary key (CorreoHotel, idHotel);
ALTER TABLE CorreoHotel ADD CONSTRAINT CorreoHotelU UNIQUE (CorreoHotel);

-- Referencial
alter table CorreoHotel add constraint CorreoHotel_fkey foreign key (idHotel) REFERENCES Hotel(idHotel) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT CorreoHotel_pkey ON CorreoHotel IS 'La llave compuesta para correo del hotel';
COMMENT ON CONSTRAINT CorreoHotel_fkey ON CorreoHotel is 'Llave foranea de correo Hotel';
COMMENT ON CONSTRAINT CorreoHotelU ON CorreoHotel IS 'Restriccion unique para el atributo correo del hotel';

COMMENT ON TABLE CorreoHotel IS 'Tabla que contiene los correos del hotel';
COMMENT ON COLUMN CorreoHotel.idHotel IS 'Identificador foraneo del hotel';
COMMENT ON COLUMN CorreoHotel.CorreoHotel is 'Correos electronicos del hotel';
comment on constraint de_la_forma on CorreoHotel is 'Restriccion que determina una entrada valida para el correo';



/*------------- Apoyo ---------------*/

create table Apoyo(
	idEmpleado int,
	idHotel int,
	
	Nombre varchar(50),
	ApellidoP varchar(50),
	ApellidoM varchar(50),
	Calle varchar(50),
	NumeroInterior int,
	NumeroExterior int,
	Colonia varchar(50),
	Estado varchar(50),
	Horario time,
	FechaNacimiento date,
	FechaContratacion date,
	Genero varchar(50),
	RFC varchar(13)
);

---- Restricciones ----

-- Dominio
alter table Apoyo alter column idEmpleado set not null;
alter table Apoyo alter column idHotel set not null;
ALTER TABLE Apoyo ADD CONSTRAINT ApoyoU UNIQUE (idEmpleado);

alter table Apoyo add constraint no_vacio1 check (Nombre <> '');
alter table Apoyo add constraint no_vacio2 check (ApellidoP <> '');
alter table Apoyo add constraint no_vacio3 check (ApellidoM <> '');
alter table Apoyo add constraint no_vacio4 check (Calle <> '');
alter table Apoyo alter column NumeroExterior set not null;
alter table Apoyo add constraint no_cero check (NumeroExterior > 0);
alter table Apoyo add constraint no_vacio5 check (Colonia <> '');
alter table Apoyo add constraint no_vacio6 check (Estado <> '');
alter table Apoyo alter column Horario set not null;
alter table Apoyo alter column FechaNacimiento set not null;
alter table Apoyo alter column FechaContratacion set not null;
alter table Apoyo add constraint no_vacio7 check (Genero <> '');
alter table Apoyo add constraint no_vacio8 check (RFC <> '');
alter table Apoyo add constraint caracteres_fijos check (char_length(RFC) = 13 or char_length(RFC) = 12);

-- Entidad 
alter table Apoyo add constraint Apoyo_pkey primary key (idEmpleado);

-- Referencial
alter table Apoyo add constraint Apoyo_fkey foreign key (idHotel) REFERENCES Hotel(idHotel) ON DELETE SET NULL ON UPDATE cascade;

-- Comentarios
COMMENT ON CONSTRAINT Apoyo_pkey ON Apoyo IS 'La llave primaria para emplaedo';
COMMENT ON CONSTRAINT Apoyo_fkey ON Apoyo is 'Llave foranea de emepleado';
COMMENT ON CONSTRAINT ApoyoU ON Apoyo IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Apoyo IS 'Tabla que contiene los empleados de apoyo del hotel';
COMMENT ON COLUMN Apoyo.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Apoyo.idHotel IS 'Identificador del Hotel';
COMMENT ON COLUMN Apoyo.Nombre IS 'Nombre del empleado';
COMMENT ON COLUMN Apoyo.ApellidoP IS 'Apellido paterno del empleado';
COMMENT ON COLUMN Apoyo.ApellidoM IS 'Apellido materno del empleado';
COMMENT ON COLUMN Apoyo.Calle IS 'Calle donde reside el empleado';
COMMENT ON COLUMN Apoyo.NumeroInterior IS 'NumeroInterior de donde reside el empleado';
COMMENT ON COLUMN Apoyo.NumeroExterior IS 'NumeroExterior de donde reside el empleado';
COMMENT ON COLUMN Apoyo.Colonia IS 'Colonia de donde reside el empleado';
COMMENT ON COLUMN Apoyo.Estado IS 'Estado de donde reside el empleado';
COMMENT ON COLUMN Apoyo.Horario IS 'Horario de entrada del empleado';
COMMENT ON COLUMN Apoyo.FechaNacimiento IS 'Fecha de nacimiento del empleado';
COMMENT ON COLUMN Apoyo.FechaContratacion IS 'Fecha de contratacion del empleado';
COMMENT ON COLUMN Apoyo.Genero IS 'Genero del empleado';
COMMENT ON COLUMN Apoyo.RFC IS 'RFC del empleado';
COMMENT ON CONSTRAINT no_vacio1 ON Apoyo IS 'Restriccion check que usamos para asegurar que Nombre no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Apoyo IS 'Restriccion check que usamos para asegurar que ApellidoP no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Apoyo IS 'Restriccion check que usamos para asegurar que ApellidoM no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Apoyo IS 'Restriccion check que usamos para asegurar que Calle no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Apoyo IS 'Restriccion check que usamos para asegurar que Colonia no sea vacio';
COMMENT ON CONSTRAINT no_vacio6 ON Apoyo IS 'Restriccion check que usamos para asegurar que Estado no sea vacio';
COMMENT ON CONSTRAINT no_vacio7 ON Apoyo IS 'Restriccion check que usamos para asegurar que Genero no sea vacio';
COMMENT ON CONSTRAINT no_vacio8 ON Apoyo IS 'Restriccion check que usamos para asegurar que RFC no sea vacio';
COMMENT ON CONSTRAINT no_cero ON Apoyo IS 'Restriccion check que usamos para asegurar que el numero exterior sea mayor a cero';
COMMENT ON CONSTRAINT caracteres_fijos ON Apoyo IS 'Restriccion check que usamos para asegurar que los caracteres del RFC sean 12 o 13';


/*------------- TelefonoApoyo ---------------*/

create table TelefonoApoyo(
	idEmpleado int,
	idTelefonoApoyo int8
);

--- Restricciones ---

-- Dominio
alter table TelefonoApoyo alter column idEmpleado set not null;
alter table TelefonoApoyo alter column idTelefonoApoyo set not null;
ALTER TABLE TelefonoApoyo ADD CONSTRAINT TelefonoApoyoU UNIQUE (idTelefonoApoyo);

-- Entidad
alter table TelefonoApoyo add constraint TelefonoApoyo_pkey primary key (idTelefonoApoyo, idEmpleado);

-- Referencial
alter table TelefonoApoyo add constraint TelefonoApoyo_fkey foreign key (idEmpleado) REFERENCES Apoyo(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT TelefonoApoyo_pkey ON TelefonoApoyo IS 'La llave compuesta para telefono del Empleado';
COMMENT ON CONSTRAINT TelefonoApoyo_fkey ON TelefonoApoyo is 'Llave foranea de Telefono Empleado';
COMMENT ON CONSTRAINT TelefonoApoyoU ON TelefonoApoyo IS 'Restriccion unique para el atributo Numero de telefono del Empleado';

COMMENT ON TABLE TelefonoApoyo IS 'Tabla que contiene los telefonos del Empleado';
COMMENT ON COLUMN TelefonoApoyo.idEmpleado IS 'Identificador foraneo del Empleado';
COMMENT ON COLUMN TelefonoApoyo.idTelefonoApoyo is 'Numero de telefono del Empleado';



/*------------- CorreoApoyo ---------------*/

create table CorreoApoyo(
	idEmpleado int,
	CorreoApoyo varchar(50)
);

--- Restricciones ---

-- Dominio
alter table CorreoApoyo add constraint de_la_forma check (CorreoApoyo like '%_@_%._%');
alter table CorreoApoyo alter column CorreoApoyo set not null;
alter table CorreoApoyo alter column idEmpleado set not null;
ALTER TABLE CorreoApoyo ADD CONSTRAINT CorreoApoyoU UNIQUE (CorreoApoyo);

-- Entidad
alter table CorreoApoyo add constraint CorreoApoyo_pkey primary key (CorreoApoyo, idEmpleado);

-- Referencial
alter table CorreoApoyo add constraint CorreoApoyo_fkey foreign key (idEmpleado) REFERENCES Apoyo(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT CorreoApoyo_pkey ON CorreoApoyo IS 'La llave compuesta para correo del empleado';
COMMENT ON CONSTRAINT CorreoApoyo_fkey ON CorreoApoyo is 'Llave foranea de correo empleado';
COMMENT ON CONSTRAINT CorreoApoyoU ON CorreoApoyo IS 'Restriccion unique para el atributo correo del empleado';

COMMENT ON TABLE CorreoApoyo IS 'Tabla que contiene los correos del empleado';
COMMENT ON COLUMN CorreoApoyo.idEmpleado IS 'Identificador foraneo del empleado';
COMMENT ON COLUMN CorreoApoyo.CorreoApoyo is 'Correos electronicos del empleado';
comment on constraint de_la_forma on CorreoApoyo is 'Restriccion que determina una entrada valida para el correo';



/*------------- Recepcionista ---------------*/

create table Recepcionista(
	idEmpleado int,
	idHotel int,
	
	Nombre varchar(50),
	ApellidoP varchar(50),
	ApellidoM varchar(50),
	Calle varchar(50),
	NumeroInterior int,
	NumeroExterior int,
	Colonia varchar(50),
	Estado varchar(50),
	Horario time,
	FechaNacimiento date,
	FechaContratacion date,
	Genero varchar(50),
	RFC varchar(13)	
);

---- Restricciones ----

-- Dominio
alter table Recepcionista alter column idEmpleado set not null;
alter table Recepcionista alter column idHotel set not null;
ALTER TABLE Recepcionista ADD CONSTRAINT RecepcionistaU UNIQUE (idEmpleado);

alter table Recepcionista add constraint no_vacio1 check (Nombre <> '');
alter table Recepcionista add constraint no_vacio2 check (ApellidoP <> '');
alter table Recepcionista add constraint no_vacio3 check (ApellidoM <> '');
alter table Recepcionista add constraint no_vacio4 check (Calle <> '');
alter table Recepcionista alter column NumeroExterior set not null;
alter table Recepcionista add constraint no_cero check (NumeroExterior > 0);
alter table Recepcionista add constraint no_vacio5 check (Colonia <> '');
alter table Recepcionista add constraint no_vacio6 check (Estado <> '');
alter table Recepcionista alter column Horario set not null;
alter table Recepcionista alter column FechaNacimiento set not null;
alter table Recepcionista alter column FechaContratacion set not null;
alter table Recepcionista add constraint no_vacio7 check (Genero <> '');
alter table Recepcionista add constraint no_vacio8 check (RFC <> '');
alter table Recepcionista add constraint caracteres_fijos check (char_length(RFC) = 13 or char_length(RFC) = 12);

-- Entidad 
alter table Recepcionista add constraint Recepcionista_pkey primary key (idEmpleado);


-- Referencial
alter table Recepcionista add constraint Recepcionista_fkey foreign key (idHotel) REFERENCES Hotel(idHotel) ON DELETE SET NULL ON UPDATE cascade;

-- Comentarios
COMMENT ON CONSTRAINT Recepcionista_pkey ON Recepcionista IS 'La llave primaria para emplaedo';
COMMENT ON CONSTRAINT Recepcionista_fkey ON Recepcionista is 'Llave foranea de emepleado';
COMMENT ON CONSTRAINT RecepcionistaU ON Recepcionista IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Recepcionista IS 'Tabla que contiene los empleados de Recepcionista del hotel';
COMMENT ON COLUMN Recepcionista.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Recepcionista.idHotel IS 'Identificador del Hotel';
COMMENT ON COLUMN Recepcionista.Nombre IS 'Nombre del empleado';
COMMENT ON COLUMN Recepcionista.ApellidoP IS 'Apellido paterno del empleado';
COMMENT ON COLUMN Recepcionista.ApellidoM IS 'Apellido materno del empleado';
COMMENT ON COLUMN Recepcionista.Calle IS 'Calle donde reside el empleado';
COMMENT ON COLUMN Recepcionista.NumeroInterior IS 'NumeroInterior de donde reside el empleado';
COMMENT ON COLUMN Recepcionista.NumeroExterior IS 'NumeroExterior de donde reside el empleado';
COMMENT ON COLUMN Recepcionista.Colonia IS 'Colonia de donde reside el empleado';
COMMENT ON COLUMN Recepcionista.Estado IS 'Estado de donde reside el empleado';
COMMENT ON COLUMN Recepcionista.Horario IS 'Horario de entrada del empleado';
COMMENT ON COLUMN Recepcionista.FechaNacimiento IS 'Fecha de nacimiento del empleado';
COMMENT ON COLUMN Recepcionista.FechaContratacion IS 'Fecha de contratacion del empleado';
COMMENT ON COLUMN Recepcionista.Genero IS 'Genero del empleado';
COMMENT ON COLUMN Recepcionista.RFC IS 'RFC del empleado';
COMMENT ON CONSTRAINT no_vacio1 ON Recepcionista IS 'Restriccion check que usamos para asegurar que Nombre no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Recepcionista IS 'Restriccion check que usamos para asegurar que ApellidoP no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Recepcionista IS 'Restriccion check que usamos para asegurar que ApellidoM no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Recepcionista IS 'Restriccion check que usamos para asegurar que Calle no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Recepcionista IS 'Restriccion check que usamos para asegurar que Colonia no sea vacio';
COMMENT ON CONSTRAINT no_vacio6 ON Recepcionista IS 'Restriccion check que usamos para asegurar que Estado no sea vacio';
COMMENT ON CONSTRAINT no_vacio7 ON Recepcionista IS 'Restriccion check que usamos para asegurar que Genero no sea vacio';
COMMENT ON CONSTRAINT no_vacio8 ON Recepcionista IS 'Restriccion check que usamos para asegurar que RFC no sea vacio';
COMMENT ON CONSTRAINT no_cero ON Recepcionista IS 'Restriccion check que usamos para asegurar que el numero exterior sea mayor a cero';
COMMENT ON CONSTRAINT caracteres_fijos ON Recepcionista IS 'Restriccion check que usamos para asegurar que los caracteres del RFC sean 12 o 13';



/*------------- TelefonoRecepcionista ---------------*/

create table TelefonoRecepcionista(
	idEmpleado int,
	idTelefonoRecepcionista int8
);

--- Restricciones ---

-- Dominio
alter table TelefonoRecepcionista alter column idEmpleado set not null;
alter table TelefonoRecepcionista alter column idTelefonoRecepcionista set not null;
ALTER TABLE TelefonoRecepcionista ADD CONSTRAINT TelefonoRecepcionistaU UNIQUE (idTelefonoRecepcionista);

-- Entidad
alter table TelefonoRecepcionista add constraint TelefonoRecepcionista_pkey primary key (idTelefonoRecepcionista, idEmpleado);

-- Referencial
alter table TelefonoRecepcionista add constraint TelefonoRecepcionista_fkey foreign key (idEmpleado) REFERENCES Recepcionista(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT TelefonoRecepcionista_pkey ON TelefonoRecepcionista IS 'La llave compuesta para telefono del Empleado';
COMMENT ON CONSTRAINT TelefonoRecepcionista_fkey ON TelefonoRecepcionista is 'Llave foranea de Telefono Empleado';
COMMENT ON CONSTRAINT TelefonoRecepcionistaU ON TelefonoRecepcionista IS 'Restriccion unique para el atributo Numero de telefono del Empleado';

COMMENT ON TABLE TelefonoRecepcionista IS 'Tabla que contiene los telefonos del Empleado';
COMMENT ON COLUMN TelefonoRecepcionista.idEmpleado IS 'Identificador foraneo del Empleado';
COMMENT ON COLUMN TelefonoRecepcionista.idTelefonoRecepcionista is 'Numero de telefono del Empleado';



/*------------- CorreoRecepcionista ---------------*/

create table CorreoRecepcionista(
	idEmpleado int,
	CorreoRecepcionista varchar(50)
);

--- Restricciones ---

-- Dominio
alter table CorreoRecepcionista add constraint de_la_forma check (CorreoRecepcionista like '%_@_%._%');
alter table CorreoRecepcionista alter column CorreoRecepcionista set not null;
alter table CorreoRecepcionista alter column idEmpleado set not null;
ALTER TABLE CorreoRecepcionista ADD CONSTRAINT CorreoRecepcionistaU UNIQUE (CorreoRecepcionista);

-- Entidad
alter table CorreoRecepcionista add constraint CorreoRecepcionista_pkey primary key (CorreoRecepcionista, idEmpleado);

-- Referencial
alter table CorreoRecepcionista add constraint CorreoRecepcionista_fkey foreign key (idEmpleado) REFERENCES Recepcionista(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT CorreoRecepcionista_pkey ON CorreoRecepcionista IS 'La llave compuesta para correo del empleado';
COMMENT ON CONSTRAINT CorreoRecepcionista_fkey ON CorreoRecepcionista is 'Llave foranea de correo empleado';
COMMENT ON CONSTRAINT CorreoRecepcionistaU ON CorreoRecepcionista IS 'Restriccion unique para el atributo correo del empleado';

COMMENT ON TABLE CorreoRecepcionista IS 'Tabla que contiene los correos del empleado';
COMMENT ON COLUMN CorreoRecepcionista.idEmpleado IS 'Identificador foraneo del empleado';
COMMENT ON COLUMN CorreoRecepcionista.CorreoRecepcionista is 'Correos electronicos del empleado';
comment on constraint de_la_forma on CorreoRecepcionista is 'Restriccion que determina una entrada valida para el correo';



/*------------- Limpieza ---------------*/

create table Limpieza(
	idEmpleado int,
	idHotel int,
	
	Nombre varchar(50),
	ApellidoP varchar(50),
	ApellidoM varchar(50),
	Calle varchar(50),
	NumeroInterior int,
	NumeroExterior int,
	Colonia varchar(50),
	Estado varchar(50),
	Horario time,
	FechaNacimiento date,
	FechaContratacion date,
	Genero varchar(50),
	RFC varchar(13)
);

---- Restricciones ----

-- Dominio
alter table Limpieza alter column idEmpleado set not null;
alter table Limpieza alter column idHotel set not null;
ALTER TABLE Limpieza ADD CONSTRAINT LimpiezaU UNIQUE (idEmpleado);

alter table Limpieza add constraint no_vacio1 check (Nombre <> '');
alter table Limpieza add constraint no_vacio2 check (ApellidoP <> '');
alter table Limpieza add constraint no_vacio3 check (ApellidoM <> '');
alter table Limpieza add constraint no_vacio4 check (Calle <> '');
alter table Limpieza alter column NumeroExterior set not null;
alter table Limpieza add constraint no_cero check (NumeroExterior > 0);
alter table Limpieza add constraint no_vacio5 check (Colonia <> '');
alter table Limpieza add constraint no_vacio6 check (Estado <> '');
alter table Limpieza alter column Horario set not null;
alter table Limpieza alter column FechaNacimiento set not null;
alter table Limpieza alter column FechaContratacion set not null;
alter table Limpieza add constraint no_vacio7 check (Genero <> '');
alter table Limpieza add constraint no_vacio8 check (RFC <> '');
alter table Limpieza add constraint caracteres_fijos check (char_length(RFC) = 13 or char_length(RFC) = 12);

-- Entidad 
alter table Limpieza add constraint Limpieza_pkey primary key (idEmpleado);

-- Referencial
alter table Limpieza add constraint Limpieza_fkey foreign key (idHotel) REFERENCES Hotel(idHotel) ON DELETE SET NULL ON UPDATE cascade;

-- Comentarios
COMMENT ON CONSTRAINT Limpieza_pkey ON Limpieza IS 'La llave primaria para emplaedo';
COMMENT ON CONSTRAINT Limpieza_fkey ON Limpieza is 'Llave foranea de emepleado';
COMMENT ON CONSTRAINT LimpiezaU ON Limpieza IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Limpieza IS 'Tabla que contiene los empleados de Limpieza del hotel';
COMMENT ON COLUMN Limpieza.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Limpieza.idHotel IS 'Identificador del Hotel';
COMMENT ON COLUMN Limpieza.Nombre IS 'Nombre del empleado';
COMMENT ON COLUMN Limpieza.ApellidoP IS 'Apellido paterno del empleado';
COMMENT ON COLUMN Limpieza.ApellidoM IS 'Apellido materno del empleado';
COMMENT ON COLUMN Limpieza.Calle IS 'Calle donde reside el empleado';
COMMENT ON COLUMN Limpieza.NumeroInterior IS 'NumeroInterior de donde reside el empleado';
COMMENT ON COLUMN Limpieza.NumeroExterior IS 'NumeroExterior de donde reside el empleado';
COMMENT ON COLUMN Limpieza.Colonia IS 'Colonia de donde reside el empleado';
COMMENT ON COLUMN Limpieza.Estado IS 'Estado de donde reside el empleado';
COMMENT ON COLUMN Limpieza.Horario IS 'Horario de entrada del empleado';
COMMENT ON COLUMN Limpieza.FechaNacimiento IS 'Fecha de nacimiento del empleado';
COMMENT ON COLUMN Limpieza.FechaContratacion IS 'Fecha de contratacion del empleado';
COMMENT ON COLUMN Limpieza.Genero IS 'Genero del empleado';
COMMENT ON COLUMN Limpieza.RFC IS 'RFC del empleado';
COMMENT ON CONSTRAINT no_vacio1 ON Limpieza IS 'Restriccion check que usamos para asegurar que Nombre no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Limpieza IS 'Restriccion check que usamos para asegurar que ApellidoP no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Limpieza IS 'Restriccion check que usamos para asegurar que ApellidoM no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Limpieza IS 'Restriccion check que usamos para asegurar que Calle no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Limpieza IS 'Restriccion check que usamos para asegurar que Colonia no sea vacio';
COMMENT ON CONSTRAINT no_vacio6 ON Limpieza IS 'Restriccion check que usamos para asegurar que Estado no sea vacio';
COMMENT ON CONSTRAINT no_vacio7 ON Limpieza IS 'Restriccion check que usamos para asegurar que Genero no sea vacio';
COMMENT ON CONSTRAINT no_vacio8 ON Limpieza IS 'Restriccion check que usamos para asegurar que RFC no sea vacio';
COMMENT ON CONSTRAINT no_cero ON Limpieza IS 'Restriccion check que usamos para asegurar que el numero exterior sea mayor a cero';
COMMENT ON CONSTRAINT caracteres_fijos ON Limpieza IS 'Restriccion check que usamos para asegurar que los caracteres del RFC sean 12 o 13';



/*------------- TelefonoLimpieza ---------------*/

create table TelefonoLimpieza(
	idEmpleado int,
	idTelefonoLimpieza int8
);

--- Restricciones ---

-- Dominio
alter table TelefonoLimpieza alter column idEmpleado set not null;
alter table TelefonoLimpieza alter column idTelefonoLimpieza set not null;
ALTER TABLE TelefonoLimpieza ADD CONSTRAINT TelefonoLimpiezaU UNIQUE (idTelefonoLimpieza);


-- Entidad
alter table TelefonoLimpieza add constraint TelefonoLimpieza_pkey primary key (idTelefonoLimpieza, idEmpleado);

-- Referencial
alter table TelefonoLimpieza add constraint TelefonoLimpieza_fkey foreign key (idEmpleado) REFERENCES Limpieza(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT TelefonoLimpieza_pkey ON TelefonoLimpieza IS 'La llave compuesta para telefono del Empleado';
COMMENT ON CONSTRAINT TelefonoLimpieza_fkey ON TelefonoLimpieza is 'Llave foranea de Telefono Empleado';
COMMENT ON CONSTRAINT TelefonoLimpiezaU ON TelefonoLimpieza IS 'Restriccion unique para el atributo Numero de telefono del Empleado';

COMMENT ON TABLE TelefonoLimpieza IS 'Tabla que contiene los telefonos del Empleado';
COMMENT ON COLUMN TelefonoLimpieza.idEmpleado IS 'Identificador foraneo del Empleado';
COMMENT ON COLUMN TelefonoLimpieza.idTelefonoLimpieza is 'Numero de telefono del Empleado';



/*------------- CorreoLimpieza ---------------*/

create table CorreoLimpieza(
	idEmpleado int,
	CorreoLimpieza varchar(50)
);

--- Restricciones ---

-- Dominio
alter table CorreoLimpieza add constraint de_la_forma check (CorreoLimpieza like '%_@_%._%');
alter table CorreoLimpieza alter column CorreoLimpieza set not null;
alter table CorreoLimpieza alter column idEmpleado set not null;
ALTER TABLE CorreoLimpieza ADD CONSTRAINT CorreoLimpiezaU UNIQUE (CorreoLimpieza);

-- Entidad
alter table CorreoLimpieza add constraint CorreoLimpieza_pkey primary key (CorreoLimpieza, idEmpleado);

-- Referencial
alter table CorreoLimpieza add constraint CorreoLimpieza_fkey foreign key (idEmpleado) REFERENCES Limpieza(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT CorreoLimpieza_pkey ON CorreoLimpieza IS 'La llave compuesta para correo del empleado';
COMMENT ON CONSTRAINT CorreoLimpieza_fkey ON CorreoLimpieza is 'Llave foranea de correo empleado';
COMMENT ON CONSTRAINT CorreoLimpiezaU ON CorreoLimpieza IS 'Restriccion unique para el atributo correo del empleado';

COMMENT ON TABLE CorreoLimpieza IS 'Tabla que contiene los correos del empleado';
COMMENT ON COLUMN CorreoLimpieza.idEmpleado IS 'Identificador foraneo del empleado';
COMMENT ON COLUMN CorreoLimpieza.CorreoLimpieza is 'Correos electronicos del empleado';
comment on constraint de_la_forma on CorreoLimpieza is 'Restriccion que determina una entrada valida para el correo';



/*------------- Comida ---------------*/

create table Comida(
	idEmpleado int,
	idHotel int,
	
	Nombre varchar(50),
	ApellidoP varchar(50),
	ApellidoM varchar(50),
	Calle varchar(50),
	NumeroInterior int,
	NumeroExterior int,
	Colonia varchar(50),
	Estado varchar(50),
	Horario time,
	FechaNacimiento date,
	FechaContratacion date,
	Genero varchar(50),
	RFC varchar(13)
);

---- Restricciones ----

-- Dominio
alter table Comida alter column idEmpleado set not null;
alter table Comida alter column idHotel set not null;
ALTER TABLE Comida ADD CONSTRAINT ComidaU UNIQUE (idEmpleado);

alter table Comida add constraint no_vacio1 check (Nombre <> '');
alter table Comida add constraint no_vacio2 check (ApellidoP <> '');
alter table Comida add constraint no_vacio3 check (ApellidoM <> '');
alter table Comida add constraint no_vacio4 check (Calle <> '');
alter table Comida alter column NumeroExterior set not null;
alter table Comida add constraint no_cero check (NumeroExterior > 0);
alter table Comida add constraint no_vacio5 check (Colonia <> '');
alter table Comida add constraint no_vacio6 check (Estado <> '');
alter table Comida alter column Horario set not null;
alter table Comida alter column FechaNacimiento set not null;
alter table Comida alter column FechaContratacion set not null;
alter table Comida add constraint no_vacio7 check (Genero <> '');
alter table Comida add constraint no_vacio8 check (RFC <> '');
alter table Comida add constraint caracteres_fijos check (char_length(RFC) = 13 or char_length(RFC) = 12);

-- Entidad 
alter table Comida add constraint Comida_pkey primary key (idEmpleado);

-- Referencial
alter table Comida add constraint Comida_fkey foreign key (idHotel) REFERENCES Hotel(idHotel) ON DELETE SET NULL ON UPDATE cascade;

-- Comentarios
COMMENT ON CONSTRAINT Comida_pkey ON Comida IS 'La llave primaria para emplaedo';
COMMENT ON CONSTRAINT Comida_fkey ON Comida is 'Llave foranea de emepleado';
COMMENT ON CONSTRAINT ComidaU ON Comida IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Comida IS 'Tabla que contiene los empleados de Comida del hotel';
COMMENT ON COLUMN Comida.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Comida.idHotel IS 'Identificador del Hotel';
COMMENT ON COLUMN Comida.Nombre IS 'Nombre del empleado';
COMMENT ON COLUMN Comida.ApellidoP IS 'Apellido paterno del empleado';
COMMENT ON COLUMN Comida.ApellidoM IS 'Apellido materno del empleado';
COMMENT ON COLUMN Comida.Calle IS 'Calle donde reside el empleado';
COMMENT ON COLUMN Comida.NumeroInterior IS 'NumeroInterior de donde reside el empleado';
COMMENT ON COLUMN Comida.NumeroExterior IS 'NumeroExterior de donde reside el empleado';
COMMENT ON COLUMN Comida.Colonia IS 'Colonia de donde reside el empleado';
COMMENT ON COLUMN Comida.Estado IS 'Estado de donde reside el empleado';
COMMENT ON COLUMN Comida.Horario IS 'Horario de entrada del empleado';
COMMENT ON COLUMN Comida.FechaNacimiento IS 'Fecha de nacimiento del empleado';
COMMENT ON COLUMN Comida.FechaContratacion IS 'Fecha de contratacion del empleado';
COMMENT ON COLUMN Comida.Genero IS 'Genero del empleado';
COMMENT ON COLUMN Comida.RFC IS 'RFC del empleado';
COMMENT ON CONSTRAINT no_vacio1 ON Comida IS 'Restriccion check que usamos para asegurar que Nombre no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Comida IS 'Restriccion check que usamos para asegurar que ApellidoP no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Comida IS 'Restriccion check que usamos para asegurar que ApellidoM no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Comida IS 'Restriccion check que usamos para asegurar que Calle no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Comida IS 'Restriccion check que usamos para asegurar que Colonia no sea vacio';
COMMENT ON CONSTRAINT no_vacio6 ON Comida IS 'Restriccion check que usamos para asegurar que Estado no sea vacio';
COMMENT ON CONSTRAINT no_vacio7 ON Comida IS 'Restriccion check que usamos para asegurar que Genero no sea vacio';
COMMENT ON CONSTRAINT no_vacio8 ON Comida IS 'Restriccion check que usamos para asegurar que RFC no sea vacio';
COMMENT ON CONSTRAINT no_cero ON Comida IS 'Restriccion check que usamos para asegurar que el numero exterior sea mayor a cero';
COMMENT ON CONSTRAINT caracteres_fijos ON Comida IS 'Restriccion check que usamos para asegurar que los caracteres del RFC sean 12 o 13';



/*------------- TelefonoComida ---------------*/

create table TelefonoComida(
	idEmpleado int,
	idTelefonoComida int8
);

--- Restricciones ---

-- Dominio
alter table TelefonoComida alter column idEmpleado set not null;
alter table TelefonoComida alter column idTelefonoComida set not null;
ALTER TABLE TelefonoComida ADD CONSTRAINT TelefonoComidaU UNIQUE (idTelefonoComida);

-- Entidad
alter table TelefonoComida add constraint TelefonoComida_pkey primary key (idTelefonoComida, idEmpleado);

-- Referencial
alter table TelefonoComida add constraint TelefonoComida_fkey foreign key (idEmpleado) REFERENCES Comida(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE; 

-- Comentarios
COMMENT ON CONSTRAINT TelefonoComida_pkey ON TelefonoComida IS 'La llave compuesta para telefono del Empleado';
COMMENT ON CONSTRAINT TelefonoComida_fkey ON TelefonoComida is 'Llave foranea de Telefono Empleado';
COMMENT ON CONSTRAINT TelefonoComidaU ON TelefonoComida IS 'Restriccion unique para el atributo Numero de telefono del Empleado';

COMMENT ON TABLE TelefonoComida IS 'Tabla que contiene los telefonos del Empleado';
COMMENT ON COLUMN TelefonoComida.idEmpleado IS 'Identificador foraneo del Empleado';
COMMENT ON COLUMN TelefonoComida.idTelefonoComida is 'Numero de telefono del Empleado';



/*------------- CorreoComida ---------------*/

create table CorreoComida(
	idEmpleado int,
	CorreoComida varchar(50)
);

--- Restricciones ---

-- Dominio
alter table CorreoComida add constraint de_la_forma check (CorreoComida like '%_@_%._%');
alter table CorreoComida alter column CorreoComida set not null;
alter table CorreoComida alter column idEmpleado set not null;
ALTER TABLE CorreoComida ADD CONSTRAINT CorreoComidaU UNIQUE (CorreoComida);

-- Entidad
alter table CorreoComida add constraint CorreoComida_pkey primary key (CorreoComida, idEmpleado);

-- Referencial
alter table CorreoComida add constraint CorreoComida_fkey foreign key (idEmpleado) REFERENCES Comida(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT CorreoComida_pkey ON CorreoComida IS 'La llave compuesta para correo del empleado';
COMMENT ON CONSTRAINT CorreoComida_fkey ON CorreoComida is 'Llave foranea de correo empleado';
COMMENT ON CONSTRAINT CorreoComidaU ON CorreoComida IS 'Restriccion unique para el atributo correo del empleado';

COMMENT ON TABLE CorreoComida IS 'Tabla que contiene los correos del empleado';
COMMENT ON COLUMN CorreoComida.idEmpleado IS 'Identificador foraneo del empleado';
COMMENT ON COLUMN CorreoComida.CorreoComida is 'Correos electronicos del empleado';
comment on constraint de_la_forma on CorreoComida is 'Restriccion que determina una entrada valida para el correo';



/*------------- Doble ---------------*/

create table Doble(
	NoHabitacion int,
	IdHotel int,
	IdEmpleado int,
	
	NoCama int,
	Disponible bool,
	CostoNoche int
);

--- Restricciones ---

-- Dominio
alter table Doble alter column NoHabitacion set not null;
alter table Doble alter column idHotel set not null;
alter table Doble alter column IdEmpleado set not null;
ALTER TABLE Doble ADD CONSTRAINT DobleU UNIQUE (NoHabitacion);

alter table Doble alter column NoCama set default 2;
alter table Doble alter column Disponible set default(true);
alter table Doble alter column CostoNoche set not null;

-- Entidad
alter table Doble add constraint Doble_pkey primary key (NoHabitacion);

-- Referencial
alter table Doble add constraint Doble_fkey_Hotel foreign key (IdHotel) REFERENCES Hotel(idHotel) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Doble add constraint Doble_fkey_Empleado foreign key (idEmpleado) REFERENCES Apoyo(idEmpleado) ON DELETE SET NULL ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Doble_pkey ON Doble IS 'La llave primaria para la habitacion';
COMMENT ON CONSTRAINT Doble_fkey_Hotel ON Doble is 'Llave foranea de Hotel para habitacion';
COMMENT ON CONSTRAINT Doble_fkey_Empleado ON Doble is 'Llave foranea de Empleado para habitacion';
COMMENT ON CONSTRAINT DobleU ON Doble IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Doble IS 'Tabla que contiene las habitaciones Dobles del hotel';
COMMENT ON COLUMN Doble.NoHabitacion IS 'Identificador de habitacion';
COMMENT ON COLUMN Doble.IdHotel IS 'Identificador de Hotel';
COMMENT ON COLUMN Doble.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Doble.NoCama IS 'Numero de camas de la habitacion';
COMMENT ON COLUMN Doble.Disponible IS '¿La habitacion esta disponible?';
COMMENT ON COLUMN Doble.CostoNoche IS 'Costo por noche de la habitacion';



/*------------- Pent_house ---------------*/

create table Pent_house(
	NoHabitacion int,
	IdHotel int,
	IdEmpleado int,
	
	NoCama int,
	Disponible bool,
	CostoNoche int
	
);

--- Restricciones ---

-- Dominio
alter table Pent_house alter column NoHabitacion set not null;
alter table Pent_house alter column idHotel set not null;
alter table Pent_house alter column idEmpleado set not null;
ALTER TABLE Pent_house ADD CONSTRAINT Pent_houseU UNIQUE (NoHabitacion);

alter table Pent_house alter column NoCama set default 6;
alter table Pent_house alter column Disponible set default(true);
alter table Pent_house alter column CostoNoche set not null;

-- Entidad
alter table Pent_house add constraint Pent_house_pkey primary key (NoHabitacion);

-- Referencial
alter table Pent_house add constraint Pent_house_fkey_Hotel foreign key (IdHotel) REFERENCES Hotel(idHotel) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Pent_house add constraint Pent_house_fkey_Empleado foreign key (idEmpleado) REFERENCES Apoyo(idEmpleado) ON DELETE SET NULL ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Pent_house_pkey ON Pent_house IS 'La llave primaria para la habitacion';
COMMENT ON CONSTRAINT Pent_house_fkey_Hotel ON Pent_house is 'Llave foranea de Hotel para habitacion';
COMMENT ON CONSTRAINT Pent_house_fkey_Empleado ON Pent_house is 'Llave foranea de Empleado para habitacion';
COMMENT ON CONSTRAINT Pent_houseU ON Pent_house IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Pent_house IS 'Tabla que contiene las habitaciones Pent_house del hotel';
COMMENT ON COLUMN Pent_house.NoHabitacion IS 'Identificador de habitacion';
COMMENT ON COLUMN Pent_house.IdHotel IS 'Identificador de Hotel';
COMMENT ON COLUMN Pent_house.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Pent_house.NoCama IS 'Numero de camas de la habitacion';
COMMENT ON COLUMN Pent_house.Disponible IS '¿La habitacion esta disponible?';
COMMENT ON COLUMN Pent_house.CostoNoche IS 'Costo por noche de la habitacion';



/*------------- Cuadruple ---------------*/

create table Cuadruple(
	NoHabitacion int,
	IdHotel int,
	IdEmpleado int,
	
	NoCama int,
	Disponible bool,
	CostoNoche int
);

--- Restricciones ---

-- Dominio
alter table Cuadruple alter column NoHabitacion set not null;
alter table Cuadruple alter column idHotel set not null;
alter table Cuadruple alter column idEmpleado set not null;
ALTER TABLE Cuadruple ADD CONSTRAINT CuadrupleU UNIQUE (NoHabitacion);

alter table Cuadruple alter column NoCama set default 4;
alter table Cuadruple alter column Disponible set default(true);
alter table Cuadruple alter column CostoNoche set not null;

-- Entidad
alter table Cuadruple add constraint Cuadruple_pkey primary key (NoHabitacion);

-- Referencial
alter table Cuadruple add constraint Cuadruple_fkey_Hotel foreign key (IdHotel) REFERENCES Hotel(idHotel) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Cuadruple add constraint Cuadruple_fkey_Empleado foreign key (idEmpleado) REFERENCES Apoyo(idEmpleado) ON DELETE SET NULL ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Cuadruple_pkey ON Cuadruple IS 'La llave primaria para la habitacion';
COMMENT ON CONSTRAINT Cuadruple_fkey_Hotel ON Cuadruple is 'Llave foranea de Hotel para habitacion';
COMMENT ON CONSTRAINT Cuadruple_fkey_Empleado ON Cuadruple is 'Llave foranea de Empleado para habitacion';
COMMENT ON CONSTRAINT CuadrupleU ON Cuadruple IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Cuadruple IS 'Tabla que contiene las habitaciones Cuadruples del hotel';
COMMENT ON COLUMN Cuadruple.NoHabitacion IS 'Identificador de habitacion';
COMMENT ON COLUMN Cuadruple.IdHotel IS 'Identificador de Hotel';
COMMENT ON COLUMN Cuadruple.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Cuadruple.NoCama IS 'Numero de camas de la habitacion';
COMMENT ON COLUMN Cuadruple.Disponible IS '¿La habitacion esta disponible?';
COMMENT ON COLUMN Cuadruple.CostoNoche IS 'Costo por noche de la habitacion';



/*------------- Individual ---------------*/

create table Individual(
	NoHabitacion int,
	IdHotel int,
	IdEmpleado int,
	
	NoCama int,
	Disponible bool,
	CostoNoche int
);

--- Restricciones ---

-- Dominio
alter table Individual alter column NoHabitacion set not null;
alter table Individual alter column idHotel set not null;
alter table Individual alter column idEmpleado set not null;
ALTER TABLE Individual ADD CONSTRAINT IndividualU UNIQUE (NoHabitacion);

alter table Individual alter column NoCama set default 1;
alter table Individual alter column Disponible set default(true);
alter table Individual alter column CostoNoche set not null;

-- Entidad
alter table Individual add constraint Individual_pkey primary key (NoHabitacion);

-- Referencial
alter table Individual add constraint Individual_fkey_Hotel foreign key (IdHotel) REFERENCES Hotel(idHotel) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Individual add constraint Individual_fkey_Empleado foreign key (idEmpleado) REFERENCES Apoyo(idEmpleado) ON DELETE SET NULL ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Individual_pkey ON Individual IS 'La llave primaria para la habitacion';
COMMENT ON CONSTRAINT Individual_fkey_Hotel ON Individual is 'Llave foranea de Hotel para habitacion';
COMMENT ON CONSTRAINT Individual_fkey_Empleado ON Individual is 'Llave foranea de Empleado para habitacion';
COMMENT ON CONSTRAINT IndividualU ON Individual IS 'Restriccion unique para el atributo idEmpleado';

COMMENT ON TABLE Individual IS 'Tabla que contiene las habitaciones Individuals del hotel';
COMMENT ON COLUMN Individual.NoHabitacion IS 'Identificador de habitacion';
COMMENT ON COLUMN Individual.IdHotel IS 'Identificador de Hotel';
COMMENT ON COLUMN Individual.idEmpleado IS 'Identificador del empleado';
COMMENT ON COLUMN Individual.NoCama IS 'Numero de camas de la habitacion';
COMMENT ON COLUMN Individual.Disponible IS '¿La habitacion esta disponible?';
COMMENT ON COLUMN Individual.CostoNoche IS 'Costo por noche de la habitacion';



/*------------- Huesped ---------------*/

create table Huesped(
	idHuesped int,
	
	Nombre varchar(50),
	ApellidoP varchar(50),
	ApellidoM varchar(50),
	Genero varchar(50),
	Nacionalidad varchar(50),
	FechaNacimiento date
);

--- Restricciones ---

-- Dominio
alter table Huesped alter column idHuesped set not null;
ALTER TABLE Huesped ADD CONSTRAINT HuespedU UNIQUE (idHuesped);

alter table Huesped add constraint no_vacio1 check (Nombre <> '');
alter table Huesped add constraint no_vacio2 check (ApellidoP <> '');
alter table Huesped add constraint no_vacio3 check (ApellidoM <> '');
alter table Huesped add constraint no_vacio4 check (Genero <> '');
alter table Huesped add constraint no_vacio5 check (Nacionalidad <> '');
alter table Huesped alter column FechaNacimiento set not null;

-- Entidad
alter table Huesped add constraint Huesped_pkey primary key (idHuesped);

-- Comentarios
COMMENT ON CONSTRAINT Huesped_pkey ON Huesped IS 'La llave primaria de la tabla Huesped';
COMMENT ON CONSTRAINT HuespedU ON Huesped IS 'Restriccion unique para el atributo identificador de huesped';

COMMENT ON TABLE Huesped IS 'Tabla que contiene los huespedes del Huesped';
COMMENT ON COLUMN Huesped.idHuesped IS 'Identificador del huesped';
COMMENT ON COLUMN Huesped.Nombre IS'Nombre del Huesped';
COMMENT ON COLUMN Huesped.ApellidoP IS 'Apellido paterno del huesped';
COMMENT ON COLUMN Huesped.ApellidoM IS 'Apellido materno del huesped';
COMMENT ON COLUMN Huesped.Genero IS 'Genero del huesped';
COMMENT ON COLUMN Huesped.Nacionalidad IS 'Nacionalidad del huesped';
COMMENT ON COLUMN Huesped.FechaNacimiento IS 'Fecha de nacimiento del huesped';
COMMENT ON CONSTRAINT no_vacio1 ON Huesped IS 'Restriccion check que usamos para asegurar que Nombre no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Huesped IS 'Restriccion check que usamos para asegurar que ApellidoP no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Huesped IS 'Restriccion check que usamos para asegurar que ApellidoM no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Huesped IS 'Restriccion check que usamos para asegurar que Genero no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Huesped IS 'Restriccion check que usamos para asegurar que Nacionalidad no sea vacio';



/*------------- TelefonoHuesped ---------------*/

create table TelefonoHuesped(
	idHuesped int,
	idTelefonoHuesped int8
);

--- Restricciones ---

-- Dominio
alter table TelefonoHuesped alter column idHuesped set not null;
alter table TelefonoHuesped alter column idTelefonoHuesped set not null;
ALTER TABLE TelefonoHuesped ADD CONSTRAINT TelefonoHuespedU UNIQUE (idTelefonoHuesped);

-- Entidad
alter table TelefonoHuesped add constraint TelefonoHuesped_pkey primary key (idTelefonoHuesped, idHuesped);

-- Referencial
alter table TelefonoHuesped add constraint TelefonoHuesped_fkey foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT TelefonoHuesped_pkey ON TelefonoHuesped IS 'La llave compuesta para telefono del Huesped';
COMMENT ON CONSTRAINT TelefonoHuesped_fkey ON TelefonoHuesped is 'Llave foranea de Telefono Huesped';
COMMENT ON CONSTRAINT TelefonoHuespedU ON TelefonoHuesped IS 'Restriccion unique para el atributo Numero de telefono del Huesped';

COMMENT ON TABLE TelefonoHuesped IS 'Tabla que contiene los telefonos del Huesped';
COMMENT ON COLUMN TelefonoHuesped.idHuesped IS 'Identificador foraneo del Huesped';
COMMENT ON COLUMN TelefonoHuesped.idTelefonoHuesped is 'Numero de telefono del Huesped';




/*------------- CorreoHuesped ---------------*/

create table CorreoHuesped(
	idHuesped int,
	CorreoHuesped varchar(50)
);

--- Restricciones ---

-- Dominio
alter table CorreoHuesped add constraint de_la_forma check (CorreoHuesped like '%_@_%._%');
alter table CorreoHuesped alter column CorreoHuesped set not null;
alter table CorreoHuesped alter column idHuesped set not null;
ALTER TABLE CorreoHuesped ADD CONSTRAINT CorreoHuespedU UNIQUE (CorreoHuesped);

-- Entidad
alter table CorreoHuesped add constraint CorreoHuesped_pkey primary key (CorreoHuesped, idHuesped);

-- Referencial
alter table CorreoHuesped add constraint CorreoHuesped_fkey foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT CorreoHuesped_pkey ON CorreoHuesped IS 'La llave compuesta para correo del Huesped';
COMMENT ON CONSTRAINT CorreoHuesped_fkey ON CorreoHuesped is 'Llave foranea de correo Huesped';
COMMENT ON CONSTRAINT CorreoHuespedU ON CorreoHuesped IS 'Restriccion unique para el atributo correo del Huesped';

COMMENT ON TABLE CorreoHuesped IS 'Tabla que contiene los correos del Huesped';
COMMENT ON COLUMN CorreoHuesped.idHuesped IS 'Identificador foraneo del Huesped';
COMMENT ON COLUMN CorreoHuesped.CorreoHuesped is 'Correos electronicos del Huesped';
comment on constraint de_la_forma on CorreoHuesped is 'Restriccion que determina una entrada valida para el correo';



/*------------- FormaPago ---------------*/

create table FormaPago(
	idPago int,
	Efectivo int,
	NoTarjeta Bigint,
	FechaVencimiento date
);

--- Restricciones ---

-- Dominio
alter table FormaPago alter column idPago set not null;
ALTER TABLE FormaPago ADD CONSTRAINT FormaPagoU UNIQUE (idPago);
alter table FormaPago add CONSTRAINT pago_valido CHECK (
	(Efectivo IS NOT NULL AND NoTarjeta IS NULL AND FechaVencimiento IS NULL) OR 
	(Efectivo IS NULL AND NoTarjeta IS NOT NULL AND FechaVencimiento IS NOT NULL));

-- Entidad
alter table FormaPago add constraint FormaPago_pkey primary key (idPago);

-- Comentarios
COMMENT ON CONSTRAINT FormaPago_pkey ON FormaPago IS 'La llave primaria para Forma de pago';
COMMENT ON CONSTRAINT FormaPagoU ON FormaPago IS 'Restriccion unique para el atributo idPago';

COMMENT ON TABLE FormaPago IS 'Tabla que contiene la forma de pago que usa el cliente';
COMMENT ON COLUMN FormaPago.idPago IS 'Identificador primario de la forma de pago';
COMMENT ON COLUMN FormaPago.Efectivo is 'La cantidad de efectivo que uso el cliente';
COMMENT ON COLUMN FormaPago.NoTarjeta is 'Numero de tarjeta del cliente';
COMMENT ON COLUMN FormaPago.FechaVencimiento is 'Fecha de vencimiento de la tarjeta del cliente';
COMMENT ON CONSTRAINT pago_valido on FormaPago is 
'Restriccion que determina una entrada valida para la forma de pago, si se utiliza efectivo, entonces no se puede ingresar NoTarjeta ni Fecha de vencimiento y viceversa';



/*------------- Pagar ---------------*/

create table Pagar(
	idHuesped int,
	idPago int
);

--- Restricciones ---

-- Dominio
alter table Pagar alter column idHuesped set not null;
alter table Pagar alter column idPago set not null;

-- Referencial
alter table Pagar add constraint Pagar_fkey_Huesped foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Pagar add constraint Pagar_fkey_Pago foreign key (idPago) REFERENCES FormaPago(idPago) ON DELETE RESTRICT ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Pagar_fkey_Huesped ON Pagar is 'Llave foranea de Hotel para habitacion';
COMMENT ON CONSTRAINT Pagar_fkey_Pago ON Pagar is 'Llave foranea de Empleado para habitacion';

COMMENT ON TABLE Pagar IS 'Relacion pagar entre Huesped y forma de pago';
COMMENT ON COLUMN Pagar.idHuesped IS 'Identificador foraneo de Huesped para Pagar';
COMMENT ON COLUMN Pagar.idPago IS 'Identificador foraneo de idPago para Pagar';



/*------------- Recibo ---------------*/

create table Recibo(
	idRecibo int,
	idHuesped int,
	idHotel int,
	NoHabitacion int,
	CheckIn date,
	Checkout date,
	NoMembresia int,
	esMiembro bool,
	Mascota bool,
	TipoHabitacion varchar(50),
	TipoPago varchar(50)
	);

--- Restricciones ---

--Dominio
alter table Recibo alter column idRecibo set not null;
alter table Recibo alter column idHuesped set not null;
alter table Recibo alter column idHotel set not null;
alter table Recibo alter column NoHabitacion set not null;
alter table Recibo alter column CheckIn set not null;
alter table Recibo alter column Checkout set not null;
alter table Recibo alter column NoMembresia set not null;
alter table Recibo alter column esMiembro set not null;
alter table Recibo alter column Mascota set not null;
alter table Recibo alter column TipoHabitacion set not null;
alter table Recibo alter column TipoPago set not null;

ALTER TABLE Recibo ADD CONSTRAINT ReciboU UNIQUE (idRecibo);

-- Entidad
alter table Recibo add constraint Recibo_pkey primary key (idRecibo, idHuesped, idHotel,NoHabitacion);

-- Referencial
alter table Recibo add constraint Recibo_fkey_Huesped foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Recibo add constraint Recibo_fkey_Hotel foreign key (idHotel) REFERENCES Hotel(idHotel) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Recibo_pkey ON Recibo IS 'La llave compuesta para Recibo';
COMMENT ON CONSTRAINT ReciboU ON Recibo IS 'Restriccion unique para el atributo idRecibo';
COMMENT ON CONSTRAINT Recibo_fkey_Huesped ON Recibo is 'Llave foranea de Huesped para Recibo';
COMMENT ON CONSTRAINT Recibo_fkey_Hotel ON Recibo is 'Llave foranea de Hotel para Recibo';

COMMENT ON TABLE Recibo IS 'Tabla que contiene la información que tiene el recibo de pago de un huesped';
COMMENT ON COLUMN Recibo.idRecibo IS 'Identificador del Recibo';
COMMENT ON COLUMN Recibo.idHuesped is 'Identificador del huesped para Recibo';
COMMENT ON COLUMN Recibo.idHotel is 'Identificador del idHotel para Recibo';
COMMENT ON COLUMN Recibo.CheckIn IS 'Hora de Check in';
COMMENT ON COLUMN Recibo.Checkout IS 'Hora de Check out';
COMMENT ON COLUMN Recibo.NoMembresia IS 'Numero de membresia';
COMMENT ON COLUMN Recibo.esMiembro IS 'Es miembro';
COMMENT ON COLUMN Recibo.Mascota IS '¿El cliente tiene mascotas?';
COMMENT ON COLUMN Recibo.TipoHabitacion IS 'Tipo de habitacion del cliente';
COMMENT ON COLUMN Recibo.TipoPago IS 'Tipo de pago del cliente(efectivo,tarjeta)';


/*------------- Encuesta ---------------*/

create table Encuesta(
	idEncuesta int,
	idHuesped int,
	
	PosibilidadRegreso bool,
	ServicioDado varchar(50),
	Comentario varchar(1000),
	Calificacion int,
	Recomendacion varchar(50),
	instalacion varchar(50)
);

--- Restricciones ---

-- Dominio
alter table Encuesta alter column idEncuesta set not null;
alter table Encuesta alter column idHuesped set not null;
ALTER TABLE Encuesta ADD CONSTRAINT EncuestaU UNIQUE (idEncuesta);

alter table Encuesta alter column PosibilidadRegreso set not null;
alter table Encuesta add constraint no_vacio1 check (ServicioDado <> '');
alter table Encuesta add constraint no_vacio2 check (Comentario <> '');
alter table Encuesta alter column Calificacion set not null;
alter table Encuesta add constraint Calificacion check (Calificacion between 0 and 10);
alter table Encuesta add constraint no_vacio3 check (Recomendacion <> '');
alter table Encuesta add constraint no_vacio4 check (instalacion <> '');

-- Entidad
alter table Encuesta add constraint Encuesta_pkey primary key (idEncuesta, idHuesped);

-- Referencial
alter table Encuesta add constraint Encuesta_fkey foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE NO ACTION ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Encuesta_pkey ON Encuesta IS 'La llave compuesta para Encuesta';
COMMENT ON CONSTRAINT EncuestaU ON Encuesta IS 'Restriccion unique para el atributo idEncuesta';
COMMENT ON CONSTRAINT Encuesta_fkey ON Encuesta is 'Llave foranea de Huesped para Encuesta';

COMMENT ON TABLE Encuesta IS 'Tabla que la informacion de la encuesta que realizo un huesped';
COMMENT ON COLUMN Encuesta.idEncuesta IS 'Identificador de la encuesta';
COMMENT ON COLUMN Encuesta.idHuesped IS 'Identificador foraneo de idHuesped';
COMMENT ON COLUMN Encuesta.PosibilidadRegreso IS '¿Es probable que el cliente vuelva?';
COMMENT ON COLUMN Encuesta.ServicioDado IS 'Servicio que se le brindo al cliente';
COMMENT ON COLUMN Encuesta.Comentario IS 'Comentario del cliente sobre su estadia';
COMMENT ON COLUMN Encuesta.Calificacion IS 'Calificacion del cliente';
COMMENT ON COLUMN Encuesta.Recomendacion IS 'Recomendacion que da el cliente para mejorar el servicio';
COMMENT ON COLUMN Encuesta.instalacion IS 'Hotel al que fue el cliente';
COMMENT ON CONSTRAINT no_vacio1 ON Encuesta is 'Restriccion check que usamos para asegurar que ServicioDado no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Encuesta is 'Restriccion check que usamos para asegurar que Comentario no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Encuesta is 'Restriccion check que usamos para asegurar que Recomendacion no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Encuesta is 'Restriccion check que usamos para asegurar que instalacion no sea vacio';
COMMENT ON CONSTRAINT Calificacion ON Encuesta is 'Restriccion check que usamos para asegurar que la calificacion sea entre 0 y 10';



/*------------- Salon ---------------*/

create table Salon(
	idSalon int,
	idHuesped int,
	Nombre varchar(50),
	Capacidad varchar(50),
	Calle varchar(50),
	NumeroInterior int,
	NumeroExterior int,
	Estado varchar(50),
	Colonia varchar(50),
	HorarioAtencion time
);

--- Restricciones ---

-- Dominio
alter table Salon alter column idSalon set not null;
alter table Salon alter column idHuesped set not null;
ALTER TABLE Salon ADD CONSTRAINT SalonU UNIQUE (idSalon);

alter table Salon add constraint no_vacio1 check (Nombre <> '');
alter table Salon add constraint no_vacio2 check (Capacidad <> '');
alter table Salon add constraint no_vacio3 check (Calle <> '');
alter table Salon alter column NumeroExterior set not null;
alter table Salon add constraint no_cero check (NumeroExterior > 0);
alter table Salon add constraint no_vacio4 check (Estado <> '');
alter table Salon add constraint no_vacio5 check (Colonia <> '');
alter table Salon alter column HorarioAtencion set not null;
alter table Salon add constraint horario check (HorarioAtencion between '08:00:00' and '20:00:00');

-- Entidad
alter table Salon add constraint Salon_pkey primary key (idSalon);

-- Referencial
alter table Salon add constraint Salon_fkey foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE set NULL ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT Salon_pkey ON Salon IS 'La llave compuesta para Salon';
COMMENT ON CONSTRAINT SalonU ON Salon IS 'Restriccion unique para el atributo idSalon';
COMMENT ON CONSTRAINT Salon_fkey ON Salon is 'Llave foranea de Huesped para Salon';

COMMENT ON TABLE Salon IS 'Tabla que guarda la informacion de los Salones';
COMMENT ON COLUMN Salon.idSalon IS 'Identificador del Salon';
COMMENT ON COLUMN Salon.idHuesped IS 'Identificador foraneo de idHuesped';
COMMENT ON COLUMN Salon.Nombre IS 'Nombre del salon';
COMMENT ON COLUMN Salon.Capacidad IS 'Capacidad de cupo del salon';
COMMENT ON COLUMN Salon.Calle IS 'Calle en donde se encuentra el salon';
COMMENT ON COLUMN Salon.NumeroInterior IS 'Numero interior del salon';
COMMENT ON COLUMN Salon.NumeroExterior IS 'Numero exterior del salon';
COMMENT ON COLUMN Salon.Estado IS 'Estado en el que se encuentra el salon';
COMMENT ON COLUMN Salon.Colonia IS 'Colonia en el que se encuentra el salon';
COMMENT ON COLUMN Salon.HorarioAtencion IS 'Hora en el que se atiende a los clientes en el salon';
COMMENT ON CONSTRAINT no_vacio1 ON Salon is 'Restriccion check que usamos para asegurar que Nombre no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON Salon is 'Restriccion check que usamos para asegurar que Capacidad no sea vacio';
COMMENT ON CONSTRAINT no_vacio3 ON Salon is 'Restriccion check que usamos para asegurar que Calle no sea vacio';
COMMENT ON CONSTRAINT no_vacio4 ON Salon is 'Restriccion check que usamos para asegurar que Estado no sea vacio';
COMMENT ON CONSTRAINT no_vacio5 ON Salon is 'Restriccion check que usamos para asegurar que Colonia no sea vacio';
COMMENT ON CONSTRAINT no_cero ON Salon is 'Restriccion check que usamos para asegurar que el numero exterior sea mayor a 0';
COMMENT ON CONSTRAINT horario ON Salon is 'Restriccion check que usamos para asegurar que horario de atencion del salon este dentro de lo establecido';


/*------------- PedirSalon ---------------*/

create table PedirSalon(
	idSalon int,
	idHuesped int,
	
	NombreSalon varchar(50),
	NoAsistente int,
	FechaEvento date,
	NoMembresia int,
	NombreHuesped varchar(50),
	HoraInicio time,
	HoraFin time
);



--- Restricciones ---

-- Dominio
alter table PedirSalon alter column idSalon set not null;
alter table PedirSalon alter column idHuesped set not null;

alter table PedirSalon add constraint no_vacio1 check (NombreSalon <> '');
alter table PedirSalon alter column NoAsistente set not null;
alter table PedirSalon alter column FechaEvento set not null;
alter table PedirSalon alter column NoMembresia set not null;
alter table PedirSalon add constraint no_vacio2 check (NombreHuesped <> '');
alter table PedirSalon alter column HoraInicio set not null;
alter table PedirSalon alter column HoraFin set not null;

-- Referencial
alter table PedirSalon add constraint PedirSalon_fkey_Salon foreign key (idSalon) REFERENCES Salon(idSalon) ON DELETE CASCADE ON UPDATE CASCADE;
alter table PedirSalon add constraint PedirSalon_fkey_Huesped foreign key (idHuesped) REFERENCES Huesped(idHuesped) ON DELETE set NULL ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT PedirSalon_fkey_Salon ON PedirSalon is 'Llave foranea de Salon para PedirSalon';
COMMENT ON CONSTRAINT PedirSalon_fkey_Huesped ON PedirSalon is 'Llave foranea de Huesped para PedirSalon';

COMMENT ON TABLE PedirSalon IS 'Tabla que representa la relacion de pedir un salon';
COMMENT ON COLUMN PedirSalon.idSalon IS 'Identificador foraneo del Salon';
COMMENT ON COLUMN PedirSalon.idHuesped IS 'Identificador foraneo de idHuesped';
COMMENT ON COLUMN PedirSalon.NombreSalon IS 'Nombre del salon';
COMMENT ON COLUMN PedirSalon.NoAsistente IS 'Numero de personas que asistiran al salon';
COMMENT ON COLUMN PedirSalon.FechaEvento IS 'Fecha del dia que rentaran el salon';
COMMENT ON COLUMN PedirSalon.NoMembresia IS 'Numero de membresia del cliente si es que la tiene';
COMMENT ON COLUMN PedirSalon.NombreHuesped IS 'Nombre del huesped';
COMMENT ON COLUMN PedirSalon.HoraInicio IS 'Hora en que inicia el evento';
COMMENT ON COLUMN PedirSalon.HoraFin IS 'Hora en que termina el evento';
COMMENT ON CONSTRAINT no_vacio1 ON PedirSalon is 'Restriccion check que usamos para asegurar que NombreSalon no sea vacio';
COMMENT ON CONSTRAINT no_vacio2 ON PedirSalon is 'Restriccion check que usamos para asegurar que NombreHuesped no sea vacio';
