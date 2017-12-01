/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     30-11-2017 21:49:32                          */
/*==============================================================*/


drop table if exists ASISTE;

drop table if exists AYUDA;

drop table if exists AYUDANTE;

drop table if exists AYUDANTIA;

drop table if exists Alumno;

drop table if exists BLOQUE;

drop table if exists CALIFICACION;

drop table if exists CARRERA;

drop table if exists EVALUACIONES;

drop table if exists HORARIO;

drop table if exists HorarioBloque;

drop table if exists MODULO;

drop table if exists Profesor;

drop table if exists SALA;

drop table if exists SECCION;

drop table if exists TUTOR;

drop table if exists TUTORIA;

drop table if exists TipoEvaluacion;

drop table if exists TipoSala;

/*==============================================================*/
/* Table: ASISTE                                                */
/*==============================================================*/
create table ASISTE
(
   IdAlumno             int not null,
   IdTutoria            int not null,
   primary key (IdAlumno, IdTutoria)
);

/*==============================================================*/
/* Table: AYUDA                                                 */
/*==============================================================*/
create table AYUDA
(
   IdAyudantia          int not null,
   IdAyudante           int not null,
   primary key (IdAyudantia, IdAyudante)
);

/*==============================================================*/
/* Table: AYUDANTE                                              */
/*==============================================================*/
create table AYUDANTE
(
   IdAyudante           int not null,
   NombreAyudante       varchar(80) not null,
   ApellidoAyudante     varchar(80),
   CorreoAyudante       varchar(255),
   primary key (IdAyudante)
);

/*==============================================================*/
/* Table: AYUDANTIA                                             */
/*==============================================================*/
create table AYUDANTIA
(
   IdAyudantia          int not null,
   IdModulo             int not null,
   primary key (IdAyudantia)
);

/*==============================================================*/
/* Table: Alumno                                                */
/*==============================================================*/
create table Alumno
(
   IdAlumno             int not null,
   NombreAlumno         varchar(80) not null,
   ApellidoAlumno       varchar(80),
   MatriculaAlumno      int not null,
   CorreoAlumno         varchar(255),
   primary key (IdAlumno)
);

/*==============================================================*/
/* Table: BLOQUE                                                */
/*==============================================================*/
create table BLOQUE
(
   IdBloque             int not null,
   HoraInicio           time,
   HoraTermino          time,
   primary key (IdBloque)
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION
(
   IdEvaluacion         int not null,
   IdAlumno             int not null,
   NOTA                 float not null,
   primary key (IdEvaluacion, IdAlumno)
);

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
create table CARRERA
(
   IdCarrera            int not null,
   IdModulo             int,
   NombreCarrera        varchar(255) not null,
   NombreDirector       varchar(80) not null,
   TelefonoCarrera      int,
   primary key (IdCarrera)
);

/*==============================================================*/
/* Table: EVALUACIONES                                          */
/*==============================================================*/
create table EVALUACIONES
(
   IdEvaluacion         int not null,
   IdTipoevaluacion     int not null,
   IdProfesor           int not null,
   IdModulo             int not null,
   FechaEvaluacion      date,
   CONTENIDO            text,
   primary key (IdEvaluacion)
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO
(
   IdHorario            int not null,
   IdSala               int not null,
   IdSeccion            int not null,
   DIA                  date,
   primary key (IdHorario)
);

/*==============================================================*/
/* Table: HorarioBloque                                         */
/*==============================================================*/
create table HorarioBloque
(
   IdHorario            int not null,
   IdBloque             int not null,
   primary key (IdHorario, IdBloque)
);

/*==============================================================*/
/* Table: MODULO                                                */
/*==============================================================*/
create table MODULO
(
   IdModulo             int not null,
   SEMESTRE             int,
   NombreModulo         varchar(255),
   primary key (IdModulo)
);

/*==============================================================*/
/* Table: Profesor                                              */
/*==============================================================*/
create table Profesor
(
   IdProfesor           int not null,
   NombreProfesor       varchar(80) not null,
   ApellidoProfesor     varchar(80),
   CorreoProfesor       varchar(255),
   primary key (IdProfesor)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA
(
   IdSala               int not null,
   IdTiposala           int not null,
   CAPACIDAD            int,
   primary key (IdSala)
);

/*==============================================================*/
/* Table: SECCION                                               */
/*==============================================================*/
create table SECCION
(
   IdSeccion            int not null,
   IdAyudantia          int not null,
   NombreSeccion        varchar(255),
   primary key (IdSeccion)
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR
(
   IdTutor              int not null,
   NombreTutor          varchar(80) not null,
   ApellidoTutor        varchar(80),
   CorreoTutor          varchar(255),
   primary key (IdTutor)
);

/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA
(
   IdTutoria            int not null,
   IdTutor              int,
   CANTIDAD             int,
   DESCRIPCION          text,
   primary key (IdTutoria)
);

/*==============================================================*/
/* Table: TipoEvaluacion                                        */
/*==============================================================*/
create table TipoEvaluacion
(
   IdTipoevaluacion     int not null,
   DESCRIPCION          text,
   primary key (IdTipoevaluacion)
);

/*==============================================================*/
/* Table: TipoSala                                              */
/*==============================================================*/
create table TipoSala
(
   IdTiposala           int not null,
   DESCRIPCION          text,
   primary key (IdTiposala)
);

alter table ASISTE add constraint FK_ASISTE foreign key (IdAlumno)
      references Alumno (IdAlumno) on delete restrict on update restrict;

alter table ASISTE add constraint FK_ASISTE2 foreign key (IdTutoria)
      references TUTORIA (IdTutoria) on delete restrict on update restrict;

alter table AYUDA add constraint FK_AYUDA foreign key (IdAyudantia)
      references AYUDANTIA (IdAyudantia) on delete restrict on update restrict;

alter table AYUDA add constraint FK_AYUDA2 foreign key (IdAyudante)
      references AYUDANTE (IdAyudante) on delete restrict on update restrict;

alter table AYUDANTIA add constraint FK_Relationship10 foreign key (IdModulo)
      references MODULO (IdModulo) on delete restrict on update restrict;

alter table CALIFICACION add constraint FK_CALIFICACION foreign key (IdEvaluacion)
      references EVALUACIONES (IdEvaluacion) on delete restrict on update restrict;

alter table CALIFICACION add constraint FK_CALIFICACION2 foreign key (IdAlumno)
      references Alumno (IdAlumno) on delete restrict on update restrict;

alter table CARRERA add constraint FK_Relationship9 foreign key (IdModulo)
      references MODULO (IdModulo) on delete restrict on update restrict;

alter table EVALUACIONES add constraint FK_Relationship5 foreign key (IdProfesor)
      references Profesor (IdProfesor) on delete restrict on update restrict;

alter table EVALUACIONES add constraint FK_Relationship6 foreign key (IdModulo)
      references MODULO (IdModulo) on delete restrict on update restrict;

alter table EVALUACIONES add constraint FK_Relationship7 foreign key (IdTipoevaluacion)
      references TipoEvaluacion (IdTipoevaluacion) on delete restrict on update restrict;

alter table HORARIO add constraint FK_Relationship1 foreign key (IdSala)
      references SALA (IdSala) on delete restrict on update restrict;

alter table HORARIO add constraint FK_Relationship3 foreign key (IdSeccion)
      references SECCION (IdSeccion) on delete restrict on update restrict;

alter table HorarioBloque add constraint FK_HorarioBloque foreign key (IdHorario)
      references HORARIO (IdHorario) on delete restrict on update restrict;

alter table HorarioBloque add constraint FK_HorarioBloque2 foreign key (IdBloque)
      references BLOQUE (IdBloque) on delete restrict on update restrict;

alter table SALA add constraint FK_Relationship2 foreign key (IdTiposala)
      references TipoSala (IdTiposala) on delete restrict on update restrict;

alter table SECCION add constraint FK_Relationship11 foreign key (IdAyudantia)
      references AYUDANTIA (IdAyudantia) on delete restrict on update restrict;

alter table TUTORIA add constraint FK_Relationship14 foreign key (IdTutor)
      references TUTOR (IdTutor) on delete restrict on update restrict;

