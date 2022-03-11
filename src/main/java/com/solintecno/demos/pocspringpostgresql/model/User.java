package com.solintecno.demos.pocspringpostgresql.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "app_user", schema = "public")
public class User {
    @Id
    @Column(name="id")
    private int id;
    public String role;
    public String password;
    public String username;
}