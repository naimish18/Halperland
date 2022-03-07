package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.ServicerequestaddressDao;
import helperland.model.Servicerequestaddress;

@Service
public class ServicerequestaddressService {
	@Autowired
	private ServicerequestaddressDao servicerequestaddressDao;
	
	@Transactional
	public void saveServiceAddress(Servicerequestaddress servicerequestaddress) {
		servicerequestaddressDao.saveServiceAddress(servicerequestaddress);
	}
	
	@Transactional
	public List<Servicerequestaddress> getServiceaddresses(int serviceId){
		return servicerequestaddressDao.getServiceAddresses(serviceId);
	}
}
