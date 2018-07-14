DROP TABLE Ticket;
DROP TABLE Airplane;
DROP TABLE Connections;
DROP TABLE Customer;
DROP TABLE AirportPersonnel;
DROP TABLE Airport;
DROP TABLE Airline;
DROP TABLE People;

/* NOTES */
/* EMPLOYS MERGED WITH AIRPORTPERSONNEL */
/* CONTAINS MERGED WITH AIRPLANE */

CREATE TABLE People
(
	PID INT NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Age INTEGER NOT NULL,
    CHECK (Age >= 1),
	Address VARCHAR(50) NULL,
	Phone VARCHAR(20) NULL,
	Email VARCHAR(50) NULL,
	PRIMARY KEY (PID)
);

CREATE TABLE Airport
(
	AirID INT NOT NULL,
	Name VARCHAR(50) NOT NULL,
	City VARCHAR(30) NOT NULL,
	Country VARCHAR(30) NOT NULL,
	PRIMARY KEY (AirID)
);

CREATE TABLE Customer /*CC = CREDIT CARD*/
(
    PID INT NOT NULL,
    Member VARCHAR(3) NOT NULL,
    Fee INT NOT NULL,
    CHECK (Fee >= 0),
    Points INT NOT NULL,
    CHECK (Points >= 0),
    CCNUM VARCHAR(20) NULL,
    CCEXPIRYDATE DATE NULL,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES People(PID) ON DELETE CASCADE
);

CREATE TABLE Airline
(   
    ALID INT NOT NULL, 
    Name VARCHAR(35) NOT NULL,
    PRIMARY KEY (ALID)
);

CREATE TABLE Connections
(
    FromAirID INT NOT NULL,
    ToAirID INT NOT NULL,
    Distance INT NOT NULL,
    PRIMARY KEY (FromAirID, ToAirID),
    FOREIGN KEY (FromAirID) REFERENCES Airport(AirID) ON DELETE CASCADE,
    FOREIGN KEY (ToAirID) REFERENCES Airport(AirID) ON DELETE CASCADE
);

CREATE TABLE AirportPersonnel
(
    AirID INT NOT NULL,
    PID INT NOT NULL,
    Salary INT NULL,
    CHECK (Salary >= 0),
    Job VARCHAR(30) NULL,
    PRIMARY KEY (AirID, PID),
    FOREIGN KEY (AirID) REFERENCES Airport(AirID) ON DELETE CASCADE,
    FOREIGN KEY (PID) REFERENCES People(PID) ON DELETE CASCADE
);

CREATE TABLE Airplane
(
    APID INT NOT NULL,
    ALID INT NOT NULL,
    Status VARCHAR(10) NOT NULL,
    PlaneFrom INT NOT NULL,
    PlaneTo INT NOT NULL,
    DepartureTime DATE NOT NULL,
    ArrivalTime DATE NOT NULL,
    FlightTime INT NOT NULL,
    NumOpenSeats INT NOT NULL,
    PRIMARY KEY (APID, ALID),
    FOREIGN KEY (ALID) REFERENCES Airline(ALID) ON DELETE CASCADE,
    FOREIGN KEY (PlaneFrom) REFERENCES Airport(AirID) ON DELETE CASCADE,
    FOREIGN KEY (PlaneTo) REFERENCES Airport(AirID) ON DELETE CASCADE
);

CREATE TABLE Ticket
(
    PID INT NOT NULL,
    APID INT NOT NULL,
    ALID INT NOT NULL,
    Price INT NOT NULL,
    SeatClass VARCHAR(10) NOT NULL,
    SeatNum INT NOT NULL,
    PRIMARY KEY (PID, APID, ALID, SeatNum),
    FOREIGN KEY (PID) REFERENCES People(PID) ON DELETE CASCADE,
    FOREIGN KEY (APID, ALID) REFERENCES Airplane(APID, ALID) ON DELETE CASCADE
);

INSERT INTO People VALUES (723249,'Cecilia Chase',77,'P.O. Box 754, 4371 Sapien, St.','1-592-564-0969','a.purus.Duis@porttitor.co.uk');
INSERT INTO People VALUES (828991,'Nicholas Potter',5,'8128 Laoreet, Av.','1-232-700-3650',NULL);
INSERT INTO People VALUES (177524,'Adam Hyde',41,'P.O. Box 605, 7707 Magna, Avenue','1-148-355-0811','ultricies.sem.magna@aliquetliberoInteger.co.uk');
INSERT INTO People VALUES (274749,'Nash Cantrell',73,'165-6369 Aliquam St.','1-727-502-2163','id.magna@egestasnuncsed.ca');
INSERT INTO People VALUES (796742,'Marny White',72,'P.O. Box 833, 8822 Pretium Ave','1-165-316-3318','Aliquam@enim.ca');
INSERT INTO People VALUES (992959,'Wing Kennedy',72,'Ap #624-3563 Velit Street','1-877-398-2832','ultricies.ornare.elit@est.net');
INSERT INTO People VALUES (515908,'May Spence',1,'3041 Tempor Street','1-631-277-0426',NULL);
INSERT INTO People VALUES (159795,'Cairo Patterson',83,'485-3195 Lorem, St.','1-119-550-0387','Morbi.non.sapien@ridiculusmusProin.com');
INSERT INTO People VALUES (284266,'Cedric Bauer',70,'760-4308 Rutrum Rd.','1-396-428-7632','lorem@Duisrisusodio.net');
INSERT INTO People VALUES (773443,'Zachary Knowles',67,'153-9124 Aenean Street','1-666-127-6010','adipiscing.lobortis.risus@risusNuncac.ca');
INSERT INTO People VALUES (424133,'Ainsley Everett',30,'6359 Pharetra Road','1-571-560-7450','sed@mi.net');
INSERT INTO People VALUES (931989,'Alisa Buckner',104,'Ap #226-5331 Hendrerit Ave','1-616-645-0213','auctor.odio.a@lectusCumsociis.com');
INSERT INTO People VALUES (280855,'Adam Cobb',78,'Ap #455-4732 Fusce Road','1-370-996-1758','mi.ac.mattis@nisidictum.edu');
INSERT INTO People VALUES (183394,'Plato Freeman',102,'P.O. Box 421, 3465 Lacus St.','1-595-658-9754','Donec@facilisisnonbibendum.co.uk');
INSERT INTO People VALUES (750827,'Camille Kim',21,'P.O. Box 110, 6808 Ultricies Road','1-503-615-9335','commodo.hendrerit.Donec@luctuset.co.uk');
INSERT INTO People VALUES (697585,'Aristotle Sykes',88,'P.O. Box 689, 2031 Semper Street','1-191-986-4062','Aliquam.erat@elit.edu');
INSERT INTO People VALUES (851415,'Jaime Brady',114,'Ap #915-1848 Eu Rd.','1-553-772-5338','orci.adipiscing.non@auctor.com');
INSERT INTO People VALUES (560255,'Dara Hess',117,'P.O. Box 115, 6479 Eros. St.','1-126-494-2537','dis.parturient.montes@velitQuisque.ca');
INSERT INTO People VALUES (660197,'Olivia Kelley',83,'Ap #779-3831 Non Av.','1-632-567-3453','imperdiet.ullamcorper.Duis@cursus.com');
INSERT INTO People VALUES (357337,'Yasir Meyer',101,'Ap #183-6056 Arcu St.','1-121-520-6158','per.inceptos@etmagnisdis.com');
INSERT INTO People VALUES (562191,'Vanna Franks',39,'P.O. Box 922, 9818 Cras Avenue','1-975-728-7468','molestie@lectusquis.com');
INSERT INTO People VALUES (228813,'Hunter Watkins',113,'750-8739 Orci Road','1-848-162-6020','mauris.erat@semper.ca');
INSERT INTO People VALUES (919299,'Rae Willis',114,'Ap #403-671 Aliquam Ave','1-726-148-2091','Donec@auctor.org');
INSERT INTO People VALUES (174203,'Solomon Randall',11,'P.O. Box 421, 5997 Amet Road','1-764-187-8255','neque.Nullam.ut@loremsit.com');
INSERT INTO People VALUES (392724,'Branden Owens',40,'P.O. Box 720, 5479 Hendrerit Avenue','1-142-436-5762','Nullam.ut@porttitor.edu');
INSERT INTO People VALUES (993479,'Aladdin Oconnor',97,'885-205 Luctus Rd.','1-359-647-0896','tristique.neque@QuisquevariusNam.com');
INSERT INTO People VALUES (377465,'Dante Guy',97,'Ap #197-5562 Mauris Road','1-542-756-1179','quam.Curabitur@aliquetProin.com');
INSERT INTO People VALUES (527434,'Oscar Burke',3,'4061 In, Street','1-618-284-3206',NULL);
INSERT INTO People VALUES (301619,'Montana Hudson',29,'585-1318 A, Street','1-460-670-8632','consectetuer@sitamet.edu');
INSERT INTO People VALUES (155192,'Urielle Simpson',31,'739-4108 Laoreet Road','1-341-238-8001','Morbi.accumsan@uteratSed.edu');
INSERT INTO People VALUES (287490,'Nevada Ferrell',7,'7352 Quis, St.','1-991-750-7792',NULL);
INSERT INTO People VALUES (299491,'William Joseph',103,'9799 Tellus Ave','1-309-792-1589','egestas@molestiepharetra.net');
INSERT INTO People VALUES (485009,'Brendan Walters',59,'Ap #437-9644 Sed Avenue','1-557-222-5901','non.bibendum@vitaediam.com');
INSERT INTO People VALUES (394651,'Caryn Cantrell',22,'5542 Pede, Avenue','1-997-116-6066','adipiscing@commodohendrerit.co.uk');
INSERT INTO People VALUES (537639,'Winter Johnson',89,'P.O. Box 947, 5887 Aliquam Avenue','1-641-319-9683','nisl.Quisque@etipsumcursus.com');
INSERT INTO People VALUES (420184,'Keiko Scott',118,'P.O. Box 842, 8828 Scelerisque Rd.','1-964-530-1979','pretium@tempusloremfringilla.edu');
INSERT INTO People VALUES (806233,'Shay Bentley',26,'Ap #544-1168 Neque St.','1-474-519-4522','Nam@fermentumconvallis.ca');
INSERT INTO People VALUES (160095,'Kennedy Cain',6,'551-8309 Nulla Av.','1-333-137-6118',NULL);
INSERT INTO People VALUES (756299,'Samson Brennan',10,'7397 Velit. Avenue','1-623-519-9674','suscipit.est@pede.co.uk');
INSERT INTO People VALUES (487946,'Walker Shepard',99,'599-2548 Amet, Ave','1-735-577-0311','Proin.non@torquentperconubia.co.uk');
INSERT INTO People VALUES (200670,'Amaya Cameron',66,'936-5692 Elementum, St.','1-619-261-2059','nibh.vulputate@rhoncusNullamvelit.ca');
INSERT INTO People VALUES (304299,'Porter Gilmore',23,'3162 Gravida Ave','1-209-722-8308','risus@Phaselluselitpede.co.uk');
INSERT INTO People VALUES (742034,'Oleg Marquez',34,'801-4998 Ligula. Rd.','1-979-937-4266','orci.consectetuer.euismod@nisi.edu');
INSERT INTO People VALUES (841963,'Brenden Hurley',100,'P.O. Box 969, 3035 Vel Road','1-201-465-4661','metus.vitae.velit@nonummyacfeugiat.com');
INSERT INTO People VALUES (178318,'Giselle Morse',41,'Ap #576-689 Dui Road','1-636-798-3472','sit.amet.ante@variusultrices.com');
INSERT INTO People VALUES (113347,'Reece Schmidt',79,'P.O. Box 291, 9615 Eu Rd.','1-858-229-9913','ac.feugiat.non@neceuismod.com');
INSERT INTO People VALUES (421373,'Chancellor Miller',70,'P.O. Box 178, 4237 Orci. Ave','1-661-319-6525','Nam.tempor@atrisusNunc.edu');
INSERT INTO People VALUES (868971,'Arthur Maynard',35,'7436 Mauris St.','1-383-473-2100','eu@diam.edu');
INSERT INTO People VALUES (457097,'Quin Head',90,'716-4469 Amet Rd.','1-283-763-4351','Curae.Phasellus.ornare@euismodenim.ca');
INSERT INTO People VALUES (706478,'James Mercer',17,'1463 Mauris Street','1-512-838-2238','malesuada.Integer@arcu.org');
INSERT INTO People VALUES (234765,'Hector Buckner',38,'Ap #184-854 In Rd.','1-705-540-9986','est@pharetrautpharetra.ca');
INSERT INTO People VALUES (831796,'Richard Summers',18,'Ap #217-175 Sociosqu Street','1-931-467-3449','libero.lacus@posuerecubilia.ca');
INSERT INTO People VALUES (321380,'Irene Dyer',46,'P.O. Box 686, 1055 Felis Street','1-520-286-7157','arcu.eu.odio@elitfermentumrisus.co.uk');
INSERT INTO People VALUES (845201,'Octavius Lawrence',43,'P.O. Box 527, 4000 Mauris Av.','1-745-749-1937','Donec@Nullatempor.org');
INSERT INTO People VALUES (322548,'Wesley Berry',109,'P.O. Box 788, 9009 Ipsum Ave','1-591-626-4180','mus@pharetranibhAliquam.org');
INSERT INTO People VALUES (112625,'Aspen Barnett',52,'895-1045 Orci, St.','1-546-708-2380','laoreet.libero@acmattisornare.org');
INSERT INTO People VALUES (220862,'Lunea Henson',59,'2643 Vestibulum Rd.','1-389-789-3244','nulla.Integer@SuspendisseduiFusce.com');
INSERT INTO People VALUES (870568,'Kristen Sellers',4,'5424 Metus. Road','1-714-488-3328',NULL);
INSERT INTO People VALUES (159117,'Oliver Mayer',38,'2608 Dapibus St.','1-767-423-0437','metus.Vivamus.euismod@aliquamadipiscinglacus.ca');
INSERT INTO People VALUES (350270,'Stephen Harmon',38,'788 Et Av.','1-727-923-1450','adipiscing@Nuncsollicitudin.edu');
INSERT INTO People VALUES (806909,'Ryder Sellers',16,'1128 Ullamcorper Ave','1-766-124-2202','sit@Donecnonjusto.co.uk');
INSERT INTO People VALUES (287148,'Sydney Morris',10,'Ap #143-7735 Leo. St.','1-369-520-6806','fringilla.mi@luctuset.net');
INSERT INTO People VALUES (564275,'Sloane Whitfield',30,'Ap #678-7090 Sapien, Street','1-401-490-5330','bibendum.fermentum@Nunc.net');
INSERT INTO People VALUES (623448,'Beverly Sykes',79,'542-989 Et Rd.','1-413-248-9135','metus@magna.ca');
INSERT INTO People VALUES (392240,'Kimberly Moses',78,'P.O. Box 783, 4179 Ullamcorper. Rd.','1-263-909-1221','mi@quislectus.net');
INSERT INTO People VALUES (996834,'Raphael Petty',19,'Ap #917-8889 Mi Road','1-223-869-4749','ac.turpis.egestas@acfermentum.ca');
INSERT INTO People VALUES (215208,'Harper Francis',59,'P.O. Box 946, 5910 A St.','1-502-842-0402','dolor.vitae.dolor@enimnisl.co.uk');
INSERT INTO People VALUES (305605,'Tarik Pitts',46,'531-6253 Non, Avenue','1-842-371-7568','consectetuer@ataugueid.org');
INSERT INTO People VALUES (318137,'Amir Koch',100,'358-8189 Posuere, Road','1-876-590-4745','tristique@tortor.com');
INSERT INTO People VALUES (416851,'Galvin Finch',106,'Ap #950-8611 Aliquam Street','1-144-930-8779','imperdiet.erat.nonummy@elit.co.uk');
INSERT INTO People VALUES (502912,'Zahir Huff',17,'772-7905 Duis Rd.','1-152-219-3113','dui.lectus@Pellentesquetincidunt.net');
INSERT INTO People VALUES (207185,'Randall Booker',9,'6325 Semper Rd.','1-116-383-4155',NULL);
INSERT INTO People VALUES (197616,'Angela Wilkerson',63,'P.O. Box 892, 4478 A, Rd.','1-802-604-5535','nibh@netusetmalesuada.edu');
INSERT INTO People VALUES (145918,'Kylee Bell',48,'6433 Magna. Rd.','1-420-372-7402','diam.Sed@Aeneaneget.edu');
INSERT INTO People VALUES (691472,'Astra Lambert',66,'875-1855 Enim, Road','1-575-705-3857','eget.lacus.Mauris@velitAliquam.org');
INSERT INTO People VALUES (302990,'Kadeem Freeman',71,'Ap #308-5203 Ornare, Ave','1-286-674-6570','elit.sed.consequat@ligula.net');
INSERT INTO People VALUES (581360,'Joshua Neal',29,'P.O. Box 637, 5113 Vel, St.','1-195-632-0554','Nunc.pulvinar@venenatisa.co.uk');
INSERT INTO People VALUES (522968,'Clare Mercado',35,'Ap #342-3010 Ornare, St.','1-980-159-8486','mauris.sapien@mi.com');
INSERT INTO People VALUES (959488,'Salvador Gallegos',40,'P.O. Box 687, 471 Quam St.','1-452-646-0965','nunc@sollicitudinorci.co.uk');
INSERT INTO People VALUES (337109,'Kuame Glenn',26,'449-9993 Mauris. Street','1-812-425-8956','accumsan.convallis.ante@utlacusNulla.co.uk');
INSERT INTO People VALUES (800692,'Ashely Bond',2,'2220 Sapien. Rd.','1-425-174-5726',NULL);
INSERT INTO People VALUES (512493,'Mufutau Odonnell',28,'409-2387 Lacus St.','1-651-129-5969','urna.Nunc@idmagna.edu');
INSERT INTO People VALUES (990234,'Avram Simon',11,'722-2219 Justo Avenue','1-171-901-4885','arcu@accumsannequeet.ca');
INSERT INTO People VALUES (784484,'John Park',23,'P.O. Box 179, 9135 Augue, Av.','1-275-737-5260','tincidunt.congue@accumsan.org');
INSERT INTO People VALUES (928235,'Yvette Sloan',59,'252-4886 Id, St.','1-905-991-7469','Sed.nunc@a.edu');
INSERT INTO People VALUES (256148,'Sawyer Randall',90,'4656 Non, St.','1-153-146-9104','Quisque@eleifend.ca');
INSERT INTO People VALUES (818809,'Adara Case',40,'Ap #820-4107 Lobortis Av.','1-943-696-7651','Nulla.semper.tellus@Nullam.co.uk');
INSERT INTO People VALUES (527915,'Kylie Nguyen',122,'854-9105 Arcu. Rd.','1-523-294-4704','dictum.eu.placerat@etmalesuada.org');
INSERT INTO People VALUES (117361,'Madeson English',50,'P.O. Box 271, 9195 Porttitor Av.','1-146-783-3708','laoreet@Aenean.ca');
INSERT INTO People VALUES (708495,'Wanda Duncan',97,'460-2903 Pede, Rd.','1-769-956-7838','sit@sed.com');
INSERT INTO People VALUES (423667,'Alan Page',121,'2636 Risus. St.','1-754-480-6377','neque.Nullam@ipsumnonarcu.org');
INSERT INTO People VALUES (195900,'Jonah Lin',23,'312 Egestas. St.','1-336-682-3131','eu.augue.porttitor@mollisDuissit.co.uk');
INSERT INTO People VALUES (350089,'Zahir Oliver',122,'P.O. Box 280, 1637 Nibh Road','1-165-489-8967','sed.orci@Nunc.com');
INSERT INTO People VALUES (877725,'Aileen Vinson',21,'P.O. Box 741, 2835 Mi Ave','1-521-381-4811','luctus@Crasconvallisconvallis.org');
INSERT INTO People VALUES (148798,'Iola Yang',8,'Ap #984-4977 Nec, St.','1-911-707-6179',NULL);
INSERT INTO People VALUES (708875,'Gabriel Whitehead',73,'8092 Nunc Av.','1-935-610-7895','tempor.est.ac@Morbinequetellus.edu');
INSERT INTO People VALUES (465197,'Kimberley Blankenship',88,'9572 Integer Avenue','1-651-795-2504','sociosqu.ad@estconguea.com');
INSERT INTO People VALUES (472632,'Keegan Lang',106,'P.O. Box 735, 1253 Aliquet Av.','1-184-387-3584','dis.parturient.montes@velest.ca');
INSERT INTO People VALUES (970784,'Colby Orr',73,'2989 Pharetra Road','1-561-164-9541','orci.adipiscing.non@nonegestas.org');
INSERT INTO People VALUES (170544,'Barclay Adkins',27,'P.O. Box 975, 8829 Dolor Street','1-884-123-5300','aliquet@at.org');

INSERT INTO Airport VALUES (111, 'Ainsworth Minicipal Airport', 'Ainsworth', 'UNITED STATES');
INSERT INTO Airport VALUES (112, 'Amsterdam Schiphol Airport', 'Amsterdam', 'NETHERLANDS');
INSERT INTO Airport VALUES (113, 'Aksu Airport', 'Aksu', 'CHINA');
INSERT INTO Airport VALUES (114, 'Arvidsjaur Airport', 'Arvidsjaur', 'SWEDEN');
INSERT INTO Airport VALUES (115, 'Del Bajio Airport', 'Leon', 'MEXICO');
INSERT INTO Airport VALUES (116, 'Sjamsudin Noor Airport', 'Banjarmasin', 'INDONESIA');
INSERT INTO Airport VALUES (117, 'Bandirma Airport', 'Bandirma Airport', 'TURKEY');
INSERT INTO Airport VALUES (118, 'Batajnica Airport', 'Belgrade', 'SERBIA');
INSERT INTO Airport VALUES (119, 'Chlef Airport', 'Chlef', 'ALGERIA');
INSERT INTO Airport VALUES (120, 'I Kapodistrias Airport', 'Kerkyra', 'GREECE');
INSERT INTO Airport VALUES (121, 'Charles De Gaulle International Airport', 'Paris', 'FRANCE');
INSERT INTO Airport VALUES (122, 'Patenga Airport', 'Chittagong', 'BANGLADESH');
INSERT INTO Airport VALUES (123, 'Mohanbari Airport', 'Dibrugarh', 'INDIA');
INSERT INTO Airport VALUES (124, 'Dhahran International', 'Dhahran', 'SAUDI ARABIA');
INSERT INTO Airport VALUES (125, 'Daugavpils Airport', 'Daugavpils', 'LATVIA');
INSERT INTO Airport VALUES (126, 'Aba Tenna D Yilma Airport', 'Dire Dawa', 'ETHIOPIA');
INSERT INTO Airport VALUES (127, 'Ercan Airport', 'Ercan', 'CYPRUS');
INSERT INTO Airport VALUES (128, 'Argostoli Airport', 'Kefalonia', 'GREECE');
INSERT INTO Airport VALUES (129, 'Sege Airport', 'Sege', 'SOLOMON ISLANDS');
INSERT INTO Airport VALUES (130, 'Geneina Airport', 'Geneina', 'SUDAN');
INSERT INTO Airport VALUES (131, 'Grand Bahama International Airport', 'Freeport', 'BAHAMAS');
INSERT INTO Airport VALUES (132, 'Frankfurt International', 'Frankfurt', 'GERMANY');
INSERT INTO Airport VALUES (133, 'Marillac Airport', 'Fort Dauphin', 'MADAGASCAR');
INSERT INTO Airport VALUES (134, 'Itazuke Airport', 'Fukuoka', 'JAPAN');
INSERT INTO Airport VALUES (135, 'Gimpo International Airport', 'Seoul', 'SOUTH KOREA');
INSERT INTO Airport VALUES (136, 'Carnmore Airport', 'Galway', 'IRELAND');
INSERT INTO Airport VALUES (137, 'Gan International Airport', 'Gan Island', 'MALDIVES');
INSERT INTO Airport VALUES (138, 'Teniente Vidal Airport', 'Coyhaique', 'CHILE');
INSERT INTO Airport VALUES (139, 'Haneda Airport', 'Tokyo', 'JAPAN');
INSERT INTO Airport VALUES (140, 'Hong Kong International Airport', 'Hong Kong', 'HONG KONG');
INSERT INTO Airport VALUES (141, 'Hanover Airport', 'Hanover', 'GERMANY');
INSERT INTO Airport VALUES (142, 'Noibai Airport', 'Hanoi', 'VIET NAM');
INSERT INTO Airport VALUES (143, 'Izhevsk Airport', 'Izhevsk', 'RUSSIA');
INSERT INTO Airport VALUES (144, 'Ile Des Pins Airport', 'Ile Des Pins', 'NEW CALEDONIA');
INSERT INTO Airport VALUES (145, 'Zilina Airport', 'Zilina', 'SLOVAKIA');
INSERT INTO Airport VALUES (146, 'Nis Airport', 'Nis Rs', 'SERBIA');
INSERT INTO Airport VALUES (147, 'Naxos Airport', 'Naxos', 'GREECE');
INSERT INTO Airport VALUES (148, 'Jurado Airport', 'Jurado', 'COLOMBIA');
INSERT INTO Airport VALUES (149, 'Kilimanjaro Airport', 'Kilimanjaro', 'TANZANIA');
INSERT INTO Airport VALUES (150, 'Juliaca Airport', 'Juliaca', 'PERU');
INSERT INTO Airport VALUES (151, 'Kigali International Airport', 'Kigali', 'RWANDA');
INSERT INTO Airport VALUES (152, 'Khorramabad Airport', 'Khorramabad', 'IRAN');
INSERT INTO Airport VALUES (153, 'Kaohsiung International', 'Kaohsiung', 'TAIWAN');
INSERT INTO Airport VALUES (154, 'Quaid E Azam International', 'Karachi', 'PAKISTAN');
INSERT INTO Airport VALUES (155, 'Los Angeles International Airport', 'Los Angeles', 'UNITED STATES');
INSERT INTO Airport VALUES (156, 'Heathrow Airport', 'London', 'UNITED KINGDOM');
INSERT INTO Airport VALUES (157, 'Lizard Island Airport', 'Lizard Island', 'AUSTRALIA');
INSERT INTO Airport VALUES (158, 'Snilow Airport', 'Lvov', 'UKRAINE');
INSERT INTO Airport VALUES (159, 'Mmabatho International Airport', 'Mmabatho', 'SOUTH AFRICA');
INSERT INTO Airport VALUES (160, 'Moi International', 'Mombasa', 'KENYA');
INSERT INTO Airport VALUES (161, 'Maribor Airport', 'Maribor', 'SLOVENIA');
INSERT INTO Airport VALUES (162, 'Jose Marie Cordova', 'Medellin', 'COLOMBIA');
INSERT INTO Airport VALUES (163, 'Kungsangen Airport', 'Norrkoping', 'SWEDEN');
INSERT INTO Airport VALUES (164, 'Nuremberg Airport', 'Nuremberg', 'GERMANY');
INSERT INTO Airport VALUES (165, 'Pilansberg Airport', 'Sun City', 'SOUTH AFRICA');
INSERT INTO Airport VALUES (166, 'Santo Antao Airport', 'Santo Antao', 'CAPE VERDE');
INSERT INTO Airport VALUES (167, 'Mosul Airport', 'Mosul', 'IRAQ');
INSERT INTO Airport VALUES (168, 'Osh Airport', 'Osh', 'KYRGYZSTAN');
INSERT INTO Airport VALUES (169, 'Mosnov Airport', 'Ostrava', 'CZECH REPUBLIC');
INSERT INTO Airport VALUES (170, 'Ostend Airport', 'Ostende', 'BELGIUM');
INSERT INTO Airport VALUES (171, 'Beijing Capital International Airport', 'Beijing', 'CHINA');
INSERT INTO Airport VALUES (172, 'Pochentong Airport', 'Phnom Penh', 'CAMBODIA');
INSERT INTO Airport VALUES (173, 'Pohnpei Airport', 'Pohnpei', 'FEDERATED STATES OF MICRONESIA');
INSERT INTO Airport VALUES (174, 'Pointe Noire Airport', 'Pointe Noire', 'CONGO');
INSERT INTO Airport VALUES (175, 'Setif Airport', 'Setif', 'ALGERIA');
INSERT INTO Airport VALUES (176, 'Olsztyn Airport', 'Olsztyn', 'POLAND');
INSERT INTO Airport VALUES (177, 'Leeton Airport', 'Leeton', 'AUSTRALIA');
INSERT INTO Airport VALUES (178, 'Arras Airport', 'Arras', 'FRANCE');
INSERT INTO Airport VALUES (179, 'Rostov Airport', 'Rostov', 'RUSSIA');
INSERT INTO Airport VALUES (180, 'Fisherton Airport', 'Rosario', 'ARGENTINA');
INSERT INTO Airport VALUES (181, 'Roros Airport', 'Roros', 'NORWAY');
INSERT INTO Airport VALUES (182, 'Rodrigues Island Airport', 'Rodrigues Island', 'MAURITIUS');
INSERT INTO Airport VALUES (183, 'Selibaby Airport', 'Selibaby', 'MAURITANIA');
INSERT INTO Airport VALUES (184, 'Sondre Stromfjord Airport', 'Kangerlussuaq', 'GREENLAND');
INSERT INTO Airport VALUES (185, 'Sanli Urfa Airport', 'Sanli Urfa', 'TURKEY');
INSERT INTO Airport VALUES (186, 'San Felix Airport', 'San Felix', 'VENEZUELA');
INSERT INTO Airport VALUES (187, 'El Peten Airport', 'Tikal', 'GUATEMALA');
INSERT INTO Airport VALUES (188, 'Taiwan Taoyuan International Airport', 'Taipei', 'TAIWAN');
INSERT INTO Airport VALUES (189, 'Tripoli International Airport', 'Tripoli', 'LIBYAN ARAB JAMAHIRIYA');
INSERT INTO Airport VALUES (190, 'Turku Airport', 'Turku', 'FINLAND');
INSERT INTO Airport VALUES (191, 'Hasanudin Airport', 'Ujung Pandang', 'INDONESIA');
INSERT INTO Airport VALUES (192, 'Kuressaare Airport', 'Kuressaare', 'ESTONIA');
INSERT INTO Airport VALUES (193, 'Upington Airport', 'Upington', 'SOUTH AFRICA');
INSERT INTO Airport VALUES (194, 'Udon Thani Airport', 'Udon Thani', 'THAILAND');
INSERT INTO Airport VALUES (195, 'Marco Polo Airport', 'Venice', 'ITALY');
INSERT INTO Airport VALUES (196, 'Kawama Airport', 'Matanzas', 'CUBA');
INSERT INTO Airport VALUES (197, 'Viseu Airport', 'Viseu', 'PORTUGAL');
INSERT INTO Airport VALUES (198, 'Lugansk Airport', 'Lugansk', 'UKRAINE');
INSERT INTO Airport VALUES (199, 'Rooikop Airport', 'Walvis Bay', 'NAMIBIA');
INSERT INTO Airport VALUES (200, 'Naga Airport', 'Naga', 'PHILIPPINES');
INSERT INTO Airport VALUES (201, 'Whyalla Airport', 'Whyalla', 'AUSTRALIA');
INSERT INTO Airport VALUES (202, 'Boram Airport', 'Wewak', 'PAPUA NEW GUINEA');
INSERT INTO Airport VALUES (203, 'Alamos Airport', 'Alamos', 'MEXICO');
INSERT INTO Airport VALUES (204, 'Chapeco Airport', 'Chapeco', 'BRAZIL');
INSERT INTO Airport VALUES (205, 'Xiamen International Airport', 'Xiamen', 'CHINA');
INSERT INTO Airport VALUES (206, 'Quepos Airport', 'Quepos', 'COSTA RICA');
INSERT INTO Airport VALUES (207, 'Yun Cheng Airport', 'Yun Cheng', 'CHINA');
INSERT INTO Airport VALUES (208, 'Medicine Hat Airport', 'Medicine Hat', 'CANADA');
INSERT INTO Airport VALUES (209, 'Yellowknife Airport', 'Yellowknife', 'CANADA');
INSERT INTO Airport VALUES (210, 'Vancouver International Airport', 'Vancouver', 'CANADA');
INSERT INTO Airport VALUES (211, 'Zakinthos Airport', 'Zakinthos', 'GREECE');
INSERT INTO Airport VALUES (212, 'St Pierre Dela Reunion Airport', 'St Pierre Dela Reunion', 'REUNION');
INSERT INTO Airport VALUES (213, 'Zweibruecken Airport', 'Zweibruecken', 'GERMANY');
INSERT INTO Airport VALUES (214, 'Frankton Airport', 'Queenstown', 'NEW ZEALAND');
INSERT INTO Airport VALUES (215, 'Central Airport', 'Centertown', 'CENTERLAND');

alter session set NLS_DATE_FORMAT='MM/YY';

INSERT INTO Customer VALUES (148798,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (828991,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (515908,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (174203,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (527434,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (287490,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (160095,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (756299,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (706478,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (870568,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (806909,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (287148,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (502912,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (207185,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (800692,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (990234,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (423667,'No',0,0,NULL,NULL);
INSERT INTO Customer VALUES (350089,'No',0,30416,'4844 1259 4696 1023','04/18');
INSERT INTO Customer VALUES (472632,'No',0,53679,'4844 6926 3054 2377','09/18');
INSERT INTO Customer VALUES (931989,'No',0,8026,'4175 0045 1568 1917','11/18');
INSERT INTO Customer VALUES (183394,'No',0,46009,'4844 8216 9902 7315','10/18');
INSERT INTO Customer VALUES (851415,'No',0,54049,'4913 1011 3058 1360','05/18');
INSERT INTO Customer VALUES (560255,'No',0,11503,'4913 2383 1782 8212','01/18');
INSERT INTO Customer VALUES (357337,'No',0,51602,'4175 0057 9216 4808','11/17');
INSERT INTO Customer VALUES (228813,'No',0,88853,'4844 0853 2804 8627','10/17');
INSERT INTO Customer VALUES (919299,'No',0,79383,'4175 0084 5772 8750','05/18');
INSERT INTO Customer VALUES (299491,'No',0,14577,'4175 0086 4268 2789','06/17');
INSERT INTO Customer VALUES (420184,'No',0,85935,'4917 1973 5086 2189','04/19');
INSERT INTO Customer VALUES (322548,'No',0,46167,'4913 8849 4058 7996','03/18');
INSERT INTO Customer VALUES (416851,'No',0,78128,'4026 9620 0012 0074','12/17');
INSERT INTO Customer VALUES (527915,'Yes',1698,16909,'4508 5455 1317 1176','03/19');
INSERT INTO Customer VALUES (117361,'Yes',2343,57578,'4917 2775 9475 7252','05/19'); 
INSERT INTO Customer VALUES (708495,'Yes',945,53971,'4026 8247 1026 0600','08/17'); 
INSERT INTO Customer VALUES (195900,'Yes',3467,68947,'4508 8312 1360 0478','07/18'); 
INSERT INTO Customer VALUES (877725,'Yes',4056,25868,'4026 3930 2774 4672','05/18'); 
INSERT INTO Customer VALUES (708875,'Yes',536,39541,'4913 9891 3435 7930','10/17'); 
INSERT INTO Customer VALUES (465197,'Yes',4165,4697,'4026 7100 1588 6639','02/19'); 
INSERT INTO Customer VALUES (970784,'Yes',730,78816,'4913 3666 0940 9324','09/17'); 
INSERT INTO Customer VALUES (170544,'Yes',3230,26586,'4026 3237 3911 4104','05/19'); 
INSERT INTO Customer VALUES (723249,'Yes',727,91573,'4917 7053 5747 7437','02/19'); 
INSERT INTO Customer VALUES (177524,'Yes',2478,88164,'4026 5834 4573 2339','05/18'); 
INSERT INTO Customer VALUES (274749,'Yes',4363,58903,'4913 9957 1829 2179','08/17');
INSERT INTO Customer VALUES (796742,'Yes',3468,80524,'4175 0019 3740 6642','05/18');
INSERT INTO Customer VALUES (992959,'Yes',2746,89128,'4175 0095 0747 6887','05/19');
INSERT INTO Customer VALUES (159795,'Yes',2011,56838,'4917 9964 7466 3872','09/17');
INSERT INTO Customer VALUES (284266,'Yes',2031,81939,'4913 7493 4713 9925','07/17');
INSERT INTO Customer VALUES (773443,'Yes',4209,72199,'4026 6968 7055 0917','03/19');
INSERT INTO Customer VALUES (424133,'Yes',4059,79562,'4026 1191 2729 2571','08/18');
INSERT INTO Customer VALUES (280855,'Yes',2415,92187,'4175 0019 3362 1152','08/18');
INSERT INTO Customer VALUES (750827,'Yes',230,99754,'4844 2575 7438 7781','05/19');
INSERT INTO Customer VALUES (697585,'Yes',3629,43277,'4844 1573 0026 3118','06/19');
INSERT INTO Customer VALUES (660197,'Yes',4358,90993,'4917 9770 7488 5289','02/18');
INSERT INTO Customer VALUES (562191,'Yes',2757,75574,'4175 0047 6624 4704','02/19');
INSERT INTO Customer VALUES (392724,'Yes',3742,71531,'4917 3242 2659 7787','03/18');
INSERT INTO Customer VALUES (993479,'Yes',3087,99571,'4175 0025 0878 1637','08/17');
INSERT INTO Customer VALUES (377465,'Yes',2935,5005,'4844 1809 5359 5032','09/18');
INSERT INTO Customer VALUES (301619,'Yes',1868,22120,'4026 7826 1789 4303','04/18');
INSERT INTO Customer VALUES (155192,'Yes',2933,84507,'4844 0394 5029 2313','09/18');
INSERT INTO Customer VALUES (485009,'Yes',3564,63282,'4508 7820 0197 9949','04/19');
INSERT INTO Customer VALUES (394651,'Yes',715,46583,'4913 1920 9824 3754','10/17');
INSERT INTO Customer VALUES (537639,'Yes',4985,75961,'4913 6132 6211 2442','11/17');
INSERT INTO Customer VALUES (806233,'Yes',1091,73165,'4913 8427 4823 0102','08/17');
INSERT INTO Customer VALUES (487946,'Yes',735,6306,'4844 4614 8155 8258','08/18');
INSERT INTO Customer VALUES (200670,'Yes',289,88602,'4026 4475 4364 5985','12/18');
INSERT INTO Customer VALUES (304299,'Yes',2609,25485,'4913 1911 4797 0029','08/18');
INSERT INTO Customer VALUES (742034,'Yes',746,45279,'4844 5044 5202 5730','07/18');
INSERT INTO Customer VALUES (841963,'Yes',2007,85423,'4175 0065 8549 5540','01/19');
INSERT INTO Customer VALUES (178318,'Yes',4886,73713,'4844 2251 7548 4935','04/18');
INSERT INTO Customer VALUES (113347,'Yes',1716,18028,'4175 0019 5902 4240','12/17');
INSERT INTO Customer VALUES (421373,'Yes',2732,38462,'4917 1589 7209 7992','10/18');
INSERT INTO Customer VALUES (868971,'Yes',451,90778,'4175 0057 8509 4780','01/18');
INSERT INTO Customer VALUES (457097,'Yes',2578,86509,'4175 0084 3559 8721','08/18');
INSERT INTO Customer VALUES (234765,'Yes',699,78303,'4026 7077 3913 8552','12/18');
INSERT INTO Customer VALUES (831796,'Yes',2599,22612,'4917 6988 5695 0840','08/18');
INSERT INTO Customer VALUES (321380,'Yes',4041,24139,'4175 0084 0210 1541','03/19');
INSERT INTO Customer VALUES (845201,'Yes',3978,8597,'4913 8015 0533 4424','10/18');
INSERT INTO Customer VALUES (112625,'Yes',2222,89788,'4913 7288 8153 6514','07/17');
INSERT INTO Customer VALUES (220862,'Yes',2270,87637,'4508 3301 5266 7440','03/19');
INSERT INTO Customer VALUES (159117,'Yes',775,76661,'4175 0060 7227 7278','05/18');
INSERT INTO Customer VALUES (350270,'Yes',4317,22737,'4175 0072 8955 0101','10/18');
INSERT INTO Customer VALUES (564275,'Yes',3704,89703,'4844 8011 1518 2464','09/17');
INSERT INTO Customer VALUES (623448,'Yes',411,23703,'4026 5194 4574 5186','01/19');
INSERT INTO Customer VALUES (392240,'Yes',3094,25549,'4026 2405 1314 9330','04/18');
INSERT INTO Customer VALUES (996834,'Yes',1137,85409,'4844 9278 5005 5696','05/19');
INSERT INTO Customer VALUES (215208,'Yes',3748,74366,'4508 1963 7820 7893','05/18');
INSERT INTO Customer VALUES (305605,'Yes',3978,97703,'4175 0004 4419 6803','04/18');
INSERT INTO Customer VALUES (318137,'Yes',975,26449,'4026 6155 6125 7210','03/19');
INSERT INTO Customer VALUES (197616,'Yes',2040,20167,'4026 2268 8167 1369','04/18');
INSERT INTO Customer VALUES (145918,'Yes',5000,92980,'4913 8867 9855 4770','10/17');
INSERT INTO Customer VALUES (691472,'Yes',849,81371,'4026 6625 2518 6432','08/17');
INSERT INTO Customer VALUES (302990,'Yes',4195,4333,'4026 9314 1000 9730','08/17');
INSERT INTO Customer VALUES (581360,'Yes',687,62668,'4844 0530 4891 2498','01/18');
INSERT INTO Customer VALUES (522968,'Yes',2529,18085,'4026 8150 4001 7850','12/17');
INSERT INTO Customer VALUES (959488,'Yes',3999,32070,'4917 8015 0628 6744','03/19');
INSERT INTO Customer VALUES (337109,'Yes',4126,24196,'4175 0090 8928 1051','03/19');
INSERT INTO Customer VALUES (512493,'Yes',370,8238,'4844 7487 2283 4138','11/17');
INSERT INTO Customer VALUES (784484,'Yes',2484,84249,'4175 0077 8999 0294','09/17');
INSERT INTO Customer VALUES (928235,'Yes',3679,77046,'4844 2710 9803 3300','03/19');
INSERT INTO Customer VALUES (256148,'Yes',3038,75014,'4508 1744 5223 9041','10/17');
INSERT INTO Customer VALUES (818809,'Yes',2946,30808,'4175 0059 6387 7071','09/17');

INSERT INTO Airline VALUES (00,'Air Canada');
INSERT INTO Airline VALUES (01,'Air China');
INSERT INTO Airline VALUES (02,'Air France');
INSERT INTO Airline VALUES (03,'Air India');
INSERT INTO Airline VALUES (04,'Alaska Airlines');
INSERT INTO Airline VALUES (05,'American Airlines');
INSERT INTO Airline VALUES (06,'British Airways');
INSERT INTO Airline VALUES (07,'Bangkok Airways');
INSERT INTO Airline VALUES (08,'Cathay Pacific');
INSERT INTO Airline VALUES (09,'China Airlines');
INSERT INTO Airline VALUES (10,'Czech Airlines');
INSERT INTO Airline VALUES (11,'Delta');
INSERT INTO Airline VALUES (12,'Dragonair');
INSERT INTO Airline VALUES (13,'Emirates');
INSERT INTO Airline VALUES (14,'EVA Air');
INSERT INTO Airline VALUES (15,'Eurowings');
INSERT INTO Airline VALUES (16,'Frontier');
INSERT INTO Airline VALUES (17,'FlyOne');
INSERT INTO Airline VALUES (18,'Fiji Airways');
INSERT INTO Airline VALUES (19,'Gulf Air');
INSERT INTO Airline VALUES (20,'Germanwings');
INSERT INTO Airline VALUES (21,'Hong Kong Airlines');
INSERT INTO Airline VALUES (22,'Haiwaiian Airlines');
INSERT INTO Airline VALUES (23,'Hainan Airlines');
INSERT INTO Airline VALUES (24,'InterJet');
INSERT INTO Airline VALUES (25,'Icelandair');
INSERT INTO Airline VALUES (26,'Japan Airlines');
INSERT INTO Airline VALUES (27,'Jet Airways');
INSERT INTO Airline VALUES (28,'Korean Air');
INSERT INTO Airline VALUES (29,'Kenya Airways');
INSERT INTO Airline VALUES (30,'Lion Airlines');
INSERT INTO Airline VALUES (31,'Malaysia Airlines');
INSERT INTO Airline VALUES (32,'Middle East Airlines');
INSERT INTO Airline VALUES (33,'Nordwind Airlines');
INSERT INTO Airline VALUES (34,'Norwegian Air Shuttle');
INSERT INTO Airline VALUES (35,'OpenSkies');
INSERT INTO Airline VALUES (36,'Pakistan International Airlines');
INSERT INTO Airline VALUES (37,'Pegasus Airlines');
INSERT INTO Airline VALUES (38,'Philippine Airlines');
INSERT INTO Airline VALUES (39,'Qatar Airways');
INSERT INTO Airline VALUES (40,'Regional Express');
INSERT INTO Airline VALUES (41,'Singapore Airlines');
INSERT INTO Airline VALUES (42,'South African Airways');
INSERT INTO Airline VALUES (43,'SWISS');
INSERT INTO Airline VALUES (44,'Spirit');
INSERT INTO Airline VALUES (45,'Turkish Airlines');
INSERT INTO Airline VALUES (46,'Tunis Air');
INSERT INTO Airline VALUES (47,'United Airlines');
INSERT INTO Airline VALUES (48,'Vietnam Airlines');
INSERT INTO Airline VALUES (49,'WestJet');
INSERT INTO Airline VALUES (50,'WOW Air');
INSERT INTO Airline VALUES (51,'Xiamen Airlines');

INSERT INTO Connections VALUES (131,203,237);
INSERT INTO Connections VALUES (203,131,237);
INSERT INTO Connections VALUES (188,202,244);
INSERT INTO Connections VALUES (202,188,244);
INSERT INTO Connections VALUES (118,169,248);
INSERT INTO Connections VALUES (169,118,248);
INSERT INTO Connections VALUES (195,211,283);
INSERT INTO Connections VALUES (211,195,283);
INSERT INTO Connections VALUES (116,188,343);
INSERT INTO Connections VALUES (188,116,343);
INSERT INTO Connections VALUES (128,195,740);
INSERT INTO Connections VALUES (195,128,740);
INSERT INTO Connections VALUES (195,210,855);
INSERT INTO Connections VALUES (210,195,855);
INSERT INTO Connections VALUES (131,204,868);
INSERT INTO Connections VALUES (204,131,868);
INSERT INTO Connections VALUES (132,141,940);
INSERT INTO Connections VALUES (141,132,940);
INSERT INTO Connections VALUES (124,210,1086);
INSERT INTO Connections VALUES (210,124,1086);
INSERT INTO Connections VALUES (136,156,1128);
INSERT INTO Connections VALUES (156,136,1128);
INSERT INTO Connections VALUES (210,209,1222);
INSERT INTO Connections VALUES (209,210,1222);
INSERT INTO Connections VALUES (175,189,1278);
INSERT INTO Connections VALUES (189,175,1278);
INSERT INTO Connections VALUES (159,212,1293);
INSERT INTO Connections VALUES (212,159,1293);
INSERT INTO Connections VALUES (166,189,1321);
INSERT INTO Connections VALUES (189,166,1321);
INSERT INTO Connections VALUES (131,148,1424);
INSERT INTO Connections VALUES (148,131,1424);
INSERT INTO Connections VALUES (171,207,1425);
INSERT INTO Connections VALUES (207,171,1425);
INSERT INTO Connections VALUES (157,201,1511);
INSERT INTO Connections VALUES (201,157,1511);
INSERT INTO Connections VALUES (159,165,1518);
INSERT INTO Connections VALUES (165,159,1518);
INSERT INTO Connections VALUES (155,210,1553);
INSERT INTO Connections VALUES (210,155,1553);
INSERT INTO Connections VALUES (134,139,1615);
INSERT INTO Connections VALUES (139,134,1615);
INSERT INTO Connections VALUES (139,210,1748);
INSERT INTO Connections VALUES (210,139,1748);
INSERT INTO Connections VALUES (169,198,1775);
INSERT INTO Connections VALUES (198,169,1775);
INSERT INTO Connections VALUES (126,151,1784);
INSERT INTO Connections VALUES (151,126,1784);
INSERT INTO Connections VALUES (144,157,1891);
INSERT INTO Connections VALUES (157,144,1891);
INSERT INTO Connections VALUES (156,197,1947);
INSERT INTO Connections VALUES (197,156,1947);
INSERT INTO Connections VALUES (124,168,1962);
INSERT INTO Connections VALUES (168,124,1962);
INSERT INTO Connections VALUES (125,169,2001);
INSERT INTO Connections VALUES (169,125,2001);
INSERT INTO Connections VALUES (159,210,2067);
INSERT INTO Connections VALUES (210,159,2067);
INSERT INTO Connections VALUES (117,127,2324);
INSERT INTO Connections VALUES (127,117,2324);
INSERT INTO Connections VALUES (188,191,2802);
INSERT INTO Connections VALUES (191,188,2802);
INSERT INTO Connections VALUES (119,189,3146);
INSERT INTO Connections VALUES (189,119,3146);
INSERT INTO Connections VALUES (171,205,3187);
INSERT INTO Connections VALUES (205,171,3187);
INSERT INTO Connections VALUES (130,151,3387);
INSERT INTO Connections VALUES (151,130,3387);
INSERT INTO Connections VALUES (151,210,3431);
INSERT INTO Connections VALUES (210,151,3431);
INSERT INTO Connections VALUES (131,187,3463);
INSERT INTO Connections VALUES (187,131,3463);
INSERT INTO Connections VALUES (129,157,3596);
INSERT INTO Connections VALUES (157,129,3596);
INSERT INTO Connections VALUES (210,208,4196);
INSERT INTO Connections VALUES (208,210,4196);
INSERT INTO Connections VALUES (153,188,4247);
INSERT INTO Connections VALUES (188,153,4247);
INSERT INTO Connections VALUES (131,150,4290);
INSERT INTO Connections VALUES (150,131,4290);
INSERT INTO Connections VALUES (169,192,4307);
INSERT INTO Connections VALUES (192,169,4307);
INSERT INTO Connections VALUES (159,182,4369);
INSERT INTO Connections VALUES (182,159,4369);
INSERT INTO Connections VALUES (157,214,4524);
INSERT INTO Connections VALUES (214,157,4524);
INSERT INTO Connections VALUES (161,169,4667);
INSERT INTO Connections VALUES (169,161,4667);
INSERT INTO Connections VALUES (142,210,5510);
INSERT INTO Connections VALUES (210,142,5510);
INSERT INTO Connections VALUES (158,169,5516);
INSERT INTO Connections VALUES (169,158,5516);
INSERT INTO Connections VALUES (189,210,5693);
INSERT INTO Connections VALUES (210,189,5693);
INSERT INTO Connections VALUES (131,196,5774);
INSERT INTO Connections VALUES (196,131,5774);
INSERT INTO Connections VALUES (132,181,5775);
INSERT INTO Connections VALUES (181,132,5775);
INSERT INTO Connections VALUES (183,189,5855);
INSERT INTO Connections VALUES (189,183,5855);
INSERT INTO Connections VALUES (132,213,5947);
INSERT INTO Connections VALUES (213,132,5947);
INSERT INTO Connections VALUES (127,210,6134);
INSERT INTO Connections VALUES (210,127,6134);
INSERT INTO Connections VALUES (120,195,6408);
INSERT INTO Connections VALUES (195,120,6408);
INSERT INTO Connections VALUES (113,171,6467);
INSERT INTO Connections VALUES (171,113,6467);
INSERT INTO Connections VALUES (132,179,6674);
INSERT INTO Connections VALUES (179,132,6674);
INSERT INTO Connections VALUES (156,184,6984);
INSERT INTO Connections VALUES (184,156,6984);
INSERT INTO Connections VALUES (121,210,7089);
INSERT INTO Connections VALUES (210,121,7089);
INSERT INTO Connections VALUES (188,210,7161);
INSERT INTO Connections VALUES (210,188,7161);
INSERT INTO Connections VALUES (132,163,7208);
INSERT INTO Connections VALUES (163,132,7208);
INSERT INTO Connections VALUES (132,164,7271);
INSERT INTO Connections VALUES (164,132,7271);
INSERT INTO Connections VALUES (131,186,7330);
INSERT INTO Connections VALUES (186,131,7330);
INSERT INTO Connections VALUES (142,194,7882);
INSERT INTO Connections VALUES (194,142,7882);
INSERT INTO Connections VALUES (157,177,7966);
INSERT INTO Connections VALUES (177,157,7966);
INSERT INTO Connections VALUES (169,176,8013);
INSERT INTO Connections VALUES (176,169,8013);
INSERT INTO Connections VALUES (133,159,8199);
INSERT INTO Connections VALUES (159,133,8199);
INSERT INTO Connections VALUES (151,160,8610);
INSERT INTO Connections VALUES (160,151,8610);
INSERT INTO Connections VALUES (131,162,8693);
INSERT INTO Connections VALUES (162,131,8693);
INSERT INTO Connections VALUES (147,195,8732);
INSERT INTO Connections VALUES (195,147,8732);
INSERT INTO Connections VALUES (123,137,9071);
INSERT INTO Connections VALUES (137,123,9071);
INSERT INTO Connections VALUES (124,152,9088);
INSERT INTO Connections VALUES (152,124,9088);
INSERT INTO Connections VALUES (131,210,9191);
INSERT INTO Connections VALUES (210,131,9191);
INSERT INTO Connections VALUES (151,199,9194);
INSERT INTO Connections VALUES (199,151,9194);
INSERT INTO Connections VALUES (132,143,9215);
INSERT INTO Connections VALUES (143,132,9215);
INSERT INTO Connections VALUES (124,154,9252);
INSERT INTO Connections VALUES (154,124,9252);
INSERT INTO Connections VALUES (124,167,9258);
INSERT INTO Connections VALUES (167,124,9258);
INSERT INTO Connections VALUES (114,132,9430);
INSERT INTO Connections VALUES (132,114,9430);
INSERT INTO Connections VALUES (149,151,10066);
INSERT INTO Connections VALUES (151,149,10066);
INSERT INTO Connections VALUES (122,123,10101);
INSERT INTO Connections VALUES (123,122,10101);
INSERT INTO Connections VALUES (159,193,10752);
INSERT INTO Connections VALUES (193,159,10752);
INSERT INTO Connections VALUES (132,190,10896);
INSERT INTO Connections VALUES (190,132,10896);
INSERT INTO Connections VALUES (123,210,11095);
INSERT INTO Connections VALUES (210,123,11095);
INSERT INTO Connections VALUES (151,174,11149);
INSERT INTO Connections VALUES (174,151,11149);
INSERT INTO Connections VALUES (132,210,11170);
INSERT INTO Connections VALUES (210,132,11170);
INSERT INTO Connections VALUES (131,180,11321);
INSERT INTO Connections VALUES (180,131,11321);
INSERT INTO Connections VALUES (146,169,11422);
INSERT INTO Connections VALUES (169,146,11422);
INSERT INTO Connections VALUES (171,210,11445);
INSERT INTO Connections VALUES (210,171,11445);
INSERT INTO Connections VALUES (140,210,11908);
INSERT INTO Connections VALUES (210,140,11908);
INSERT INTO Connections VALUES (188,200,12065);
INSERT INTO Connections VALUES (200,188,12065);
INSERT INTO Connections VALUES (169,210,12120);
INSERT INTO Connections VALUES (210,169,12120);
INSERT INTO Connections VALUES (121,178,12146);
INSERT INTO Connections VALUES (178,121,12146);
INSERT INTO Connections VALUES (135,210,12547);
INSERT INTO Connections VALUES (210,135,12547);
INSERT INTO Connections VALUES (156,210,12723);
INSERT INTO Connections VALUES (210,156,12723);
INSERT INTO Connections VALUES (131,138,12815);
INSERT INTO Connections VALUES (138,131,12815);
INSERT INTO Connections VALUES (112,210,13112);
INSERT INTO Connections VALUES (210,112,13112);
INSERT INTO Connections VALUES (127,185,13213);
INSERT INTO Connections VALUES (185,127,13213);
INSERT INTO Connections VALUES (115,131,13276);
INSERT INTO Connections VALUES (131,115,13276);
INSERT INTO Connections VALUES (145,169,13293);
INSERT INTO Connections VALUES (169,145,13293);
INSERT INTO Connections VALUES (111,155,13464);
INSERT INTO Connections VALUES (155,111,13464);
INSERT INTO Connections VALUES (157,210,13474);
INSERT INTO Connections VALUES (210,157,13474);
INSERT INTO Connections VALUES (142,172,13666);
INSERT INTO Connections VALUES (172,142,13666);
INSERT INTO Connections VALUES (131,206,13667);
INSERT INTO Connections VALUES (206,131,13667);
INSERT INTO Connections VALUES (112,170,13767);
INSERT INTO Connections VALUES (170,112,13767);
INSERT INTO Connections VALUES (157,173,13991);
INSERT INTO Connections VALUES (173,157,13991);
INSERT INTO Connections VALUES (215,111,9999);
INSERT INTO Connections VALUES (215,112,9999);
INSERT INTO Connections VALUES (215,113,9999);
INSERT INTO Connections VALUES (215,114,9999);
INSERT INTO Connections VALUES (215,115,9999);
INSERT INTO Connections VALUES (215,116,9999);
INSERT INTO Connections VALUES (215,117,9999);
INSERT INTO Connections VALUES (215,118,9999);
INSERT INTO Connections VALUES (215,119,9999);
INSERT INTO Connections VALUES (215,120,9999);
INSERT INTO Connections VALUES (215,121,9999);
INSERT INTO Connections VALUES (215,122,9999);
INSERT INTO Connections VALUES (215,123,9999);
INSERT INTO Connections VALUES (215,124,9999);
INSERT INTO Connections VALUES (215,125,9999);
INSERT INTO Connections VALUES (215,126,9999);
INSERT INTO Connections VALUES (215,127,9999);
INSERT INTO Connections VALUES (215,128,9999);
INSERT INTO Connections VALUES (215,129,9999);
INSERT INTO Connections VALUES (215,130,9999);
INSERT INTO Connections VALUES (215,131,9999);
INSERT INTO Connections VALUES (215,132,9999);
INSERT INTO Connections VALUES (215,133,9999);
INSERT INTO Connections VALUES (215,134,9999);
INSERT INTO Connections VALUES (215,135,9999);
INSERT INTO Connections VALUES (215,136,9999);
INSERT INTO Connections VALUES (215,137,9999);
INSERT INTO Connections VALUES (215,138,9999);
INSERT INTO Connections VALUES (215,139,9999);
INSERT INTO Connections VALUES (215,140,9999);
INSERT INTO Connections VALUES (215,141,9999);
INSERT INTO Connections VALUES (215,142,9999);
INSERT INTO Connections VALUES (215,143,9999);
INSERT INTO Connections VALUES (215,144,9999);
INSERT INTO Connections VALUES (215,145,9999);
INSERT INTO Connections VALUES (215,146,9999);
INSERT INTO Connections VALUES (215,147,9999);
INSERT INTO Connections VALUES (215,148,9999);
INSERT INTO Connections VALUES (215,149,9999);
INSERT INTO Connections VALUES (215,150,9999);
INSERT INTO Connections VALUES (215,151,9999);
INSERT INTO Connections VALUES (215,152,9999);
INSERT INTO Connections VALUES (215,153,9999);
INSERT INTO Connections VALUES (215,154,9999);
INSERT INTO Connections VALUES (215,155,9999);
INSERT INTO Connections VALUES (215,156,9999);
INSERT INTO Connections VALUES (215,157,9999);
INSERT INTO Connections VALUES (215,158,9999);
INSERT INTO Connections VALUES (215,159,9999);
INSERT INTO Connections VALUES (215,160,9999);
INSERT INTO Connections VALUES (215,161,9999);
INSERT INTO Connections VALUES (215,162,9999);
INSERT INTO Connections VALUES (215,163,9999);
INSERT INTO Connections VALUES (215,164,9999);
INSERT INTO Connections VALUES (215,165,9999);
INSERT INTO Connections VALUES (215,166,9999);
INSERT INTO Connections VALUES (215,167,9999);
INSERT INTO Connections VALUES (215,168,9999);
INSERT INTO Connections VALUES (215,169,9999);
INSERT INTO Connections VALUES (215,170,9999);
INSERT INTO Connections VALUES (215,171,9999);
INSERT INTO Connections VALUES (215,172,9999);
INSERT INTO Connections VALUES (215,173,9999);
INSERT INTO Connections VALUES (215,174,9999);
INSERT INTO Connections VALUES (215,175,9999);
INSERT INTO Connections VALUES (215,176,9999);
INSERT INTO Connections VALUES (215,177,9999);
INSERT INTO Connections VALUES (215,178,9999);
INSERT INTO Connections VALUES (215,179,9999);
INSERT INTO Connections VALUES (215,180,9999);
INSERT INTO Connections VALUES (215,181,9999);
INSERT INTO Connections VALUES (215,182,9999);
INSERT INTO Connections VALUES (215,183,9999);
INSERT INTO Connections VALUES (215,184,9999);
INSERT INTO Connections VALUES (215,185,9999);
INSERT INTO Connections VALUES (215,186,9999);
INSERT INTO Connections VALUES (215,187,9999);
INSERT INTO Connections VALUES (215,188,9999);
INSERT INTO Connections VALUES (215,189,9999);
INSERT INTO Connections VALUES (215,190,9999);
INSERT INTO Connections VALUES (215,191,9999);
INSERT INTO Connections VALUES (215,192,9999);
INSERT INTO Connections VALUES (215,193,9999);
INSERT INTO Connections VALUES (215,194,9999);
INSERT INTO Connections VALUES (215,195,9999);
INSERT INTO Connections VALUES (215,196,9999);
INSERT INTO Connections VALUES (215,197,9999);
INSERT INTO Connections VALUES (215,198,9999);
INSERT INTO Connections VALUES (215,199,9999);
INSERT INTO Connections VALUES (215,200,9999);
INSERT INTO Connections VALUES (215,201,9999);
INSERT INTO Connections VALUES (215,202,9999);
INSERT INTO Connections VALUES (215,203,9999);
INSERT INTO Connections VALUES (215,204,9999);
INSERT INTO Connections VALUES (215,205,9999);
INSERT INTO Connections VALUES (215,206,9999);
INSERT INTO Connections VALUES (215,207,9999);
INSERT INTO Connections VALUES (215,208,9999);
INSERT INTO Connections VALUES (215,209,9999);
INSERT INTO Connections VALUES (215,210,9999);
INSERT INTO Connections VALUES (215,211,9999);
INSERT INTO Connections VALUES (215,212,9999);
INSERT INTO Connections VALUES (215,213,9999);
INSERT INTO Connections VALUES (215,214,9999);
INSERT INTO Connections VALUES (210,215,9999);
INSERT INTO Connections VALUES (112,215,1234);
INSERT INTO Connections VALUES (121,215,1234);
INSERT INTO Connections VALUES (123,215,1234);
INSERT INTO Connections VALUES (124,215,1234);
INSERT INTO Connections VALUES (127,215,1234);
INSERT INTO Connections VALUES (131,215,1234);
INSERT INTO Connections VALUES (132,215,1234);
INSERT INTO Connections VALUES (135,215,1234);
INSERT INTO Connections VALUES (139,215,1234);
INSERT INTO Connections VALUES (140,215,1234);
INSERT INTO Connections VALUES (142,215,1234);
INSERT INTO Connections VALUES (151,215,1234);
INSERT INTO Connections VALUES (155,215,1234);
INSERT INTO Connections VALUES (156,215,1234);
INSERT INTO Connections VALUES (157,215,1234);
INSERT INTO Connections VALUES (159,215,1234);
INSERT INTO Connections VALUES (169,215,1234);
INSERT INTO Connections VALUES (171,215,1234);
INSERT INTO Connections VALUES (188,215,1234);
INSERT INTO Connections VALUES (189,215,1234);
INSERT INTO Connections VALUES (195,215,1234);
INSERT INTO Connections VALUES (208,215,1234);
INSERT INTO Connections VALUES (209,215,1234);
INSERT INTO Connections VALUES (215,215,1234);
INSERT INTO Connections VALUES (210,210,1234);


INSERT INTO AirportPersonnel VALUES (188,877725,41000,'Airline Administrative Support');
INSERT INTO AirportPersonnel VALUES (135,394651,42000,'Airline Administrative Support');
INSERT INTO AirportPersonnel VALUES (210,742034,58000,'Airline Administrative Support');
INSERT INTO AirportPersonnel VALUES (132,159117,111000,'Airline Flight Instructor');
INSERT INTO AirportPersonnel VALUES (210,845201,104000,'Airline Pilot');
INSERT INTO AirportPersonnel VALUES (135,305605,110000,'Airline Pilot');
INSERT INTO AirportPersonnel VALUES (188,321380,121000,'Airline Pilot');
INSERT INTO AirportPersonnel VALUES (210,155192,29000,'Airline Station Agent');
INSERT INTO AirportPersonnel VALUES (210,581360,35000,'Airline Ticket Agent');
INSERT INTO AirportPersonnel VALUES (188,424133,36000,'Airline Ticket Agent');
INSERT INTO AirportPersonnel VALUES (135,564275,35000,'Airline Ticket Agent');
INSERT INTO AirportPersonnel VALUES (210,868971,123000,'Aviation Attorney');
INSERT INTO AirportPersonnel VALUES (210,562191,60000,'Aviation Meteorologist');
INSERT INTO AirportPersonnel VALUES (188,485009,56000,'Avionics Technician');
INSERT INTO AirportPersonnel VALUES (135,928235,57000,'Avionics Technician');
INSERT INTO AirportPersonnel VALUES (210,197616,58000,'Avionics Technician');
INSERT INTO AirportPersonnel VALUES (210,234765,45000,'Crew Schedule Coordinator');
INSERT INTO AirportPersonnel VALUES (135,831796,38000,'Flight Attendant');
INSERT INTO AirportPersonnel VALUES (188,996834,50000,'Flight Attendant');
INSERT INTO AirportPersonnel VALUES (210,750827,40000,'Flight Attendant');
INSERT INTO AirportPersonnel VALUES (135,818809,47500,'Flight Dispatcher');
INSERT INTO AirportPersonnel VALUES (210,178318,47000,'Flight Dispatcher');
INSERT INTO AirportPersonnel VALUES (188,177524,50000,'Flight Dispatcher');
INSERT INTO AirportPersonnel VALUES (135,784484,130000,'Janitor');
INSERT INTO AirportPersonnel VALUES (188,220862,40000,'Janitor');
INSERT INTO AirportPersonnel VALUES (210,215208,20000,'Janitor');
INSERT INTO AirportPersonnel VALUES (135,145918,41000,'Operations Agent');
INSERT INTO AirportPersonnel VALUES (210,117361,42000,'Operations Agent');
INSERT INTO AirportPersonnel VALUES (188,112625,82000,'Operations Agent');
INSERT INTO AirportPersonnel VALUES (210,522968,34000,'Passenger Service Agent');
INSERT INTO AirportPersonnel VALUES (135,337109,37000,'Passenger Service Agent');
INSERT INTO AirportPersonnel VALUES (188,806233,35000,'Passenger Service Agent');
INSERT INTO AirportPersonnel VALUES (210,350270,82000,'Ramp Planner');
INSERT INTO AirportPersonnel VALUES (210,304299,150000,'Regional Sales Manager');
INSERT INTO AirportPersonnel VALUES (210,170544,38000,'Reservation Sales Agent');
INSERT INTO AirportPersonnel VALUES (135,512493,39000,'Reservation Sales Agent');
INSERT INTO AirportPersonnel VALUES (188,301619,40000,'Reservation Sales Agent');
INSERT INTO AirportPersonnel VALUES (210,392724,35000,'Security Guard');
INSERT INTO AirportPersonnel VALUES (210,959488,37500,'Security Guard');
INSERT INTO AirportPersonnel VALUES (210,195900,500000,'Security Guard/Assassin');
INSERT INTO AirportPersonnel VALUES (188,195900,1000000,'Assassin');
INSERT INTO AirportPersonnel VALUES (135,195900,500000,'Smuggler');

alter session set NLS_DATE_FORMAT='MM/DD/YYYY HH24:MI';

INSERT INTO Airplane VALUES (999,00,'IN FLIGHT',210,155,'12/25/2018 12:19','12/25/2018 18:19',6,0);
INSERT INTO Airplane VALUES (998,00,'IN FLIGHT',188,210,'05/5/2018 16:33','05/5/2018 22:33',6,346);
INSERT INTO Airplane VALUES (997,00,'IN FLIGHT',171,210,'01/8/2019 00:19','01/8/2019 06:19',6,1);
INSERT INTO Airplane VALUES (996,00,'CANCELLED',132,210,'12/5/2018 10:34','12/5/2018 16:34',6,126);
INSERT INTO Airplane VALUES (995,00,'CANCELLED',114,132,'08/19/2018 09:44','08/19/2018 15:44',6,159);
INSERT INTO Airplane VALUES (994,00,'CANCELLED',139,134,'11/11/2018 04:11','11/11/2018 10:11',6,282);
INSERT INTO Airplane VALUES (993,00,132,163,132,'04/21/2018 07:53','04/21/2018 13:53',6,158);
INSERT INTO Airplane VALUES (992,00,210,156,210,'09/23/2018 15:31','09/23/2018 21:31',6,245);
INSERT INTO Airplane VALUES (991,00,157,157,210,'01/17/2018 23:24','01/18/2018 05:24',6,2);
INSERT INTO Airplane VALUES (990,00,162,162,131,'08/18/2018 12:22','08/18/2018 18:22',6,128);
INSERT INTO Airplane VALUES (989,01,'IN FLIGHT',210,155,'11/20/2018 07:14','11/20/2018 19:14',12,331);
INSERT INTO Airplane VALUES (988,01,'IN FLIGHT',188,210,'02/14/2018 05:25','02/14/2018 17:25',12,413);
INSERT INTO Airplane VALUES (987,01,'IN FLIGHT',171,210,'03/6/2018 03:53','03/6/2018 15:53',12,98);
INSERT INTO Airplane VALUES (986,01,'CANCELLED',132,210,'11/7/2018 02:25','11/7/2018 14:25',12,341);
INSERT INTO Airplane VALUES (985,01,'CANCELLED',114,132,'07/28/2018 08:49','07/28/2018 20:49',12,33);
INSERT INTO Airplane VALUES (984,01,'CANCELLED',139,134,'12/4/2018 13:26','12/5/2018 01:26',12,99);
INSERT INTO Airplane VALUES (983,01,163,163,132,'03/29/2018 04:26','03/29/2018 16:26',12,239);
INSERT INTO Airplane VALUES (982,01,156,156,210,'10/6/2018 22:24','10/7/2018 10:24',12,33);
INSERT INTO Airplane VALUES (981,01,210,157,210,'06/8/2018 18:18','06/9/2018 06:18',12,298);
INSERT INTO Airplane VALUES (980,01,131,162,131,'03/16/2018 03:43','03/16/2018 15:43',12,143);
INSERT INTO Airplane VALUES (979,06,'IN FLIGHT',210,155,'12/4/2018 19:20','12/4/2018 20:20',1,318);
INSERT INTO Airplane VALUES (978,06,'IN FLIGHT',188,210,'01/3/2019 02:43','01/3/2019 03:43',1,174);
INSERT INTO Airplane VALUES (977,06,'IN FLIGHT',171,210,'09/7/2018 08:57','09/7/2018 09:57',1,192);
INSERT INTO Airplane VALUES (976,06,132,132,210,'01/17/2018 01:15','01/17/2018 02:15',1,443);
INSERT INTO Airplane VALUES (975,06,114,114,132,'12/7/2018 16:22','12/7/2018 17:22',1,80);
INSERT INTO Airplane VALUES (974,06,139,139,134,'01/19/2018 01:58','01/19/2018 02:58',1,137);
INSERT INTO Airplane VALUES (973,06,'CANCELLED',163,132,'09/6/2018 11:57','09/6/2018 12:57',1,75);
INSERT INTO Airplane VALUES (972,06,'CANCELLED',156,210,'11/27/2018 08:39','11/27/2018 09:39',1,313);
INSERT INTO Airplane VALUES (971,06,'CANCELLED',157,210,'08/12/2018 17:44','08/12/2018 18:44',1,114);
INSERT INTO Airplane VALUES (970,06,'CANCELLED',162,131,'06/21/2018 23:47','06/22/2018 00:47',1,496);
INSERT INTO Airplane VALUES (969,49,'IN FLIGHT',210,155,'07/1/2018 06:25','07/2/2018 06:25',24,352);
INSERT INTO Airplane VALUES (968,49,'IN FLIGHT',188,210,'11/29/2018 19:58','11/30/2018 19:58',24,128);
INSERT INTO Airplane VALUES (967,49,'IN FLIGHT',171,210,'05/17/2018 05:05','05/18/2018 05:05',24,40);
INSERT INTO Airplane VALUES (966,49,210,132,210,'09/13/2018 17:55','09/14/2018 17:55',24,241);
INSERT INTO Airplane VALUES (965,49,132,114,132,'10/13/2018 04:20','10/14/2018 04:20',24,281);
INSERT INTO Airplane VALUES (964,49,134,139,134,'02/1/2018 00:26','02/2/2018 00:26',24,207);
INSERT INTO Airplane VALUES (963,49,'CANCELLED',163,132,'06/20/2018 21:56','06/21/2018 21:56',24,469);
INSERT INTO Airplane VALUES (962,49,'CANCELLED',156,210,'01/15/2018 03:50','01/16/2018 03:50',24,276);
INSERT INTO Airplane VALUES (961,49,'CANCELLED',157,210,'02/3/2018 05:08','02/4/2018 05:08',24,489);
INSERT INTO Airplane VALUES (960,49,'CANCELLED',162,131,'10/28/2018 20:29','10/29/2018 20:29',24,74);
INSERT INTO Airplane VALUES (959,28,'IN FLIGHT',210,155,'11/14/2018 04:38','11/14/2018 22:38',18,422);
INSERT INTO Airplane VALUES (958,28,'IN FLIGHT',188,210,'04/10/2018 18:43','04/11/2018 12:43',18,203);
INSERT INTO Airplane VALUES (957,28,'IN FLIGHT',171,210,'10/14/2018 07:47','10/15/2018 01:47',18,149);
INSERT INTO Airplane VALUES (956,28,'IN FLIGHT',132,210,'09/6/2018 02:24','09/6/2018 20:24',18,425);
INSERT INTO Airplane VALUES (955,28,'IN FLIGHT',114,132,'01/23/2018 12:04','01/24/2018 06:04',18,407);
INSERT INTO Airplane VALUES (954,28,'IN FLIGHT',139,134,'01/24/2018 13:31','01/25/2018 07:31',18,18);
INSERT INTO Airplane VALUES (953,28,'IN FLIGHT',163,132,'05/27/2018 01:16','05/27/2018 19:16',18,106);
INSERT INTO Airplane VALUES (952,28,'IN FLIGHT',156,210,'06/7/2018 07:07','06/8/2018 01:07',18,405);
INSERT INTO Airplane VALUES (951,28,'IN FLIGHT',157,210,'10/17/2018 00:00','10/17/2018 18:00',18,94);
INSERT INTO Airplane VALUES (950,28,'IN FLIGHT',162,131,'08/30/2018 08:53','08/31/2018 02:53',18,481);
INSERT INTO Airplane VALUES (949,14,155,155,210,'07/13/2018 08:10','07/13/2018 11:10',3,204);
INSERT INTO Airplane VALUES (948,14,210,210,188,'02/15/2018 08:59','02/15/2018 11:59',3,128);
INSERT INTO Airplane VALUES (947,14,210,210,171,'05/8/2018 16:23','05/8/2018 19:23',3,165);
INSERT INTO Airplane VALUES (946,14,210,210,132,'05/21/2018 20:04','05/21/2018 23:04',3,111);
INSERT INTO Airplane VALUES (945,14,132,132,114,'06/23/2018 22:08','06/24/2018 01:08',3,454);
INSERT INTO Airplane VALUES (944,14,139,134,139,'10/9/2018 16:11','10/9/2018 22:11',6,242);
INSERT INTO Airplane VALUES (943,14,163,132,163,'02/9/2018 02:00','02/9/2018 08:00',6,137);
INSERT INTO Airplane VALUES (942,14,156,210,156,'08/29/2018 04:00','08/29/2018 10:00',6,272);
INSERT INTO Airplane VALUES (941,14,157,210,157,'03/9/2018 04:30','03/9/2018 10:30',6,28);
INSERT INTO Airplane VALUES (940,14,162,131,162,'10/22/2018 22:05','10/23/2018 04:05',6,12);
INSERT INTO Airplane VALUES (939,04,'CANCELLED',155,210,'05/4/2018 16:52','05/5/2018 01:52',9,253);
INSERT INTO Airplane VALUES (938,04,'CANCELLED',210,188,'01/17/2018 11:46','01/17/2018 20:46',9,158);
INSERT INTO Airplane VALUES (937,04,'CANCELLED',210,171,'11/14/2018 13:12','11/14/2018 22:12',9,246);
INSERT INTO Airplane VALUES (936,04,'CANCELLED',210,132,'10/7/2018 07:40','10/7/2018 16:40',9,306);
INSERT INTO Airplane VALUES (935,04,'CANCELLED',132,114,'05/11/2018 08:40','05/11/2018 17:40',9,38);
INSERT INTO Airplane VALUES (934,04,'CANCELLED',134,139,'06/17/2018 02:06','06/17/2018 17:06',15,92);
INSERT INTO Airplane VALUES (933,04,'CANCELLED',132,163,'07/9/2018 15:50','07/10/2018 06:50',15,50);
INSERT INTO Airplane VALUES (932,04,'CANCELLED',210,156,'12/21/2018 01:00','12/21/2018 16:00',15,276);
INSERT INTO Airplane VALUES (931,04,'CANCELLED',210,157,'11/27/2018 04:07','11/27/2018 19:07',15,42);
INSERT INTO Airplane VALUES (930,04,'CANCELLED',131,162,'02/16/2018 12:46','02/17/2018 03:46',15,266);
INSERT INTO Airplane VALUES (929,26,'IN FLIGHT',155,210,'04/5/2018 10:28','04/6/2018 04:28',18,46);
INSERT INTO Airplane VALUES (928,26,'IN FLIGHT',210,188,'07/2/2018 03:00','07/2/2018 21:00',18,435);
INSERT INTO Airplane VALUES (927,26,'IN FLIGHT',210,171,'11/26/2018 12:56','11/27/2018 06:56',18,265);
INSERT INTO Airplane VALUES (926,26,'IN FLIGHT',210,132,'03/14/2018 19:16','03/15/2018 13:16',18,279);
INSERT INTO Airplane VALUES (925,26,'IN FLIGHT',132,114,'05/15/2018 00:42','05/15/2018 18:42',18,295);
INSERT INTO Airplane VALUES (924,26,'CANCELLED',134,139,'01/12/2019 03:15','01/13/2019 00:15',21,292);
INSERT INTO Airplane VALUES (923,26,'CANCELLED',132,163,'03/21/2018 11:26','03/22/2018 08:26',21,65);
INSERT INTO Airplane VALUES (922,26,'CANCELLED',210,156,'08/22/2018 19:12','08/23/2018 16:12',21,141);
INSERT INTO Airplane VALUES (921,26,'CANCELLED',210,157,'07/16/2018 10:32','07/17/2018 07:32',21,168);
INSERT INTO Airplane VALUES (920,26,'CANCELLED',131,162,'08/5/2018 14:40','08/6/2018 11:40',21,34);
INSERT INTO Airplane VALUES (919,21,210,155,210,'01/8/2019 20:49','01/9/2019 06:49',10,70);
INSERT INTO Airplane VALUES (918,21,188,210,188,'08/22/2018 23:25','08/23/2018 09:25',10,294);
INSERT INTO Airplane VALUES (917,21,171,210,171,'04/12/2018 15:57','04/13/2018 01:57',10,312);
INSERT INTO Airplane VALUES (916,21,132,210,132,'11/16/2018 13:29','11/16/2018 23:29',10,331);
INSERT INTO Airplane VALUES (915,21,114,132,114,'06/4/2018 08:34','06/4/2018 18:34',10,259);
INSERT INTO Airplane VALUES (914,21,139,134,139,'07/28/2018 14:17','07/29/2018 00:17',10,340);
INSERT INTO Airplane VALUES (913,21,163,132,163,'02/11/2018 13:03','02/11/2018 23:03',10,221);
INSERT INTO Airplane VALUES (912,21,156,210,156,'07/12/2018 15:07','07/13/2018 01:07',10,384);
INSERT INTO Airplane VALUES (911,21,157,210,157,'12/7/2018 05:50','12/7/2018 15:50',10,396);
INSERT INTO Airplane VALUES (910,21,162,131,162,'01/25/2018 01:55','01/25/2018 11:55',10,453);
INSERT INTO Airplane VALUES (909,44,155,155,210,'03/24/2018 20:26','03/25/2018 16:26',20,397);
INSERT INTO Airplane VALUES (908,44,210,210,188,'09/18/2018 05:07','09/19/2018 01:07',20,235);
INSERT INTO Airplane VALUES (907,44,210,210,171,'09/7/2018 06:28','09/8/2018 02:28',20,5);
INSERT INTO Airplane VALUES (906,44,210,210,132,'09/2/2018 06:08','09/3/2018 02:08',20,127);
INSERT INTO Airplane VALUES (905,44,132,132,114,'07/29/2018 00:18','07/29/2018 20:18',20,53);
INSERT INTO Airplane VALUES (904,44,134,134,139,'01/5/2019 23:01','01/6/2019 19:01',20,452);
INSERT INTO Airplane VALUES (903,44,132,132,163,'10/4/2018 04:43','10/5/2018 00:43',20,76);
INSERT INTO Airplane VALUES (902,44,210,210,156,'08/16/2018 08:56','08/17/2018 04:56',20,117);
INSERT INTO Airplane VALUES (901,44,210,210,157,'04/25/2018 20:41','04/26/2018 16:41',20,236);
INSERT INTO Airplane VALUES (900,44,131,131,162,'05/4/2018 01:30','05/4/2018 21:30',20,248);

INSERT INTO Ticket VALUES (527915,999,00,1352,'Business',1);
INSERT INTO Ticket VALUES (117361,998,00,1061,'Business',2);
INSERT INTO Ticket VALUES (708495,997,00,1506,'Business',3);
INSERT INTO Ticket VALUES (423667,996,00,1404,'Business',4);
INSERT INTO Ticket VALUES (113347,995,00,1284,'Business',5);
INSERT INTO Ticket VALUES (421373,994,00,1158,'Business',6);
INSERT INTO Ticket VALUES (457097,993,00,1919,'Business',7);
INSERT INTO Ticket VALUES (623448,992,00,1062,'Business',8);
INSERT INTO Ticket VALUES (392240,991,00,1604,'Business',9);
INSERT INTO Ticket VALUES (318137,990,00,1032,'Business',10);
INSERT INTO Ticket VALUES (416851,989,01,1593,'Business',11);
INSERT INTO Ticket VALUES (691472,988,01,1451,'Business',12);
INSERT INTO Ticket VALUES (302990,987,01,1394,'Business',13);
INSERT INTO Ticket VALUES (256148,986,01,1860,'Business',14);
INSERT INTO Ticket VALUES (708495,985,01,1722,'Business',15);
INSERT INTO Ticket VALUES (708875,984,01,1882,'Business',16);
INSERT INTO Ticket VALUES (465197,983,01,1738,'Business',17);
INSERT INTO Ticket VALUES (472632,982,01,1832,'Business',18);
INSERT INTO Ticket VALUES (970784,981,01,1410,'Business',19);
INSERT INTO Ticket VALUES (796742,980,01,1899,'Business',20);
INSERT INTO Ticket VALUES (706478,979,06,971,'Economy',21);
INSERT INTO Ticket VALUES (870568,978,06,594,'Economy',22);
INSERT INTO Ticket VALUES (806909,977,06,895,'Economy',23);
INSERT INTO Ticket VALUES (287148,976,06,905,'Economy',24);
INSERT INTO Ticket VALUES (502912,975,06,503,'Economy',25);
INSERT INTO Ticket VALUES (207185,974,06,921,'Economy',26);
INSERT INTO Ticket VALUES (800692,973,06,801,'Economy',27);
INSERT INTO Ticket VALUES (990234,972,06,911,'Economy',28);
INSERT INTO Ticket VALUES (148798,971,06,1167,'Economy',29);
INSERT INTO Ticket VALUES (828991,970,06,529,'Economy',30);
INSERT INTO Ticket VALUES (515908,969,49,585,'Economy',31);
INSERT INTO Ticket VALUES (174203,968,49,1190,'Economy',32);
INSERT INTO Ticket VALUES (527434,967,49,1113,'Economy',33);
INSERT INTO Ticket VALUES (287490,966,49,602,'Economy',34);
INSERT INTO Ticket VALUES (160095,965,49,1096,'Economy',35);
INSERT INTO Ticket VALUES (756299,964,49,1216,'Economy',36);
INSERT INTO Ticket VALUES (928235,963,49,858,'Economy',37);
INSERT INTO Ticket VALUES (256148,962,49,918,'Economy',38);
INSERT INTO Ticket VALUES (818809,961,49,1186,'Economy',39);
INSERT INTO Ticket VALUES (723249,960,49,964,'Economy',40);
INSERT INTO Ticket VALUES (784484,959,28,2702,'First',1);
INSERT INTO Ticket VALUES (195900,958,04,2353,'First',1);
INSERT INTO Ticket VALUES (274749,957,28,2388,'First',1);
INSERT INTO Ticket VALUES (992959,956,28,2872,'First',4);
INSERT INTO Ticket VALUES (159795,955,28,2022,'First',3);
INSERT INTO Ticket VALUES (284266,954,28,2026,'First',2);
INSERT INTO Ticket VALUES (773443,953,28,2051,'First',4);
INSERT INTO Ticket VALUES (931989,952,28,2954,'First',6);
INSERT INTO Ticket VALUES (280855,951,28,2794,'First',8);
INSERT INTO Ticket VALUES (183394,950,28,2309,'First',10);
INSERT INTO Ticket VALUES (697585,949,14,2167,'First',12);
INSERT INTO Ticket VALUES (660197,948,14,2698,'First',14);
INSERT INTO Ticket VALUES (357337,947,14,2058,'First',15);
INSERT INTO Ticket VALUES (993479,946,14,2899,'First',13);
INSERT INTO Ticket VALUES (377465,945,14,2797,'First',11);
INSERT INTO Ticket VALUES (299491,944,14,2092,'First',9);
INSERT INTO Ticket VALUES (537639,943,14,2292,'First',7);
INSERT INTO Ticket VALUES (487946,942,14,2440,'First',5);
INSERT INTO Ticket VALUES (200670,941,14,2025,'First',3);
INSERT INTO Ticket VALUES (841963,940,14,2156,'First',1);
INSERT INTO Ticket VALUES (195900,942,14,2353,'First',1);