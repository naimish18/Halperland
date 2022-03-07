package helperland.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.UpdateServiceDao;

@Service
public class UpdateServiceService {
	@Autowired
	private UpdateServiceDao updateServiceDao;
	
	@Transactional
	public void updateService(int serviceId,Timestamp date) {
		updateServiceDao.updateService(serviceId, date);
	}
}
