package com.simplilearn.springboot.crud.controller.test;


import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import com.simplilearn.springboot.crud.controller.BookController;



public class BookControllerTest {

	
	private static BookController bookController;
	
	@BeforeAll
	public static void setUp() throws Exception {
		bookController = new BookController();
	}

	@Test
	public void getAllBooksTest() {
		
		bookController.getAllBooks();
	}

}
