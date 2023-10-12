package com.simplilearn.springboot.crud.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplilearn.springboot.crud.entity.Book;
import com.simplilearn.springboot.crud.repository.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepository;

	public List<Book> getAllBooks() {

		List<Book> books = new ArrayList<Book>();
		bookRepository.findAll().forEach(book -> books.add(book));

		return books;

	}

	public int save(Book book) {

		Book savedBook = bookRepository.save(book);
		return savedBook.getBookId();
	}

//	public int saveAll(List<Book> books) {
//
//		Iterable<Book> savedBooks = bookRepository.saveAll(books);
//		return savedBooks.stream().map(book -> book.getBookId()).collect(collector));
//	}
	
	public int update(Book book){
		return save(book);
	}
	
	public void deleteBookById(int id){
		bookRepository.deleteById(id);
	}
}
