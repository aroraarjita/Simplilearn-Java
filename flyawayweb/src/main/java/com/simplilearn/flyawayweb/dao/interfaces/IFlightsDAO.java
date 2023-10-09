package com.simplilearn.flyawayweb.dao.interfaces;

import java.util.List;

import com.simplilearn.flyawayweb.entity.Flight;

public interface IFlightsDAO {

	int addFlight(Flight flight);
	
	int updateFlight(Flight flight);
	
	int deleteFlight(Flight flight);
	
	List<Flight> getFlightList();
	
	Flight getFlightDetails(int id);
	
	List<Flight> searchFlights(String src, String dest);
}
