-- MySQL Script generated by MySQL Workbench

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tinyyoutube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tinyyoutube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tinyyoutube` DEFAULT CHARACTER SET utf8 ;
USE `tinyyoutube` ;

-- -----------------------------------------------------
-- Table `tinyyoutube`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`usuari` (
  `usuari_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(128) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `nom` VARCHAR(60) NOT NULL,
  `data_naixement` DATETIME NULL,
  `sexe` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(10) NULL,
  PRIMARY KEY (`usuari_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `tinyyoutube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`video` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(128) NOT NULL,
  `descripcio` TEXT NOT NULL,
  `grandaria` INT NULL,
  `nom_arxiu` VARCHAR(128) NULL,
  `durada_video` INT NULL,
  `thumbnail_url` VARCHAR(128) NULL,
  `num_reproduccions` INT NOT NULL DEFAULT 0,
  `num_likes` INT NOT NULL DEFAULT 0,
  `num_dislikes` INT NOT NULL DEFAULT 0,
  `estats` ENUM('public', 'ocult', 'privat') NOT NULL DEFAULT 'privat',
  `data_publicacio` DATETIME NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_usuari_idx` (`usuari_id` ASC),
  CONSTRAINT `fk_video_usuari`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tinyyoutube`.`video_etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`video_etiqueta` (
  `video_etiqueta_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`video_etiqueta_id`))
ENGINE = InnoDB;

-- INSERT INTO `video_etiqueta`  (`video_etiqueta_id`, `nom`) VALUES


-- -----------------------------------------------------
-- Table `tinyyoutube`.`video_etiqueta_has_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`video_etiqueta_has_video` (
  `video_etiqueta_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`video_etiqueta_id`, `video_id`),
  INDEX `fk_video_etiqueta_has_video_video1_idx` (`video_id` ASC),
  INDEX `fk_video_etiqueta_has_video_video_etiqueta1_idx` (`video_etiqueta_id` ASC),
  CONSTRAINT `fk_video_etiqueta_has_video_video_etiqueta1`
    FOREIGN KEY (`video_etiqueta_id`)
    REFERENCES `tinyyoutube`.`video_etiqueta` (`video_etiqueta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_etiqueta_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `tinyyoutube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tinyyoutube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`canal` (
  `canal_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(128) NOT NULL,
  `descripcio` TEXT NULL,
  `data_creacio` DATETIME NOT NULL,
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`canal_id`),
  INDEX `fk_canal_usuari1_idx` (`usuari_id` ASC),
  CONSTRAINT `fk_canal_usuari1`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tinyyoutube`.`suscriptors_canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`suscriptors_canal` (
  `usuari_id` INT NOT NULL,
  `canal_id` INT NOT NULL,
  PRIMARY KEY (`usuari_id`, `canal_id`),
  INDEX `fk_usuari_has_canal_canal1_idx` (`canal_id` ASC),
  INDEX `fk_usuari_has_canal_usuari1_idx` (`usuari_id` ASC),
  CONSTRAINT `fk_usuari_has_canal_usuari1`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_canal_canal1`
    FOREIGN KEY (`canal_id`)
    REFERENCES `tinyyoutube`.`canal` (`canal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tinyyoutube`.`like_dislike_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`like_dislike_video` (
  `usuari_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `value` TINYINT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`usuari_id`, `video_id`),
  INDEX `fk_usuari_has_video_video1_idx` (`video_id` ASC),
  INDEX `fk_usuari_has_video_usuari1_idx` (`usuari_id` ASC),
  CONSTRAINT `fk_usuari_has_video_usuari1`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `tinyyoutube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tinyyoutube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(128) NOT NULL,
  `data_creacio` DATETIME NOT NULL,
  `estat` ENUM('publica', 'privat') NOT NULL DEFAULT 'privat',
  `usuari_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_usuari1_idx` (`usuari_id` ASC),
  CONSTRAINT `fk_playlist_usuari1`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tinyyoutube`.`playlist_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`playlist_videos` (
  `playlist_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `video_id`),
  INDEX `fk_playlist_has_video_video1_idx` (`video_id` ASC),
  INDEX `fk_playlist_has_video_playlist1_idx` (`playlist_id` ASC),
  CONSTRAINT `fk_playlist_has_video_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `tinyyoutube`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `tinyyoutube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tinyyoutube`.`comentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`comentari` (
  `comentari_id` INT NOT NULL AUTO_INCREMENT,
  `usuari_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `text` TEXT NOT NULL,
  `data_creacio` DATETIME NOT NULL,
  INDEX `fk_usuari_has_video_video2_idx` (`video_id` ASC),
  INDEX `fk_usuari_has_video_usuari2_idx` (`usuari_id` ASC),
  PRIMARY KEY (`comentari_id`),
  CONSTRAINT `fk_usuari_has_video_usuari2`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_video_video2`
    FOREIGN KEY (`video_id`)
    REFERENCES `tinyyoutube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tinyyoutube`.`like_dislike_comentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tinyyoutube`.`like_dislike_comentari` (
  `usuari_usuari_id` INT NOT NULL,
  `comentari_comentari_id` INT NOT NULL,
  `value` TINYINT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`usuari_usuari_id`, `comentari_comentari_id`),
  INDEX `fk_usuari_has_comentari_comentari1_idx` (`comentari_comentari_id` ASC),
  INDEX `fk_usuari_has_comentari_usuari1_idx` (`usuari_usuari_id` ASC),
  CONSTRAINT `fk_usuari_has_comentari_usuari1`
    FOREIGN KEY (`usuari_usuari_id`)
    REFERENCES `tinyyoutube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_comentari_comentari1`
    FOREIGN KEY (`comentari_comentari_id`)
    REFERENCES `tinyyoutube`.`comentari` (`comentari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
