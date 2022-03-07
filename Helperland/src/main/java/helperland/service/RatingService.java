package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helperland.dao.RatingDao;
import helperland.model.Rating;

@Service
public class RatingService {
	@Autowired
	private RatingDao ratingDao;
	
	@Transactional
	public void saveRatings(Rating rating) {
		ratingDao.saveRatings(rating);
	}
	
	@Transactional
	public double getRatings(int providerId) {
		return ratingDao.getRatings(providerId);
	}
}
