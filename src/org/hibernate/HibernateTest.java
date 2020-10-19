package org.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.tu.varna.USER_RIGHTS;

public class HibernateTest {
	public static void main(String[] args) {
		USER_RIGHTS user = new USER_RIGHTS();
		user.setRIGHTS(true);
		user.setDESCRIPTION("TEST");
	
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}
}
