CREATE DATABASE `weather` /*!40100 COLLATE 'utf8_general_ci' */

CREATE TABLE `wd` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`windspeed` FLOAT NOT NULL DEFAULT '0',
	`winddir` FLOAT NOT NULL DEFAULT '0',
	`windgust` FLOAT NOT NULL DEFAULT '0',
	`windgustdir` SMALLINT(6) NOT NULL DEFAULT '0',
	`rainrate` FLOAT NOT NULL DEFAULT '0',
	`rain` FLOAT NOT NULL DEFAULT '0',
	`dewpoint` FLOAT NOT NULL DEFAULT '0',
	`windchill` FLOAT NOT NULL DEFAULT '0',
	`heatindex` SMALLINT(6) NOT NULL DEFAULT '0',
	`outtemp` FLOAT NOT NULL DEFAULT '0',
	`intemp` FLOAT NOT NULL DEFAULT '0',
	`inhumidity` FLOAT NOT NULL DEFAULT '0',
	`outhumidity` FLOAT NOT NULL DEFAULT '0',
	`barometer` FLOAT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `datetime` (`datetime`),
	INDEX `rain` (`rain`),
	INDEX `barometer` (`barometer`),
	INDEX `windgust` (`windgust`),
	INDEX `windspeed` (`windspeed`),
	INDEX `outtemp` (`outtemp`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

DELIMITER //
create function date_trunc(vInterval varchar(7), vDate timestamp)
returns timestamp
begin
    declare toReturn timestamp;

    if vInterval = 'year' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(YEAR, '1900-01-01', vDate) YEAR);
    elseif vInterval = 'quarter' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(QUARTER, '1900-01-01', vDate) QUARTER);
    elseif vInterval = 'month' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(MONTH, '1900-01-01', vDate) MONTH);
    elseif vInterval = 'week' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(WEEK, '1900-01-01', vDate) WEEK);
    elseif vInterval = 'day' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(DAY, '1900-01-01', vDate) DAY);
    elseif vInterval = 'hour' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(HOUR, '1900-01-01', vDate) HOUR);
    elseif vInterval = 'minute' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(MINUTE, '1900-01-01', vDate) MINUTE);
    END IF;

    return toReturn;
end//
DELIMITER ;

