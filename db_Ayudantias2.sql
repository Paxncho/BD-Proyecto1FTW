/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     04-12-2017 11:44:19                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_AYUDANTI_RELATIONS_MODULO') then
    alter table AYUDANTIA
       delete foreign key FK_AYUDANTI_RELATIONS_MODULO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ASISTENC_ASISTENCI_ALUMNO') then
    alter table AsistenciaAClases
       delete foreign key FK_ASISTENC_ASISTENCI_ALUMNO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ASISTENC_ASISTENCI_MODULO') then
    alter table AsistenciaAClases
       delete foreign key FK_ASISTENC_ASISTENCI_MODULO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ASISTENC_ASISTENCI_ALUMNO') then
    alter table AsistenciaTutoria
       delete foreign key FK_ASISTENC_ASISTENCI_ALUMNO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ASISTENC_ASISTENCI_TUTORIA') then
    alter table AsistenciaTutoria
       delete foreign key FK_ASISTENC_ASISTENCI_TUTORIA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AYUDANTE_AYUDANTEA_AYUDANTI') then
    alter table AyudanteACargo
       delete foreign key FK_AYUDANTE_AYUDANTEA_AYUDANTI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AYUDANTE_AYUDANTEA_AYUDANTE') then
    alter table AyudanteACargo
       delete foreign key FK_AYUDANTE_AYUDANTEA_AYUDANTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CALIFICA_CALIFICAC_EVALUACI') then
    alter table CALIFICACION
       delete foreign key FK_CALIFICA_CALIFICAC_EVALUACI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CALIFICA_CALIFICAC_ALUMNO') then
    alter table CALIFICACION
       delete foreign key FK_CALIFICA_CALIFICAC_ALUMNO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EVALUACI_RELATIONS_MODULO') then
    alter table EVALUACIONES
       delete foreign key FK_EVALUACI_RELATIONS_MODULO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EVALUACI_RELATIONS_TIPOEVAL') then
    alter table EVALUACIONES
       delete foreign key FK_EVALUACI_RELATIONS_TIPOEVAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIO_HORARIOAY_SECCION') then
    alter table HORARIO
       delete foreign key FK_HORARIO_HORARIOAY_SECCION
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIO_RELATIONS_SALA') then
    alter table HORARIO
       delete foreign key FK_HORARIO_RELATIONS_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIO_RELATIONS_MODULO') then
    alter table HORARIO
       delete foreign key FK_HORARIO_RELATIONS_MODULO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIOB_HORARIOBL_HORARIO') then
    alter table HorarioBloque
       delete foreign key FK_HORARIOB_HORARIOBL_HORARIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HORARIOB_HORARIOBL_BLOQUE') then
    alter table HorarioBloque
       delete foreign key FK_HORARIOB_HORARIOBL_BLOQUE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROFESOR_PROFESORA_PROFESOR') then
    alter table ProfesorACargo
       delete foreign key FK_PROFESOR_PROFESORA_PROFESOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROFESOR_PROFESORA_MODULO') then
    alter table ProfesorACargo
       delete foreign key FK_PROFESOR_PROFESORA_MODULO
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

drop index if exists AYUDANTE.AyudantePk;

drop table if exists AYUDANTE;

drop index if exists AYUDANTIA.Relationship10Fk;

drop index if exists AYUDANTIA.AyudantiaPk;

drop table if exists AYUDANTIA;

drop index if exists AsistenciaAClases.Asistenciaaclases2Fk;

drop index if exists AsistenciaAClases.AsistenciaaclasesFk;

drop index if exists AsistenciaAClases.AsistenciaaclasesPk;

drop table if exists AsistenciaAClases;

drop index if exists AsistenciaTutoria.Asistenciatutoria2Fk;

drop index if exists AsistenciaTutoria.AsistenciatutoriaFk;

drop index if exists AsistenciaTutoria.AsistenciatutoriaPk;

drop table if exists AsistenciaTutoria;

drop index if exists AyudanteACargo.Ayudanteacargo2Fk;

drop index if exists AyudanteACargo.AyudanteacargoFk;

drop index if exists AyudanteACargo.AyudanteacargoPk;

drop table if exists AyudanteACargo;

drop index if exists BLOQUE.BloquePk;

drop table if exists BLOQUE;

drop index if exists CALIFICACION.Calificacion2Fk;

drop index if exists CALIFICACION.CalificacionFk;

drop index if exists CALIFICACION.CalificacionPk;

drop table if exists CALIFICACION;

drop index if exists EVALUACIONES.Relationship7Fk;

drop index if exists EVALUACIONES.Relationship6Fk;

drop index if exists EVALUACIONES.EvaluacionesPk;

drop table if exists EVALUACIONES;

drop index if exists HORARIO.Relationship16Fk;

drop index if exists HORARIO.HorarioayudantiaFk;

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

drop index if exists ProfesorACargo.Profesoracargo2Fk;

drop index if exists ProfesorACargo.ProfesoracargoFk;

drop index if exists ProfesorACargo.ProfesoracargoPk;

drop table if exists ProfesorACargo;

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
   MatriculaAlumno      integer                        not null,
   NombreAlumno         varchar(1000)                  not null,
   ApellidoAlumno       varchar(1000)                  null,
   CorreoAlumno         varchar(1000)                  null,
   constraint PK_ALUMNO primary key (MatriculaAlumno)
);

/*==============================================================*/
/* Index: AlumnoPk                                              */
/*==============================================================*/
create unique index AlumnoPk on ALUMNO (
MatriculaAlumno ASC
);

/*==============================================================*/
/* Table: AYUDANTE                                              */
/*==============================================================*/
create table AYUDANTE 
(
   RutAyudante          integer                        not null,
   NombreAyudante       varchar(1000)                  not null,
   ApellidoAyudante     varchar(1000)                  null,
   CorreoAyudante       varchar(1000)                  null,
   constraint PK_AYUDANTE primary key (RutAyudante)
);

/*==============================================================*/
/* Index: AyudantePk                                            */
/*==============================================================*/
create unique index AyudantePk on AYUDANTE (
RutAyudante ASC
);

/*==============================================================*/
/* Table: AYUDANTIA                                             */
/*==============================================================*/
create table AYUDANTIA 
(
   IdAyudantia          integer                        not null,
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
/* Table: AsistenciaAClases                                     */
/*==============================================================*/
create table AsistenciaAClases 
(
   MatriculaAlumno      integer                        not null,
   IdModulo             integer                        not null,
   constraint PK_ASISTENCIAACLASES primary key clustered (MatriculaAlumno, IdModulo)
);

/*==============================================================*/
/* Index: AsistenciaaclasesPk                                   */
/*==============================================================*/
create unique clustered index AsistenciaaclasesPk on AsistenciaAClases (
MatriculaAlumno ASC,
IdModulo ASC
);

/*==============================================================*/
/* Index: AsistenciaaclasesFk                                   */
/*==============================================================*/
create index AsistenciaaclasesFk on AsistenciaAClases (
MatriculaAlumno ASC
);

/*==============================================================*/
/* Index: Asistenciaaclases2Fk                                  */
/*==============================================================*/
create index Asistenciaaclases2Fk on AsistenciaAClases (
IdModulo ASC
);

/*==============================================================*/
/* Table: AsistenciaTutoria                                     */
/*==============================================================*/
create table AsistenciaTutoria 
(
   MatriculaAlumno      integer                        not null,
   IdTutoria            integer                        not null,
   constraint PK_ASISTENCIATUTORIA primary key clustered (MatriculaAlumno, IdTutoria)
);

/*==============================================================*/
/* Index: AsistenciatutoriaPk                                   */
/*==============================================================*/
create unique clustered index AsistenciatutoriaPk on AsistenciaTutoria (
MatriculaAlumno ASC,
IdTutoria ASC
);

/*==============================================================*/
/* Index: AsistenciatutoriaFk                                   */
/*==============================================================*/
create index AsistenciatutoriaFk on AsistenciaTutoria (
MatriculaAlumno ASC
);

/*==============================================================*/
/* Index: Asistenciatutoria2Fk                                  */
/*==============================================================*/
create index Asistenciatutoria2Fk on AsistenciaTutoria (
IdTutoria ASC
);

/*==============================================================*/
/* Table: AyudanteACargo                                        */
/*==============================================================*/
create table AyudanteACargo 
(
   IdAyudantia          integer                        not null,
   RutAyudante          integer                        not null,
   constraint PK_AYUDANTEACARGO primary key clustered (IdAyudantia, RutAyudante)
);

/*==============================================================*/
/* Index: AyudanteacargoPk                                      */
/*==============================================================*/
create unique clustered index AyudanteacargoPk on AyudanteACargo (
IdAyudantia ASC,
RutAyudante ASC
);

/*==============================================================*/
/* Index: AyudanteacargoFk                                      */
/*==============================================================*/
create index AyudanteacargoFk on AyudanteACargo (
IdAyudantia ASC
);

/*==============================================================*/
/* Index: Ayudanteacargo2Fk                                     */
/*==============================================================*/
create index Ayudanteacargo2Fk on AyudanteACargo (
RutAyudante ASC
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
   MatriculaAlumno      integer                        not null,
   constraint PK_CALIFICACION primary key clustered (IdEvaluacion, MatriculaAlumno)
);

/*==============================================================*/
/* Index: CalificacionPk                                        */
/*==============================================================*/
create unique clustered index CalificacionPk on CALIFICACION (
IdEvaluacion ASC,
MatriculaAlumno ASC
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
MatriculaAlumno ASC
);

/*==============================================================*/
/* Table: EVALUACIONES                                          */
/*==============================================================*/
create table EVALUACIONES 
(
   IdEvaluacion         integer                        not null,
   IdTipoEvaluacion     integer                        not null,
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
/* Index: Relationship6Fk                                       */
/*==============================================================*/
create index Relationship6Fk on EVALUACIONES (
IdModulo ASC
);

/*==============================================================*/
/* Index: Relationship7Fk                                       */
/*==============================================================*/
create index Relationship7Fk on EVALUACIONES (
IdTipoEvaluacion ASC
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO 
(
   IdHorario            integer                        not null,
   IdSala               integer                        not null,
   IdModulo             integer                        null,
   IdSeccion            integer                        null,
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
/* Index: HorarioayudantiaFk                                    */
/*==============================================================*/
create index HorarioayudantiaFk on HORARIO (
IdSeccion ASC
);

/*==============================================================*/
/* Index: Relationship16Fk                                      */
/*==============================================================*/
create index Relationship16Fk on HORARIO (
IdModulo ASC
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
   NombreModulo         varchar(1000)                  not null,
   SEMESTRE             varchar(1000)                  null,
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
   RutProfesor          integer                        not null,
   NombreProfesor       varchar(1000)                  not null,
   ApellidoProfesor     varchar(1000)                  null,
   CorreoProfesor       varchar(1000)                  null,
   constraint PK_PROFESOR primary key (RutProfesor)
);

/*==============================================================*/
/* Index: ProfesorPk                                            */
/*==============================================================*/
create unique index ProfesorPk on PROFESOR (
RutProfesor ASC
);

/*==============================================================*/
/* Table: ProfesorACargo                                        */
/*==============================================================*/
create table ProfesorACargo 
(
   RutProfesor          integer                        not null,
   IdModulo             integer                        not null,
   constraint PK_PROFESORACARGO primary key clustered (RutProfesor, IdModulo)
);

/*==============================================================*/
/* Index: ProfesoracargoPk                                      */
/*==============================================================*/
create unique clustered index ProfesoracargoPk on ProfesorACargo (
RutProfesor ASC,
IdModulo ASC
);

/*==============================================================*/
/* Index: ProfesoracargoFk                                      */
/*==============================================================*/
create index ProfesoracargoFk on ProfesorACargo (
RutProfesor ASC
);

/*==============================================================*/
/* Index: Profesoracargo2Fk                                     */
/*==============================================================*/
create index Profesoracargo2Fk on ProfesorACargo (
IdModulo ASC
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   IdSala               integer                        not null,
   IdTiposala           integer                        not null,
   NombreSala           varchar(1000)                  not null,
   CAPACIDAD            integer                        not null,
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
   IdAyudantia          integer                        not null,
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
   RutTutor             integer                        not null,
   NombreTutor          varchar(1000)                  not null,
   ApellidoTutor        varchar(1000)                  null,
   CorreoTutor          varchar(1000)                  null,
   constraint PK_TUTOR primary key (RutTutor)
);

/*==============================================================*/
/* Index: TutorPk                                               */
/*==============================================================*/
create unique index TutorPk on TUTOR (
RutTutor ASC
);

/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA 
(
   IdTutoria            integer                        not null,
   RutTutor             integer                        not null,
   CANTIDAD             integer                        null,
   Descripcion          long varchar                   null,
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
RutTutor ASC
);

/*==============================================================*/
/* Table: TipoEvaluacion                                        */
/*==============================================================*/
create table TipoEvaluacion 
(
   IdTipoEvaluacion     integer                        not null,
   Descripcion          long varchar                   null,
   constraint PK_TIPOEVALUACION primary key (IdTipoEvaluacion)
);

/*==============================================================*/
/* Index: TipoevaluacionPk                                      */
/*==============================================================*/
create unique index TipoevaluacionPk on TipoEvaluacion (
IdTipoEvaluacion ASC
);

/*==============================================================*/
/* Table: TipoSala                                              */
/*==============================================================*/
create table TipoSala 
(
   IdTiposala           integer                        not null,
   Descripcion          long varchar                   null,
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
   RutUsuario           integer                        not null,
   IdModulo             integer                        not null,
   CONTRASENA           char(1000)                     not null,
   CATEGORIA            integer                        not null,
   constraint PK_USUARIO primary key (RutUsuario)
);

/*==============================================================*/
/* Index: UsuarioPk                                             */
/*==============================================================*/
create unique index UsuarioPk on USUARIO (
RutUsuario ASC
);

/*==============================================================*/
/* Index: Relationship9Fk                                       */
/*==============================================================*/
create index Relationship9Fk on USUARIO (
IdModulo ASC
);

alter table AYUDANTIA
   add constraint FK_AYUDANTI_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

alter table AsistenciaAClases
   add constraint FK_ASISTENC_ASISTENCI_ALUMNO foreign key (MatriculaAlumno)
      references ALUMNO (MatriculaAlumno)
      on update cascade
      on delete restrict;

alter table AsistenciaAClases
   add constraint FK_ASISTENC_ASISTENCI_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

alter table AsistenciaTutoria
   add constraint FK_ASISTENC_ASISTENCI_ALUMNO foreign key (MatriculaAlumno)
      references ALUMNO (MatriculaAlumno)
      on update cascade
      on delete restrict;

alter table AsistenciaTutoria
   add constraint FK_ASISTENC_ASISTENCI_TUTORIA foreign key (IdTutoria)
      references TUTORIA (IdTutoria)
      on update cascade
      on delete restrict;

alter table AyudanteACargo
   add constraint FK_AYUDANTE_AYUDANTEA_AYUDANTI foreign key (IdAyudantia)
      references AYUDANTIA (IdAyudantia)
      on update cascade
      on delete restrict;

alter table AyudanteACargo
   add constraint FK_AYUDANTE_AYUDANTEA_AYUDANTE foreign key (RutAyudante)
      references AYUDANTE (RutAyudante)
      on update cascade
      on delete restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CALIFICAC_EVALUACI foreign key (IdEvaluacion)
      references EVALUACIONES (IdEvaluacion)
      on update cascade
      on delete restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CALIFICAC_ALUMNO foreign key (MatriculaAlumno)
      references ALUMNO (MatriculaAlumno)
      on update cascade
      on delete restrict;

alter table EVALUACIONES
   add constraint FK_EVALUACI_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

alter table EVALUACIONES
   add constraint FK_EVALUACI_RELATIONS_TIPOEVAL foreign key (IdTipoEvaluacion)
      references TipoEvaluacion (IdTipoEvaluacion)
      on update cascade
      on delete restrict;

alter table HORARIO
   add constraint FK_HORARIO_HORARIOAY_SECCION foreign key (IdSeccion)
      references SECCION (IdSeccion)
      on update cascade
      on delete restrict;

alter table HORARIO
   add constraint FK_HORARIO_RELATIONS_SALA foreign key (IdSala)
      references SALA (IdSala)
      on update cascade
      on delete restrict;

alter table HORARIO
   add constraint FK_HORARIO_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
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

alter table ProfesorACargo
   add constraint FK_PROFESOR_PROFESORA_PROFESOR foreign key (RutProfesor)
      references PROFESOR (RutProfesor)
      on update cascade
      on delete restrict;

alter table ProfesorACargo
   add constraint FK_PROFESOR_PROFESORA_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
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
   add constraint FK_TUTORIA_RELATIONS_TUTOR foreign key (RutTutor)
      references TUTOR (RutTutor)
      on update cascade
      on delete restrict;

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_MODULO foreign key (IdModulo)
      references MODULO (IdModulo)
      on update cascade
      on delete restrict;

