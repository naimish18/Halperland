package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.CancelServiceDao;

@Service
public class CancelServiceService {
	@Autowired
	private CancelServiceDao cancelServiceDao;
	
	@Transactional
	public void cancelService(int serviceId) {
		cancelServiceDao.cancelService(serviceId);
	}
}
