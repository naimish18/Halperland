package helperland.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.Servicerequestaddress;

@Repository
public class ServicerequestaddressDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveServiceAddress(Servicerequestaddress servicerequestaddress) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(servicerequestaddress);
	}
	
	public List<Servicerequestaddress> getServiceAddresses(int serviceId) {
		Session session=sessionFactory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select * from servicerequestaddress where ServiceRequestId="+String.valueOf(serviceId));
		query.addEntity(Servicerequestaddress.class);
		return query.getResultList();
		
	}
}
