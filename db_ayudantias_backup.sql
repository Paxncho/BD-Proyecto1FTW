-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ayudantias
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `MatriculaAlumno` int(11) NOT NULL,
  `NombreAlumno` varchar(255) NOT NULL,
  `ApellidoAlumno` varchar(255) DEFAULT NULL,
  `CorreoAlumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MatriculaAlumno`),
  UNIQUE KEY `AlumnoPk` (`MatriculaAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (2016479040,'Nicolas','Valdebenito','nvaldebenito16@alumnos.utalca.cl'),(2017479030,'Macarena','Aguilera','maguilera17@alumnos.utalca.cl'),(2017479041,'Sebastian','Perez','sperez17@alumnos.utalca.cl');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistenciaaclases`
--

DROP TABLE IF EXISTS `asistenciaaclases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistenciaaclases` (
  `MatriculaAlumno` int(11) NOT NULL,
  `IdModulo` int(11) NOT NULL,
  PRIMARY KEY (`MatriculaAlumno`,`IdModulo`),
  KEY `AsistenciaaclasesFk` (`MatriculaAlumno`),
  KEY `Asistenciaaclases2Fk` (`IdModulo`),
  CONSTRAINT `FK_ASISTENC_ASISTENCI_ALUMNO` FOREIGN KEY (`MatriculaAlumno`) REFERENCES `alumno` (`MatriculaAlumno`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ASISTENC_ASISTENCI_MODULO` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistenciaaclases`
--

LOCK TABLES `asistenciaaclases` WRITE;
/*!40000 ALTER TABLE `asistenciaaclases` DISABLE KEYS */;
INSERT INTO `asistenciaaclases` VALUES (2016479040,0),(2017479030,0),(2017479041,0);
/*!40000 ALTER TABLE `asistenciaaclases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistenciatutoria`
--

DROP TABLE IF EXISTS `asistenciatutoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistenciatutoria` (
  `MatriculaAlumno` int(11) NOT NULL,
  `IdTutoria` int(11) NOT NULL,
  PRIMARY KEY (`MatriculaAlumno`,`IdTutoria`),
  KEY `AsistenciatutoriaFk` (`MatriculaAlumno`),
  KEY `Asistenciatutoria2Fk` (`IdTutoria`),
  CONSTRAINT `FK_ASISTENC_ASISTENCI_TUTORIA` FOREIGN KEY (`IdTutoria`) REFERENCES `tutoria` (`IdTutoria`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistenciatutoria`
--

LOCK TABLES `asistenciatutoria` WRITE;
/*!40000 ALTER TABLE `asistenciatutoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistenciatutoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayudante`
--

DROP TABLE IF EXISTS `ayudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ayudante` (
  `RutAyudante` int(11) NOT NULL,
  `NombreAyudante` varchar(255) NOT NULL,
  `ApellidoAyudante` varchar(255) DEFAULT NULL,
  `CorreoAyudante` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RutAyudante`),
  UNIQUE KEY `AyudantePk` (`RutAyudante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayudante`
--

LOCK TABLES `ayudante` WRITE;
/*!40000 ALTER TABLE `ayudante` DISABLE KEYS */;
INSERT INTO `ayudante` VALUES (19648145,'Daniela','Cid','daniela_cid_vidal@hotmail.com');
/*!40000 ALTER TABLE `ayudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayudanteacargo`
--

DROP TABLE IF EXISTS `ayudanteacargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ayudanteacargo` (
  `IdAyudantia` int(11) NOT NULL,
  `RutAyudante` int(11) NOT NULL,
  PRIMARY KEY (`IdAyudantia`,`RutAyudante`),
  KEY `AyudanteacargoFk` (`IdAyudantia`),
  KEY `Ayudanteacargo2Fk` (`RutAyudante`),
  CONSTRAINT `FK_AYUDANTE_AYUDANTEA_AYUDANTE` FOREIGN KEY (`RutAyudante`) REFERENCES `ayudante` (`RutAyudante`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AYUDANTE_AYUDANTEA_AYUDANTI` FOREIGN KEY (`IdAyudantia`) REFERENCES `ayudantia` (`IdAyudantia`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayudanteacargo`
--

LOCK TABLES `ayudanteacargo` WRITE;
/*!40000 ALTER TABLE `ayudanteacargo` DISABLE KEYS */;
INSERT INTO `ayudanteacargo` VALUES (0,19648145);
/*!40000 ALTER TABLE `ayudanteacargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayudantia`
--

DROP TABLE IF EXISTS `ayudantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ayudantia` (
  `IdAyudantia` int(11) NOT NULL,
  `IdModulo` int(11) NOT NULL,
  PRIMARY KEY (`IdAyudantia`),
  UNIQUE KEY `AyudantiaPk` (`IdAyudantia`),
  KEY `Relationship10Fk` (`IdModulo`),
  CONSTRAINT `FK_AYUDANTI_RELATIONS_MODULO` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayudantia`
--

LOCK TABLES `ayudantia` WRITE;
/*!40000 ALTER TABLE `ayudantia` DISABLE KEYS */;
INSERT INTO `ayudantia` VALUES (0,1);
/*!40000 ALTER TABLE `ayudantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloque`
--

DROP TABLE IF EXISTS `bloque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloque` (
  `IdBloque` int(11) NOT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraTermino` time DEFAULT NULL,
  PRIMARY KEY (`IdBloque`),
  UNIQUE KEY `BloquePk` (`IdBloque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloque`
--

LOCK TABLES `bloque` WRITE;
/*!40000 ALTER TABLE `bloque` DISABLE KEYS */;
INSERT INTO `bloque` VALUES (1,'08:30:00','09:30:00'),(2,'09:40:00','10:40:00'),(3,'10:50:00','11:50:00'),(4,'12:00:00','13:00:00'),(5,'13:10:00','14:10:00'),(6,'14:20:00','15:20:00'),(7,'15:30:00','16:30:00'),(8,'16:40:00','17:40:00'),(9,'17:50:00','18:50:00'),(10,'19:00:00','20:00:00'),(11,'20:10:00','21:10:00');
/*!40000 ALTER TABLE `bloque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion` (
  `IdEvaluacion` int(11) NOT NULL,
  `MatriculaAlumno` int(11) NOT NULL,
  `Nota` int(11) DEFAULT NULL,
  `Comentarios` mediumtext,
  PRIMARY KEY (`IdEvaluacion`,`MatriculaAlumno`),
  KEY `CalificacionFk` (`IdEvaluacion`),
  KEY `Calificacion2Fk` (`MatriculaAlumno`),
  CONSTRAINT `FK_CALIFICA_CALIFICAC_ALUMNO` FOREIGN KEY (`MatriculaAlumno`) REFERENCES `alumno` (`MatriculaAlumno`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CALIFICA_CALIFICAC_EVALUACI` FOREIGN KEY (`IdEvaluacion`) REFERENCES `evaluacion` (`IdEvaluacion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
INSERT INTO `calificacion` VALUES (0,2016479040,39,'Reforzar comandos sql'),(0,2017479030,45,'Conocimiento minimo suficiente'),(0,2017479041,10,'No se present├│ a la prueba');
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion` (
  `IdEvaluacion` int(11) NOT NULL,
  `IdTipoEvaluacion` int(11) NOT NULL,
  `IdModulo` int(11) NOT NULL,
  `FechaEvaluacion` date DEFAULT NULL,
  `Contenido` mediumtext,
  PRIMARY KEY (`IdEvaluacion`),
  UNIQUE KEY `EvaluacionesPk` (`IdEvaluacion`),
  KEY `Relationship6Fk` (`IdModulo`),
  KEY `Relationship7Fk` (`IdTipoEvaluacion`),
  CONSTRAINT `FK_EVALUACI_RELATIONS_MODULO` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_EVALUACI_RELATIONS_TIPOEVAL` FOREIGN KEY (`IdTipoEvaluacion`) REFERENCES `tipoevaluacion` (`IdTipoEvaluacion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` VALUES (0,0,0,'2017-07-22','Creaci├│n de Base de Datos'),(1,0,0,'2017-12-08','Esta es una evaluacion'),(2,2,0,'2017-09-06','Laboratorio 2 Unidad 1');
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `IdHorario` int(11) NOT NULL,
  `IdSala` int(11) NOT NULL,
  `IdModulo` int(11) DEFAULT NULL,
  `IdSeccion` int(11) DEFAULT NULL,
  `Dia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdHorario`),
  UNIQUE KEY `HorarioPk` (`IdHorario`),
  KEY `Relationship1Fk` (`IdSala`),
  KEY `HorarioayudantiaFk` (`IdSeccion`),
  KEY `Relationship16Fk` (`IdModulo`),
  CONSTRAINT `FK_HORARIO_HORARIOAY_SECCION` FOREIGN KEY (`IdSeccion`) REFERENCES `seccion` (`IdSeccion`) ON UPDATE CASCADE,
  CONSTRAINT `FK_HORARIO_RELATIONS_MODULO` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_HORARIO_RELATIONS_SALA` FOREIGN KEY (`IdSala`) REFERENCES `sala` (`IdSala`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (0,2,1,NULL,'Lunes'),(1,1,1,0,'Lunes'),(2,2,0,NULL,'Lunes');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariobloque`
--

DROP TABLE IF EXISTS `horariobloque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horariobloque` (
  `IdHorario` int(11) NOT NULL,
  `IdBloque` int(11) NOT NULL,
  PRIMARY KEY (`IdHorario`,`IdBloque`),
  KEY `HorariobloqueFk` (`IdHorario`),
  KEY `Horariobloque2Fk` (`IdBloque`),
  CONSTRAINT `FK_HORARIOB_HORARIOBL_BLOQUE` FOREIGN KEY (`IdBloque`) REFERENCES `bloque` (`IdBloque`) ON UPDATE CASCADE,
  CONSTRAINT `FK_HORARIOB_HORARIOBL_HORARIO` FOREIGN KEY (`IdHorario`) REFERENCES `horario` (`IdHorario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariobloque`
--

LOCK TABLES `horariobloque` WRITE;
/*!40000 ALTER TABLE `horariobloque` DISABLE KEYS */;
INSERT INTO `horariobloque` VALUES (0,7),(1,8),(2,4);
/*!40000 ALTER TABLE `horariobloque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `IdModulo` int(11) NOT NULL,
  `NombreModulo` varchar(255) NOT NULL,
  `Semestre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdModulo`),
  UNIQUE KEY `ModuloPk` (`IdModulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (0,'Bases de Datos','4'),(1,'Programaci├│n Estructurada','1');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `RutProfesor` int(11) NOT NULL,
  `NombreProfesor` varchar(255) NOT NULL,
  `ApellidoProfesor` varchar(255) DEFAULT NULL,
  `CorreoProfesor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RutProfesor`),
  UNIQUE KEY `ProfesorPk` (`RutProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (19648763,'Jos├®','Riffo','jfriffoa@gmail.com');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesoracargo`
--

DROP TABLE IF EXISTS `profesoracargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesoracargo` (
  `RutProfesor` int(11) NOT NULL,
  `IdModulo` int(11) NOT NULL,
  PRIMARY KEY (`RutProfesor`,`IdModulo`),
  KEY `ProfesoracargoFk` (`RutProfesor`),
  KEY `Profesoracargo2Fk` (`IdModulo`),
  CONSTRAINT `FK_PROFESOR_PROFESORA_MODULO` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PROFESOR_PROFESORA_PROFESOR` FOREIGN KEY (`RutProfesor`) REFERENCES `profesor` (`RutProfesor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesoracargo`
--

LOCK TABLES `profesoracargo` WRITE;
/*!40000 ALTER TABLE `profesoracargo` DISABLE KEYS */;
INSERT INTO `profesoracargo` VALUES (19648763,0),(19648763,1);
/*!40000 ALTER TABLE `profesoracargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `IdSala` int(11) NOT NULL,
  `IdTiposala` int(11) NOT NULL,
  `NombreSala` varchar(255) NOT NULL,
  `Capacidad` int(11) NOT NULL,
  PRIMARY KEY (`IdSala`),
  UNIQUE KEY `SalaPk` (`IdSala`),
  KEY `Relationship2Fk` (`IdTiposala`),
  CONSTRAINT `FK_SALA_RELATIONS_TIPOSALA` FOREIGN KEY (`IdTiposala`) REFERENCES `tiposala` (`IdTiposala`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (0,3,'Sala 301',25),(1,0,'Sala 801',25),(2,1,'Laboratorio de BioInformatica',25);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion` (
  `IdSeccion` int(11) NOT NULL,
  `IdAyudantia` int(11) NOT NULL,
  `NombreSeccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdSeccion`),
  UNIQUE KEY `SeccionPk` (`IdSeccion`),
  KEY `Relationship11Fk` (`IdAyudantia`),
  CONSTRAINT `FK_SECCION_RELATIONS_AYUDANTI` FOREIGN KEY (`IdAyudantia`) REFERENCES `ayudantia` (`IdAyudantia`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (0,0,'Secci├│n A');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoevaluacion`
--

DROP TABLE IF EXISTS `tipoevaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoevaluacion` (
  `IdTipoEvaluacion` int(11) NOT NULL,
  `Descripcion` mediumtext,
  PRIMARY KEY (`IdTipoEvaluacion`),
  UNIQUE KEY `TipoevaluacionPk` (`IdTipoEvaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoevaluacion`
--

LOCK TABLES `tipoevaluacion` WRITE;
/*!40000 ALTER TABLE `tipoevaluacion` DISABLE KEYS */;
INSERT INTO `tipoevaluacion` VALUES (0,'Prueba'),(1,'Control'),(2,'Laboratorio'),(3,'Examen');
/*!40000 ALTER TABLE `tipoevaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposala`
--

DROP TABLE IF EXISTS `tiposala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposala` (
  `IdTiposala` int(11) NOT NULL,
  `Descripcion` mediumtext,
  PRIMARY KEY (`IdTiposala`),
  UNIQUE KEY `TiposalaPk` (`IdTiposala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposala`
--

LOCK TABLES `tiposala` WRITE;
/*!40000 ALTER TABLE `tiposala` DISABLE KEYS */;
INSERT INTO `tiposala` VALUES (0,'Sala'),(1,'Laboratorio'),(2,'Modulo'),(3,'Taller');
/*!40000 ALTER TABLE `tiposala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `IdTipoUsuario` int(11) NOT NULL,
  `NombreTipo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdTipoUsuario`),
  UNIQUE KEY `TipousuarioPk` (`IdTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (0,'Profesor'),(1,'Ayudante'),(2,'Tutor');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `RutTutor` int(11) NOT NULL,
  `NombreTutor` varchar(255) NOT NULL,
  `ApellidoTutor` varchar(255) DEFAULT NULL,
  `CorreoTutor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RutTutor`),
  UNIQUE KEY `TutorPk` (`RutTutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutoria`
--

DROP TABLE IF EXISTS `tutoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutoria` (
  `IdTutoria` int(11) NOT NULL,
  `RutTutor` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Descripcion` mediumtext,
  PRIMARY KEY (`IdTutoria`),
  UNIQUE KEY `TutoriaPk` (`IdTutoria`),
  KEY `Relationship14Fk` (`RutTutor`),
  CONSTRAINT `FK_TUTORIA_RELATIONS_TUTOR` FOREIGN KEY (`RutTutor`) REFERENCES `tutor` (`RutTutor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutoria`
--

LOCK TABLES `tutoria` WRITE;
/*!40000 ALTER TABLE `tutoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `RutUsuario` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `IdTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`RutUsuario`),
  UNIQUE KEY `UsuarioPk` (`RutUsuario`),
  KEY `Relationship17Fk` (`IdTipoUsuario`),
  CONSTRAINT `FK_USUARIO_RELATIONS_TIPOUSUA` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `tipousuario` (`IdTipoUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (19648145,'19648',1),(19648763,'19648',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08 19:24:17
