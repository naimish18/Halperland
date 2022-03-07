package helperland.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.Zipcode;

@Repository
public class ZipcodeDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Zipcode> getZipcode(){
		Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery < Zipcode > cq = cb.createQuery(Zipcode.class);
        Root < Zipcode > root = cq.from(Zipcode.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
	}
}
