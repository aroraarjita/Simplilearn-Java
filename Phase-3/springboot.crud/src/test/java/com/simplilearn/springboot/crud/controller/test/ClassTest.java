package com.simplilearn.springboot.crud.controller.test;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.simplilearn.springboot.crud.controller.BookController;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.jupiter.api.BeforeAll;


public class ClassTest {
private BookController bookController;
	
	@BeforeAll
	private void testSetup(){
		bookController = new BookController();
	}

	@Test
	private void getAllBooksTest(){
		
		bookController.getAllBooks();
	}

}
