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

INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr1', 'John Doe', 'john.doe@example.com', 'hashed_password_1', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr2', 'Jane Smith', 'jane.smith@example.com', 'hashed_password_2', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr3', 'Michael Johnson', 'michael.johnson@example.com', 'hashed_password_3', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
INSERT INTO mydb.User (id, name, email, password, createdAt, updatedAt) VALUES ('usr4', 'Emily Brown', 'emily.brown@example.com', 'hashed_password_4', '2025-04-30 02:36:34.000', '2025-04-30 02:36:34.000');
