DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPaises`()
BEGIN
	Select pais.Nombre from pais;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPYME`(
	IN `pNombreComercio` CHAR(100),
	IN `pEstadoID` INT(11),
	IN `pSectorID` INT(11),
	IN `pAnnoInicioOperaciones` INT(4),
	IN `pNumeroTelefono` CHAR(50),
	IN `pDireccion` CHAR(200),
	IN `pEsActiva` BIT(1),
	IN `pEsNegocioFamiliar` BIT(1),
	IN `pLogo` BLOB,
	IN `pExtensionLogo` CHAR(3),
	IN `pFechaCreacion` DATETIME,
	IN `pFechaUltimaActualizacion` DATETIME,
	IN `pEsFacebookAppInstalado` BIT(1),
	IN `pUsuarioID` INT(11),
	IN `pGeneroPropietarioID` INT(11),
	IN `pCedJuridica` VARCHAR(50)
)
    DETERMINISTIC
BEGIN
START TRANSACTION;
insert into pyme
values (pNombreComercio,pEstadoID,pSectorID,pAnnoInicioOperaciones,pNumeroTelefono,pDireccion,pEsActiva,pEsNegocioFamiliar,pLogo,pExtensionLogo,pFechaCreacion,pFechaUltimaActualizacion,pEsFacebookAppInstalado,pUsuarioID,pGeneroPropietarioID,pCedJuridica); 
COMMIT;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUsuario`(IN `NombreUsuario` VARCHAR(50), IN `NombreCompleto` VARCHAR(100), IN `Clave` VARCHAR(50), IN `EmailContacto` VARCHAR(50))
BEGIN
INSERT INTO usuario(usuario.Usuario,usuario.NombreCompleto,usuario.Clave, usuario.EmailContacto) values
(NombreUsuario,NombreCompleto,Clave,EmailContacto);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRespuestas`(
	IN `pRespuesta01` INT(11),
	IN `pRespuesta02` INT(11),
	IN `pRespuesta03` INT(11),
	IN `pRespuesta04` INT(11),
	IN `pRespuesta05` INT(11),
	IN `pFechaRespuesta` DATETIME,
	IN `pGeneroID` VARCHAR(1),
	IN `pCampo1` VARCHAR(100),
	IN `pCampo2` VARCHAR(100),
	IN `pRangoEdad` TINYINT(1),
	IN `pPymeID` INT(11)
)
    DETERMINISTIC
BEGIN
START TRANSACTION;
insert into respuesta
values(pRespuesta01,pRespuesta02,pRespuesta03,pRespuesta04,pRespuesta05,pFechaRespuesta,pGeneroID,pCampo1,pCampo2,pRangoEdad,pPymeID);
COMMIT;
END$$
DELIMITER ;