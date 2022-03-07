package helperland.dao;

import java.sql.Timestamp;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UpdateServiceDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void updateService(int serviceId,Timestamp date) {
		Session session=sessionFactory.getCurrentSession();
		String sql="update servicerequest set ServiceStartDate=:date where ServiceRequestId="+serviceId;
		System.out.println(sql);
		SQLQuery query=session.createSQLQuery(sql);
		query.setParameter("date", date);
		query.executeUpdate();
	}
}
