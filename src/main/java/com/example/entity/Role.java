package com.example.entity;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by root on 3/20/19.
 */
public enum  Role implements GrantedAuthority {
    USER, ADMIN;


    @Override
    public String getAuthority() {
        return name();
    }
}
