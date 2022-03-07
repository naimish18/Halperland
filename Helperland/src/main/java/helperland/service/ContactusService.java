package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.ContactusDao;
import helperland.model.Contactus;

@Service
public class ContactusService {

	@Autowired
	private ContactusDao contactusDao;
	
	@Transactional
	public void saveContactus(Contactus contactus) {
		contactusDao.saveContactus(contactus);
	}
}
