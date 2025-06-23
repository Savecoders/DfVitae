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

