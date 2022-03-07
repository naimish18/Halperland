package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.Contactus;

@Repository
public class ContactusDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveContactus(Contactus contactus) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(contactus);
	}
}
