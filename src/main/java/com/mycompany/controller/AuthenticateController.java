/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class AuthenticateController {
    
    @GetMapping("/loginPage")
    public String showLoginForm(){
        return "login2";
    }
    @GetMapping("/access-denied")
    public String showAccess(){
        return "access-denied";
    }
    
}
