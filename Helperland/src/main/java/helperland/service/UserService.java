package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.UserDao;
import helperland.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Transactional
	public void saveUser(User user) {
		userDao.saveUser(user);
	}
	
	@Transactional
	public List<User> getUsers(){
		return userDao.getUsers();
	}
	
	@Transactional
	public User getUser(int UserId) {
		return userDao.getUser(UserId);
	}
	
	@Transactional
	public void updatePassword(int UserId,String password) {
		userDao.updatePassword(UserId, password);
	}
	
}
