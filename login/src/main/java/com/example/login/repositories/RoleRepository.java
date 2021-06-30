package com.example.login.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.login.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    
    Role findByRole(final String role);

}
