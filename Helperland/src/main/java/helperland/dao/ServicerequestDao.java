package helperland.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.Servicerequest;

@Repository
public class ServicerequestDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveServicerequest(Servicerequest servicerequest) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(servicerequest);
	}
	
	public List<Servicerequest> getServicerequests(int id) {
		Session session=sessionFactory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select * from servicerequest where UserId="+id);
		query.addEntity(Servicerequest.class);
		List<Servicerequest> results=query.list();
		return results;
		
	}
	
	public List<Servicerequest> getServicerequests() {
		Session session=sessionFactory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select * from servicerequest");
		query.addEntity(Servicerequest.class);
		List<Servicerequest> results=query.list();
		return results;
		
	}
	
	public void acceptService(int serviceProId ,int serviceReqId) {
		Session session=sessionFactory.getCurrentSession();
		String sql="update servicerequest set ServiceProviderId=:sp_id where ServiceRequestId=:s_id";
		SQLQuery query=session.createSQLQuery(sql);
		query.setParameter("sp_id", serviceProId);
		query.setParameter("s_id", serviceReqId);
		query.executeUpdate();
	}
}
