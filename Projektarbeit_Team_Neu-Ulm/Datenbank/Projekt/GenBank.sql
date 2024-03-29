SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `GenBank` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `GenBank` ;

-- -----------------------------------------------------
-- Table `GenBank`.`Pat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GenBank`.`Pat` (
  `idPat` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idPat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GenBank`.`MutP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GenBank`.`MutP` (
  `idMP` INT NOT NULL AUTO_INCREMENT,
  `Gene` VARCHAR(255) NULL,
  `Name` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  `Pos.` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `Nuc Change` VARCHAR(45) NULL,
  `Coverage` VARCHAR(45) NULL,
  `AA Change` VARCHAR(45) NULL,
  `Condition` VARCHAR(45) NULL,
  `Hint` VARCHAR(45) NULL,
  `web Ref` VARCHAR(45) NULL,
  `HGVS nomenclatur` VARCHAR(45) NULL,
  `mut Entry` VARCHAR(45) NULL,
  `mut Effect` VARCHAR(45) NULL,
  `TValidation` VARCHAR(45) NULL,
  `MValidation` VARCHAR(45) NULL,
  `Index` INT NULL,
  `Pat_idPat` INT NOT NULL,
  PRIMARY KEY (`idMP`, `Pat_idPat`),
  INDEX `fk_MutP_Pat1_idx` (`Pat_idPat` ASC),
  CONSTRAINT `fk_MutP_Pat1`
    FOREIGN KEY (`Pat_idPat`)
    REFERENCES `GenBank`.`Pat` (`idPat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GenBank`.`Genname`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GenBank`.`Genname` (
  `idG` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idG`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GenBank`.`MutDat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GenBank`.`MutDat` (
  `idMDat` INT NOT NULL AUTO_INCREMENT,
  `Change` VARCHAR(45) NULL,
  `AA change` VARCHAR(45) NULL,
  `nucleotide` VARCHAR(255) NOT NULL,
  `protein` VARCHAR(45) NULL,
  `Phenotype` VARCHAR(255) NULL,
  `Reference` VARCHAR(255) NULL,
  `extraInfo` VARCHAR(45) NULL,
  `Genname_idG` INT NOT NULL,
  PRIMARY KEY (`idMDat`),
  INDEX `fk_MutDat_Genname1_idx` (`Genname_idG` ASC),
  CONSTRAINT `fk_MutDat_Genname1`
    FOREIGN KEY (`Genname_idG`)
    REFERENCES `GenBank`.`Genname` (`idG`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GenBank`.`MuM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GenBank`.`MuM` (
  `MP_idMP` INT NOT NULL,
  `MDat_idDat` INT NOT NULL,
  PRIMARY KEY (`MP_idMP`, `MDat_idDat`),
  INDEX `fk_MutP_has_MutDat_MutDat1_idx` (`MDat_idDat` ASC),
  INDEX `fk_MutP_has_MutDat_MutP1_idx` (`MP_idMP` ASC),
  CONSTRAINT `fk_MutP_has_MutDat_MutP1`
    FOREIGN KEY (`MP_idMP`)
    REFERENCES `GenBank`.`MutP` (`idMP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MutP_has_MutDat_MutDat1`
    FOREIGN KEY (`MDat_idDat`)
    REFERENCES `GenBank`.`MutDat` (`idMDat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
