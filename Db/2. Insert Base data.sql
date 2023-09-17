USE My_CV;
CALL `Sp_Insert_User`('Sergio Saúl', 'Torres Ibarra', 'torres.sergio.1am@gmail.com', '4773817644', 'valle de hidalgo 107 col. agua azul', 'Desarrollador Fullstack -.NET y arquitecto de software', 'sergio_torres_17', SHA2('171200', 512));
-- Educación 
INSERT INTO `Educacion` (`PersonaID`,`Institucion`,`Titulo`,`FechaGrado`) VALUES(1,'CBTis 225','Técnico en programación',NOW());
INSERT INTO `Educacion` (`PersonaID`,`Institucion`,`Titulo`,`FechaGrado`) VALUES(1,'ITL Leon','Ingeniero en sistemas computacionales',NOW());
-- Programas
INSERT INTO `Programas` (`NombrePrograma`,`NivelDominio`)VALUES('Excel',5);
INSERT INTO `Programas` (`NombrePrograma`,`NivelDominio`)VALUES('Word',5);
INSERT INTO `Programas` (`NombrePrograma`,`NivelDominio`)VALUES('Power Point',4);
INSERT INTO `Programas` (`NombrePrograma`,`NivelDominio`)VALUES('Publisher',2);
-- Experiencia Laboral 
INSERT INTO `ExperienciaLaboral` (`PersonaID`,`Puesto`,`Empresa`,`FechaInicio`,`FechaFin`,`Descripcion`) VALUES (1,'Profesor de robotica','Instituto pierre faure',cast('2020-02-05' as datetime),cast('2020-06-15' as datetime),'Impartía la materia de fundamentos de robotica para grados de secundaria.');
INSERT INTO `ExperienciaLaboral` (`PersonaID`,`Puesto`,`Empresa`,`FechaInicio`,`FechaFin`,`Descripcion`) VALUES (1,'Desarrollador Backend','Multi-Code MX Systems',cast('2016-02-15' as datetime),cast(now() as datetime),'Desarrollo general de proyectos a clientes independientes');
INSERT INTO `ExperienciaLaboral` (`PersonaID`,`Puesto`,`Empresa`,`FechaInicio`,`FechaFin`,`Descripcion`) VALUES (1,'Desarrollador COBOL','ABC Consultora',cast('2019-08-05' as datetime),cast('2020-10-03' as datetime),'Desarrollo de mdulos COBOL para industria bancaria');
INSERT INTO `ExperienciaLaboral` (`PersonaID`,`Puesto`,`Empresa`,`FechaInicio`,`FechaFin`,`Descripcion`) VALUES (1,'Analista de soporte de tiendas','Grupo Charly',cast('2020-09-15' as datetime),cast(now() as datetime),'Analista de soporte de tiendas');
-- Programas persona
INSERT INTO `ProgramasPersona`(`PersonaID`,`ProgramaID`,`NivelDominio`)VALUES(1,1,5);
INSERT INTO `ProgramasPersona`(`PersonaID`,`ProgramaID`,`NivelDominio`)VALUES(1,2,5);
INSERT INTO `ProgramasPersona`(`PersonaID`,`ProgramaID`,`NivelDominio`)VALUES(1,3,4);
INSERT INTO `ProgramasPersona`(`PersonaID`,`ProgramaID`,`NivelDominio`)VALUES(1,4,2);
