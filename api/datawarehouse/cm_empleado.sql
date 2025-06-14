create table cm_empleado
(
    ID_CM_EMPLEADO        int auto_increment comment 'ID PRIMARY KEY DE LA TABLA'
        primary key,
    ID_CM_CARGO           int                                 not null,
    PRIMER_NOMBRE         varchar(80)                         null,
    SEGUNDO_NOMBRE        varchar(80)                         null,
    PRIMER_APELLIDO       varchar(80)                         null,
    SEGUNDO_APELLIDO      varchar(80)                         null,
    EDAD                  int                                 null,
    ESTADO                char      default 'S'               not null comment 'ESTADO DEL REGISTRO',
    USUARIO_CREACION      varchar(40)                         not null comment 'USUARIO RESPONSBALE DE LA CREACION',
    FECHA_CREACION        timestamp default CURRENT_TIMESTAMP not null comment 'FECHA  DE CREACION DEL REGISTRO',
    USUARIO_ACTUALIZACION varchar(40)                         null comment 'USUARIO RESPONSBALE DE LA CREACION',
    FECHA_ACTUALIZACION   timestamp default CURRENT_TIMESTAMP not null comment 'FECHA  DE CREACION DEL REGISTRO',
    constraint FK_EMPL_I_CARGO
        foreign key (ID_CM_CARGO) references cm_cargo (ID_CM_CARGO)
)
    comment 'TABLA PARA ALMACENAR INFO DE LOS EMPLEADOS';

INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (1, 1, 'NEXAR', 'JORDAN', 'MOLINA', 'GARCES', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (2, 1, 'KEVIN', 'LEO', 'MORA', 'MOLINA', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (3, 2, 'JULIA', 'VERONICA', 'GARCIA', 'CEREZO', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (4, 3, 'MARIA', 'ELENA', 'MERCED', 'YEPEZ', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (5, 4, 'LEONEL', 'CRISS', 'GOMEZ', 'SUAREZ', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (6, 5, 'FELIX', 'JORDAN', 'DIAZ', 'VERA', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (7, 6, 'ELIAS', 'FERNANDO', 'OYOLA', 'MERCED', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (8, 7, 'ANA', 'BELEN', 'VERA', 'PINTO', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (9, 8, 'SILVIA', 'PENNY', 'STARK', 'GOMEZ', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
INSERT INTO MEDICENTER.cm_empleado (ID_CM_EMPLEADO, ID_CM_CARGO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, EDAD, ESTADO, USUARIO_CREACION, FECHA_CREACION, USUARIO_ACTUALIZACION, FECHA_ACTUALIZACION) VALUES (10, 9, 'MISSY', 'ESTER', 'MOLINA', 'GARCES', 36, 'S', 'PMIRANDA', '2022-01-20 04:18:27', 'PMIRANDA', '2022-01-20 04:18:27');
