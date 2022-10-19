
package com.admin.barberia.DAO;

import com.admin.barberia.Models.Cliente;
import org.springframework.data.repository.CrudRepository;

public interface ClienteDao extends CrudRepository<Cliente, Integer> {
    
}
