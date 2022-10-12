
package com.admin.barberia.Service;

import com.admin.barberia.Models.Barbero;
import java.util.List;

public interface BarberoService {
    public Barbero save (Barbero barbero);
    public void delete (Integer id);
    public Barbero findById (Integer id);
    public List<Barbero> findByAll();
}
