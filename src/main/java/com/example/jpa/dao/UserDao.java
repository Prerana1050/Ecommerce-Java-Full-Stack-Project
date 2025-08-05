package com.example.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpa.entity.User;

public interface UserDao extends JpaRepository<User, String> {
	User findByEmailAndPassword(String email, String pass);
	User findByEmail(String email);
}
