package com.solintecno.demos.pocspringpostgresql.services.impl;

import com.solintecno.demos.pocspringpostgresql.model.User;
import com.solintecno.demos.pocspringpostgresql.repository.UserRepository;
import com.solintecno.demos.pocspringpostgresql.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public int insertarUsuario(User user) {
        return userRepository.insertarUsuario(user.getUsername(), user.getPassword(), user.getRole());
    }
}
