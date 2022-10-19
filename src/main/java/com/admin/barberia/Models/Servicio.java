
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
@Entity(name="servicio")

public class Servicio implements Serializable {
    @Id
    @Column(name="id_servicio")
    private int id_servicio;
    
    @Column(name="nom_servicio")
    private String nom_servicio;
    
    @Column(name="valor")
    private float valor;

    public Servicio() {
    }

    public Servicio(int id_servicio, String nom_servicio, float valor) {
        this.id_servicio = id_servicio;
        this.nom_servicio = nom_servicio;
        this.valor = valor;
    }

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

    public String getNom_servicio() {
        return nom_servicio;
    }

    public void setNom_servicio(String nom_servicio) {
        this.nom_servicio = nom_servicio;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
    
    
    
}
