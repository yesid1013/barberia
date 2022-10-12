
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
@Entity(name="detalle_serv")
public class Detalle_serv implements Serializable {
    @Id
    @Column(name="id_detalleServ")
    private int id_cliente;
    
    @ManyToOne
    @JoinColumn(name="id_cita_fk")
    private Cita cita;
    
    @ManyToOne
    @JoinColumn(name="id_servicio")
    private Servicio servicio;
}
