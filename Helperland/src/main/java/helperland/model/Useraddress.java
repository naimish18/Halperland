package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "useraddress")
public class Useraddress {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int AddressId;
	private String AddressLine1;
	private String AddressLine2;
	private String PostalCode;
	private String City;
	private String Mobile;
	private int UserId;
	private boolean IsDeleted;
	public int getAddressId() {
		return AddressId;
	}
	public void setAddressId(int addressId) {
		AddressId = addressId;
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
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public boolean isIsDeleted() {
		return IsDeleted;
	}
	public void setIsDeleted(boolean isDeleted) {
		IsDeleted = isDeleted;
	}
	
	@Override
	public String toString() {
		return "Useraddress [AddressId=" + AddressId + ", AddressLine1=" + AddressLine1 + ", AddressLine2="
				+ AddressLine2 + ", PostalCode=" + PostalCode + ", City=" + City + ", Mobile=" + Mobile + ", UserId="
				+ UserId + ", IsDeleted=" + IsDeleted + "]";
	}

}
