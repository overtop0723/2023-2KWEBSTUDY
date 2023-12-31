CREATE TABLE `students`(
`name` VARCHAR(20) NOT NULL,
`id` INT NOT NULL,
`year` YEAR NOT NULL,
`major` VARCHAR(20) NOT NULL,
`individual_number` INT NOT NULL,
`phone_number` VARCHAR(20),
`address` VARCHAR(100),
`credits` INT DEFAULT 0 NOT NULL,
`GPA` DOUBLE DEFAULT 0.0 NOT NULL,
`enrollment` TINYINT(1) DEFAULT 1 NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
