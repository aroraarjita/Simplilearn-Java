package com.simplilearn.flyawayweb.utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
//import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static SessionFactory sessionfactory;

	static {

		try {

//			StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
//			Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
//			HibernateUtil.sessionfactory = meta.getSessionFactoryBuilder().build();
			
			
//			  StandardServiceRegistry ssr = new StandardServiceRegistryBuilder()
//					  .configure("hibernate.cfg.xml")
//					  .build();				
//				Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();				
//				SessionFactory sf =  meta.getSessionFactoryBuilder().build();
//				
			

//			   Configuration cfg = new Configuration().configure();
//			   StandardServiceRegistryBuilder builder = new
//			   StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
//			   sessionfactory = cfg.buildSessionFactory(builder.build());
			   
			   Configuration config = new Configuration();
			   config.configure();
			   // local SessionFactory bean created
			   sessionfactory = config.buildSessionFactory();
			   //Session session = sessionFactory.getCurrentSession();
			 
				
				
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);

			throw new ExceptionInInitializerError(ex);
		}

	}

	public HibernateUtil() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static SessionFactory getSessionfactory() {
	
		return sessionfactory;
	}

}
