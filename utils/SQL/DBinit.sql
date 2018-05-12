CREATE USER mydbusername@localhost IDENTIFIED BY 'mydbuserpwd';

CREATE DATABASE piscium DEFAULT CHARACTER SET utf8;

CREATE TABLE pis_user(
    user_id INT(8) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'USER ID',
    user_admin TINYINT NOT NULL DEFAULT '0' COMMENT 'USER ADMIN AUTHENTICATION'
) ENGINE = InnoDB;

CREATE TABLE pis_user_profile(
    user_id INT(8) NOT NULL COMMENT 'USER ID',
    user_name VARCHAR(32) NOT NULL UNIQUE COMMENT 'USER NAME',
    user_email VARCHAR(32) NOT NULL UNIQUE COMMENT 'USER EMAIL',
    user_password CHAR(32) NOT NULL COMMENT 'USER PASSWORD',
    user_phone CHAR(20) NULL COMMENT 'USER MOBILE NUMBER',
    user_avatar VARCHAR(128) NULL COMMENT 'USER AVATAR ICON',
    user_login_state TINYINT NOT NULL DEFAULT '0' COMMENT 'USER LOGIN STATE',
    user_ctime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'USER ACCOUNT CREATION TIME',
    user_utime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'USER ACCOUNT LAST UPDATED TIME'
) ENGINE = InnoDB;

ALTER TABLE pis_user_profile ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES pis_user (user_id);