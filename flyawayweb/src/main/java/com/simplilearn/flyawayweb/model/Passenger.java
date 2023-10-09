package com.simplilearn.flyawayweb.model;

public class Passenger {
	
	private String fullName;
	
	private String email;
	
	private String mobileNumber;
	
	private int age;

	public Passenger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Passenger(String fullName, String email, String mobileNumber, int age) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.age = age;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Passenger [fullName=" + fullName + ", email=" + email + ", mobileNumber=" + mobileNumber + ", age="
				+ age + "]";
	}
	
}
