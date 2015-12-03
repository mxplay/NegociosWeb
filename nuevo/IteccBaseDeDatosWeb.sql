-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itecc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itecc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itecc` DEFAULT CHARACTER SET latin1 ;
USE `itecc` ;

-- -----------------------------------------------------
-- Table `itecc`.`cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`cursos` ;

CREATE TABLE IF NOT EXISTS `itecc`.`cursos` (
  `IdCurso` INT(11) NOT NULL AUTO_INCREMENT,
  `Nivel` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Nombre` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  PRIMARY KEY (`IdCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`seccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`seccion` ;

CREATE TABLE IF NOT EXISTS `itecc`.`seccion` (
  `IdSeccion` INT(11) NOT NULL AUTO_INCREMENT,
  `IdCurso` INT(11) NOT NULL,
  `Nombre` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Modalidad` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Jornada` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  `cursos_IdCurso` INT(11) NOT NULL,
  PRIMARY KEY (`IdSeccion`, `cursos_IdCurso`),
  INDEX `fk_seccion_cursos1_idx` (`cursos_IdCurso` ASC),
  CONSTRAINT `fk_seccion_cursos1`
    FOREIGN KEY (`cursos_IdCurso`)
    REFERENCES `itecc`.`cursos` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`alumnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`alumnos` ;

CREATE TABLE IF NOT EXISTS `itecc`.`alumnos` (
  `IdAlumno` INT(11) NOT NULL AUTO_INCREMENT,
  `IdSeccion` INT(11) NOT NULL,
  `Identidad` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `PrimerNombre` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `SegundoNombre` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `PrimerApellido` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `SegundoApellido` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `FechaDeNacimiento` DATE NOT NULL,
  `TipoDeSangre` VARCHAR(3) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  `seccion_IdSeccion` INT(11) NOT NULL,
  `seccion_cursos_IdCurso` INT(11) NOT NULL,
  PRIMARY KEY (`IdAlumno`),
  UNIQUE INDEX `Identidad` (`Identidad` ASC),
  INDEX `fk_alumnos_seccion1_idx` (`seccion_IdSeccion` ASC, `seccion_cursos_IdCurso` ASC),
  CONSTRAINT `fk_alumnos_seccion1`
    FOREIGN KEY (`seccion_IdSeccion` , `seccion_cursos_IdCurso`)
    REFERENCES `itecc`.`seccion` (`IdSeccion` , `cursos_IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`añoescolar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`añoescolar` ;

CREATE TABLE IF NOT EXISTS `itecc`.`añoescolar` (
  `IdAñoEscolar` INT(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  PRIMARY KEY (`IdAñoEscolar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`materias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`materias` ;

CREATE TABLE IF NOT EXISTS `itecc`.`materias` (
  `IdMateria` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  PRIMARY KEY (`IdMateria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`tipodeusuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`tipodeusuario` ;

CREATE TABLE IF NOT EXISTS `itecc`.`tipodeusuario` (
  `IdTipoDeUsuario` INT(11) NOT NULL,
  `Descripcion` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  PRIMARY KEY (`IdTipoDeUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `itecc`.`usuarios` (
  `IdUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `IdTipoUsuario` INT(11) NOT NULL,
  `NombreDeUsuario` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Contraseña` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Identidad` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Nombre` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `Correo` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Telefono` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Estado` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `UltimoLog` DATETIME NOT NULL,
  `Borrado` INT(11) NOT NULL,
  `tipodeusuario_IdTipoDeUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE INDEX `NombreDeUsuario` (`NombreDeUsuario` ASC),
  UNIQUE INDEX `Identidad` (`Identidad` ASC),
  INDEX `fk_usuarios_tipodeusuario_idx` (`tipodeusuario_IdTipoDeUsuario` ASC),
  CONSTRAINT `fk_usuarios_tipodeusuario`
    FOREIGN KEY (`tipodeusuario_IdTipoDeUsuario`)
    REFERENCES `itecc`.`tipodeusuario` (`IdTipoDeUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`cursomaterias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`cursomaterias` ;

CREATE TABLE IF NOT EXISTS `itecc`.`cursomaterias` (
  `IdCursoMateria` INT(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` INT(11) NOT NULL,
  `IdCurso` INT(11) NOT NULL,
  `IdMateria` INT(11) NOT NULL,
  `Descripcion` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Borrado` INT(11) NOT NULL,
  `materias_IdMateria` INT(11) NOT NULL,
  `cursos_IdCurso` INT(11) NOT NULL,
  `usuarios_IdUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`IdCursoMateria`, `materias_IdMateria`, `cursos_IdCurso`, `usuarios_IdUsuario`),
  INDEX `fk_cursomaterias_materias1_idx` (`materias_IdMateria` ASC),
  INDEX `fk_cursomaterias_cursos1_idx` (`cursos_IdCurso` ASC),
  INDEX `fk_cursomaterias_usuarios1_idx` (`usuarios_IdUsuario` ASC),
  CONSTRAINT `fk_cursomaterias_materias1`
    FOREIGN KEY (`materias_IdMateria`)
    REFERENCES `itecc`.`materias` (`IdMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursomaterias_cursos1`
    FOREIGN KEY (`cursos_IdCurso`)
    REFERENCES `itecc`.`cursos` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursomaterias_usuarios1`
    FOREIGN KEY (`usuarios_IdUsuario`)
    REFERENCES `itecc`.`usuarios` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`notasboleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`notasboleta` ;

CREATE TABLE IF NOT EXISTS `itecc`.`notasboleta` (
  `IdNotasBoleta` INT(11) NOT NULL AUTO_INCREMENT,
  `IdSeccion` INT(11) NOT NULL,
  `IdAñoEscolar` INT(11) NOT NULL,
  `IdAlumno` INT(11) NOT NULL,
  `Borrado` INT(11) NOT NULL,
  `añoescolar_IdAñoEscolar` INT(11) NOT NULL,
  `alumnos_IdAlumno` INT(11) NOT NULL,
  `seccion_IdSeccion` INT(11) NOT NULL,
  `seccion_cursos_IdCurso` INT(11) NOT NULL,
  PRIMARY KEY (`IdNotasBoleta`, `alumnos_IdAlumno`, `seccion_IdSeccion`, `seccion_cursos_IdCurso`),
  INDEX `fk_notasboleta_añoescolar1_idx` (`añoescolar_IdAñoEscolar` ASC),
  INDEX `fk_notasboleta_alumnos1_idx` (`alumnos_IdAlumno` ASC),
  INDEX `fk_notasboleta_seccion1_idx` (`seccion_IdSeccion` ASC, `seccion_cursos_IdCurso` ASC),
  CONSTRAINT `fk_notasboleta_añoescolar1`
    FOREIGN KEY (`añoescolar_IdAñoEscolar`)
    REFERENCES `itecc`.`añoescolar` (`IdAñoEscolar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notasboleta_alumnos1`
    FOREIGN KEY (`alumnos_IdAlumno`)
    REFERENCES `itecc`.`alumnos` (`IdAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notasboleta_seccion1`
    FOREIGN KEY (`seccion_IdSeccion` , `seccion_cursos_IdCurso`)
    REFERENCES `itecc`.`seccion` (`IdSeccion` , `cursos_IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`notasdetalles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`notasdetalles` ;

CREATE TABLE IF NOT EXISTS `itecc`.`notasdetalles` (
  `IdNotasDetalles` INT(11) NOT NULL AUTO_INCREMENT,
  `IdNotasBoleta` INT(11) NOT NULL,
  `IdCursoMateria` INT(11) NOT NULL,
  `IParcial` INT(11) NOT NULL,
  `INivelacion` INT(11) NOT NULL,
  `ITotal` INT(11) NOT NULL,
  `IIParcial` INT(11) NOT NULL,
  `IINivelacion` INT(11) NOT NULL,
  `IITotal` INT(11) NOT NULL,
  `IIIParcial` INT(11) NOT NULL,
  `IIINivelacion` INT(11) NOT NULL,
  `IIITotal` INT(11) NOT NULL,
  `IVParcial` INT(11) NOT NULL,
  `Promedio` DOUBLE NULL DEFAULT NULL,
  `IRecuperacion` INT(11) NOT NULL,
  `IIRecuperacion` INT(11) NOT NULL,
  `notasboleta_IdNotasBoleta` INT(11) NOT NULL,
  PRIMARY KEY (`IdNotasDetalles`, `notasboleta_IdNotasBoleta`),
  INDEX `fk_notasdetalles_notasboleta1_idx` (`notasboleta_IdNotasBoleta` ASC),
  CONSTRAINT `fk_notasdetalles_notasboleta1`
    FOREIGN KEY (`notasboleta_IdNotasBoleta`)
    REFERENCES `itecc`.`notasboleta` (`IdNotasBoleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `itecc`.`padrealumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itecc`.`padrealumno` ;

CREATE TABLE IF NOT EXISTS `itecc`.`padrealumno` (
  `IdPadreAlumno` INT(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` INT(11) NOT NULL,
  `IdAlumno` INT(11) NOT NULL,
  `Borrado` INT(11) NOT NULL,
  `usuarios_IdUsuario` INT(11) NOT NULL,
  `alumnos_IdAlumno` INT(11) NOT NULL,
  PRIMARY KEY (`IdPadreAlumno`, `usuarios_IdUsuario`, `alumnos_IdAlumno`),
  INDEX `fk_padrealumno_usuarios1_idx` (`usuarios_IdUsuario` ASC),
  INDEX `fk_padrealumno_alumnos1_idx` (`alumnos_IdAlumno` ASC),
  CONSTRAINT `fk_padrealumno_usuarios1`
    FOREIGN KEY (`usuarios_IdUsuario`)
    REFERENCES `itecc`.`usuarios` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_padrealumno_alumnos1`
    FOREIGN KEY (`alumnos_IdAlumno`)
    REFERENCES `itecc`.`alumnos` (`IdAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
