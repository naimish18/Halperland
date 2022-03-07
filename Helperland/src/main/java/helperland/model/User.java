package helperland.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "user")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int UserId;
	private String FirstName;
	private String LastName;
	private String Mobile;
	private String Email;
	private String Password;
	private int UserTypeId;
	private Timestamp CreatedDate;
	private Timestamp ModifiedDate;
	private int ModifiedBy;
	private int IsApproved;
	private String ZipCode;
	private Timestamp DateOfBirth;
	
	
	public int getIsApproved() {
		return IsApproved;
	}
	public void setIsApproved(int isApproved) {
		IsApproved = isApproved;
	}

	public String getFirstName() {
		return FirstName;
	}
	
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public int getUserTypeId() {
		return UserTypeId;
	}
	public void setUserTypeId(int userTypeId) {
		UserTypeId = userTypeId;
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
	public int getModifiedBy() {
		return ModifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		ModifiedBy = modifiedBy;
	}
	public String getZipCode() {
		return ZipCode;
	}
	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}
	public Timestamp getDateOfBirth() {
		return DateOfBirth;
	}
	public void setDateOfBirth(Timestamp dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}
	
	@Override
	public String toString() {
		return "User [UserId=" + UserId + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Mobile=" + Mobile
				+ ", Email=" + Email + ", Password=" + Password + ", UserTypeId=" + UserTypeId + ", CreatedDate="
				+ CreatedDate + ", ModifiedDate=" + ModifiedDate + ", ModifiedBy=" + ModifiedBy + ", IsApproved="
				+ IsApproved + ", ZipCode=" + ZipCode + ", DateOfBirth=" + DateOfBirth + "]";
	}

}
