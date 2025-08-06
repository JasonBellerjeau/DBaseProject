
CREATE TABLE CITIZEN (
    Id INT NOT NULL,
    Name Varchar(45),
    Street Varchar(45),
    City varchar(45),
    State varchar(45),
    Zipcode int,
    County Varchar(45),
    PRIMARY KEY (Id)
);
CREATE TABLE CAR (
    Owner INT NOT NULL,
    License VARCHAR(45),
    Make VARCHAR(45),
    Model VARCHAR(45),
    PRIMARY KEY (License),
    FOREIGN KEY (Owner)
        REFERENCES CITIZEN (Id)
);
CREATE TABLE OFFICER(
	BadgeNumber int not null,
    Id int,
    County varchar(45),
    PRIMARY KEY (BadgeNumber),
    FOREIGN KEY (Id)
		REFERENCES CITIZEN(Id)
);
CREATE TABLE INCIDENT(
	IncidentId int,
    BadgeNumber int,
    Id int,
    License varchar(45),
    Type varchar(45),
    Date date,
    WeaponUsed bool,
	PRIMARY KEY (IncidentId),
    FOREIGN KEY (BadgeNumber)
		REFERENCES OFFICER (BadgeNumber),
	FOREIGN KEY (Id)
		REFERENCES CITIZEN (Id),
	FOREIGN KEY (License)
		REFERENCES CAR (License)
);
CREATE TABLE WEAPON(
	WeaponId int not null,
    OfficerId int,
    Type varchar(45),
    PRIMARY KEY (WeaponId),
    FOREIGN KEY (OfficerId)
		REFERENCES OFFICER (BadgeNumber)
);
INSERT INTO CITIZEN
VALUES(10030, "John Doe", "111 Valley St", "Cincinnati", "Ohio", 45221, "Hamilton");
INSERT INTO CITIZEN
VALUES(10330, "Jane Doe", "111 Valley St", "Cincinnati", "Ohio", 45221, "Hamilton");
INSERT INTO CITIZEN
VALUES(11030, "Bret Ferguson", "312 Valley St", "Cincinnati", "Ohio", 45221, "Hamilton");
INSERT INTO CITIZEN
VALUES(10630, "Bill Child", "1254 Bleaker Dr", "Cincinnati", "Ohio", 45221, "Hamilton");
INSERT INTO CITIZEN
VALUES(13430, "Biff Chills", "5360 Deer Dr", "Cincinnati", "Ohio", 45069, "Butler");
INSERT INTO CITIZEN
VALUES(43430, "Sabrina Chills", "3209 Blaine Dr", "Cincinnati", "Ohio", 45069, "Butler");
INSERT INTO CITIZEN
VALUES(13450, "Yuri Carmichael", "8290 Trove St", "Cincinnati", "Ohio", 45069, "Butler");
INSERT INTO CITIZEN
VALUES(19130, "Thad", "123 Chicken Dr", "Cincinnati", "Ohio", 45069, "Butler");


INSERT INTO CAR
VALUES(10030,"VB2308","Ford","Explorer");
INSERT INTO CAR
VALUES(11030,"TR3409","Chevy","Impala");
INSERT INTO CAR
VALUES(11030,"TY4509","Ford","F150");
INSERT INTO CAR
VALUES(13430,"RT2309","Chevy","Camero");
INSERT INTO CAR
VALUES(43430,"TE1090","Ford","Fusion");
INSERT INTO CAR
VALUES(13450,"WQ1000","Tesla", "CyberTruck");
INSERT INTO CAR
VALUES(19130,"1","Ford","Model T");

INSERT INTO OFFICER
VALUES(1,10030,"Hamilton");
INSERT INTO OFFICER
VALUES(2,11030,"Hamilton");
INSERT INTO OFFICER
VALUES(3,19130,"Butler");
INSERT INTO OFFICER
VALUES(4,43430,"Butler");

INSERT INTO WEAPON
VALUES(1,1,"Pistol");
INSERT INTO WEAPON
VALUES(2,3,"Shotgun");
INSERT INTO WEAPON
VALUES(3,2,"Rifle");
INSERT INTO WEAPON
VALUES(4,2,"Pistol");
INSERT INTO WEAPON
VALUES(5,4,"Pistol");



SELECT Name
FROM CITIZEN
WHERE Name LIKE '%Doe';