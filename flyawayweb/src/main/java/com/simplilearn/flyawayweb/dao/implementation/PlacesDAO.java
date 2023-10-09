package com.simplilearn.flyawayweb.dao.implementation;

import java.util.List;

//import org.hibernate.Query;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simplilearn.flyawayweb.dao.interfaces.IPlacesDAO;
import com.simplilearn.flyawayweb.entity.Place;
import com.simplilearn.flyawayweb.utils.HibernateUtil;


public class PlacesDAO implements IPlacesDAO {

	public int addPlace(Place place) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();

		int result = (Integer) session.save(place);
		transaction.commit();
		session.close();
		return result;
	}

	public int updatePlace(Place place) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.update(place);
		transaction.commit();
		session.close();
		return 1;
	}

	public int deletePlace(Place place) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		if(getPlaceDetail(place.getPlaceId()) != null){
			session.delete(place);
			transaction.commit();
			session.close();
			return 1;
		}
		else
		{
			session.close();
			return 0;
		}
	}

	public List<Place> getPlaceList(){	
		List<Place> places = null;
	try{

		Session session = HibernateUtil.getSessionfactory().openSession();
		Query<Place> query = (Query<Place>)session.createQuery("from Place");		
	     places  = query.getResultList();
	
	}
	catch(Exception ex){
		System.out.println(ex.getMessage());
	}
		
	return places;
	}

	public Place getPlaceDetail(int id) {
		
		Place place = null;
		Session session = null;
		
		try{
			 session = HibernateUtil.getSessionfactory().openSession();
			place = session.load(Place.class, id);
		}
		catch(Exception ex){
			System.out.println("exception"+ ex.getMessage());
			place = null;
		}
		finally
		{
			session.close();
		}
		
		return place;
	}

}
