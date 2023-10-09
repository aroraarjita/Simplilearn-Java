package com.simplilearn.flyawayweb.dao.implementation;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simplilearn.flyawayweb.dao.interfaces.IAirlinesDAO;
import com.simplilearn.flyawayweb.entity.Airline;
import com.simplilearn.flyawayweb.utils.HibernateUtil;

public class AirlinesDAO implements IAirlinesDAO {

	public int addAirline(Airline airline) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		int result = (Integer) session.save(airline);
		transaction.commit();
		session.close();
		
		return result;
	}

	public int updateAirline(Airline airline) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.update(airline);
		transaction.commit();
		session.close();
		return 1;
	}

	public int deleteAirline(Airline airline) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		if(getAirlineDetails(airline.getAirlineId()) != null){
			session.delete(airline);
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

	public List<Airline> getAirlines() {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<Airline> airlines = null;
		
		try{
			Query<Airline> query = session.createQuery("from Airline");
			
			airlines = query.list();
		}
		catch(Exception ex){
			System.out.println("exception"+ ex.getMessage());
			
		}
		finally
		{
			session.close();
		}
	
		
		return airlines;
	}

	public Airline getAirlineDetails(int id) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Airline airline = null;
		
		try{
			airline = session.load(Airline.class, id);
		}
		catch(Exception ex){
			System.out.println("exception"+ ex.getMessage());
			airline = null;
		}
		finally
		{
			session.close();
		}
		
		
		return airline;
	}	
}
