
package com.admin.barberia.Controller;

import com.admin.barberia.Models.Barbero;
import com.admin.barberia.Service.BarberoService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin("*")
@RequestMapping("/barbero")
public class BarberoController {
    @Autowired
    private BarberoService barberoService;
    
    @PostMapping(value="/")
    public ResponseEntity<Barbero> agregar(@RequestBody Barbero barbero){
        Barbero obj = barberoService.save(barbero);
        return new ResponseEntity<>(obj, HttpStatus.OK);
    }
    
    @DeleteMapping(value="/{id}")
    public ResponseEntity<Barbero> eliminar(@PathVariable Integer id){
        Barbero obj = barberoService.findById(id);
        if(obj!=null){
            barberoService.delete(id);
        } else {
            return new ResponseEntity<>(obj, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(obj, HttpStatus.OK);
    }
    
    @PutMapping(value="/")
    public ResponseEntity<Barbero> editar(@RequestBody Barbero barbero){
        Barbero obj = barberoService.findById(barbero.getId_barbero());
        if(obj!=null){
            obj.setNom_barbero(barbero.getNom_barbero());
            obj.setCorreo_barbero(barbero.getCorreo_barbero());
            barberoService.save(obj);
        } else {
            return new ResponseEntity<>(obj, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(obj, HttpStatus.OK);
    }
    
    @GetMapping("/list")
    public List<Barbero> consultarTodo(){
        return barberoService.findByAll();
    }
    
    @GetMapping("/list/{id}")
    public Barbero consultarPorId(@PathVariable Integer id){
        return barberoService.findById(id);
    }
}
