
package com.admin.barberia.DAO;

import com.admin.barberia.Models.Detalle_serv;
import com.admin.barberia.Models.Cita;
import com.admin.barberia.Models.Servicio;
import org.springframework.data.repository.CrudRepository;

public interface Detalle_servDao extends CrudRepository<Detalle_serv, Integer> {
    
}
