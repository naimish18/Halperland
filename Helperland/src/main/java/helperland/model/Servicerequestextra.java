package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "servicerequestextra")
public class Servicerequestextra {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ServiceRequestExtraId;
	private int ServiceRequestId;
	private int ServiceExtraId;
	
	public int getServiceRequestExtraId() {
		return ServiceRequestExtraId;
	}
	public void setServiceRequestExtraId(int serviceRequestExtraId) {
		ServiceRequestExtraId = serviceRequestExtraId;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public int getServiceExtraId() {
		return ServiceExtraId;
	}
	public void setServiceExtraId(int serviceExtraId) {
		ServiceExtraId = serviceExtraId;
	}
	
	@Override
	public String toString() {
		return "Servicerequestextra [ServiceRequestExtraId=" + ServiceRequestExtraId + ", ServiceRequestId="
				+ ServiceRequestId + ", ServiceExtraId=" + ServiceExtraId + "]";
	}
	
	
}
