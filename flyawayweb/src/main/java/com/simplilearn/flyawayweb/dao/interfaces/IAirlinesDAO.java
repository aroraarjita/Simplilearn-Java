package com.simplilearn.flyawayweb.dao.interfaces;

import java.util.List;

import com.simplilearn.flyawayweb.entity.Airline;

public interface IAirlinesDAO {
	
	int addAirline(Airline airline);
	
    int updateAirline(Airline airline);
	
    int deleteAirline(Airline airline);
	
	List<Airline>getAirlines();
	
	Airline getAirlineDetails(int id);
	
	
	

}
