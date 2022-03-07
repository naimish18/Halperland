package helperland.dao;

import java.sql.PreparedStatement;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CancelServiceDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void cancelService(int serviceId) {
		Session session=sessionFactory.getCurrentSession();
		String sql="update servicerequest set Status='cancelled' where ServiceRequestId="+String.valueOf(serviceId);
		SQLQuery query=session.createSQLQuery(sql);
		query.executeUpdate();
	}
}
