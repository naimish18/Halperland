package helperland.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.User;

@Repository
public class UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveUser(User user) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
		
	}
	
	public List<User> getUsers(){
		Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery < User > cq = cb.createQuery(User.class);
        Root < User > root = cq.from(User.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
	}
	
	public User getUser(int UserId) {
		Session session=sessionFactory.getCurrentSession();
		User user =session.get(User.class, UserId);
		return user;
	}
	
	public void updatePassword(int UserId,String password) {
		Session session=sessionFactory.getCurrentSession();
		String sql="update user set Password=:pass where UserId="+UserId;
		SQLQuery query=session.createSQLQuery(sql);
		query.setParameter("pass", password);
		query.executeUpdate();
	}
}
