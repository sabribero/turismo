package model;

public class weat {
	
	int day;
	
	float morning_temp, morning_id, afternoon_temp, afternoon_id;
	String morning_desc, afternoon_desc;
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public float getMorning_temp() {
		return morning_temp;
	}
	public void setMorning_temp(float morning_temp) {
		this.morning_temp = morning_temp;
	}
	public float getMorning_id() {
		return morning_id;
	}
	public void setMorning_id(float morning_id) {
		this.morning_id = morning_id;
	}
	public float getAfternoon_temp() {
		return afternoon_temp;
	}
	public void setAfternoon_temp(float afternoon_temp) {
		this.afternoon_temp = afternoon_temp;
	}
	public float getAfternoon_id() {
		return afternoon_id;
	}
	public void setAfternoon_id(float afternoon_id) {
		this.afternoon_id = afternoon_id;
	}
	public String getMorning_desc() {
		return morning_desc;
	}
	public void setMorning_desc(String morning_desc) {
		this.morning_desc = morning_desc;
	}
	public String getAfternoon_desc() {
		return afternoon_desc;
	}
	public void setAfternoon_desc(String afternoon_desc) {
		this.afternoon_desc = afternoon_desc;
	}
	@Override
	public String toString() {
		return "weat [day=" + day + ", morning_temp=" + morning_temp + ", morning_id=" + morning_id
				+ ", afternoon_temp=" + afternoon_temp + ", afternoon_id=" + afternoon_id + ", morning_desc="
				+ morning_desc + ", afternoon_desc=" + afternoon_desc + "]";
	}
	
	
	

}