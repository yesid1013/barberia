
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
@Entity(name="tipoDePago")
public class TipoDePago implements Serializable {
    @Id
    @Column(name="id_TipoDePago")
    private int id_TipoDePago;
    
    @Column(name="nom_tipo")
    private String nom_tipo;
    
    @Column(name="detalle_dePago")
    private String detalle_dePago;
}
