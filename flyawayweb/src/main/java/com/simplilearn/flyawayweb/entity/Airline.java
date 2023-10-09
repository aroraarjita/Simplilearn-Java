package com.simplilearn.flyawayweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="AIRLINE")
public class Airline {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="AIRLINE_ID")
	private int airlineId;
	
	@Column(name="AIRLINE_CODE")
	private String airlineCode;
	
	@Column(name="AIRLINE_NAME")
	private String airlineName;

	
	public Airline() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Airline(int airlineId, String airlineCode, String airlineName) {
		super();
		this.airlineId = airlineId;
		this.airlineCode = airlineCode;
		this.airlineName = airlineName;
	}


	public int getAirlineId() {
		return airlineId;
	}

	public void setAirlineId(int airlineId) {
		this.airlineId = airlineId;
	}

	public String getAirlineCode() {
		return airlineCode;
	}

	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}

	public String getAirlineName() {
		return airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	@Override
	public String toString() {
		return "Airlines [airlineId=" + airlineId + ", airlineCode=" + airlineCode + ", airlineName=" + airlineName
				+ "]";
	}
	
}
