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
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-0', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 22237, '2025-03-21 13:34:50.041', '2025-03-21 13:34:50.041');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-1', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 26000, '2025-03-27 13:34:50.058', '2025-03-27 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-10', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 56122, '2025-02-24 13:34:50.058', '2025-02-24 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-11', 'usr4', 'completed', 43798, '2025-05-31 13:34:50.058', '2025-05-31 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-12', 'cmbrzrvqw0000p7s8eauv7e06', 'pending', 121776, '2025-06-08 13:34:50.058', '2025-06-08 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-13', 'cmbrzrvs80004p7s8lqcf0zir', 'completed', 114177, '2025-03-28 13:34:50.058', '2025-03-28 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-14', 'usr1', 'completed', 27700, '2025-05-11 13:34:50.058', '2025-05-11 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-15', 'usr4', 'completed', 14001.35031, '2025-06-09 13:34:50.058', '2025-06-09 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-16', 'usr3', 'completed', 123804, '2025-03-03 13:34:50.058', '2025-03-03 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-17', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 82674, '2025-05-08 13:34:50.058', '2025-05-08 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-18', 'usr3', 'completed', 60416.35031, '2025-02-28 13:34:50.058', '2025-02-28 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-19', 'cmbrzrvs80004p7s8lqcf0zir', 'completed', 131861, '2025-05-09 13:34:50.058', '2025-05-09 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-2', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 39950, '2025-02-18 13:34:50.058', '2025-02-18 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-20', 'usr4', 'completed', 55272, '2025-03-11 13:34:50.058', '2025-03-11 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-21', 'cmbrzrvse0005p7s8mx923vnv', 'completed', 2.118, '2025-02-23 13:34:50.058', '2025-02-23 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-22', 'cmbrzrvrx0003p7s89ekt6jhb', 'completed', 42812, '2025-03-19 13:34:50.058', '2025-03-19 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-23', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 134183, '2025-02-13 13:34:50.058', '2025-02-13 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-24', 'usr3', 'completed', 35690, '2025-05-27 13:34:50.058', '2025-05-27 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-25', 'cmbrzrvqw0000p7s8eauv7e06', 'pending', 295147, '2025-03-06 13:34:50.058', '2025-03-06 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-26', 'usr2', 'completed', 46741.70062, '2025-03-03 13:34:50.058', '2025-03-03 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-27', 'usr2', 'completed', 141497.05093, '2025-04-25 13:34:50.058', '2025-04-25 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-28', 'usr1', 'completed', 43000, '2025-02-20 13:34:50.058', '2025-02-20 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-29', 'usr2', 'completed', 122637, '2025-02-25 13:34:50.058', '2025-02-25 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-3', 'cmbrzrvrx0003p7s89ekt6jhb', 'completed', 161918.998, '2025-05-12 13:34:50.058', '2025-05-12 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-30', 'usr4', 'completed', 71670, '2025-03-13 13:34:50.058', '2025-03-13 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-31', 'usr3', 'completed', 75797, '2025-04-16 13:34:50.058', '2025-04-16 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-32', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 16839, '2025-02-23 13:34:50.058', '2025-02-23 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-33', 'usr2', 'completed', 29800, '2025-05-28 13:34:50.058', '2025-05-28 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-34', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 167500, '2025-02-26 13:34:50.058', '2025-02-26 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-35', 'usr1', 'completed', 26001.019, '2025-06-04 13:34:50.058', '2025-06-04 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-36', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 35936, '2025-03-17 13:34:50.058', '2025-03-17 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-37', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 36999, '2025-04-13 13:34:50.058', '2025-04-13 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-38', 'usr4', 'completed', 453211, '2025-02-25 13:34:50.058', '2025-02-25 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-39', 'cmbrzrvrh0001p7s8zarklq29', 'completed', 64500, '2025-03-10 13:34:50.058', '2025-03-10 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-4', 'usr4', 'pending', 66404, '2025-05-17 13:34:50.058', '2025-05-17 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-40', 'cmbrzrvse0005p7s8mx923vnv', 'completed', 124502.038, '2025-03-07 13:34:50.058', '2025-03-07 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-41', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 89588, '2025-03-29 13:34:50.058', '2025-03-29 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-42', 'cmbrzrvrr0002p7s8xitlvnsq', 'completed', 27597, '2025-06-11 13:34:50.058', '2025-06-11 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-43', 'usr1', 'pending', 123594, '2025-02-13 13:34:50.058', '2025-02-13 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-44', 'cmbrzrvrx0003p7s89ekt6jhb', 'completed', 33707.73862, '2025-05-23 13:34:50.058', '2025-05-23 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-5', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 160500, '2025-04-15 13:34:50.058', '2025-04-15 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-6', 'usr3', 'completed', 45033, '2025-02-17 13:34:50.058', '2025-02-17 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-7', 'usr2', 'completed', 84000, '2025-02-19 13:34:50.058', '2025-02-19 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-8', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 22384, '2025-05-31 13:34:50.058', '2025-05-31 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890058-9', 'cmbrzrvs80004p7s8lqcf0zir', 'completed', 49200, '2025-04-23 13:34:50.058', '2025-04-23 13:34:50.058');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-45', 'usr4', 'completed', 55400, '2025-04-02 13:34:50.059', '2025-04-02 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-46', 'usr2', 'completed', 101299, '2025-03-14 13:34:50.059', '2025-03-14 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-47', 'cmbrzrvse0005p7s8mx923vnv', 'completed', 36400, '2025-04-18 13:34:50.059', '2025-04-18 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-48', 'cmbrzrvse0005p7s8mx923vnv', 'completed', 27707.497, '2025-03-22 13:34:50.059', '2025-03-22 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-49', 'cmbrzrvrh0001p7s8zarklq29', 'completed', 61588, '2025-06-08 13:34:50.059', '2025-06-08 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-50', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 52134, '2025-06-09 13:34:50.059', '2025-06-09 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-51', 'cmbrzrvs80004p7s8lqcf0zir', 'completed', 68089, '2025-05-05 13:34:50.059', '2025-05-05 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-52', 'usr4', 'completed', 11192, '2025-02-23 13:34:50.059', '2025-02-23 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-53', 'cmbrzrvrx0003p7s89ekt6jhb', 'pending', 11192, '2025-04-13 13:34:50.059', '2025-04-13 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-54', 'cmbrzrvrx0003p7s89ekt6jhb', 'completed', 205764, '2025-06-03 13:34:50.059', '2025-06-03 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-55', 'usr4', 'completed', 83100, '2025-04-03 13:34:50.059', '2025-04-03 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-56', 'usr1', 'completed', 39800, '2025-06-09 13:34:50.059', '2025-06-09 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-57', 'cmbrzrvrh0001p7s8zarklq29', 'completed', 45164, '2025-05-02 13:34:50.059', '2025-05-02 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-58', 'cmbrzrvqw0000p7s8eauv7e06', 'completed', 76500, '2025-02-16 13:34:50.059', '2025-02-16 13:34:50.059');
INSERT INTO mydb.Orders (id, userId, status, totalPrice, createdAt, updatedAt) VALUES ('order-1749648890059-59', 'cmbrzrvqw0000p7s8eauv7e06', 'pending', 127401, '2025-03-18 13:34:50.059', '2025-03-18 13:34:50.059');
