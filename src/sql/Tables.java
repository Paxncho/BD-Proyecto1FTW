package sql;

/**
 * @author Pencho
 * @version 1.0, Last modification: 04-12-2017
 */

public enum Tables {
    ALUMNO ("alumno", "MatriculaAlumno, NombreAlumno, ApellidoAlumno, CorreoAlumno"),
    ASISTENCIA_A_CLASES("asistenciaaclases", "MatriculaAlumno, IdModulo"),
    ASISTENCIA_TUTORIAS("asistenciatutoria","MatriculaAlumno, IdTutoria"),
    AYUDANTE ("ayudante", "RutAyudante, NombreAyudante, ApellidoAyudante, CorreoAyudante"),
    AYUDANTE_A_CARGO("ayudanteacargo", "IdAyudantia, RutAyudante"),
    AYUDANTIA ("ayudantia", "IdAyudantia, IdModulo"),
    BLOQUE("bloque", "IdBloque, HoraInicio, HoraTermino"),
    CALIFICACION("calificacion", "IdEvaluacion, MatriculaAlumno, Nota, Comentario"),
    EVALUACION("evaluacion", "IdEvaluacion, IdTipoEvaluacion, IdModulo, FechaEvaluacion, Contenido"),
    HORARIO("horario", "IdHorario, IdSala, IdSeccion, DIA"),
    HORARIO_BLOQUE("horariobloque", "IdHorario, IdBloque"),
    MODULO("modulo", "IdModulo, NombreModulo, SEMESTRE"),
    PROFESOR("profesor", "RutProfesor, NombreProfesor, ApellidoProfesor, CorreoProfesor"),
    PROFESOR_A_CARGO("profesoracargo","RutProfesor, IdModulo"),
    SALA("sala", "IdSala, IdTiposala, NombreSala, CAPACIDAD"),
    SECCION("seccion", "IdSeccion, IdAyudantia, NombreSeccion"),
    TIPO_EVALUACION("tipoevaluacion", "IdTipoEvaluacion, Descripcion"),
    TIPO_SALA("tiposala", "IdTiposala, Descripcion"),
    TIPO_USUARIO("tipousuario", "IdTipoUsuario, NombreTipo"),
    TUTOR("tutor", "RutTutor, NombreTutor, ApellidoTutor, CorreoTutor"),
    TUTORIA("tutoria", "IdTutoria, RutTutor, Cantidad, Descripcion"),
    USUARIO("usuario", "RutUsuario, Password, IdTipoUsuario");
    
    private final String name;
    private final String parameters;
    
    Tables(String databaseName, String parameters){
        this.name = databaseName;
        this.parameters = parameters;
    }
    
    public String getDatabaseName(){
        return this.name;
    }
    
    public String getDatabaseParameters(){
        return this.parameters;
    }
   
}
