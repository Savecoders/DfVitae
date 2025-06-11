create table Orders
(
    id         varchar(191)                                                            not null
        primary key,
    userId     varchar(191)                                                            not null,
    status     enum ('pending', 'completed', 'cancelled') default 'pending'            not null,
    totalPrice double                                                                  not null,
    createdAt  datetime(3)                                default CURRENT_TIMESTAMP(3) not null,
    updatedAt  datetime(3)                                                             not null,
    constraint Orders_userId_fkey
        foreign key (userId) references User (id)
            on update cascade
);

INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord1', 'usr1', 'completed', 75299, '2025-03-31 02:36:34.000', '2025-03-31 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord10', 'usr2', 'pending', 7701, '2025-04-29 02:36:34.000', '2025-04-29 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord2', 'usr2', 'completed', 43022, '2025-04-05 02:36:34.000', '2025-04-05 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord21', 'usr1', 'completed', 15999, '2025-01-30 02:46:23.000', '2025-01-30 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord22', 'usr1', 'completed', 27700, '2025-02-09 02:46:23.000', '2025-02-09 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord23', 'usr1', 'completed', 51237, '2025-02-19 02:46:23.000', '2025-02-19 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord24', 'usr1', 'cancelled', 8900, '2025-03-01 02:46:23.000', '2025-03-01 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord25', 'usr1', 'completed', 62900, '2025-03-11 02:46:23.000', '2025-03-11 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord26', 'usr1', 'pending', 14900, '2025-04-20 02:46:23.000', '2025-04-20 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord27', 'usr1', 'completed', 39900, '2025-04-25 02:46:23.000', '2025-04-25 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord28', 'usr1', 'pending', 28000, '2025-04-28 02:46:23.000', '2025-04-28 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord29', 'usr2', 'completed', 4004, '2025-02-04 02:46:23.000', '2025-02-04 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord3', 'usr3', 'completed', 35835, '2025-04-10 02:36:34.000', '2025-04-10 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord30', 'usr2', 'completed', 11294, '2025-02-14 02:46:23.000', '2025-02-14 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord31', 'usr2', 'cancelled', 18900, '2025-02-24 02:46:23.000', '2025-02-24 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord32', 'usr2', 'completed', 6200, '2025-03-06 02:46:23.000', '2025-03-06 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord33', 'usr2', 'completed', 8830, '2025-03-16 02:46:23.000', '2025-03-16 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord34', 'usr2', 'pending', 914, '2025-04-22 02:46:23.000', '2025-04-22 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord35', 'usr2', 'cancelled', 96500, '2025-04-27 02:46:23.000', '2025-04-27 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord36', 'usr3', 'completed', 21500, '2025-02-01 02:46:23.000', '2025-02-01 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord37', 'usr3', 'completed', 4415, '2025-02-11 02:46:23.000', '2025-02-11 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord38', 'usr3', 'pending', 12500, '2025-02-21 02:46:23.000', '2025-02-21 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord39', 'usr3', 'completed', 39900, '2025-03-03 02:46:23.000', '2025-03-03 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord4', 'usr4', 'completed', 57500, '2025-04-15 02:36:34.000', '2025-04-15 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord40', 'usr3', 'cancelled', 3079, '2025-03-13 02:46:23.000', '2025-03-13 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord41', 'usr3', 'completed', 11192, '2025-03-23 02:46:23.000', '2025-03-23 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord42', 'usr3', 'completed', 4004, '2025-04-02 02:46:23.000', '2025-04-02 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord43', 'usr3', 'pending', 5647, '2025-04-23 02:46:23.000', '2025-04-23 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord44', 'usr4', 'completed', 40969, '2025-02-06 02:46:23.000', '2025-02-06 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord45', 'usr4', 'completed', 5133, '2025-02-16 02:46:23.000', '2025-02-16 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord46', 'usr4', 'completed', 36999, '2025-02-26 02:46:23.000', '2025-02-26 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord47', 'usr4', 'cancelled', 85500, '2025-03-08 02:46:23.000', '2025-03-08 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord48', 'usr4', 'completed', 23513, '2025-03-18 02:46:23.000', '2025-03-18 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord49', 'usr4', 'completed', 19900, '2025-03-28 02:46:23.000', '2025-03-28 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord5', 'usr1', 'pending', 9138, '2025-04-20 02:36:34.000', '2025-04-20 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord50', 'usr4', 'pending', 41500, '2025-04-26 02:46:23.000', '2025-04-26 02:46:23.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord6', 'usr2', 'cancelled', 512, '2025-04-23 02:36:34.000', '2025-04-23 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord7', 'usr3', 'completed', 39400, '2025-04-25 02:36:34.000', '2025-04-25 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord8', 'usr4', 'pending', 25500, '2025-04-27 02:36:34.000', '2025-04-27 02:36:34.000');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('ord9', 'usr1', 'completed', 41500, '2025-04-28 02:36:34.000', '2025-04-28 02:36:34.000');
