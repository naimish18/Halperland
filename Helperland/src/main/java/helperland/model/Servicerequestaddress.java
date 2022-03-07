package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "servicerequestaddress")
public class Servicerequestaddress {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private int ServiceRequestId;
	private String AddressLine1;
	private String AddressLine2;
	private String City;
	private String PostalCode;
	private String Mobile;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public String getAddressLine1() {
		return AddressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return AddressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	@Override
	public String toString() {
		return "Servicerequestaddress [Id=" + Id + ", ServiceRequestId=" + ServiceRequestId + ", AddressLine1="
				+ AddressLine1 + ", AddressLine2=" + AddressLine2 + ", City=" + City + ", PostalCode=" + PostalCode
				+ ", Mobile=" + Mobile + "]";
	}
	
	
	
}
