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

