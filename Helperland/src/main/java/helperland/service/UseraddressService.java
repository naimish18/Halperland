package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.UseraddressDao;
import helperland.model.Useraddress;

@Service
public class UseraddressService {
	@Autowired
	private UseraddressDao useraddressDao;
	
	@Transactional
	public void saveAddress(Useraddress useraddress) {
		useraddressDao.saveAddress(useraddress);
	}
	
	@Transactional
	public List<Useraddress> getAddresses(){
		return useraddressDao.getAddresses();
	}
	
	@Transactional
	public Useraddress getAddress(int AddressId) {
		return useraddressDao.getAddress(AddressId);
	}
	
	@Transactional
	public void deleteAddress(int AddressId) {
		useraddressDao.deleteAddress(AddressId);
	}
}
