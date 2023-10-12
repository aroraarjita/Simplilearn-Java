package com.simplilearn.springboot.crud.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simplilearn.springboot.crud.entity.Book;
import com.simplilearn.springboot.crud.service.BookService;

@RestController
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("/books")
	public List<Book> getAllBooks(){
		return bookService.getAllBooks();		
	}
	
	@PostMapping("/save/book")
	public int saveBook(@RequestBody Book book){
		return bookService.save(book);
	}
	
	@PutMapping("/update/book")
	public int updateBook(@RequestBody Book book ){
		return bookService.update(book);
	}
	
	@DeleteMapping("/delete/book/{bookid}")
	public void deleteBook(@PathVariable("bookid")int bookid){
		bookService.deleteBookById(bookid);
	}
}
