/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
    
      
    @RequestMapping
    public String home(){
        return "home";
    }
    
      
    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }
     
    @RequestMapping("/user")
    public String user(){
        return "user";
    }
   
}
