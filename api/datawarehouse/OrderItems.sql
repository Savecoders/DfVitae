create table OrderItems
(
    id        varchar(191)                             not null
        primary key,
    orderId   varchar(191)                             not null,
    productId varchar(191)                             not null,
    quantity  int                                      not null,
    price     double                                   not null,
    createdAt datetime(3) default CURRENT_TIMESTAMP(3) not null,
    updatedAt datetime(3)                              not null,
    constraint OrderItems_orderId_productId_key
        unique (orderId, productId),
    constraint OrderItems_orderId_fkey
        foreign key (orderId) references Orders (id)
            on update cascade on delete cascade,
    constraint OrderItems_productId_fkey
        foreign key (productId) references Products (id)
            on update cascade
);

INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm1', 'ord1', '088978de-77aa-4433-b39a-8571445f01bf', 1, 57500, '2025-03-31 02:36:34.000', '2025-03-31 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm10', 'ord7', '09d612e4-6401-42ab-b09d-b051a3feb15c', 1, 13900, '2025-04-25 02:36:34.000', '2025-04-25 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm11', 'ord7', '6a0a9887-605e-4d62-9756-1fea0bfa6735', 1, 13999, '2025-04-25 02:36:34.000', '2025-04-25 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm12', 'ord7', '00b98b2a-8b01-425c-9b0c-0b290d9c5d48', 1, 2200, '2025-04-25 02:36:34.000', '2025-04-25 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm13', 'ord7', '5dc69ace-3aa1-4ce6-9580-0dfe3b71a464', 1, 7200, '2025-04-25 02:36:34.000', '2025-04-25 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm14', 'ord7', '09b0bc6b-5195-41f7-971c-f06fa3c3a8be', 4, 512, '2025-04-25 02:36:34.000', '2025-04-25 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm15', 'ord8', '0a2af985-c707-4207-b99a-2c2a39335831', 1, 25500, '2025-04-27 02:36:34.000', '2025-04-27 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm16', 'ord9', '046f71f2-79e6-4a63-be00-e418d557e21b', 1, 41500, '2025-04-28 02:36:34.000', '2025-04-28 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm17', 'ord10', '00fcca66-9046-4201-b74d-320a1d4f4e17', 1, 7701, '2025-04-29 02:36:34.000', '2025-04-29 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm2', 'ord1', '0694fc6f-00c5-4915-804f-00ea0312d833', 1, 15299, '2025-03-31 02:36:34.000', '2025-03-31 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm21', 'ord21', '0f4113cc-2d5f-4388-a99a-6c149fe887f7', 1, 15999, '2025-01-30 02:46:23.000', '2025-01-30 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm22', 'ord22', '10d19658-43e2-492a-83f3-7bc3eca3f686', 1, 27700, '2025-02-09 02:46:23.000', '2025-02-09 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm23', 'ord23', '1f3e8b1e-c214-46f7-a827-2550b0f46afb', 1, 51237, '2025-02-19 02:46:23.000', '2025-02-19 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm24', 'ord24', '45209bf8-da8e-4c1b-9fc6-2ad3ac802c46', 1, 8900, '2025-03-01 02:46:23.000', '2025-03-01 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm25', 'ord25', '1a32eeb3-6602-43ec-8a08-1e9f0e2c3d36', 1, 62900, '2025-03-11 02:46:23.000', '2025-03-11 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm26', 'ord26', '3f6ca07c-3fa5-43f6-a14d-ff23d2a1d236', 1, 14900, '2025-04-20 02:46:23.000', '2025-04-20 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm27', 'ord27', '7f6754c8-8927-44af-ab67-fbc7e2a73de1', 1, 39900, '2025-04-25 02:46:23.000', '2025-04-25 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm28', 'ord28', '2efc027e-d876-4ae7-8762-1190678284e8', 1, 28000, '2025-04-28 02:46:23.000', '2025-04-28 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm29', 'ord29', '33abeda7-e5ee-40b3-a610-d35a052f9616', 1, 4004, '2025-02-04 02:46:23.000', '2025-02-04 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm3', 'ord1', '98bd9292-360a-49a4-b88a-f17fd277d794', 2, 1026, '2025-03-31 02:36:34.000', '2025-03-31 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm30', 'ord30', '152b3c24-3504-4346-9383-f75268f97cac', 1, 11294, '2025-02-14 02:46:23.000', '2025-02-14 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm31', 'ord31', '37c2aee3-0a25-4fe0-8b9b-63ee1ecddeb5', 1, 18900, '2025-02-24 02:46:23.000', '2025-02-24 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm32', 'ord32', '1855cfe5-7234-4ff6-afa3-e4da6ae4f4ef', 1, 6200, '2025-03-06 02:46:23.000', '2025-03-06 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm33', 'ord33', '2981e564-9643-4af8-8e17-f92199f9e41b', 1, 8830, '2025-03-16 02:46:23.000', '2025-03-16 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm34', 'ord34', '2c6c14ca-6417-40d9-9160-57c554724eb3', 1, 914, '2025-04-22 02:46:23.000', '2025-04-22 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm35', 'ord35', '447a9dff-5e99-4533-bcaf-3253897347c1', 1, 96500, '2025-04-27 02:46:23.000', '2025-04-27 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm36', 'ord36', '192cbf0e-3535-49d5-b853-ade7f2acd187', 1, 21500, '2025-02-01 02:46:23.000', '2025-02-01 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm37', 'ord37', '19ba5ad9-f7d9-4f64-9f91-b3cd9319360a', 1, 4415, '2025-02-11 02:46:23.000', '2025-02-11 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm38', 'ord38', '1dc0f147-1cbb-4b96-87b0-91c743c7c56b', 1, 12500, '2025-02-21 02:46:23.000', '2025-02-21 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm39', 'ord39', '1f1e8d53-f87f-47a1-8853-ecb14f21c557', 1, 39900, '2025-03-03 02:46:23.000', '2025-03-03 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm4', 'ord1', '0a2af985-c707-4207-b99a-2c2a39335831', 1, 2500, '2025-03-31 02:36:34.000', '2025-03-31 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm40', 'ord40', '25207f3d-2cb7-4567-ad85-3f5165dc63c9', 1, 3079, '2025-03-13 02:46:23.000', '2025-03-13 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm41', 'ord41', '20b94a21-3a52-4f41-b5e2-91675e9f6270', 1, 11192, '2025-03-23 02:46:23.000', '2025-03-23 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm42', 'ord42', 'c98808c5-44ed-49ae-b992-7777d8aa216e', 1, 4004, '2025-04-02 02:46:23.000', '2025-04-02 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm43', 'ord43', '42e871e5-0158-4cbe-9dcf-c66f17bf1292', 1, 5647, '2025-04-23 02:46:23.000', '2025-04-23 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm44', 'ord44', '2bc82480-3fd5-429e-ab81-dfd4c7de9239', 1, 40969, '2025-02-06 02:46:23.000', '2025-02-06 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm45', 'ord45', '2daccbe5-90b8-480d-8116-cbd7f80e07f8', 1, 5133, '2025-02-16 02:46:23.000', '2025-02-16 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm46', 'ord46', '2ef04cab-2d8d-4dbc-ac32-e5346fbd52ab', 1, 36999, '2025-02-26 02:46:23.000', '2025-02-26 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm47', 'ord47', '6d11c1e9-2e49-4bbe-8cc1-3c042b7405f8', 1, 85500, '2025-03-08 02:46:23.000', '2025-03-08 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm48', 'ord48', '3c091da0-3615-4209-bbf7-8900d7b34668', 1, 23513, '2025-03-18 02:46:23.000', '2025-03-18 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm49', 'ord49', '3caa7212-ac37-40a6-a131-9a310089d10e', 1, 19900, '2025-03-28 02:46:23.000', '2025-03-28 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm5', 'ord2', '513701f5-21f1-4fb7-8197-b0f8f2430067', 1, 43022, '2025-04-05 02:36:34.000', '2025-04-05 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm50', 'ord50', '7028dab1-30cf-480c-87f5-ccc73bfdb92c', 1, 41500, '2025-04-26 02:46:23.000', '2025-04-26 02:46:23.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm6', 'ord3', '079eeea1-2afc-4ba4-9fc5-068d40ab8bc4', 1, 35835, '2025-04-10 02:36:34.000', '2025-04-10 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm7', 'ord4', '088978de-77aa-4433-b39a-8571445f01bf', 1, 57500, '2025-04-15 02:36:34.000', '2025-04-15 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm8', 'ord5', '098e2165-d126-4f2b-8647-3531d7766c57', 1, 9138, '2025-04-20 02:36:34.000', '2025-04-20 02:36:34.000');
INSERT INTO mydb.OrderItems (id, orderId, productId, quantity, price, createdAt, updatedAt) VALUES ('itm9', 'ord6', '09b0bc6b-5195-41f7-971c-f06fa3c3a8be', 1, 512, '2025-04-23 02:36:34.000', '2025-04-23 02:36:34.000');
