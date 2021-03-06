/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     04-12-2017 9:24:13                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ASISTE_ASISTE_ALUMNO') then
    alter table ASISTE
       delete foreign key FK_ASISTE_ASISTE_ALUMNO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ASISTE_ASISTE2_TUTORIA') then
    alter table ASISTE
       delete foreign key FK_ASISTE_ASISTE2_TUTORIA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AYUDA_AYUDA_AYUDANTI') then
    alter table AYUDA
       delete foreign key FK_AYUDA_AYUDA_AYUDANTI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AYUDA_AYUDA2_AYUDANTE') then
    alter table AYUDA
       delete foreign key FK_AYUDA_AYUDA2_AYUDANTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AYUDANTI_RELATIONS_MODULO') then
    alter table AYUDANTIA
       delete foreign key FK_AYUDANTI_RELATIONS_MODULO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CALIFICA_CALIFICAC_EVALUACI') then
    alter table CALIFICACION
       delete foreign key FK_CALIFICA_CALIFICAC_EVALUACI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CALIFICA_CALIFICAC_ALUMNO') then
    alter table CALIFICACION
       delete foreign key FK_CALIFICA_CALIFICAC_ALUMNO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EVALUACI_RELATIONS_PROFESOR') then
    alter table EVALUACIONES
       delete foreign key FK_EVALUACI_RELATIONS_PROFESOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EVALUACI_RELATIONS_MODULO') then
    alter table EVALUACIONES
       delete foreign key FK_EVALUACI_RELATIONS_MODULO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EVALUACI_RELATIONS_TIPOEVAL') then
    alter table EVALUACIONES
       delete foreign key FK_EVALUACI_RELATIONS_TIPOEVAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIO_RELATIONS_SALA') then
    alter table HORARIO
       delete foreign key FK_HORARIO_RELATIONS_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIO_RELATIONS_SECCION') then
    alter table HORARIO
       delete foreign key FK_HORARIO_RELATIONS_SECCION
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIOB_HORARIOBL_HORARIO') then
    alter table HorarioBloque
       delete foreign key FK_HORARIOB_HORARIOBL_HORARIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIOB_HORARIOBL_BLOQUE') then
    alter table HorarioBloque
       delete foreign key FK_HORARIOB_HORARIOBL_BLOQUE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SALA_RELATIONS_TIPOSALA') then
    alter table SALA
       delete foreign key FK_SALA_RELATIONS_TIPOSALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SECCION_RELATIONS_AYUDANTI') then
    alter table SECCION
       delete foreign key FK_SECCION_RELATIONS_AYUDANTI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TUTORIA_RELATIONS_TUTOR') then
    alter table TUTORIA
       delete foreign key FK_TUTORIA_RELATIONS_TUTOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USUARIO_RELATIONS_MODULO') then
    alter table USUARIO
       delete foreign key FK_USUARIO_RELATIONS_MODULO
end if;

drop index if exists ALUMNO.AlumnoPk;

drop table if exists ALUMNO;

drop index if exists ASISTE.Asiste2Fk;

drop index if exists ASISTE.AsisteFk;

drop index if exists ASISTE.AsistePk;

drop table if exists ASISTE;

drop index if exists AYUDA.Ayuda2Fk;

drop index if exists AYUDA.AyudaFk;

drop index if exists AYUDA.AyudaPk;

drop table if exists AYUDA;

drop index if exists AYUDANTE.AyudantePk;

drop table if exists AYUDANTE;

drop index if exists AYUDANTIA.Relationship10Fk;

drop index if exists AYUDANTIA.AyudantiaPk;

drop table if exists AYUDANTIA;

drop index if exists BLOQUE.BloquePk;

drop table if exists BLOQUE;

drop index if exists CALIFICACION.Calificacion2Fk;

drop index if exists CALIFICACION.CalificacionFk;

drop index if exists CALIFICACION.CalificacionPk;

drop table if exists CALIFICACION;

drop index if exists EVALUACIONES.Relationship7Fk;

drop index if exists EVALUACIONES.Relationship6Fk;

drop index if exists EVALUACIONES.Relationship5Fk;

drop index if exists EVALUACIONES.EvaluacionesPk;

drop table if exists EVALUACIONES;

drop index if exists HORARIO.Relationship3Fk;

drop index if exists HORARIO.Relationship1Fk;

drop index if exists HORARIO.HorarioPk;

drop table if exists HORARIO;

drop index if exists HorarioBloque.Horariobloque2Fk;

drop index if exists HorarioBloque.HorariobloqueFk;

drop index if exists HorarioBloque.HorariobloquePk;

drop table if exists HorarioBloque;

drop index if exists MODULO.ModuloPk;

drop table if exists MODULO;

drop index if exists PROFESOR.ProfesorPk;

drop table if exists PROFESOR;

drop index if exists SALA.Relationship2Fk;

drop index if exists SALA.SalaPk;

drop table if exists SALA;

drop index if exists SECCION.Relationship11Fk;

drop index if exists SECCION.SeccionPk;

drop table if exists SECCION;

drop index if exists TUTOR.TutorPk;

drop table if exists TUTOR;

drop index if exists TUTORIA.Relationship14Fk;

drop index if exists TUTORIA.TutoriaPk;

drop table if exists TUTORIA;

drop index if exists TipoEvaluacion.TipoevaluacionPk;

drop table if exists TipoEvaluacion;

drop index if exists TipoSala.TiposalaPk;

drop table if exists TipoSala;

drop index if exists USUARIO.Relationship9Fk;

drop index if exists USUARIO.UsuarioPk;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: ALUMNO                                                */
/*==============================================================*/
create table ALUMNO 
(
   IdAlumno             integer                        not null,
   NombreAlumno         varchar(1000)                  null,
   ApellidoAlumno       varchar(1000)                  null,
   MatriculaAlumno      integer                        null,
   CorreoAlumno         varchar(1000)                  null,
   constraint PK_ALUMNO primary key (IdAlumno)
);

/*==============================================================*/
/* Index: AlumnoPk                                              */
/*==============================================================*/
create unique index AlumnoPk on ALUMNO (
IdAlumno ASC
);

/*==============================================================*/
/* Table: ASISTE                                                */
/*==============================================================*/
create table ASISTE 
(
   IdAlumno             integer                        not null,
   IdTutoria            integer                        not null,
   constraint PK_ASISTE primary key clustered (IdAlumno, IdTutoria)
);

/*==============================================================*/
/* Index: AsistePk                                              */
/*==============================================================*/
create unique clustered index AsistePk on ASISTE (
IdAlumno ASC,
IdTutoria ASC
);

/*==============================================================*/
/* Index: AsisteFk                                              */
/*==============================================================*/
create index AsisteFk on ASISTE (
IdAlumno ASC
);

/*==============================================================*/
/* Index: Asiste2Fk                                             */
/*==============================================================*/
create index Asiste2Fk on ASISTE (
IdTutoria ASC
);

/*==============================================================*/
/* Table: AYUDA                                                 */
/*==============================================================*/
create table AYUDA 
(
   IdAyudantia          char(10)                       not null,
   IdAyudante           integer                        not null,
   constraint PK_AYUDA primary key clustered (IdAyudantia, IdAyudante)
);

/*==============================================================*/
/* Index: AyudaPk                                               */
/*==============================================================*/
create unique clustered index AyudaPk on AYUDA (
IdAyudantia ASC,
IdAyudante ASC
);

/*==============================================================*/
/* Index: AyudaFk                                               */
/*==============================================================*/
create index AyudaFk on AYUDA (
IdAyudantia ASC
);

/*==============================================================*/
/* Index: Ayuda2Fk                                              */
/*==============================================================*/
create index Ayuda2Fk on AYUDA (
IdAyudante ASC
);

/*==============================================================*/
/* Table: AYUDANTE                                              */
/*==============================================================*/
create table AYUDANTE 
(
   IdAyudante           integer                        not null,
   NombreAyudante       varchar(1000)                  null,
   ApellidoAyudante     varchar(1000)                  null,
   CorreoAyudante       varchar(1000)                  null,
   RutAyudante          integer                        null,
   constraint PK_AYUDANTE primary key (IdAyudante)
);

/*==============================================================*/
/* Index: AyudantePk                                            */
/*==============================================================*/
create unique index AyudantePk on AYUDANTE (
IdAyudante ASC
);

/*==============================================================*/
/* Table: AYUDANTIA                                             */
/*==============================================================*/
create table AYUDANTIA 
(
   IdAyudantia          char(10)                       not null,
   IdModulo             integer                        not null,
   constraint PK_AYUDANTIA primary key (IdAyudantia)
);

/*==============================================================*/
/* Index: AyudantiaPk                                           */
/*==============================================================*/
create unique index AyudantiaPk on AYUDANTIA (
IdAyudantia ASC
);

/*==============================================================*/
/* Index: Relationship10Fk                                      */
/*==============================================================*/
create index Relationship10Fk on AYUDANTIA (
IdModulo ASC
);

/*==============================================================*/
/* Table: BLOQUE                                                */
/*==============================================================*/
create table BLOQUE 
(
   IdBloque             integer                        not null,
   HoraInicio           time                           null,
   HoraTermino          time                           null,
   constraint PK_BLOQUE primary key (IdBloque)
);

/*==============================================================*/
/* Index: BloquePk                                              */
/*==============================================================*/
create unique index BloquePk on BLOQUE (
IdBloque ASC
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION 
(
   IdEvaluacion         integer                        not null,
   IdAlumno             integer                        not null,
   constraint PK_CALIFICACION primary key clustered (IdEvaluacion, IdAlumno)
);

/*==============================================================*/
/* Index: CalificacionPk                                        */
/*==============================================================*/
create unique clustered index CalificacionPk on CALIFICACION (
IdEvaluacion ASC,
IdAlumno ASC
);

/*==============================================================*/
/* Index: CalificacionFk                                        */
/*==============================================================*/
create index CalificacionFk on CALIFICACION (
IdEvaluacion ASC
);

/*==============================================================*/
/* Index: Calificacion2Fk                                       */
/*==============================================================*/
create index Calificacion2Fk on CALIFICACION (
IdAlumno ASC
);

/*==============================================================*/
/* Table: EVALUACIONES                                          */
/*==============================================================*/
create table EVALUACIONES 
(
   IdEvaluacion         integer                        not null,
   IdTipoevaluacion     integer                        not null,
   IdProfesor           integer                        not null,
   IdModulo             integer                        not null,
   FechaEvaluacion      date                           null,
   CONTENIDO            long varchar                   null,
   constraint PK_EVALUACIONES primary key (IdEvaluacion)
);

/*==============================================================*/
/* Index: EvaluacionesPk                                        */
/*==============================================================*/
create unique index EvaluacionesPk on EVALUACIONES (
IdEvaluacion ASC
);

/*==============================================================*/
/* Index: Relationship5Fk                                       */
/*==============================================================*/
create index Relationship5Fk on EVALUACIONES (
IdProfesor ASC
);

/*==============================================================*/
/* Index: Relationship6Fk                                       */
/*==============================================================*/
create index Relationship6Fk on EVALUACIONES (
IdModulo ASC
);

/*==============================================================*/
/* Index: Relationship7Fk                                       */
/*==============================================================*/
create index Relationship7Fk on EVALUACIONES (
IdTipoevaluacion ASC
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO 
(
   IdHorario            integer                        not null,
   IdSala               integer                        not null,
   IdSeccion            integer                        not null,
   DIA                  date                           null,
   constraint PK_HORARIO primary key (IdHorario)
);

/*==============================================================*/
/* Index: HorarioPk                                             */
/*==============================================================*/
create unique index HorarioPk on HORARIO (
IdHorario ASC
);

/*==============================================================*/
/* Index: Relationship1Fk                                       */
/*==============================================================*/
create index Relationship1Fk on HORARIO (
IdSala ASC
);

/*==============================================================*/
/* Index: Relationship3Fk                                       */
/*==============================================================*/
create index Relationship3Fk on HORARIO (
IdSeccion ASC
);

/*==============================================================*/
/* Table: HorarioBloque                                         */
/*==============================================================*/
create table HorarioBloque 
(
   IdHorario            integer                        not null,
   IdBloque             integer                        not null,
   constraint PK_HORARIOBLOQUE primary key clustered (IdHorario, IdBloque)
);

/*==============================================================*/
/* Index: HorariobloquePk                                       */
/*==============================================================*/
create unique clustered index HorariobloquePk on HorarioBloque (
IdHorario ASC,
IdBloque ASC
);

/*==============================================================*/
/* Index: HorariobloqueFk                                       */
/*==============================================================*/
create index HorariobloqueFk on HorarioBloque (
IdHorario ASC
);

/*==============================================================*/
/* Index: Horariobloque2Fk                                      */
/*==============================================================*/
create index Horariobloque2Fk on HorarioBloque (
IdBloque ASC
);

/*==============================================================*/
/* Table: MODULO                                                */
/*==============================================================*/
create table MODULO 
(
   IdModulo             integer                        not null,
   SEMESTRE             varchar(1000)                  null,
   NombreModulo         varchar(1000)                  null,
   constraint PK_MODULO primary key (IdModulo)
);

/*==============================================================*/
/* Index: ModuloPk                                              */
/*==============================================================*/
create unique index ModuloPk on MODULO (
IdModulo ASC
);

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR 
(
   IdProfesor           integer                        not null,
   NombreProfesor       varchar(1000)                  null,
   ApellidoProfesor     varchar(1000)                  null,
   CorreoProfesor       varchar(1000)                  not null,
   RutProfesor          integer                        null,
   constraint PK_PROFESOR primary key (IdProfesor)
);

/*==============================================================*/
/* Index: ProfesorPk                                            */
/*==============================================================*/
create unique index ProfesorPk on PROFESOR (
IdProfesor ASC
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   IdSala               integer                        not null,
   IdTiposala           integer                        not null,
   CAPACIDAD            integer                        null,
   constraint PK_SALA primary key (IdSala)
);

/*==============================================================*/
/* Index: SalaPk                                                */
/*==============================================================*/
create unique index SalaPk on SALA (
IdSala ASC
);

/*==============================================================*/
/* Index: Relationship2Fk                                       */
/*==============================================================*/
create index Relationship2Fk on SALA (
IdTiposala ASC
);

/*==============================================================*/
/* Table: SECCION                                               */
/*==============================================================*/
create table SECCION 
(
   IdSeccion            integer                        not null,
   IdAyudantia          char(10)                       not null,
   NombreSeccion        varchar(1000)                  null,
   constraint PK_SECCION primary key (IdSeccion)
);

/*==============================================================*/
/* Index: SeccionPk                                             */
/*==============================================================*/
create unique index SeccionPk on SECCION (
IdSeccion ASC
);

/*==============================================================*/
/* Index: Relationship11Fk                                      */
/*==============================================================*/
create index Relationship11Fk on SECCION (
IdAyudantia ASC
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR 
(
   IdTutor              integer                        not null,
   NombreTutor          varchar(1000)                  null,
   ApellidoTutor        varchar(1000)                  null,
   CorreoTutor          varchar(1000)                  null,
   RutTutor             integer                        null,
   constraint PK_TUTOR primary key (IdTutor)
);

/*==============================================================*/
/* Index: TutorPk                                               */
/*==============================================================*/
create unique index TutorPk on TUTOR (
IdTutor ASC
);

/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA 
(
   IdTutoria            integer                        not null,
   IdTutor              integer                        not null,
   CANTIDAD             integer                        null,
   DESCRIPCION          varchar(1000)                  null,
   constraint PK_TUTORIA primary key (IdTutoria)
);

/*==============================================================*/
/* Index: TutoriaPk                                             */
/*==============================================================*/
create unique index TutoriaPk on TUTORIA (
IdTutoria ASC
);

/*==============================================================*/
/* Index: Relationship14Fk                                      */
/*==============================================================*/
create index Relationship14Fk on TUTORIA (
IdTutor ASC
);

/*==============================================================*/
/* Table: TipoEvaluacion                                        */
/*==============================================================*/
create table TipoEvaluacion 
(
   IdTipoevaluacion     integer                        not null,
   DESCRIPCION          varchar(1000)                  null,
   constraint PK_TIPOEVALUACION primary key (IdTipoevaluacion)
);

/*==============================================================*/
/* Index: TipoevaluacionPk                                      */
/*==============================================================*/
create unique index TipoevaluacionPk on TipoEvaluacion (
IdTipoevaluacion ASC
);

/*==============================================================*/
/* Table: TipoSala                                              */
/*==============================================================*/
create table TipoSala 
(
   IdTiposala           integer                        not null,
   DESCRIPCION          varchar(1000)                  null,
   constraint PK_TIPOSALA primary key (IdTiposala)
);

/*==============================================================*/
/* Index: TiposalaPk                                            */
/*==============================================================*/
create unique index TiposalaPk on TipoSala (
IdTiposala ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   IdUsuario            integer                        not null,
   IdModulo             integer                        not null,
   CONTRASENA           char(1000)                     not null,
   CATEGORIA            integer                        null,
   RutUsuario           integer                        not null,
   constraint PK_USUARIO primary key (IdUsuario)
);

/*==============================================================*/
/* Index: UsuarioPk                                             */
/*==============================================================*/
create unique index UsuarioPk on USUARIO (
IdUsuario ASC
);

/*==============================================================*/
/* Index: Relationship9Fk                                       */
/*==============================================================*/
create index Relationship9Fk on USUARIO (
IdModulo ASC
);

alter table ASISTE
   add constraint FK_ASISTE_ASISTE_ALUMNO foreign key (IdAlumno)
      references ALUMNO (IdAlumno)
      on update cascade
      on delete restrict;

alter table ASISTE
   add constraint FK_ASISTE_ASISTE2_TUTORIA foreign key (IdTutoria)
      references TUTORIA (IdTutoria)
      on update cascade
      on delete restrict;

alter table AYUDA
   add constraint FK_AYUDA_AYUDA_AYUDANTI foreign key (IdAyudantia)
      references AYUDANTIA (IdAyudantia)
      on update cascade
      on delete restrict;

alter table AYUDA
   add constraint FK_AYUDA_AYUDA2_AYUDANTE foreign key (IdAyudante)
      references AYUDANTE (IdAyudante)
      on update cascade
      on delete restrict;

alter table AYUDANTIA
   add constraint FK_AYUDANTI_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CALIFICAC_EVALUACI foreign key (IdEvaluacion)
      references EVALUACIONES (IdEvaluacion)
      on update cascade
      on delete restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CALIFICAC_ALUMNO foreign key (IdAlumno)
      references ALUMNO (IdAlumno)
      on update cascade
      on delete restrict;

alter table EVALUACIONES
   add constraint FK_EVALUACI_RELATIONS_PROFESOR foreign key (IdProfesor)
      references PROFESOR (IdProfesor)
      on update cascade
      on delete restrict;

alter table EVALUACIONES
   add constraint FK_EVALUACI_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

alter table EVALUACIONES
   add constraint FK_EVALUACI_RELATIONS_TIPOEVAL foreign key (IdTipoevaluacion)
      references TipoEvaluacion (IdTipoevaluacion)
      on update cascade
      on delete restrict;

alter table HORARIO
   add constraint FK_HORARIO_RELATIONS_SALA foreign key (IdSala)
      references SALA (IdSala)
      on update cascade
      on delete restrict;

alter table HORARIO
   add constraint FK_HORARIO_RELATIONS_SECCION foreign key (IdSeccion)
      references SECCION (IdSeccion)
      on update cascade
      on delete restrict;

alter table HorarioBloque
   add constraint FK_HORARIOB_HORARIOBL_HORARIO foreign key (IdHorario)
      references HORARIO (IdHorario)
      on update cascade
      on delete restrict;

alter table HorarioBloque
   add constraint FK_HORARIOB_HORARIOBL_BLOQUE foreign key (IdBloque)
      references BLOQUE (IdBloque)
      on update cascade
      on delete restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_TIPOSALA foreign key (IdTiposala)
      references TipoSala (IdTiposala)
      on update cascade
      on delete restrict;

alter table SECCION
   add constraint FK_SECCION_RELATIONS_AYUDANTI foreign key (IdAyudantia)
      references AYUDANTIA (IdAyudantia)
      on update cascade
      on delete restrict;

alter table TUTORIA
   add constraint FK_TUTORIA_RELATIONS_TUTOR foreign key (IdTutor)
      references TUTOR (IdTutor)
      on update cascade
      on delete restrict;

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

