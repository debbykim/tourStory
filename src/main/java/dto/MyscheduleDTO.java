package dto;

public class MyscheduleDTO {
	private String member_schedule_nick;
	private String schedule_name;
	private String schedule_title;
	private String schedule_address;
	private String schedule_tel;
	private String schedule_latitude;//위도
	private String schedule_longitude; // 경도
	private int schedule_num;
	private String schedule_day;
	
	public MyscheduleDTO() {
		
	}
	
	
	public String getSchedule_name() {
		return schedule_name;
	}

	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}

	public String getSchedule_title() {
		return schedule_title;
	}

	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}

	public String getSchedule_address() {
		return schedule_address;
	}

	public void setSchedule_address(String schedule_address) {
		this.schedule_address = schedule_address;
	}

	public String getSchedule_tel() {
		return schedule_tel;
	}

	public void setSchedule_tel(String schedule_tel) {
		this.schedule_tel = schedule_tel;
	}

	public String getSchedule_latitude() {
		return schedule_latitude;
	}

	public void setSchedule_latitude(String schedule_latitude) {
		this.schedule_latitude = schedule_latitude;
	}

	public String getSchedule_longitude() {
		return schedule_longitude;
	}

	public void setSchedule_longitude(String schedule_longitude) {
		this.schedule_longitude = schedule_longitude;
	}

	public int getSchedule_num() {
		return schedule_num;
	}

	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}

	public String getSchedule_day() {
		return schedule_day;
	}

	public void setSchedule_day(String schedule_day) {
		this.schedule_day = schedule_day;
	}

	public String getMember_schedule_nick() {
		return member_schedule_nick;
	}

	public void setMember_schedule_nick(String member_schedule_nick) {
		this.member_schedule_nick = member_schedule_nick;
	}
}//end MyscheduleDTO
