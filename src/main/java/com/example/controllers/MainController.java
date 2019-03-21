package com.example.controllers;

import com.example.entity.Person;
import com.example.entity.User;
import com.example.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * Created by root on 3/18/19.
 */


@Controller
public class MainController {
    @Autowired
    private PersonRepository personRepository;

    @GetMapping("/")
    public String greeting() {
        return "home";
    }

    @GetMapping("/main")
    public String getMain(Map<String, Object> model) {
        model.put("users", personRepository.findAll());
        return "main";
    }

    @PostMapping("main")
    public String addPerson(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String email, Map<String, Object> model) {
        personRepository.save(new Person(name, email, user));
        model.put("users", personRepository.findByName(name));
        return "main";
    }

    @PostMapping("filter")
    public String doFilter (@RequestParam String name, Map<String, Object> model) {
        model.put("users", personRepository.findByName(name));
        return "main";
    }

}