
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
@Entity(name="cliente")
public class Cliente implements Serializable {
    @Id
    @Column(name="id_cliente")
    private int id_cliente;
    
    @Column(name="nom_cliente")
    private String nom_cliente;
    
    @Column(name="telefono")
    private String telefono;

    public Cliente() {
    }

    public Cliente(int id_cliente, String nom_cliente, String telefono) {
        this.id_cliente = id_cliente;
        this.nom_cliente = nom_cliente;
        this.telefono = telefono;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNom_cliente() {
        return nom_cliente;
    }

    public void setNom_cliente(String nom_cliente) {
        this.nom_cliente = nom_cliente;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
}
