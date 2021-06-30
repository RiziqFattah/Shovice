package com.example.login.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.login.model.Request;

public interface RequestRepository extends JpaRepository<Request, Long> {
    
    Request findById(final String id);
}
