create table User
(
    id        varchar(191)                             not null
        primary key,
    name      varchar(191)                             null,
    email     varchar(191)                             null,
    password  varchar(191)                             null,
    createdAt datetime(3) default CURRENT_TIMESTAMP(3) not null,
    updatedAt datetime(3)                              not null,
    constraint User_email_key
        unique (email)
);

INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('cmbrzrvqw0000p7s8eauv7e06', 'Carlos Mendoza', 'carlos.mendoza@demo.com', null, '2025-06-11 13:34:49.976', '2025-06-11 13:34:49.976');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('cmbrzrvrh0001p7s8zarklq29', 'Laura Jiménez', 'laura.jimenez@demo.com', null, '2025-06-11 13:34:49.998', '2025-06-11 13:34:49.998');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('cmbrzrvrr0002p7s8xitlvnsq', 'Roberto Vargas', 'roberto.vargas@demo.com', null, '2025-06-11 13:34:50.008', '2025-06-11 13:34:50.008');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('cmbrzrvrx0003p7s89ekt6jhb', 'Ana Torres', 'ana.torres@demo.com', null, '2025-06-11 13:34:50.013', '2025-06-11 13:34:50.013');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('cmbrzrvs80004p7s8lqcf0zir', 'Diego Ruiz', 'diego.ruiz@demo.com', null, '2025-06-11 13:34:50.025', '2025-06-11 13:34:50.025');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('cmbrzrvse0005p7s8mx923vnv', 'Sofía Castro', 'sofia.castro@demo.com', null, '2025-06-11 13:34:50.031', '2025-06-11 13:34:50.031');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr1', 'John Doe', 'john.doe@example.com', 'hashed_password_1', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr2', 'Jane Smith', 'jane.smith@example.com', 'hashed_password_2', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr3', 'Michael Johnson', 'michael.johnson@example.com', 'hashed_password_3', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr4', 'Emily Brown', 'emily.brown@example.com', 'hashed_password_4', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
