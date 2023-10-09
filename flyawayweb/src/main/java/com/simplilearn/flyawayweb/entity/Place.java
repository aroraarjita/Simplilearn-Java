package com.simplilearn.flyawayweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PLACE")
public class Place {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="PLACE_ID")
	private int placeId;
	
	@Column(name="PLACE_CODE")
	private String placeCode;
	
	@Column(name="PLACE_NAME")
	private String placeName;
	
	
	public Place() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Place(int placeId, String placeCode, String placeName) {
		super();
		this.placeId = placeId;
		this.placeCode = placeCode;
		this.placeName = placeName;
	}


	public int getPlaceId() {
		return placeId;
	}

	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}

	public String getPlaceCode() {
		return placeCode;
	}

	public void setPlaceCode(String placeCode) {
		this.placeCode = placeCode;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	@Override
	public String toString() {
		return "Places [placeId=" + placeId + ", placeCode=" + placeCode + ", placeName=" + placeName + "]";
	}
	
	

}
