package gui;

/**
 * @author Pencho
 * @version 1.1, Last modification: 08-12-2017
 */

public class DataComboBox{
    private final int id;
    private final String descripcion;

    public DataComboBox(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    @Override
    public String toString(){
        return descripcion;
    }
}
