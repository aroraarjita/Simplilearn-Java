package com.simplilearn.flyawayweb.dao.interfaces;

import java.util.List;

import com.simplilearn.flyawayweb.entity.Place;

public interface IPlacesDAO {
	
    int addPlace(Place place);
	
	int updatePlace(Place place);
	
	int deletePlace(Place place);
	
	List<Place>getPlaceList();
	
	Place getPlaceDetail(int id);

}
