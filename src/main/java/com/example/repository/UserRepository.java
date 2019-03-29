package com.example.repository;

import com.example.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * Created by root on 3/20/19.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String name);

    User findByActivationCode(String code);
}
