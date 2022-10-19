
package com.admin.barberia.Models;

import java.io.Serializable;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.GenerationType;

@Table
@Entity(name="cita")
public class Cita implements Serializable {
    @Id
    @Column(name="id_cita")
    private int id_cita;
    
    //Llave foranea muchos a uno id_cliente
    @ManyToOne
    @JoinColumn(name="id_cliente_fk")
    private Cliente cliente;
    
    @ManyToOne
    @JoinColumn(name="id_barbero_fk")
    private Barbero barbero;
    
    @Column(name="fecha_cita")
    private String fecha_cita;
    
    @ManyToOne
    @JoinColumn(name="id_TipoDepago_fk")
    private TipoDePago tipoDepago;

    public Cita() {
    }

    public Cita(int id_cita, Cliente cliente, Barbero barbero, String fecha_cita, TipoDePago tipoDepago) {
        this.id_cita = id_cita;
        this.cliente = cliente;
        this.barbero = barbero;
        this.fecha_cita = fecha_cita;
        this.tipoDepago = tipoDepago;
    }

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Barbero getBarbero() {
        return barbero;
    }

    public void setBarbero(Barbero barbero) {
        this.barbero = barbero;
    }

    public String getFecha_cita() {
        return fecha_cita;
    }

    public void setFecha_cita(String fecha_cita) {
        this.fecha_cita = fecha_cita;
    }

    public TipoDePago getTipoDepago() {
        return tipoDepago;
    }

    public void setTipoDepago(TipoDePago tipoDepago) {
        this.tipoDepago = tipoDepago;
    }

    
    
    
    
}
