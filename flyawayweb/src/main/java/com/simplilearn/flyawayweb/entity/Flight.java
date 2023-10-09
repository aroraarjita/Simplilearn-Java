package com.simplilearn.flyawayweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="FLIGHT")
public class Flight {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="FLIGHT_ID")
	private int flightId;
	
	@Column(name="FLIGHT_NAME")
	private String flightName;
	
	@OneToOne
	@JoinColumn(name="AIRLINE_ID")
	private Airline airlineId;
	
	@ManyToOne
	@JoinColumn(name="PLACE_SOURCE")
	private Place source;
	
	@ManyToOne
	@JoinColumn(name="PLACE_DESTINATION")
	private Place destination;
	
	@Column(name="FLIGHT_PRICE")
	private int price;
	
	public Flight() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Flight(int flightId, String flightName, Airline airlineId, Place source, Place destination, int price) {
		super();
		this.flightId = flightId;
		this.flightName = flightName;
		this.airlineId = airlineId;
		this.source = source;
		this.destination = destination;
		this.price = price;
	}

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	public Airline getAirlineId() {
		return airlineId;
	}

	public void setAirlineId(Airline airlineId) {
		this.airlineId = airlineId;
	}

	public Place getSource() {
		return source;
	}

	public void setSource(Place source) {
		this.source = source;
	}

	public Place getDestination() {
		return destination;
	}

	public void setDestination(Place destination) {
		this.destination = destination;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Flight [flightId=" + flightId + ", flightName=" + flightName + ", airlineId=" + airlineId + ", source="
				+ source + ", destination=" + destination + ", price=" + price + "]";
	}




}
