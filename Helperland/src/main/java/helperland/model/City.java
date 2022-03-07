package helperland.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "city")
public class City {
	@Id
	private int Id;
	private String CityName;
	private int StateId;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getCityName() {
		return CityName;
	}
	public void setCityName(String cityName) {
		CityName = cityName;
	}
	public int getStateId() {
		return StateId;
	}
	public void setStateId(int stateId) {
		StateId = stateId;
	}
	
	@Override
	public String toString() {
		return "City [Id=" + Id + ", CityName=" + CityName + ", StateId=" + StateId + "]";
	}
	
}
