USE `test`;
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UfoData`;
DROP TABLE IF EXISTS `UfoHotspots`;

CREATE TABLE `UfoData` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SightingTime` datetime NOT NULL,
  `Shape` varchar(50) NOT NULL DEFAULT 'UNKNOWN',
  `Duration` int NOT NULL DEFAULT 0,
  `HoursAndMinutes` varchar(15),
  `Comments` varchar(255),
  `Site` varchar(60),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `UfoHotspots` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SightingTime` datetime NOT NULL,
  `Shape` varchar(50) NOT NULL DEFAULT 'UNKNOWN',
  `Duration` int NOT NULL DEFAULT 0,
  `Comments` varchar(255),
  `City` varchar(15),
  `State` varchar(2),
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



LOAD DATA LOCAL
INFILE '/Users/loganheinz/Projects/UfoHotspots/ufo_sightings.csv'
INTO TABLE UfoData
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;