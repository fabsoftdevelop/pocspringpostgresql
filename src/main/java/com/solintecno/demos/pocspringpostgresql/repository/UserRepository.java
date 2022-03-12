package com.solintecno.demos.pocspringpostgresql.repository;

import com.solintecno.demos.pocspringpostgresql.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query(value = "select * from public.\"add_user\"(?1, ?2, ?3)", nativeQuery = true)
    int insertarUsuario(String newusername, String newpassword, String rolename);

}
