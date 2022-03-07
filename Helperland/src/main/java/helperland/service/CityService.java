package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.CItyDao;
import helperland.model.City;

@Service
public class CityService {
	@Autowired
	private CItyDao cItyDao;
	
	@Transactional
	public City getCity(int id) {
		return cItyDao.getCity(id);
	}
}
