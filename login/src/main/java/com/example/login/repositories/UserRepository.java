package com.example.login.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.login.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    
    User findByEmail(final String email);

}
