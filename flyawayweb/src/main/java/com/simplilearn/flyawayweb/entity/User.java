package com.simplilearn.flyawayweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER")
public class User {

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="USER_ID")
	private int id;
	
	@Column(name="USER_NAME")
	private String name;
	
	@Column(name="EMAIL_ID")
	private String emailid;
	
	@Column(name="USER_CONTACT_NUM")
	private Long contactNumber;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int id, String name, String emailid, Long contactNumber) {
		super();
		this.id = id;
		this.name = name;
		this.emailid = emailid;
		this.contactNumber = contactNumber;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public Long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(Long contactNumber) {
		this.contactNumber = contactNumber;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", emailid=" + emailid + ", contactNumber=" + contactNumber + "]";
	}
	
	
}
