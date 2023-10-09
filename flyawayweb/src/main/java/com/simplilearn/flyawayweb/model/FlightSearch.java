package com.simplilearn.flyawayweb.model;

public class FlightSearch {
	
	private String travelDate;
	
	private String source;
	
	private String destination;
	
	private int count;
	
	public FlightSearch() {
		super();
		// TODO Auto-generated constructor stub
	}	
	public FlightSearch(String travelDate, String source, String destination, int count) {
		super();
		this.travelDate = travelDate;
		this.source = source;
		this.destination = destination;
		this.count = count;
	}

	public String getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "FlightSearch [travelDate=" + travelDate + ", source=" + source + ", destination=" + destination
				+ ", count=" + count + "]";
	}

	
}
