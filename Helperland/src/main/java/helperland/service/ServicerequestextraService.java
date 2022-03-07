package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.ServicerequestextraDao;
import helperland.model.Servicerequestextra;

@Service
public class ServicerequestextraService {
	
	@Autowired
	private ServicerequestextraDao servicerequestextraDao;
	
	@Transactional
	public void saveExtraService(Servicerequestextra servicerequestextra) {
		servicerequestextraDao.saveExtraService(servicerequestextra);
	}
	
	@Transactional
	public String getExtraServices(int serviceId){
		return servicerequestextraDao.getExtraServices(serviceId);
	}
}
