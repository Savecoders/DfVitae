create table DetailsProducts
(
    id          varchar(191)                             not null
        primary key,
    ref         varchar(191)                             not null,
    reference   varchar(191)                             not null,
    warranty    varchar(191)                             not null,
    createdAt   datetime(3) default CURRENT_TIMESTAMP(3) not null,
    updatedAt   datetime(3)                              not null,
    productId   varchar(191)                             not null,
    description varchar(191)                             not null,
    constraint DetailsProducts_productId_fkey
        foreign key (productId) references Products (id)
            on update cascade
);

INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('0414fe60-b7ac-4491-b9cb-c57a7692f692', 'AVR604', '', '', '2025-04-30 01:08:52.694', '2025-04-30 01:08:52.694', '9e7e1213-a103-4fec-b26d-eea08cc4a5d3', 'Regulador CDP con Supresor de Picos AVR 604, 300W, 600VA, 4 Contactos, 4x USB');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('044eda6f-1780-41df-a4e4-f3993b6fd7f4', 'RR-212S-20PK-R2', '', '', '2025-04-30 01:08:52.680', '2025-04-30 01:08:52.680', 'ea114346-787f-4e86-a11d-8f0dca77eb48', 'Características


Diámetro de ventilador: 120 mm
Número de ventiladores: 1 Ventilador(es)
Nivel de ruido: 26 Db
Adecuado para: Procesador');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('0489b6f3-f96d-4c57-85a1-749eeaa6ff37', 'Z790-H', '', '', '2025-04-30 01:08:52.705', '2025-04-30 01:08:52.705', '91238d4c-077f-44c7-9715-b5e8544935a1', 'Mainboard ASUS ATX ROG Strix Z790-H GAMING WIFI, S-1700, Intel Z790, HDMI, 128GB DDR5 para Intel');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('07bc50d8-3274-424a-a597-35c0b4d64464', 'rtx5070asusprime', '', '', '2025-04-30 01:08:52.759', '2025-04-30 01:08:52.759', 'c6189f25-9dbc-43e4-9bff-b6db5f15c2fd', 'Tarjeta de Video ASUS RTX 5070, 12GB 256-bit GDDR7, PCI Express 5.0');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('09446158-1703-4e8e-bc0f-0c2860276480', 'RM850e', '', '', '2025-04-30 01:08:52.669', '2025-04-30 01:08:52.669', '6a0a9887-605e-4d62-9756-1fea0bfa6735', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('0bdf18f4-8a8e-4e29-a6e8-f6d32b35440d', 'rtx40608gb', '', '', '2025-04-30 01:08:52.695', '2025-04-30 01:08:52.695', '800cd8f4-17d7-4d69-8449-508ba7d9885e', 'Características


Frecuencia boost: 2460 MHz
Núcleos CUDA: 3072
Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('0d04d5fa-5d0e-41ab-8102-c86e35a69126', 'B650PLUSWIFI', '', '', '2025-04-30 01:08:52.695', '2025-04-30 01:08:52.695', '84556902-f304-4fc6-8b62-5719475ec111', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('0d19095f-161b-4e40-8f8c-98c0540a6b64', 'i513400', '', '', '2025-04-30 01:08:52.694', '2025-04-30 01:08:52.694', '192cbf0e-3535-49d5-b853-ade7f2acd187', 'i5-13400');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('0ed4dfad-d054-4fe2-bfec-72369f2bb95b', 'AD5U480032G-S', '', '', '2025-04-30 01:08:52.657', '2025-04-30 01:08:52.657', '747b8e2a-d44a-4b10-9104-927e1eb4a54e', 'Memoria RAM Adata AD5U480032G-S DDR5, 4800MHz, 32GB');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('103c1c88-f336-4644-ac5c-c004971b0e5a', 'WDS100T3G0A', '', '', '2025-04-30 01:08:52.730', '2025-04-30 01:08:52.730', '1f785b5d-5674-4995-bb7f-3782941b7791', 'Características


Capacidad: 1000 GB
Interface: Serial ATA III
Velocidad de lectura: 545 MB/s');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('110d3ab9-a0f8-4f67-a35c-bfbb82f42d62', 'I5-14600K', '', '', '2025-04-30 01:08:52.769', '2025-04-30 01:08:52.769', 'd7aec5e6-14ca-49c9-9854-5dcc960702f2', 'Características


Familia de procesador: Intel® Core™ i5
Modelo del procesador: i5-14600K
Frecuencia del procesador: 3.5 GHz
Socket de procesador: LGA 1700
Número de núcleos: 14');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('1299201d-9637-4150-9068-8d7b3d255e35', 'BV800', '', '', '2025-04-30 01:08:52.723', '2025-04-30 01:08:52.723', '78d240a1-caa2-4113-be08-cad03dd8cb3f', 'Características


Capacidad de potencia de salida (VA): 800 VA
Potencia de salida: 450 W
Cantidad de salidas AC: 6
Voltaje nominal de entrada: 120');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('137ab94b-798d-47c4-b414-35b3dbc82fd5', 'CMK32GX5M1B5200C40', '', '', '2025-04-30 01:08:52.665', '2025-04-30 01:08:52.665', '61ded36e-9a87-4247-99b9-e2b92410366d', 'Características


Tipo de memoria interna: DDR5
Memoria interna: 32GB
Diseño de memoria: 2 x 16 GB
Velocidad de memoria del reloj: 5200 MHz
Latencia CAS: 40');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('1575eb87-4048-4999-871d-611da5ca46b2', 'Z790-E GAMING WIFI', '', '', '2025-04-30 01:08:52.759', '2025-04-30 01:08:52.759', 'a76d17a7-e333-43dc-9fc0-21c7e02353b9', 'Mainboard ASUS ATX ROG STRIX Z790-E GAMING WIFI, S-1700, Intel Z790, HDMI, 128GB DDR5');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('184d132b-038b-4ffc-85a7-59fbf26e38c5', 'GR701', '', '', '2025-04-30 01:08:52.669', '2025-04-30 01:08:52.669', 'fd202eac-5b08-43ea-959a-3c3cd6abc7db', 'Case ASUS ROG Hyperion GR701 con Ventana ARGB, Tower, EATX/ATX');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('19b71fc9-7f75-4aa1-9912-3bd70e8280ec', 'VG279QL1A', '', '', '2025-04-30 01:08:52.698', '2025-04-30 01:08:52.698', 'da9c5aa3-84fa-4b92-96cb-2995af3fc0b7', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('19ecd27d-0110-4add-8091-342fb20ecc1a', 'KF552C40BB-16', '', '', '2025-04-30 01:08:52.727', '2025-04-30 01:08:52.727', '1855cfe5-7234-4ff6-afa3-e4da6ae4f4ef', 'MEMORIA RAM KINGSTON FURY 1X16GB DDR5 5200MHZ KF552C40BB-16 CL40');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('20aaf927-2c41-4a73-97fe-752c878d8fc4', 'A620MS2H', '', '', '2025-04-30 01:08:52.738', '2025-04-30 01:08:52.738', '1797f488-e8a3-4170-bcf0-301f54a68683', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('22957d33-0e37-4a69-b3a2-a19381b08c69', 'R-SMART1010', '', '', '2025-04-30 01:08:52.684', '2025-04-30 01:08:52.684', '45209bf8-da8e-4c1b-9fc6-2ad3ac802c46', 'UPS CDP Modelo R-SMART 1010 1000VA 500W 10 TOMAS');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('261f18a7-340f-406a-bda9-610a95b82f17', 'MX-4 8G', '', '', '2025-04-30 01:08:52.746', '2025-04-30 01:08:52.746', 'dba4567a-4ad1-4ef5-ae8b-de4d78a90371', 'Pasta Térmica, ARCTIC MX4 8G para CPU,  LAPTOPS, PS');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('2a0e5dbb-dbfa-4f86-9c3a-6176dc994bcb', 'OLAX POE-D6', '', '', '2025-04-30 01:08:52.723', '2025-04-30 01:08:52.723', '7cce162f-21a4-4f2a-8d3e-066e271a1c01', 'Mini UPS OLAX POE-D6 20.000 mAh');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('2dbda78d-4562-401d-849c-55ba4f72d363', 'MEMKIN16GBDDR55600MHZ', '', '', '2025-04-30 01:08:52.712', '2025-04-30 01:08:52.712', '2981e564-9643-4af8-8e17-f92199f9e41b', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('2eaf24bd-6acb-4d54-8236-2c9b055e4904', 'B760M DS3H AX', '', '', '2025-04-30 01:08:52.745', '2025-04-30 01:08:52.745', '5606d1cf-4584-4226-a942-41de319cf6f8', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('2fa5df8d-d0ce-40ec-a345-9accc3d95e10', 'NV22TB', '', '', '2025-04-30 01:08:52.702', '2025-04-30 01:08:52.702', '52174412-65d5-4257-a956-5e67dba8f603', 'SSD Kingston NV3 NVMe, 2TB, PCI 4.0 6,000/5,000MB/seg>');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('30131b7e-d042-42f3-9305-d2b588f3b7c4', 'PA247CV', '', '', '2025-04-30 01:08:52.669', '2025-04-30 01:08:52.669', '68559a08-2160-45c6-b75f-dd1a7d95e2cf', 'Monitor ASUS Pro Art PA247CV LED 23.8", Full HD, 75Hz, HDMI, Bocinas Integradas (2x 4W), Negro/Plata');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('30934395-91a0-4249-b2d7-68fd372b76e1', 'A620M-K', '', '', '2025-04-30 01:08:52.728', '2025-04-30 01:08:52.728', '248a5e7b-dfcd-48a0-a72e-8bce1badab56', 'A620M-K');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('31531ec5-e216-4fe6-a9ec-d41298f15ec2', 'FPP-T700', '', '', '2025-04-30 01:08:52.706', '2025-04-30 01:08:52.706', '580aada7-8501-4d6b-89db-d30d8a419b9d', 'POWER STATION FORZA TITAN 700W FPP-T700 - BATERÍA LMFP');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('320d1ba1-41d0-420b-abc8-ca36205f74e6', '', '', '', '2025-04-30 01:08:52.655', '2025-04-30 01:08:52.655', 'e6673b6d-8c52-4901-bb6e-26be6c3883a1', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('32a58a74-ce3e-4453-8a26-105956f09c24', 'GV-N408SWF3V2-16GD', '', '', '2025-04-30 01:08:52.713', '2025-04-30 01:08:52.713', '8f859d6d-f9e3-4e3d-8147-10b55be33c5e', 'Características


Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('32df2d7e-3691-4ccb-a6d6-aae0d28380fd', 'Z790-PLUS WIFI', '', '', '2025-04-30 01:08:52.742', '2025-04-30 01:08:52.742', 'ac77ab70-d6dc-4582-933b-5a027f69154d', 'Z790-PLUS WIFI');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('35dad52f-c83a-49a1-b11e-82ffa4487fa7', 'ups508', '', '', '2025-04-30 01:08:52.750', '2025-04-30 01:08:52.750', '00fcca66-9046-4201-b74d-320a1d4f4e17', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('369ab027-5841-424a-a95a-b8b37713d486', 'BR1350M2-LM', '', '', '2025-04-30 01:08:52.678', '2025-04-30 01:08:52.678', '32a60de8-a996-45dc-bf63-185267c54f91', 'Características


Capacidad de potencia de salida (VA): 1350 VA
Potencia de salida: 810 W
Índice de aumento de energía: 1080 J
Cantidad de salidas AC: 10
Voltaje nominal de entrada: 120');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('37a1a4b4-c7e3-4a0c-86da-d3b0e2f17ea7', 'BATERIABLESSPOWER12V', '', '', '2025-04-30 01:08:52.734', '2025-04-30 01:08:52.734', '00b98b2a-8b01-425c-9b0c-0b290d9c5d48', 'BATERIA BLESS POWER 12V - 7.5AH PARA UPS');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('386733a3-0f7c-4e32-b85b-d561909c97e2', 'Legend 900', '', '', '2025-04-30 01:08:52.677', '2025-04-30 01:08:52.677', '74e3b23b-1584-4c8a-87c2-40ac49a7b362', 'Interfaz de transmisión PCIe Gen4 x4
Velocidad de lectura/escritura de hasta 7000/5400 MB/s
Funciona con PS5, velocidad de lectura de hasta 6200 MB/s para PS5');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('38c553cc-4222-4486-8562-93180134c940', 'i5-12400', '', '', '2025-04-30 01:08:52.690', '2025-04-30 01:08:52.690', '4d659962-ea4b-4b53-9c63-0e9efcea0543', 'Procesador Intel Core i5-12400, S-1700, 2.50GHz, 6-Core, 12va. Generación');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('38ebdd27-c77b-47ea-8858-7ae59885e701', 'nv2500gb', '', '', '2025-04-30 01:08:52.695', '2025-04-30 01:08:52.695', 'd544c963-581d-438f-b50d-064b1bffb0ca', 'SSD Kingston NV3 NVMe, 500GB, PCI 4.0, 5,000/3,000MB/seg');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('3946a158-039a-4307-be92-30a2c2649ed8', '7000x', '', '', '2025-04-30 01:08:52.678', '2025-04-30 01:08:52.678', '079eeea1-2afc-4ba4-9fc5-068d40ab8bc4', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('3ba1b6b0-aa6c-41c1-b58d-0296fd965ad9', 'VG279QL3A', '', '', '2025-04-30 01:08:52.704', '2025-04-30 01:08:52.704', '85f368a0-6747-4a62-b2b1-8eb19bffe9eb', 'VG279QL3A');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('3bf709aa-f442-4ea6-b41f-8343fd097a3f', 'MEMKIN16GBDDR55600MHZ', '', '', '2025-04-30 01:08:52.665', '2025-04-30 01:08:52.665', '3e00a7ff-e62f-41fd-9f60-f22e2f0ecdf5', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('3e11f6f4-6824-483b-a5c5-d9f710546358', 'BV1000', '', '', '2025-04-30 01:08:52.769', '2025-04-30 01:08:52.769', '1dc0f147-1cbb-4b96-87b0-91c743c7c56b', 'Características


Capacidad de potencia de salida (VA): 1000 VA
Potencia de salida: 600 W
Cantidad de salidas AC: 6
Voltaje nominal de entrada: 120');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('3f8d684b-2291-40e5-ba0f-c3aadd8375c0', '24MK430H-B', '', '', '2025-04-30 01:08:52.772', '2025-04-30 01:08:52.772', '4cd1dd27-084a-4496-bdc6-e45489568814', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('4065aa66-f293-42d9-b3cf-2f39d9929110', 'ultra9285K', '', '', '2025-04-30 01:08:52.746', '2025-04-30 01:08:52.746', '447a9dff-5e99-4533-bcaf-3253897347c1', 'Procesador Intel Core Ultra 9 285K con Intel Graphics, LGA 1851, 5.7GHz, 24 Núcleos, 36MB Caché - Ultra Series 2 Arrow Lake');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('408fba1e-a190-4378-a370-d010c8f02520', 'TUF-RTX4090-O24G-OG-GAMING', '', '', '2025-04-30 01:08:52.667', '2025-04-30 01:08:52.667', '41349ed5-1062-490e-a3ea-ed715fe81900', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('46f72720-345b-41f3-ade7-664eeb360bde', 'VA24EHF', '', '', '2025-04-30 01:08:52.656', '2025-04-30 01:08:52.656', '97bfa871-690a-409b-8c0a-030647863c7f', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('474292cb-28ee-4e8b-aed3-ede950a12d72', 'GV-N1656OC-4GD', '', '', '2025-04-30 01:08:52.724', '2025-04-30 01:08:52.724', '8c20d7af-d19d-442d-92ec-87724ca62d88', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('487ce5be-27ec-4526-9a42-32f124a369b3', 'CV650', '', '', '2025-04-30 01:08:52.656', '2025-04-30 01:08:52.656', '7516fb79-496d-4ba9-b659-fd2c83f44e29', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('48d0d2fb-4a69-44d0-9acb-4f67f8a25d71', '981-001049', '', '', '2025-04-30 01:08:52.673', '2025-04-30 01:08:52.673', 'cc56ead3-1863-4eb3-baca-9d7e6392ea5e', 'Características


Frecuencia de auricular: 20 - 20000 Hz
Tecnología de conectividad: Inalámbrico
Color del producto: Negro, Amarillo');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('492d5e19-abf3-4051-857e-cc0ed03cf9be', 'BVX900L-LM', '', '', '2025-04-30 01:08:52.695', '2025-04-30 01:08:52.695', '7cfefb8b-8316-48f1-8dbc-998b7cd45b3b', 'UPS No Break APC BVX900L-LM Línea interactiva, 480W, 900VA, Entrada 89-145V, 6 Contactos');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('499af75a-c1a5-431d-b442-45b31f1011dc', 'XG27ACS', '', '', '2025-04-30 01:08:52.741', '2025-04-30 01:08:52.741', '9b9d61ca-3c63-4927-8212-eeb2b20ee92f', 'Monitor ASUS ROG Strix 27" QHD 2560x1440  180HZ, 1MS, Modelo XG27ACS');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('4d08c8e4-80d0-4f0e-a382-ae72ec1ca6ba', 'M32QC', '', '', '2025-04-30 01:08:52.702', '2025-04-30 01:08:52.702', '1a32eeb3-6602-43ec-8a08-1e9f0e2c3d36', 'Características


-Diagonal de la pantalla: 80 cm (31.5")
Tipo HD: Quad HD
AMD FreeSync: 
Velocidad de actualización: 165 Hz
HDMI: 2
DisplayPort: 1');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('4f9072c7-ae16-49bc-a0b5-87e035f828ec', 'VZ27EHF', '', '', '2025-04-30 01:08:52.707', '2025-04-30 01:08:52.707', '94fe3a63-9254-4f07-9fe5-daf4b748234d', 'Monitor GAMING ASUS VZ27EHF Eye Care, Ultra Slim, 27" IPS, FHD, 100Hz, 1ms');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('50cf0bdd-ce34-4c12-b5ae-fa4c8224434e', 'BVX900L-LM', '', '', '2025-04-30 01:08:52.674', '2025-04-30 01:08:52.674', 'f044041d-ad94-4b2d-a2a8-34ce4fdd0f1b', 'Características


Capacidad de potencia de salida (VA): 0.9 kVA
Potencia de salida: 480 W
Índice de aumento de energía: 350 J
Cantidad de salidas AC: 6');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('50e1abe8-89db-49db-8424-ad242376fa06', 'a400240gb', '', '', '2025-04-30 01:08:52.670', '2025-04-30 01:08:52.670', '33abeda7-e5ee-40b3-a610-d35a052f9616', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('50fc59a1-d733-43b1-ad53-839cda1295ad', 'i5-14600KF', '', '', '2025-04-30 01:08:52.663', '2025-04-30 01:08:52.663', '1f1e8d53-f87f-47a1-8853-ecb14f21c557', 'Procesador Intel Core i5-14600KF, S-1700, 3.50GHz, 14-Core,  (14va. Generación - Raptor Lake)');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('51d217de-e4cd-4763-b30a-8dfccc2f4445', 'GV-N4090WF3V2-24GD', '', '', '2025-04-30 01:08:52.728', '2025-04-30 01:08:52.728', '147a1568-2660-4412-a635-bddd8374e9ec', 'Características


Frecuencia boost: 2520 MHz
Núcleos CUDA: 16384
Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('566a479b-4eac-43e8-8cef-f8954632bcfd', 'Z890-P', '', '', '2025-04-30 01:08:52.751', '2025-04-30 01:08:52.751', '5371d91f-df5d-4938-bad9-fdfa0e247e9f', 'Mainboard ASUS PRIME Z890-P, ATX, LGA 1851 (Socket V1), Intel Z890, 192GB DDR5');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('571bcea4-4b1d-4cc8-8c1a-cbde2ed5aaf5', 'VG27AQL1A', '', '', '2025-04-30 01:08:52.688', '2025-04-30 01:08:52.688', '927262fd-d4d2-493a-b054-e5b6a849097b', 'Características


-Diagonal de la pantalla: 68,6 cm (27")
Tipo HD: Quad HD
Nvidia G-Sync: 
AMD FreeSync: 
Velocidad de actualización: 170 Hz
HDMI: 2
DisplayPort: 1');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('5936fbc9-cfcb-4f29-932e-9943c4b137dd', 'KB-100', '', '', '2025-04-30 01:08:52.724', '2025-04-30 01:08:52.724', '2c6c14ca-6417-40d9-9160-57c554724eb3', 'Teclado Genius Smart KB-100, Alámbrico, Negro (Español)');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('5d79e7e5-e07b-4f54-a190-8ad2526399e6', 'Case Mid', '', '', '2025-04-30 01:08:52.729', '2025-04-30 01:08:52.729', 'c98808c5-44ed-49ae-b992-7777d8aa216e', 'Case Mid Tower Normal USB 600watts');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('62c195cb-f89f-413f-b7e5-b99d8a006e17', '4600G', '', '', '2025-04-30 01:08:52.754', '2025-04-30 01:08:52.754', 'b2ac885c-189a-459d-976f-0df15a2fd623', 'Procesador AMD Ryzen 5 4600G Radeon Graphics, S-AM4');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('63cd4750-af72-4bfc-91e0-51d53e798db8', '16gbddr4kingston', '', '', '2025-04-30 01:08:52.678', '2025-04-30 01:08:52.678', '706fb114-0b29-4bba-b81c-e0700adfca3f', 'Memoria RAM Kingston 16GB DDR4, 3200MHz para PC');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('64de3848-920c-40f4-b20b-cf5059d78c2d', 'PA278QV', '', '', '2025-04-30 01:08:52.678', '2025-04-30 01:08:52.678', 'eab242bf-b2d3-413b-8367-69ee0d82db83', 'Características


-Diagonal de la pantalla: 68,6 cm (27")
Nvidia G-Sync: 
AMD FreeSync: 
Velocidad de actualización: 75 Hz
HDMI: 1
DisplayPort: 1');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('66649666-383e-4244-a77f-d8a76809e487', 'Gc300', '', '', '2025-04-30 01:08:52.751', '2025-04-30 01:08:52.751', '94b051c3-ef5d-4126-85b5-085c2f9875ce', 'Gamepad  MSI Force Gc300 Wireless, Alámbrico/Inalámbrico, USB 2.0, Negro');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('66b2c33e-3943-487f-8c91-cc9252fecb5d', '8700G', '', '', '2025-04-30 01:08:52.729', '2025-04-30 01:08:52.729', '7f6754c8-8927-44af-ab67-fbc7e2a73de1', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('69a5e43d-f2ed-4662-929f-704d830c3da1', 'CMK32GX5M1B5600C40', '', '', '2025-04-30 01:08:52.671', '2025-04-30 01:08:52.671', '8b69f37a-a4e6-4010-b182-b7645295f7a1', 'Características


Tipo de memoria interna: DDR5
Memoria interna: 32GB
Diseño de memoria: 2 x 16 GB
Velocidad de memoria del reloj: 5600 MHz
Latencia CAS: 40');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('6b30edd0-ee6a-4c33-bc1c-a95f78724cc7', 'RM1000e', '', '', '2025-04-30 01:08:52.647', '2025-04-30 01:08:52.647', '37c2aee3-0a25-4fe0-8b9b-63ee1ecddeb5', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('6ba0cad7-c6bc-4256-94de-0c17aa0c0938', 'GT301', '', '', '2025-04-30 01:08:52.732', '2025-04-30 01:08:52.732', '3c091da0-3615-4209-bbf7-8900d7b34668', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('6cd61c88-b521-42ee-8370-01bea8357419', 'CA-9011201-NA', '', '', '2025-04-30 01:08:52.666', '2025-04-30 01:08:52.666', '5e595c40-00a2-4624-8859-a0ef8170cbb9', 'Características


Frecuencia de auricular: 20 - 30000 Hz
Tecnología de conectividad: Inalámbrico
Color del producto: Carbono');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('6dea8a22-f5c3-4905-9706-3dfbb19441b3', 'H150', '', '', '2025-04-30 01:08:52.722', '2025-04-30 01:08:52.722', '0694fc6f-00c5-4915-804f-00ea0312d833', 'Corsair H150');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('6e2cba63-8f49-4caa-a4b9-9e3f6bbbf076', 'a520m_k', '', '', '2025-04-30 01:08:52.691', '2025-04-30 01:08:52.691', '20b94a21-3a52-4f41-b5e2-91675e9f6270', 'a520m-k');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('6e52b804-4933-4aa8-829a-6cd1f72336dc', 'ultra5 245k', '', '', '2025-04-30 01:08:52.744', '2025-04-30 01:08:52.744', '62c5967f-6f1a-4e02-8fec-1c9fb0f93c6f', 'Procesador Intel Core Ultra 5 245K  LGA 1851  14x (6P + 8E) Cores');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('70b7578c-7d8a-4073-9fdc-42a4460c941d', 'C700P', '', '', '2025-04-30 01:08:52.732', '2025-04-30 01:08:52.732', 'cc858fe9-2d53-4c73-b21c-57d02a94238a', 'Cooler Master Cosmos C700P, Full Tower, ATX/Micro-ATX/Mini-ITX, USB 3.0, sin Fuente, 3 Ventiladores Instalados, Negro');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('70bfe02d-2425-4d0c-af7f-b2e09dee8da7', 'WDS500G3B0E', '', '', '2025-04-30 01:08:52.767', '2025-04-30 01:08:52.767', '7161138b-6682-4da8-8c1e-36db76de13ab', 'Características


Capacidad: 500 GB
Interface: PCI Express 4.0
Velocidad de lectura: 4000 MB/s
Velocidad de escritura: 3600 MB/s');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('71cac616-ace2-4893-9a7e-aaa2ac4e357a', 'i7-13700', '', '', '2025-04-30 01:08:52.682', '2025-04-30 01:08:52.682', '1f3e8b1e-c214-46f7-a827-2550b0f46afb', 'i7-13700');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('73365781-94d3-4bee-92bc-8f39a3aeb926', 'RTX5080', '', '', '2025-04-30 01:08:52.765', '2025-04-30 01:08:52.765', 'a75fe249-7407-479e-8d7f-236e5baae10c', 'Tarjeta de Video Asus RTX5080  6GB GDDR7 OC Edition');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('734db53c-ba49-423c-af75-68ad90e83aaf', 'GV-N407TEAGLE OC-12GD', '', '', '2025-04-30 01:08:52.720', '2025-04-30 01:08:52.720', '2db88bb9-ecd6-4642-a235-11498ab3cdf7', 'Características


Frecuencia del procesador: 2625 MHz
Frecuencia boost: 2610 MHz
Núcleos CUDA: 7680
Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('748354f1-272f-45c9-950e-063e62c5d20f', 'GV-N407TSGAMING OC-16GD', '', '', '2025-04-30 01:08:52.745', '2025-04-30 01:08:52.745', 'a52a95e9-9ef1-46bb-9af1-6da405b7f667', 'Características


Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('75c84524-fecc-4c8f-a16b-232bb63082a6', 'BT-1001', '', '', '2025-04-30 01:08:52.704', '2025-04-30 01:08:52.704', 'fbc7a151-f7d8-4315-9b2a-7e5d550251c6', 'UPS FORZA BT-1001 - 1000VA/500WATTS - 6 TOMAS - 120V');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('77041211-d202-4dfc-a3f0-9cc3ea32a77f', 'RTX30508GBPhoenix', '', '', '2025-04-30 01:08:52.739', '2025-04-30 01:08:52.739', 'cabeaa82-373c-4e8a-95e0-f36a44b48211', 'Tarjeta de Video ASUS NVIDIA Phoenix GeForce RTX 3050 8G, 8GB 128-bit GDDR6, PCI Express 4.0');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('795f4e36-8cf1-4b10-8479-c66ace03d62f', 'RENEGADE4TB', '', '', '2025-04-30 01:08:52.701', '2025-04-30 01:08:52.701', 'a9860385-8e00-450f-bbdf-e69c47687673', 'SSD KINGSTON FURY RENEGADE 4TB M.2 NVME 2280 PCI-E 4.0 - 7300MB/S - 7000MB/S (SFYRD/4000G)');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('79fc374f-7115-4e1d-85df-d324e52e4d5e', 'Ryzen 7 7700', '', '', '2025-04-30 01:08:52.771', '2025-04-30 01:08:52.771', '7d35eb60-f42d-4919-90cf-b73e5e2521dc', 'Procesador AMD Ryzen 7 7700, S-AM5');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('7a7f36a8-5bfa-4d2f-9f91-4c8dc6df049c', 'DX-110', '', '', '2025-04-30 01:08:52.771', '2025-04-30 01:08:52.771', '09b0bc6b-5195-41f7-971c-f06fa3c3a8be', 'Mouse Genius Óptico DX-110, Alámbrico, USB, 1000DPI, Negro');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('7eca9055-c3cd-43cd-ad75-7b9d70b820e5', 'RM1200x', '', '', '2025-04-30 01:08:52.664', '2025-04-30 01:08:52.664', '3eab1750-e7bf-42cd-8659-4c5bc531a5a2', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('81ca5867-8cb3-437d-bf20-734f8cbc8030', 'Z890-E', '', '', '2025-04-30 01:08:52.756', '2025-04-30 01:08:52.756', '7fc70037-63bd-48dc-90a7-b5f8d4f16118', 'Mainboard ASUS ROG STRIX Z890-E GAMING WIFI, ATX, LGA 1851 (Socket V1), Intel Z890, 192GB DDR5, HDMI/DP para Intel');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('847334e7-155a-4545-80ab-a6327052cb3f', 'tm30corsair', '', '', '2025-04-30 01:08:52.767', '2025-04-30 01:08:52.767', '98bd9292-360a-49a4-b88a-f17fd277d794', 'Pasta Térmica Corsair  TM30, 3 Gramos');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('84dc5fe1-496d-4c4e-b8a2-42c675e66f4a', 'NV22TB', '', '', '2025-04-30 01:08:52.719', '2025-04-30 01:08:52.719', '3f6ca07c-3fa5-43f6-a14d-ff23d2a1d236', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('86c17c28-9072-40f2-9cf7-72dc5f5965b2', 'AP-850G', '', '', '2025-04-30 01:08:52.682', '2025-04-30 01:08:52.682', 'e47cd799-b26e-41d8-b78d-bc72e29b5552', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('88c9266c-9d48-4ab8-9817-d1bd4e216642', '', '', '', '2025-04-30 01:08:52.661', '2025-04-30 01:08:52.661', '890563f1-deef-4bfe-a7d1-18eafdfd63f5', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('8c4358bc-1e3c-4453-bb69-375aa878bef9', 'DUAL-RTX4070S-O12G', '', '', '2025-04-30 01:08:52.737', '2025-04-30 01:08:52.737', 'b659c6e8-fbb8-4158-8e7f-2e96a22061f2', 'Características


Frecuencia boost: 2520 MHz
Núcleos CUDA: 7168
Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('8c9ab757-6866-4d34-9cba-1c73db58fef0', 'BX2000M-LM', '', '', '2025-04-30 01:08:52.763', '2025-04-30 01:08:52.763', '5cc0aaac-73fe-473c-ba22-fe4e1e273b99', 'UPS APC BX2000M-LM Intercativo, 1200W - 2000VA 6 tomas');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('8d4e1e9f-3ca3-466c-9e0b-1cf24435b075', '', '', '', '2025-04-30 01:08:52.752', '2025-04-30 01:08:52.752', '8a26bc67-0735-4fe2-bf7a-d1e6830bc07e', 'Fuente de Poder Corsair CX750 80 PLUS Bronze, 24-pin ATX, 120mm, 750W');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('8d60dd7d-5fd1-4d43-ba5a-29c60c83e979', '20mk400', '', '', '2025-04-30 01:08:52.677', '2025-04-30 01:08:52.677', 'b485e474-f8c8-43ef-a6d2-ccf8f80640d4', 'Monitor LG 20MK400H-B LED 19.5", 60Hz, HDMI, Negro');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('8f806076-d628-4cd2-a840-e6ace3de9a1e', 'XG32WCS', '', '', '2025-04-30 01:08:52.749', '2025-04-30 01:08:52.749', '9c76b587-514e-4c78-a6c7-27d9570be403', 'Monitor Curvo ASUS ROG Strix 32" QHD 2560x1440 180HZ, 1MS, Modelo XG32WCS');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('904d6bc4-1a59-404e-a138-35179137d7fd', 'DS-UPS3000-X', '', '', '2025-04-30 01:08:52.746', '2025-04-30 01:08:52.746', '2efc027e-d876-4ae7-8762-1190678284e8', 'UPS Interactivo Hikvision DS-UPS3000-X 3000VA - 1800W - 120V / 6 TOMAS - Batería 12V 9Ah');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('9053cdf8-118f-4af8-b356-238a670a6fa8', 'rtx408016gbasusstrix', '', '', '2025-04-30 01:08:52.724', '2025-04-30 01:08:52.724', 'e1a66687-8b83-420a-b4d1-bfe20b717990', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('91773679-d31f-4227-83b7-270ea978fc37', '8600G', '', '', '2025-04-30 01:08:52.724', '2025-04-30 01:08:52.724', '8900f6e8-4397-4fbc-9e1b-8df2a73abd86', 'Características


Familia de procesador: AMD Ryzen™ 5
Modelo del procesador: 8600G
Frecuencia del procesador: 4,3 GHz
Socket de procesador: Socket AM5
Número de núcleos: 6');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('942ca251-6c31-4ff5-8016-b857700edca1', '412R', '', '', '2025-04-30 01:08:52.658', '2025-04-30 01:08:52.658', '33e1a46d-1abc-4195-afd5-4821e76e2fd1', 'HYPER H412R');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('950838cd-31a5-44e3-8fbf-93df83c2d7b6', 'nv21tb', '', '', '2025-04-30 01:08:52.704', '2025-04-30 01:08:52.704', '6dc703c7-0795-40f1-98bd-75666ba4d9a1', 'SSD Kingston NV3 NVMe, 1TB, PCIe 4.0 6,000/4,000MB/seg');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('957d371e-da96-4f76-9963-8257ae2c0a42', 'VA27EHF', '', '', '2025-04-30 01:08:52.664', '2025-04-30 01:08:52.664', '10d19658-43e2-492a-83f3-7bc3eca3f686', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('98fcf595-b20e-4b94-bdfc-eab952c596c0', 'i7-12700', '', '', '2025-04-30 01:08:52.669', '2025-04-30 01:08:52.669', '2bc82480-3fd5-429e-ab81-dfd4c7de9239', 'Procesador Intel Core i7-12700, S-1700, 2.10GHz, 12-Core, 25MB Smart Cache (12va. Generación - Alder Lake)');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('99d8d0b1-c92b-40c2-b0a5-1c4559169a13', '16gbddr4adata', '', '', '2025-04-30 01:08:52.769', '2025-04-30 01:08:52.769', '19ba5ad9-f7d9-4f64-9f91-b3cd9319360a', 'Memoria RAM Adata 16GB DDR4, 3200MHz para PC');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('9b9edd24-0a80-4f70-8ade-3403e0d439e4', 'h610m-k D4', '', '', '2025-04-30 01:08:52.710', '2025-04-30 01:08:52.710', '152b3c24-3504-4346-9383-f75268f97cac', 'Mainbaord ASUS Micro-ATX H610M-K D4, S-1700, Intel H610, HDMI, 64GB DDR4 para Intel');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('9fd83a39-f08c-4f12-ab39-e9d189f13376', 'C8', '', '', '2025-04-30 01:08:52.728', '2025-04-30 01:08:52.728', '09d612e4-6401-42ab-b09d-b051a3feb15c', 'Case Antec Constellation C8 con Ventana, Full Tower, ATX/EATX/ITX/Micro ATX, USB 3.0, sin Fuente NO FAN');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('a1e447b0-e39f-4ada-b9e3-7a70779bbb9e', 'l3250', '', '', '2025-04-30 01:08:52.687', '2025-04-30 01:08:52.687', 'e6c52279-c1ea-49f3-bbc8-203fe4d36a9b', 'Multifuncional Epson EcoTank L3250, Color, Inyección, Inalámbrico, Print/Scan/Copy');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('a4a84bac-19cb-479f-88fa-8485e2fa2592', 'nv21tb', '', '', '2025-04-30 01:08:52.733', '2025-04-30 01:08:52.733', '5dc69ace-3aa1-4ce6-9580-0dfe3b71a464', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('a4d0a03a-aba5-4467-9627-3a5165fac66b', 'K552W', '', '', '2025-04-30 01:08:52.657', '2025-04-30 01:08:52.657', 'ae5b0009-4645-460c-a2a3-b5af7e1be745', 'Teclado Mecánico Gamer Redragon Kumara K552W RGB, Switch Red, USB, Blanco');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('ab905ba7-d123-457f-8f0d-7ce370af1136', 'SFYRD/2000G', '', '', '2025-04-30 01:08:52.693', '2025-04-30 01:08:52.693', '4bf002e1-8850-403c-886f-5ad953597717', 'Características


Capacidad: 2000 GB
Interface: PCI Express 4.0
Velocidad de lectura: 7300 MB/s
Velocidad de escritura: 7000 MB/s');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('ac8090c2-af8e-4cca-9f31-a9859c479d4a', 'i3-13100', '', '', '2025-04-30 01:08:52.738', '2025-04-30 01:08:52.738', 'e4b87436-dca4-4f1c-bfc6-f390d6a552be', 'i3-13100');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('ada4fbf7-8684-44bd-b8a9-d793fb265818', 'B760M DS3H', '', '', '2025-04-30 01:08:52.749', '2025-04-30 01:08:52.749', '0f4113cc-2d5f-4388-a99a-6c149fe887f7', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('b2b249cb-e87c-4ccc-9ace-1e26b858eef8', 'CASETERRAX3FAN', '', '', '2025-04-30 01:08:52.688', '2025-04-30 01:08:52.688', '2daccbe5-90b8-480d-8116-cbd7f80e07f8', 'Case GAMER 3 FAN USB 2.0 sin FUENTE DE PODER');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('ba24f6a2-59d1-424a-b196-ddbcd3dcf6d0', 'cv750', '', '', '2025-04-30 01:08:52.721', '2025-04-30 01:08:52.721', '65c3952a-e192-48ac-a75e-a5180a6f3849', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('bb1ff247-af1d-4358-86ff-de45fabdc82c', 'casez06', '', '', '2025-04-30 01:08:52.678', '2025-04-30 01:08:52.678', '25207f3d-2cb7-4567-ad85-3f5165dc63c9', 'Case Generico 500watts Hektech');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('bf414ec7-e04c-4399-ab10-c839cfadf267', '32QHD240', '', '', '2025-04-30 01:08:52.764', '2025-04-30 01:08:52.764', '16a245ce-80ad-459c-b528-9e018762707f', 'Características


-Diagonal de la pantalla: 81,3 cm (32")
Tipo HD: Quad HD
Nvidia G-Sync: 
AMD FreeSync: 
Velocidad de actualización: 240 Hz
HDMI: 2
DisplayPort: 1');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('bffc60dd-1896-452c-b823-53044723c2c5', 'azza240mm', '', '', '2025-04-30 01:08:52.772', '2025-04-30 01:08:52.772', 'a82d3f47-dbfd-41c3-aeef-8593ed6fd390', 'Cooler liquido Azza Galeforce  240mm para procesadores AMD e INTEL');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('c1afc43f-296a-4d49-80cd-65831f6a37ed', 'B650M-A II-CSM', '', '', '2025-04-30 01:08:52.698', '2025-04-30 01:08:52.698', 'f1a54a7b-9a65-445b-97e9-4530ec8c00b0', 'Mainboard ASUS Micro-ATX PRIME B650M-A II-CSM, AM5, AMD B650, HDMI, 128GB DDR5');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('c3262eef-dddc-48cf-a755-355d5e1bdfe4', 'FX-2200LCD', '', '', '2025-04-30 01:08:52.702', '2025-04-30 01:08:52.702', '869c06c8-1569-4bd0-a951-79db92065ce3', 'UPS No Break Forza Power Technologies FX-2200LCD, 1200W, 2200VA, Entrada 110-120V, Salida 110-120V');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('c334bab5-67db-4675-a030-e77c70e97f6f', 'b550m-a', '', '', '2025-04-30 01:08:52.687', '2025-04-30 01:08:52.687', 'aa140bb7-200c-444d-9932-8f1dfbd8b9da', 'Mainboard ASUS Micro ATX PRIME B550M-A AC, S-AM4, DRR4, para AMD');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('c41092dc-43c8-4b0e-bf55-6e7127c41712', 'kit4en1', '', '', '2025-04-30 01:08:52.712', '2025-04-30 01:08:52.712', '58cb3509-889e-4842-b42a-c6aabdf3e4fd', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('c44b36f7-5e5d-4e3f-8cf8-03e0e47c134d', 'SFYRDK/2000G', '', '', '2025-04-30 01:08:52.689', '2025-04-30 01:08:52.689', '57ef304f-f2b1-4ab8-aaf6-0a82a29cffb9', 'Características


Capacidad: 2000 GB
Interface: PCI Express 4.0');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('ca4682b6-8e74-4831-aa0a-29d52b1d4f7c', 'GT301', '', '', '2025-04-30 01:08:52.710', '2025-04-30 01:08:52.710', '850a8514-d4b1-4dfb-bd56-addf7402caf9', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('cc6aadc9-8b02-48da-8e76-9dda68717bfb', 'i5-14400', '', '', '2025-04-30 01:08:52.657', '2025-04-30 01:08:52.657', 'ad1e570a-70bd-49ad-b94e-4448098e0f32', 'Características


Familia de procesador: Intel® Core™ i5
Modelo del procesador: i5-14400
Frecuencia del procesador: 2.5 GHz
Socket de procesador: LGA 1700
Número de núcleos: 10');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('cd42f357-2890-45ed-9627-333ece7203c8', 'ASUS TUF GAMING Z890-PLUS WIFI', '', '', '2025-04-30 01:08:52.752', '2025-04-30 01:08:52.752', '046f71f2-79e6-4a63-be00-e418d557e21b', 'TUF GAMING Z890-PLUS WIFI');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('cee9d2f7-1051-4ab0-9dda-8dd347e4e636', 'VG249Q3A', '', '', '2025-04-30 01:08:52.740', '2025-04-30 01:08:52.740', '650c8d61-703f-4ef1-856a-6ea79f299b8c', 'Pulgadas: 23.8
Ratio de aspecto: 16:9
Área de visión (HxV): 527.04 x 296.46 mm
Tipo de Luz: LED
Tipo de panel: IPS');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('d212ae07-60fc-46ba-bbb5-d77be1581519', '5700G', '', '', '2025-04-30 01:08:52.660', '2025-04-30 01:08:52.660', '55b74372-c690-454e-84de-7472e72b8e1c', '5700G');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('d27ab6d3-c606-4353-835f-89e1aa638cde', 'H610M-K *DDR5*', '', '', '2025-04-30 01:08:52.771', '2025-04-30 01:08:52.771', 'e264a180-5d62-4ef8-b11f-5e9acb96166f', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('d2e79f43-1209-4960-abb3-4b4ad1c4252b', 'nv2500gb', '', '', '2025-04-30 01:08:52.657', '2025-04-30 01:08:52.657', '795e40b8-0aeb-449a-aa76-05ad51a29448', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('d65b611a-2f31-4f4c-a2a0-5d1ba0207dfb', 'PG27AQN', '', '', '2025-04-30 01:08:52.769', '2025-04-30 01:08:52.769', '6e24940a-1c8e-4f28-a6b4-2c16c115fbb9', 'Características


-Diagonal de la pantalla: 68,6 cm (27")
Tipo HD: Wide Quad HD
Nvidia G-Sync: 
AMD FreeSync: 
Velocidad de actualización: 360 Hz
HDMI: 3
DisplayPort: 1');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('daba9348-14bf-44f7-8442-dfc4bfaa6436', '8500G', '', '', '2025-04-30 01:08:52.668', '2025-04-30 01:08:52.668', '5ff37926-8b28-4e58-90a5-19f6a6837cf0', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('db65ac40-0963-4f6c-bdbf-6e8217c71c22', 'AC2A', '', '', '2025-04-30 01:08:52.711', '2025-04-30 01:08:52.711', '9139ee43-27aa-42ec-8055-4f8638b049b2', 'POWER STATION BLUETTI AC2A - 300 WATTS - 204WH');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('db8003d4-393e-4aff-af41-b5089aea314a', 'GV-N4060WF2-8GD', '', '', '2025-04-30 01:08:52.734', '2025-04-30 01:08:52.734', '5f308f1c-aca1-413a-854c-3ebc5ea08350', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('dd990f84-c461-4497-acab-7e64df0e68ff', 'GEFORCE RTX 3060 VENTUS 3X 12G OC', '', '', '2025-04-30 01:08:52.690', '2025-04-30 01:08:52.690', '513701f5-21f1-4fb7-8197-b0f8f2430067', 'GEFORCE RTX 3060 VENTUS 3X 12G OC');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('de869dde-a42c-4d7f-85f5-858aea0f34bc', 'PH-GT1030-02G', '', '', '2025-04-30 01:08:52.755', '2025-04-30 01:08:52.755', 'de691bc8-8787-4541-9e6b-838935b6c7b2', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('de95ff71-8815-4aec-a100-a03332371a6b', 'i9-14900KF', '', '', '2025-04-30 01:08:52.680', '2025-04-30 01:08:52.680', 'ebe56009-5599-46a5-bd48-c68dae2fe482', 'Procesador Intel Core i9-14900KF, S-1700, 5.6 GHz, 24-Core,  (14va. Generación - Raptor Lake)');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('dee3269b-5d96-4675-8161-540714e6949d', 'i9-14900', '', '', '2025-04-30 01:08:52.702', '2025-04-30 01:08:52.702', 'c17d3a40-a645-4e47-a6ae-0c6a383f9bab', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('e10911b0-253e-4b07-8b01-df75f709f413', 'GV-N3060GAMING OC-12GD', '', '', '2025-04-30 01:08:52.771', '2025-04-30 01:08:52.771', 'f04de717-2d84-453b-a58b-cb877d61f7f6', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('e1c2fb0f-68da-4c54-9b89-81bc54192435', 'XPGSummoner', '', '', '2025-04-30 01:08:52.724', '2025-04-30 01:08:52.724', '96e43762-bcce-4331-bb48-5f3bceb27a76', 'Teclado Gamer XPG Summoner LED RGB, Cherry MX Blue, USB');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('e32559fe-ff6b-402c-85a7-53381b577288', 'BVX1200L-LM', '', '', '2025-04-30 01:08:52.751', '2025-04-30 01:08:52.751', '4a2f4bc6-6287-43e0-8263-3cb345754234', 'Características


Capacidad de potencia de salida (VA): 1.2 kVA
Potencia de salida: 650 W
Índice de aumento de energía: 273 J
Cantidad de salidas AC: 6');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('e7102206-89c9-4230-bd2c-7d94f4b54f3f', 'GV-N407SGAMING OC-12GD', '', '', '2025-04-30 01:08:52.710', '2025-04-30 01:08:52.710', '6d11c1e9-2e49-4bbe-8cc1-3c042b7405f8', 'Características


Cantidad de puertos HDMI: 1
Cantidad de DisplayPorts: 3');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('edaa906c-3f13-45b2-a378-2061e827bd5d', '1ESM1695', '', '', '2025-04-30 01:08:52.717', '2025-04-30 01:08:52.717', '8c143a1b-fcf3-40a1-a851-e70747a70a0c', 'UN AÑO DE GARANTÍA');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('efd840be-4205-413b-9403-29ee9e7ab54e', 'i9-13900k', '', '', '2025-04-30 01:08:52.723', '2025-04-30 01:08:52.723', '85dc5448-e064-4539-898a-387b42c83ae7', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('f0652e42-9657-4ec2-a9bc-30024ada2cc8', 'ultra7265k', '', '', '2025-04-30 01:08:52.739', '2025-04-30 01:08:52.739', '088978de-77aa-4433-b39a-8571445f01bf', '');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('f5f6481d-9ce4-4fec-8ba9-83d3679199da', 'QM-B20', '', '', '2025-04-30 01:08:52.716', '2025-04-30 01:08:52.716', '098e2165-d126-4f2b-8647-3531d7766c57', 'QM-B20');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('f836275b-b6f5-4aec-aba3-942d6810a636', 'BV500', '', '', '2025-04-30 01:08:52.661', '2025-04-30 01:08:52.661', '4aa06a40-9b98-458e-8cca-9ea581327175', 'Características


Capacidad de potencia de salida (VA): 500 VA
Potencia de salida: 300 W
Cantidad de salidas AC: 6
Voltaje nominal de entrada: 120');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('fa325560-9e90-49f2-a28a-96fad9c6edca', 'i3-10105', '', '', '2025-04-30 01:08:52.750', '2025-04-30 01:08:52.750', '94f452e0-ce51-4f53-9fea-3b5d4b87cb46', 'Características


Familia de procesador: Intel® Core™ i3-10xxx
Modelo del procesador: i3-10105
Socket de procesador: LGA 1200
Número de núcleos: 4');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('fc956435-c204-4982-bb39-320960df6446', 'CX650M', '', '', '2025-04-30 01:08:52.728', '2025-04-30 01:08:52.728', '671b178d-3ea3-4bf1-8ec5-4e93022e983e', 'Fuente de Poder Corsair CX650M 80 PLUS Bronze, 24-pin ATX, 12cm, 650W');
INSERT INTO mydb.DetailsProducts (id, ref, reference, warranty, createdAt, updatedAt, productId, description) VALUES ('ff67dbcd-ce1f-4f40-84ac-b17489a25798', 'UPSSKEPOE-830P-LFP', '', '', '2025-04-30 01:08:52.741', '2025-04-30 01:08:52.741', '9db5a93f-6cdd-4904-bb38-987efed9b594', 'Mini UPS SKE POE-830P-LFP - 20.000 MAH - 5V/9V/12V - 1.5A - TYPE-C 18W - BLACK');
