create table _prisma_migrations
(
    id                  varchar(36)                               not null
        primary key,
    checksum            varchar(64)                               not null,
    finished_at         datetime(3)                               null,
    migration_name      varchar(255)                              not null,
    logs                text                                      null,
    rolled_back_at      datetime(3)                               null,
    started_at          datetime(3)  default CURRENT_TIMESTAMP(3) not null,
    applied_steps_count int unsigned default '0'                  not null
);

INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('1de71478-3abb-4445-8cb6-6236fb8e7991', '1d40f36a77ee65d656821110fe53f729c03e818bdfa6e4c0828d821ecbbde068', '2025-04-30 00:58:52.409', '20250430005851_revert_description_product', null, null, '2025-04-30 00:58:52.372', 1);
INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('4ab7d58b-b6c9-4620-a9eb-ef86b8369fb7', 'ab57e1f6b1a65101b075db13dc4b0d4a8fe95cf7f3428054fb0a1733f547ff61', '2025-04-30 00:51:15.319', '20250430005114_fix_add_image_url_product', null, null, '2025-04-30 00:51:15.283', 1);
INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('5b0e8f97-426e-4950-93af-13afae3657df', '388054f0836109eafd64e75d8ef216d3ceaba49ae94259fcb199da132a23f940', '2025-04-30 00:59:42.379', '20250430005941_rm_description_product', null, null, '2025-04-30 00:59:42.348', 1);
INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('8000faa3-2482-4ada-a9bb-632dc65489d3', '6bd344093682ab8d481b83b1d9069cd30694c29da632ce4c59d1317662e07393', '2025-04-30 00:50:02.218', '20250430005001_fix_atribute_title_product', null, null, '2025-04-30 00:50:02.181', 1);
INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('b33ae4ed-867c-449f-afc1-781aad07647e', '9336e90152ad0498906326459188cd4a09b074acc981ca0e5ffc46d5766cceca', '2025-04-29 22:41:23.506', '20250429224123_init_db_tech_shop', null, null, '2025-04-29 22:41:23.095', 1);
INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('bc5d23f4-1074-4a94-b770-dc5b6c208f2b', '726b2b8782c18463fbf7cf8a4f3b8edc6bd7c1c4d91854280f3eaa835bb7ab8d', '2025-04-30 00:52:13.969', '20250430005213_fix_add_availability_product', null, null, '2025-04-30 00:52:13.903', 1);
INSERT INTO mydb._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('fdc62277-9660-4f1c-8f0a-885954429633', '6a2fac116d17e432795e959f60b89c950014caecf87894df6b1029ac8eebfae2', '2025-04-30 00:58:10.985', '20250430005810_fix_remove_description_product', null, null, '2025-04-30 00:58:10.913', 1);
