package helperland.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "servicerequest")
public class Servicerequest {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ServiceRequestId;
	private int UserId;
	private int ServiceId;
	private Timestamp ServiceStartDate;
	private String ZipCode;
	private double ServiceHours;
	private double ExtraHours;
	private double SubTotal;
	private double TotalCost;
	private String Comments;
	private boolean HasPets;
	private Timestamp CreatedDate;
	private Timestamp ModifiedDate;
	private String Status;
	private String ServiceProviderId;
	
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public int getServiceId() {
		return ServiceId;
	}
	public void setServiceId(int serviceId) {
		ServiceId = serviceId;
	}
	public Timestamp getServiceStartDate() {
		return ServiceStartDate;
	}
	public void setServiceStartDate(Timestamp serviceStartDate) {
		ServiceStartDate = serviceStartDate;
	}
	public String getZipCode() {
		return ZipCode;
	}
	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}
	public double getServiceHours() {
		return ServiceHours;
	}
	public void setServiceHours(double serviceHours) {
		ServiceHours = serviceHours;
	}
	public double getExtraHours() {
		return ExtraHours;
	}
	public void setExtraHours(double extraHours) {
		ExtraHours = extraHours;
	}
	public double getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(double subTotal) {
		SubTotal = subTotal;
	}
	public double getTotalCost() {
		return TotalCost;
	}
	public void setTotalCost(double totalCost) {
		TotalCost = totalCost;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public boolean getHasPets() {
		return HasPets;
	}
	public void setHasPets(boolean hasPets) {
		HasPets = hasPets;
	}
	public Timestamp getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		CreatedDate = createdDate;
	}
	public Timestamp getModifiedDate() {
		return ModifiedDate;
	}
	public void setModifiedDate(Timestamp modifiedDate) {
		ModifiedDate = modifiedDate;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getServiceProviderId() {
		return ServiceProviderId;
	}
	public void setServiceProviderId(String serviceProviderId) {
		ServiceProviderId=serviceProviderId;
	}
	
	@Override
	public String toString() {
		return "Servicerequest [ServiceRequestId=" + ServiceRequestId + ", UserId=" + UserId + ", ServiceId="
				+ ServiceId + ", ServiceStartDate=" + ServiceStartDate + ", ZipCode=" + ZipCode + ", ServiceHours="
				+ ServiceHours + ", ExtraHours=" + ExtraHours + ", SubTotal=" + SubTotal + ", TotalCost=" + TotalCost
				+ ", Comments=" + Comments + ", HasPets=" + HasPets + ", CreatedDate=" + CreatedDate + ", ModifiedDate="
				+ ModifiedDate + ", Status=" + Status + ", ServiceProviderId=" + ServiceProviderId + "]";
	}
	
}
