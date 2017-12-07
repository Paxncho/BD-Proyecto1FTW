package sql;

/**
 * @author Pencho
 * @version 1.1, Last modification: 07-12-2017
 */

public enum Tables {
    ALUMNO ("alumno", "MatriculaAlumno, NombreAlumno, ApellidoAlumno, CorreoAlumno", "MatriculaAlumno"),
    ASISTENCIA_A_CLASES("asistenciaaclases", "MatriculaAlumno, IdModulo", ""),
    ASISTENCIA_TUTORIAS("asistenciatutoria","MatriculaAlumno, IdTutoria", ""),
    AYUDANTE ("ayudante", "RutAyudante, NombreAyudante, ApellidoAyudante, CorreoAyudante", "RutAyudante"),
    AYUDANTE_A_CARGO("ayudanteacargo", "IdAyudantia, RutAyudante", ""),
    AYUDANTIA ("ayudantia", "IdAyudantia, IdModulo", ""),
    BLOQUE("bloque", "IdBloque, HoraInicio, HoraTermino", "IdBloque"),
    CALIFICACION("calificacion", "IdEvaluacion, MatriculaAlumno, Nota, Comentario", ""),
    EVALUACION("evaluacion", "IdEvaluacion, IdTipoEvaluacion, IdModulo, FechaEvaluacion, Contenido", "IdEvaluacion"),
    HORARIO("horario", "IdHorario, IdSala, IdSeccion, DIA", "IdHorario"),
    HORARIO_BLOQUE("horariobloque", "IdHorario, IdBloque", ""),
    MODULO("modulo", "IdModulo, NombreModulo, SEMESTRE", "IdModulo"),
    PROFESOR("profesor", "RutProfesor, NombreProfesor, ApellidoProfesor, CorreoProfesor", "RutProfesor"),
    PROFESOR_A_CARGO("profesoracargo","RutProfesor, IdModulo", ""),
    SALA("sala", "IdSala, IdTiposala, NombreSala, CAPACIDAD", "IdSala"),
    SECCION("seccion", "IdSeccion, IdAyudantia, NombreSeccion", "IdSeccion"),
    TIPO_EVALUACION("tipoevaluacion", "IdTipoEvaluacion, Descripcion", "IdTipoEvaluacion"),
    TIPO_SALA("tiposala", "IdTiposala, Descripcion", "IdTipoSala"),
    TIPO_USUARIO("tipousuario", "IdTipoUsuario, NombreTipo", "IdTipoUsuario"),
    TUTOR("tutor", "RutTutor, NombreTutor, ApellidoTutor, CorreoTutor", "RutTutor"),
    TUTORIA("tutoria", "IdTutoria, RutTutor, Cantidad, Descripcion", "IdTutoria"),
    USUARIO("usuario", "RutUsuario, Password, IdTipoUsuario", "RutUsuario");
    
    private final String name;
    private final String parameters;
    private final String id;
    
    Tables(String databaseName, String parameters, String id){
        this.name = databaseName;
        this.parameters = parameters;
        this.id = id;
    }
    
    public String getDatabaseName(){
        return this.name;
    }
    
    public String getDatabaseParameters(){
        return this.parameters;
    }
    
    public String getId(){
        return this.id;
    }   
}
