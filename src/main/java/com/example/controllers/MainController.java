package com.example.controllers;

import com.example.entity.Person;
import com.example.entity.User;
import com.example.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by root on 3/18/19.
 */


@Controller
public class MainController {
    @Autowired
    private PersonRepository personRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting() {
        return "home";
    }

    @GetMapping("/main")
    public String getMain(@RequestParam(required = false, defaultValue = "") String name, Model model) {
        if (name != null && !name.isEmpty()) {
            model.addAttribute("persons", personRepository.findByName(name));
        } else {
            model.addAttribute("persons", personRepository.findAll());
        }

        model.addAttribute("name", name);

        return "main";
    }

    @PostMapping("/main")
    public String addPerson(
            @RequestParam("file") MultipartFile file,
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String email, Map<String, Object> model) throws IOException {
        Person person = new Person(name, email, user);
        if (file != null && !file.isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + " " + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            person.setFilename(resultFileName);
        }
        personRepository.save(person);
        model.put("persons", personRepository.findByName(name));
        return "main";
    }
}