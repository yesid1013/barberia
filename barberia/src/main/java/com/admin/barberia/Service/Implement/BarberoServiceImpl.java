
package com.admin.barberia.Service.Implement;

import com.admin.barberia.DAO.BarberoDao;
import com.admin.barberia.Models.Barbero;
import com.admin.barberia.Service.BarberoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class BarberoServiceImpl implements BarberoService  {
    @Autowired
    private BarberoDao barberoDao;
    
    @Override
    @Transactional(readOnly=false)
    public Barbero save(Barbero barbero){
        return barberoDao.save(barbero);
    }
    
    @Override
    @Transactional(readOnly=false)
    public void delete(Integer id){
        barberoDao.deleteById(id);
    }
    
    @Override
    @Transactional(readOnly=true)
    public Barbero findById(Integer id){
        return barberoDao.findById(id).orElse(null);
    }
    
    @Override
    @Transactional(readOnly=true)
    public List<Barbero> findByAll(){
        return (List<Barbero>) barberoDao.findAll();
    }
}
