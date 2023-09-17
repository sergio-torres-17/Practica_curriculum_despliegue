CREATE DATABASE My_CV;
USE My_CV;
CREATE TABLE Programas (
    ProgramaID INT PRIMARY KEY AUTO_INCREMENT,
    NombrePrograma VARCHAR(255) NOT NULL,
    NivelDominio INT CHECK (NivelDominio >= 1 AND NivelDominio <= 5)
);

CREATE TABLE Personas (
    PersonaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Direccion VARCHAR(255),
    Descripcion TEXT NOT NULL
);

CREATE TABLE ExperienciaLaboral (
    ExperienciaID INT PRIMARY KEY AUTO_INCREMENT,
    PersonaID INT NOT NULL,
    Puesto VARCHAR(255) NOT NULL,
    Empresa VARCHAR(255) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    Descripcion TEXT,
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID)
);

CREATE TABLE Educacion (
    EducacionID INT PRIMARY KEY AUTO_INCREMENT,
    PersonaID INT NOT NULL,
    Institucion VARCHAR(255) NOT NULL,
    Titulo VARCHAR(255) NOT NULL,
    FechaGrado DATE NOT NULL,
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID)
);

CREATE TABLE ProgramasPersona (
    ProgramaPersonaID INT PRIMARY KEY AUTO_INCREMENT,
    PersonaID INT NOT NULL,
    ProgramaID INT NOT NULL,
    NivelDominio INT CHECK (NivelDominio >= 1 AND NivelDominio <= 5),
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID),
    FOREIGN KEY (ProgramaID) REFERENCES Programas(ProgramaID)
);

CREATE TABLE Credenciales (
    CredencialID INT PRIMARY KEY AUTO_INCREMENT,
    PersonaID INT NOT NULL,
    NombreUsuario VARCHAR(50) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,  -- Se recomienda almacenar contraseñas de forma segura (hash)
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID)
);
DELIMITER //
create procedure Sp_Insert_User(
	_Nombre VARCHAR(255),
    _Apellido VARCHAR(255),
    _Email VARCHAR(255),
    _Telefono VARCHAR(15),
    _Direccion VARCHAR(255),
    _Descripcion TEXT,
    _Nombre_Usuario VARCHAR(50),
    _pass NVARCHAR(255)
)
BEGIN
	set @existUser = (select if(count(*)>0, 1, 0) from personas where email = _email);
	if @existUser = 0 then
		INSERT INTO `my_cv`.`personas`
			(`Nombre`,
			`Apellido`,
			`Email`,
			`Telefono`,
			`Direccion`,
			`Descripcion`)
			VALUES
			(_Nombre,
			_Apellido,
			_Email,
			_Telefono,
			_Direccion,
			_Descripcion);
            
            set @usuarioid = (select PersonaId from personas WHERE Email = _Email);
            INSERT INTO `my_cv`.`credenciales`
			(`PersonaID`,
			`NombreUsuario`,
			`Contraseña`)
			VALUES
			(@usuarioid,
			_Nombre_Usuario,
			_pass);
		select 0 `Code`, 'El usuario fue insertado correctemente'`Message`;
    else
		select -1 `Code`, 'El usuario ya existe '`Message`;
    end if;
END;//
//
CREATE VIEW Vw_Programs_people
AS
select concat(p.Nombre ,' ',p.Apellido) `People`, pr.NombrePrograma, pp.NivelDominio  from programas pr
LEFT JOIN programaspersona pp ON pr.programaID = PP.programaid
LEFT JOIN personas p ON p.personaid = pp.personaid
//
delimiter //
CREATE VIEW Vw_Programas_experiencia
AS
select concat(p.Nombre ,' ',p.Apellido) `People`, el.Empresa, el.Puesto,el.FechaInicio,el.FechaFin, el.Descripcion  from experiencialaboral el
LEFT JOIN personas p ON p.personaid = el.personaid
//