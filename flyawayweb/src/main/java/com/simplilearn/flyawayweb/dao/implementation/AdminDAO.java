package com.simplilearn.flyawayweb.dao.implementation;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simplilearn.flyawayweb.dao.interfaces.IAdminDAO;
import com.simplilearn.flyawayweb.entity.Admin;
import com.simplilearn.flyawayweb.utils.HibernateUtil;

public class AdminDAO implements IAdminDAO {

	public int addAdmin(Admin admin) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();

		int result = (Integer) session.save(admin);
		transaction.commit();
		session.close();
		return result;
	}

	public int updateAdmin(Admin admin) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.saveOrUpdate(admin);
		transaction.commit();
		session.close();
		return 1;
	}

	public Admin getAdminDetails(String username, String password) {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Admin admin = null;
		
		Query query = session.createQuery("from Admin where username= :username and password= :password");
		
		query.setParameter("username", username);
	    query.setParameter("password", password);
		
	     admin = (Admin) query.uniqueResult();
	     
	     session.close();
	    
		return admin;
	}

	public Long getAdminRowCount() {
		Session session = HibernateUtil.getSessionfactory().openSession();
		Query query = session.createQuery("select count(*) from Admin");
		Long count = (Long) query.uniqueResult();
		
		return count;
	}

}
