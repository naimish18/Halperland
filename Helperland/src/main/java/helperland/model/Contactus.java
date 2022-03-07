package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "contactus")
public class Contactus {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ContactUsId;
	private String Email;
	private String Message;
	private String Name;
	private String PhoneNumber;
	private String Subject;
	public int getContactUsId() {
		return ContactUsId;
	}
	public void setContactUsId(int contactUsId) {
		ContactUsId = contactUsId;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	@Override
	public String toString() {
		return "Contactus [ContactUsId=" + ContactUsId + ", Email=" + Email + ", Message=" + Message + ", Name=" + Name
				+ ", PhoneNumber=" + PhoneNumber + ", Subject=" + Subject + "]";
	}
	
	
	
}
