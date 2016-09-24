-- Volcando estructura para procedimiento programathon2016.insertPYME
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPYME`(IN `NombreComercio` CHAR(100), IN `Estado` INT, IN `Sector` INT, IN `CedulaJuridica` VARCHAR(50), IN `GeneroPropietario` INT, IN `Telefono` CHAR(50), IN `EsActiva` BIT(1), IN `EsNegocioFamiliar` BIT(1), IN `Logo` LONGTEXT, IN `AnnioInicioOperaciones` TINYINT(4))
BEGIN
INSERT into pyme(pyme.NombreComercio, pyme.EstadoID, pyme.SectorID, pyme.CedJuridica,
pyme.GeneroPropietarioID, pyme.NumeroTelefono, pyme.EsActiva, pyme.EsNegocioFamiliar,
pyme.Logo, pyme.AnnoInicioOperaciones) values
(NombreComercio, Estado, Sector, CedulaJuridica, GeneroPropietario, Telefono,EsActiva, EsNegocioFamiliar, Logo, AnnioInicioOperaciones);

END//
DELIMITER ;


-- Volcando estructura para procedimiento programathon2016.getPaises
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPaises`()
BEGIN
	Select pais.Nombre from pais;
END//
DELIMITER ;


-- Volcando estructura para procedimiento programathon2016.insertUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUsuario`(IN `NombreUsuario` VARCHAR(50), IN `NombreCompleto` VARCHAR(100), IN `Clave` VARCHAR(50), IN `EmailContacto` VARCHAR(50))
BEGIN
INSERT INTO usuario(usuario.Usuario,usuario.NombreCompleto,usuario.Clave, usuario.EmailContacto) values
(NombreUsuario,NombreCompleto,Clave,EmailContacto);
END//
DELIMITER ;
