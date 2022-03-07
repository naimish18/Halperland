package helperland.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "rating")
public class Rating {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int RatingId;
	private int ServiceRequestId;
	private int RatingFrom;
	private int RatingTo;
	private String Comments;
	private Timestamp RatingDate;
	private double Ratings;
	private double OnTimeArrival;
	private double Friendly;
	private double QualityOfService;
	public int getRatingId() {
		return RatingId;
	}
	public void setRatingId(int ratingId) {
		RatingId = ratingId;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public int getRatingFrom() {
		return RatingFrom;
	}
	public void setRatingFrom(int ratingFrom) {
		RatingFrom = ratingFrom;
	}
	public int getRatingTo() {
		return RatingTo;
	}
	public void setRatingTo(int ratingTo) {
		RatingTo = ratingTo;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public Timestamp getRatingDate() {
		return RatingDate;
	}
	public void setRatingDate(Timestamp ratingDate) {
		RatingDate = ratingDate;
	}
	public double getRatings() {
		return Ratings;
	}
	public void setRatings(double ratings) {
		Ratings = ratings;
	}
	public double getOnTimeArrival() {
		return OnTimeArrival;
	}
	public void setOnTimeArrival(double onTimeArrival) {
		OnTimeArrival = onTimeArrival;
	}
	public double getFriendly() {
		return Friendly;
	}
	public void setFriendly(double friendly) {
		Friendly = friendly;
	}
	public double getQualityOfService() {
		return QualityOfService;
	}
	public void setQualityOfService(double qualityOfService) {
		QualityOfService = qualityOfService;
	}
	@Override
	public String toString() {
		return "Rating [RatingId=" + RatingId + ", ServiceRequestId=" + ServiceRequestId + ", RatingFrom=" + RatingFrom
				+ ", RatingTo=" + RatingTo + ", Comments=" + Comments + ", RatingDate=" + RatingDate + ", Ratings="
				+ Ratings + ", OnTimeArrival=" + OnTimeArrival + ", Friendly=" + Friendly + ", QualityOfService="
				+ QualityOfService + "]";
	}
	
	
}
