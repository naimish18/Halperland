package helperland.dao;

import java.math.BigDecimal;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helperland.model.Rating;

@Repository
public class RatingDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveRatings(Rating rating) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(rating);
	}
	
	public double getRatings(int providerId) {
		Session session=sessionFactory.getCurrentSession();
		String sql="select avg(Ratings) from rating where RatingTo="+providerId;
		SQLQuery query=session.createSQLQuery(sql);
		BigDecimal rating;
		rating=(BigDecimal) query.getResultList().get(0);
		if(rating!=null) {
			return rating.doubleValue();
		}
		return 0.0;
	}
}
