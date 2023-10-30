CREATE TABLE `users`(
`id` VARCHAR(20) NOT NULL,
`password` VARCHAR(20) NOT NULL,
`nickname` VARCHAR(20) NOT NULL,
`profile_link` VARCHAR(100),
`profile_message` VARCHAR(50),
`withdrawl_status` TINYINT(1) DEFAULT 0 NOT NULL,
`signup_date` DATETIME NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels`(
`id` VARCHAR(20) NOT NULL,
`channel_name` VARCHAR(20) NOT NULL,
`created_user` VARCHAR(20) NOT NULL,
`channel_link` VARCHAR(100) NOT NULL,
`max_capacity` INT NOT NULL,
`profile_message` VARCHAR(50),
`withdrawl_status` TINYINT(1) DEFAULT 0 NOT NULL,
`signup_date` DATETIME NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`created_user`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
`id` VARCHAR(20) NOT NULL,
`chat_content` VARCHAR(1000) NOT NULL,
`chat_writtenby` VARCHAR(20) NOT NULL,
`chat_channel` VARCHAR(20) NOT NULL,
`chat_created_date` DATETIME NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`chat_writtenby`) REFERENCES `users`(`id`),
FOREIGN KEY(`chat_channel`) REFERENCES `channels`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows`(
`id` VARCHAR(20) NOT NULL,
`follower` VARCHAR(20) NOT NULL,
`followee` VARCHAR(20) NOT NULL,
`follow_date` DATETIME NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`follower`) REFERENCES `users`(`id`),
FOREIGN KEY(`followee`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks`(
`id` VARCHAR(20) NOT NULL,
`blocked_from` VARCHAR(20) NOT NULL,
`blocked_user` VARCHAR(20) NOT NULL,
`blocked_date` DATETIME NOT NULL,
PRIMARY KEY(`id`),
FOREIGN KEY(`blocked_from`) REFERENCES `users`(`id`),
FOREIGN KEY(`blocked_user`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;