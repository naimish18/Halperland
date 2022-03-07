package helperland.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.Servicerequestextra;

@Repository
public class ServicerequestextraDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveExtraService(Servicerequestextra servicerequestextra) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(servicerequestextra);
	}
	
	public String getExtraServices(int serviceId){
		Session session=sessionFactory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select ServiceExtraId from servicerequestextra where ServiceRequestId="+String.valueOf(serviceId));
		List<Integer> extraIds=query.getResultList(); 
		
		String extra_services_name="";
		
		Map<Integer, String> extraName=new HashMap<Integer, String>();
		extraName.put(1, "cabinate");
		extraName.put(2, "fridge");
		extraName.put(3, "oven");
		extraName.put(4, "wash&dry");
		extraName.put(5, "windows");
		
		for (Integer integer : extraIds) {
			extra_services_name+=extraName.get(integer)+" ";
		}
		
		return extra_services_name;
	}
}
