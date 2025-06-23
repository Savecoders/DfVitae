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

