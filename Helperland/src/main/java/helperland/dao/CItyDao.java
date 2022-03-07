package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.City;

@Repository
public class CItyDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public City getCity(int id) {
		Session session=sessionFactory.getCurrentSession();
		City city =session.get(City.class, id);
		return city;
	}
}
