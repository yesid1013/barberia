
package com.admin.barberia.DAO;

import com.admin.barberia.Models.Cita;
import com.admin.barberia.Models.Cliente;
import com.admin.barberia.Models.Barbero;
import com.admin.barberia.Models.TipoDePago;
import org.springframework.data.repository.CrudRepository;

public interface CitaDao extends CrudRepository<Cita, Integer> {
    
}
