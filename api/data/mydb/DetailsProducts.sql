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

