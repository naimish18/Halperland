package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.ServicerequestDao;
import helperland.model.Servicerequest;

@Service
public class ServicerequestService {
	@Autowired
	private ServicerequestDao servicerequestDao;
	
	@Transactional
	public void saveServicerequest(Servicerequest servicerequest) {
		servicerequestDao.saveServicerequest(servicerequest);
	}
	
	@Transactional
	public List<Servicerequest> getServiceRequests(int id) {
		return servicerequestDao.getServicerequests(id);
	}
	
	@Transactional
	public List<Servicerequest> getServiceRequests() {
		return servicerequestDao.getServicerequests();
	}
	
	@Transactional
	public void acceptService(int serviceProId,int serviceReqId) {
		servicerequestDao.acceptService(serviceProId, serviceReqId);
	}
}
