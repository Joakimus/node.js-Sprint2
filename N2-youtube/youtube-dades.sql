
USE `tinyyoutube`;

INSERT INTO `usuari` (`usuari_id`, `email`, `password`, `nom`, `data_naixement`, `sexe`, `pais`, `codi_postal`) VALUES
(1, 'mratajczak@gmail.com','Kratajczuk', 'mratajczak', '1994-12-02', 'D','Ukraine', '18990'),
(2, 'aleks.bakowski@gmail.com', 'Espingarda99', 'aleksbak99', '2005-11-24', 'H', 'Polska', '34999'),
(3, 'rosita@yahoo.com', 'Lamasbella', 'rositabella', '2000-06-24', 'D', 'Colombia', '65798'),
(4, 'peporro@hotmail.com', 'Porrompompom88', 'pep88', '1988-05-05', 'H','Cat' ,'08042'),
(5, 'petrowa.olga@gmail.com', 'Olgiuniupetro', 'petrolga', '2003-08-25', 'D','Rosja','44042'); 


INSERT INTO `video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom_arxiu`, `durada_video`, `thumbnail_url`, `num_reproduccions`, `num_likes`,`num_dislikes`, `estats`, `data_publicacio`, `usuari_id`) VALUES
(1, 'Fregir patates','Com fregir patates sense oli', '230', 'patates.mpeg', '5','url1', '18990', '456','7','public','1994-12-02',4),
(2, 'Grullas', 'El baile de la grulla', '99','grullas.mp4', '24','url2', '4532' , '1784', '1', 'privat','2015-11-24',3),
(3, 'Niezbiedz', 'The Russian bear', '459', 'niezbiedz.wmv', '130', 'url3', '10849533','24789','0','public','2010-08-14',5),
(4, 'Mazury', 'Wycieczki Nad jedziorami', '880', 'mazury.ogg', '31','url3','98042','2988', '10', 'privat', '2009-10-15',2),
(5, 'Lviv', 'Na granice stolica kulturalna starej Polski w czasie wojny', '754', 'na_granicy.mp4', '55','url5','444','899','145','ocult','2014-03-22',1); 

-- Comentaris
INSERT INTO `comentari` (`comentari_id`, `video_id`, `usuari_id`, `text`,`data_creacio`)
VALUES  (1, '2', '1',  'Hahahaha! 8-D', '2021-02-25'),
        (2, '5', '3',  'Woooow!', '2022-02-20'),
        (3, '4', '5',  'Cacca de la vacca', '2022-09-28'),
        (4, '3', '4',  'Quina passada!', '2022-02-20'),
        (5, '1', '2',  'Ole, ole', '2022-02-20');

-- LIKES i _DISLIKES
INSERT INTO `tinyyoutube`.`like_dislike_video` (`usuari_id`, `video_id`, `value`, `data`) 
VALUES  ('1',  '1', '8' ,'2022-03-30'),
        ('3',  '4', '9' ,'2021-12-02'),
        ('4',  '5', '4' ,'2020-09-21');

-- LIKES i _DISLIKES dels _COMENTARIS
INSERT INTO `tinyyoutube`.`like_dislike_comentari` (`usuari_usuari_id`,`comentari_comentari_id`,`value`, `data`) 
VALUES ('1', '3', '7', '2022-03-31');
INSERT INTO `tinyyoutube`.`like_dislike_comentari` (`usuari_usuari_id`,`comentari_comentari_id`,`value`, `data`) 
VALUES ('5', '2', '3', '2022-03-15');

-- Playlist
INSERT INTO `playlist` (`playlist_id`,`nom`, `data_creacio`, `estat`,`usuari_id`) 
VALUES  (1,'Malgorzata_Playlist', '2022-08-02', '1','1'),
		(2,'Aleks_Playlist', '2021-03-30', '1','2'),
		(3,'Rosita_Playlist', '2023-03-25', '1','3'),
		(4,'Pep_Playlist', '2023-04-14', '1','4'),
        (5,'Olga_Playlist', '2021-12-20', '1','5');

INSERT INTO `tinyyoutube`.`playlist_videos` (`playlist_id`, `video_id`) 
VALUES  ('1', '1'),
        ('1', '2'),
        ('2', '2'),
		('3', '4'),
		('3', '5'),
		('4', '3'),
		('5', '1'),
		('5', '2'),
		('5', '3'),
		('5', '4');
      

-- ETIQUETES
INSERT INTO `video_etiqueta` (`video_etiqueta_id`, `nom`) 
VALUES  (1,'Master of the Universe'),
        (2,'Hahahaha'),
        (3,'Champion'),
        (4,'Es la canya'),
        (5,'Quina passada'),
        (6,'El despiporre!');

-- ETIQUETES_VIDEO
INSERT INTO `video_etiqueta_has_video` (`video_etiqueta_id`, `video_id`) 
VALUES  ('1', '1'),
		('2', '5'),
		('3', '1'),
		('4', '4'),
		('5', '2'),
		('6', '3');

--Canal i subscriptors
INSERT INTO `canal`  (`canal_id`, `nom`, `data_creacio`, `usuari_id` ) VALUES
(1,'FRANK CUESTA - CANAL YOUTUBE', '2005-01-15', '4'),
(2,'Rammstein Official', '2001-02-25', '1');

INSERT INTO `suscriptors_canal` (`usuari_id`, `canal_id`) 
VALUES  ('1', '1'),
        ('2', '2'),
        ('3', '1'),
        ('4', '1'),
        ('5', '2');
        
        
        
        
        
        
        
        
        
        
        
        
        
        
