package com.simplilearn.springboot.crud.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.simplilearn.springboot.crud.entity.Book;

@Repository
public interface BookRepository extends CrudRepository<Book,Integer>{



}

