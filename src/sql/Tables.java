package sql;

/**
 * @author Pencho
 * @version 1.0, Last modification: 01-12-2017
 */

public enum Tables {
    ALUMNO ("alumno", "IdAlumno, NombreAlumno, ApellidoAlumno, MatriculaAlumno, CorreoAlumno"),
    ASISTE ("asiste", "IdAlumno, IdTutoria"),
    AYUDA ("ayuda", "IdAyudantia, IdAyudante"),
    AYUDANTE ("ayudante", "IdAyudante, NombreAyudante, ApellidoAyudante, CorreoAyudante"),
    AYUDANTIA ("ayudantia", "IdAyudantia, IdModulo"),
    BLOQUE("bloque", "IdBloque, HoraInicio, HoraTermino"),
    CALIFICACION("calificacion", "IdEvaluacion, IdAlumno, NOTA"),
    CARRERA("carrera", "IdCarrera, IdModulo, NombreCarrera, NombreDirector, TelefonoCarrera"),
    EVALUACIONES("evaluaciones", "IdEvaluacion, IdTipoevaluacion, IdProfesor, IdModulo, FechaEvaluacion, CONTENIDO"),
    HORARIO("horario", "IdHorario, IdSala, IdSeccion, DIA"),
    HORARIO_BLOQUE("horariobloque", "IdHorario, IdBloque"),
    MODULO("modulo", "IdModulo, SEMESTRE, NombreModulo"),
    PROFESOR("profesor", "IdProfesor, NombreProfesor, ApellidoProfesor, CorreoProfesor"),
    SALA("sala", "IdSala, IdTiposala, CAPACIDAD"),
    SECCION("seccion", "IdSeccion, IdAyudantia, NombreSeccion"),
    TIPO_EVALUACION("tipoevaluacion", "IdTipoevaluacion, DESCRIPCION"),
    TIPO_SALA("tiposala", "IdTiposala, DESCRIPCION"),
    TUTOR("tutor", "IdTutor, NombreTutor, ApellidoTutor, CorreoTutor"),
    TUTORIA("tutoria", "IdTutoria, IdTutor, CANTIDAD, DESCRIPCION");
    
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
