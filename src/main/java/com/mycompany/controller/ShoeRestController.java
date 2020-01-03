package com.mycompany.controller;

import com.mycompany.entities.Product;
import com.mycompany.service.ShoeService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/shoes")
public class ShoeRestController {
    @Autowired
    ShoeService service;
    
    @GetMapping
    public ResponseEntity<List<Product>> list(){
        List<Product> list = service.getAllShoes();
        return ResponseEntity.ok().body(list);
    }
}
