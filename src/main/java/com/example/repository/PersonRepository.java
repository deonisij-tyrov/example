package com.example.repository;

import com.example.entity.Person;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by root on 3/18/19.
 */

public interface PersonRepository extends CrudRepository<Person, Integer> {
    List<Person> findByName(String name);
}
