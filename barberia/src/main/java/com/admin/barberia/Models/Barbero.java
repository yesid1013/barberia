
package com.admin.barberia.Models;

import java.io.Serializable;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;


@Table
@Entity(name="barbero")
public class Barbero implements Serializable {
    //Columna id barbero
    @Id
    @Column(name="id_barbero")
    private int id_barbero;
    
    //Columna nombre barbero
    @Column(name="nom_barbero")
    private String nom_barbero;
    
    //Columna correo barbero
    @Column(name="correo_barbero")
    private String correo_barbero;

    public Barbero() {
    }

    public Barbero(int id_barbero, String nom_barbero, String correo_barbero) {
        this.id_barbero = id_barbero;
        this.nom_barbero = nom_barbero;
        this.correo_barbero = correo_barbero;
    }

    public int getId_barbero() {
        return id_barbero;
    }

    public void setId_barbero(int id_barbero) {
        this.id_barbero = id_barbero;
    }

    public String getNom_barbero() {
        return nom_barbero;
    }

    public void setNom_barbero(String nom_barbero) {
        this.nom_barbero = nom_barbero;
    }

    public String getCorreo_barbero() {
        return correo_barbero;
    }

    public void setCorreo_barbero(String correo_barbero) {
        this.correo_barbero = correo_barbero;
    }
  
    

    
    
    
    
}
