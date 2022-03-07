package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.ZipcodeDao;
import helperland.model.Zipcode;

@Service
public class ZipcodeService {
	@Autowired
	private ZipcodeDao zipcodeDao;
	
	@Transactional
	public List<Zipcode> getZipcode(){
		return zipcodeDao.getZipcode();
	}

}
