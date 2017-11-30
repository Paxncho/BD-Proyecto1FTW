/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     30-11-2017 17:35:59                          */
/*==============================================================*/


drop table if exists ALUMNO;

drop table if exists ASISTE;

drop table if exists AYUDA;

drop table if exists AYUDANTE;

drop table if exists AYUDANTIA;

drop table if exists BLOQUE;

drop table if exists CALIFICACION;

drop table if exists CARRERA;

drop table if exists EVALUACIONES;

drop table if exists HORARIO;

drop table if exists HORARIO_BLOQUE;

drop table if exists MODULO;

drop table if exists PROFESOR;

drop table if exists SALA;

drop table if exists SECCION;

drop table if exists TIPO_EVALUACION;

drop table if exists TIPO_SALA;

drop table if exists TUTOR;

drop table if exists TUTORIA;

/*==============================================================*/
/* Table: ALUMNO                                                */
/*==============================================================*/
create table ALUMNO
(
   ID_ALUMNO            int not null,
   NOMBRE_ALUMNO        varchar(1000),
   APELLIDO_ALUMNO      varchar(1000),
   MATRICULA_ALUMNO     int,
   CORREO_ALUMNO        varchar(1000),
   primary key (ID_ALUMNO)
);

/*==============================================================*/
/* Table: ASISTE                                                */
/*==============================================================*/
create table ASISTE
(
   ID_ALUMNO            int not null,
   ID_TUTORIA           int not null,
   primary key (ID_ALUMNO, ID_TUTORIA)
);

/*==============================================================*/
/* Table: AYUDA                                                 */
/*==============================================================*/
create table AYUDA
(
   ID_AYUDANTIA         char(10) not null,
   ID_AYUDANTE          int not null,
   primary key (ID_AYUDANTIA, ID_AYUDANTE)
);

/*==============================================================*/
/* Table: AYUDANTE                                              */
/*==============================================================*/
create table AYUDANTE
(
   ID_AYUDANTE          int not null,
   NOMBRE_AYUDANTE      varchar(1000),
   APELLIDO_AYUDANTE    varchar(1000),
   CORREO_AYUDANTE      varchar(1000),
   primary key (ID_AYUDANTE)
);

/*==============================================================*/
/* Table: AYUDANTIA                                             */
/*==============================================================*/
create table AYUDANTIA
(
   ID_AYUDANTIA         char(10) not null,
   ID_MODULO            int not null,
   primary key (ID_AYUDANTIA)
);

/*==============================================================*/
/* Table: BLOQUE                                                */
/*==============================================================*/
create table BLOQUE
(
   ID_BLOQUE            int not null,
   HORA_INICIO          time,
   HORA_TERMINO         time,
   primary key (ID_BLOQUE)
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION
(
   ID_EVALUACION        int not null,
   ID_ALUMNO            int not null,
   primary key (ID_EVALUACION, ID_ALUMNO)
);

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
create table CARRERA
(
   ID_CARRERA           int not null,
   ID_MODULO            int not null,
   NOMBRE_CARRERA       varchar(1000),
   NOMBRE_DIRECTOR      varchar(1000),
   TELEFONO_CARRERA     varchar(1000),
   ATTRIBUTE_12         varchar(1000),
   primary key (ID_CARRERA)
);

/*==============================================================*/
/* Table: EVALUACIONES                                          */
/*==============================================================*/
create table EVALUACIONES
(
   ID_EVALUACION        int not null,
   ID_TIPOEVALUACION    int not null,
   ID_PROFESOR          int not null,
   ID_MODULO            int not null,
   FECHA_EVALUACION     date,
   CONTENIDO            text,
   primary key (ID_EVALUACION)
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO
(
   ID_HORARIO           int not null,
   ID_SALA              int not null,
   ID_SECCION           int not null,
   DIA                  date,
   primary key (ID_HORARIO)
);

/*==============================================================*/
/* Table: HORARIO_BLOQUE                                        */
/*==============================================================*/
create table HORARIO_BLOQUE
(
   ID_HORARIO           int not null,
   ID_BLOQUE            int not null,
   primary key (ID_HORARIO, ID_BLOQUE)
);

/*==============================================================*/
/* Table: MODULO                                                */
/*==============================================================*/
create table MODULO
(
   ID_MODULO            int not null,
   SEMESTRE             varchar(1000),
   NOMBRE_MODULO        varchar(1000),
   primary key (ID_MODULO)
);

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR
(
   ID_PROFESOR          int not null,
   NOMBRE_PROFESOR      varchar(1000),
   APELLIDO_PROFESOR    varchar(1000),
   CORREO_PROFESOR      varchar(1000) not null,
   primary key (ID_PROFESOR)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA
(
   ID_SALA              int not null,
   ID_TIPOSALA          int not null,
   CAPACIDAD            int,
   primary key (ID_SALA)
);

/*==============================================================*/
/* Table: SECCION                                               */
/*==============================================================*/
create table SECCION
(
   ID_SECCION           int not null,
   ID_AYUDANTIA         char(10) not null,
   NOMBRE_SECCION       varchar(1000),
   primary key (ID_SECCION)
);

/*==============================================================*/
/* Table: TIPO_EVALUACION                                       */
/*==============================================================*/
create table TIPO_EVALUACION
(
   ID_TIPOEVALUACION    int not null,
   DESCRIPCION          varchar(1000),
   primary key (ID_TIPOEVALUACION)
);

/*==============================================================*/
/* Table: TIPO_SALA                                             */
/*==============================================================*/
create table TIPO_SALA
(
   ID_TIPOSALA          int not null,
   DESCRIPCION          varchar(1000),
   primary key (ID_TIPOSALA)
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR
(
   ID_TUTOR             int not null,
   NOMBRE_TUTOR         varchar(1000),
   APELLIDO_TUTOR       varchar(1000),
   CORREO_TUTOR         varchar(1000),
   primary key (ID_TUTOR)
);

/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA
(
   ID_TUTORIA           int not null,
   ID_TUTOR             int not null,
   CANTIDAD             int,
   DESCRIPCION          varchar(1000),
   primary key (ID_TUTORIA)
);

alter table ASISTE add constraint FK_ASISTE foreign key (ID_ALUMNO)
      references ALUMNO (ID_ALUMNO) on delete restrict on update restrict;

alter table ASISTE add constraint FK_ASISTE2 foreign key (ID_TUTORIA)
      references TUTORIA (ID_TUTORIA) on delete restrict on update restrict;

alter table AYUDA add constraint FK_AYUDA foreign key (ID_AYUDANTIA)
      references AYUDANTIA (ID_AYUDANTIA) on delete restrict on update restrict;

alter table AYUDA add constraint FK_AYUDA2 foreign key (ID_AYUDANTE)
      references AYUDANTE (ID_AYUDANTE) on delete restrict on update restrict;

alter table AYUDANTIA add constraint FK_RELATIONSHIP_10 foreign key (ID_MODULO)
      references MODULO (ID_MODULO) on delete restrict on update restrict;

alter table CALIFICACION add constraint FK_CALIFICACION foreign key (ID_EVALUACION)
      references EVALUACIONES (ID_EVALUACION) on delete restrict on update restrict;

alter table CALIFICACION add constraint FK_CALIFICACION2 foreign key (ID_ALUMNO)
      references ALUMNO (ID_ALUMNO) on delete restrict on update restrict;

alter table CARRERA add constraint FK_RELATIONSHIP_9 foreign key (ID_MODULO)
      references MODULO (ID_MODULO) on delete restrict on update restrict;

alter table EVALUACIONES add constraint FK_RELATIONSHIP_5 foreign key (ID_PROFESOR)
      references PROFESOR (ID_PROFESOR) on delete restrict on update restrict;

alter table EVALUACIONES add constraint FK_RELATIONSHIP_6 foreign key (ID_MODULO)
      references MODULO (ID_MODULO) on delete restrict on update restrict;

alter table EVALUACIONES add constraint FK_RELATIONSHIP_7 foreign key (ID_TIPOEVALUACION)
      references TIPO_EVALUACION (ID_TIPOEVALUACION) on delete restrict on update restrict;

alter table HORARIO add constraint FK_RELATIONSHIP_1 foreign key (ID_SALA)
      references SALA (ID_SALA) on delete restrict on update restrict;

alter table HORARIO add constraint FK_RELATIONSHIP_3 foreign key (ID_SECCION)
      references SECCION (ID_SECCION) on delete restrict on update restrict;

alter table HORARIO_BLOQUE add constraint FK_HORARIO_BLOQUE foreign key (ID_HORARIO)
      references HORARIO (ID_HORARIO) on delete restrict on update restrict;

alter table HORARIO_BLOQUE add constraint FK_HORARIO_BLOQUE2 foreign key (ID_BLOQUE)
      references BLOQUE (ID_BLOQUE) on delete restrict on update restrict;

alter table SALA add constraint FK_RELATIONSHIP_2 foreign key (ID_TIPOSALA)
      references TIPO_SALA (ID_TIPOSALA) on delete restrict on update restrict;

alter table SECCION add constraint FK_RELATIONSHIP_11 foreign key (ID_AYUDANTIA)
      references AYUDANTIA (ID_AYUDANTIA) on delete restrict on update restrict;

alter table TUTORIA add constraint FK_RELATIONSHIP_14 foreign key (ID_TUTOR)
      references TUTOR (ID_TUTOR) on delete restrict on update restrict;

