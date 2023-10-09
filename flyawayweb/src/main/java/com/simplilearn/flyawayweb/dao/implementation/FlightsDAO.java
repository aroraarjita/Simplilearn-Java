package com.simplilearn.flyawayweb.dao.implementation;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.simplilearn.flyawayweb.dao.interfaces.IFlightsDAO;
import com.simplilearn.flyawayweb.entity.Flight;
import com.simplilearn.flyawayweb.utils.HibernateUtil;

public class FlightsDAO implements IFlightsDAO {

	public int addFlight(Flight flight) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		int result = (Integer) session.save(flight);
		transaction.commit();
		session.close();
		
		return result;
	}

	public int updateFlight(Flight flight) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.update(flight);
		transaction.commit();
		session.close();
		return 1;
	}

	public int deleteFlight(Flight flight) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		if(getFlightDetails(flight.getFlightId()) != null){
			session.delete(flight);
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

	public List<Flight> getFlightList() {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<Flight> flights = null;
		
		try{
			Query<Flight> query = session.createQuery("from Flight");
			
			flights = query.list();
		}
		catch(Exception ex){
			System.out.println("exception"+ ex.getMessage());
			
		}
		finally
		{
			session.close();
		}
		return flights;
	}

	public Flight getFlightDetails(int id) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Flight flight = null;
		
		try{
			flight = session.load(Flight.class, id);
		}
		catch(Exception ex){
			System.out.println("exception"+ ex.getMessage());
		}
		finally
		{
			session.close();
		}
		
		return flight;
	}

	public List<Flight> searchFlights(String src, String dest) {
		/*Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<Flight> flights = null;*/
		List<Flight> airlineList = new ArrayList<Flight>();
		 Session session = HibernateUtil.getSessionfactory().openSession();
		
		try{
			
			/*Criteria crit = session.createCriteria(Flight.class);
			Criterion source = Restrictions.eq("TRAVEL_SOURCE", src);
			Criterion destionation = Restrictions.eq("TRAVEL_DESTINATION",dest);
			
			LogicalExpression andExpression = Restrictions.and(source, destionation);
			crit.add(andExpression);
					
			
			//Query<Flight> query = session.createQuery("from FLIGHT where TRAVEL_SOURCE= :source");
			flights = crit.list();*/
						
			//**creating CriteriaBuilder**
			/*CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Flight> criteria = builder.createQuery(Flight.class);
			Root<Flight> flightRoot=criteria.from(Flight.class);
			criteria.select(flightRoot);

			//**Adding where clause**
			criteria.where(builder.equal(flightRoot.get("source"), src));	
			criteria.where(builder.equal(flightRoot.get("destination"), dest));
			flights=session.createQuery(criteria).getResultList();	
			
			*/
			
			
			 
			 Criteria criteriaObj = session.createCriteria(Flight.class,"flight");
			 criteriaObj.createAlias("flight.source", "srcfd");
			 criteriaObj.createAlias("flight.destination", "destfd");
			 
			 Criterion criterionObj1 = Restrictions.eq("srcfd.placeId", Integer.parseInt(src));  // roll_No >= 2
			Criterion criterionObj2 = Restrictions.eq("destfd.placeId",Integer.parseInt(dest));
			criteriaObj.add(Restrictions.and(criterionObj1, criterionObj2));
			airlineList = criteriaObj.list();
		}
		catch(Exception ex){
			System.out.println("exception"+ ex.getMessage());
			
		}
		finally
		{
			session.close();
		}
		
		return airlineList;
	}

}
