package com.solintecno.demos.pocspringpostgresql.controllers;

import com.solintecno.demos.pocspringpostgresql.model.Response;
import com.solintecno.demos.pocspringpostgresql.model.User;
import com.solintecno.demos.pocspringpostgresql.services.UsuarioService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/")
    public Response save(@RequestBody User user){
        log.info("Accediendo al metodo save dentro de UserController");
        int data = usuarioService.insertarUsuario(user);
        return new Response(data);
    }


}
