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

import helperland.model.Useraddress;

@Repository
public class UseraddressDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveAddress(Useraddress useraddress) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(useraddress);
		
	}
	
	public List<Useraddress> getAddresses(){
		Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery < Useraddress > cq = cb.createQuery(Useraddress.class);
        Root < Useraddress > root = cq.from(Useraddress.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
	}
	
	public Useraddress getAddress(int AddressId) {
		Session session=sessionFactory.getCurrentSession();
		Useraddress useraddress=session.get(Useraddress.class,AddressId);
		return useraddress;
	}
	
	public void deleteAddress(int AddressId) {
		Session session=sessionFactory.getCurrentSession();
		String sql="update useraddress set IsDeleted=true where AddressId="+AddressId;
		SQLQuery query=session.createSQLQuery(sql);
		query.executeUpdate();
	}
}
