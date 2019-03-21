package com.example.controllers;

import com.example.entity.Role;
import com.example.entity.User;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

/**
 * Created by root on 3/20/19.
 */

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        if(userRepository.findByName(user.getName()) != null) {
            model.put("message", "User exist");
            return "registration";
        }
        System.out.println("test"+user.toString());
        user.setActive(true);
        user.setRoleSet(Collections.singleton(Role.USER));
        userRepository.save(user);

        return "redirect:/login";
    }
}
