create table Products
(
    id           varchar(191)                             not null
        primary key,
    price        double                                   not null,
    stock        int                                      null,
    createdAt    datetime(3) default CURRENT_TIMESTAMP(3) not null,
    updatedAt    datetime(3)                              not null,
    title        varchar(191)                             not null,
    imageUrl     varchar(191)                             null,
    availability tinyint(1)  default 1                    null
);

