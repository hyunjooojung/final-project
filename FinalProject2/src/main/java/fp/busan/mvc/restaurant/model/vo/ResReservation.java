package fp.busan.mvc.restaurant.model.vo;

public class ResReservation {
	private int user_code;
	private int res_id;
	private String memberId;
	private String res_name;
	private String pick_date;
	private int time;
	private int adult_num;
	private int teenager_num;
	private int kids_num;
	public ResReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResReservation(int user_code, int res_id, String memberId, String res_name, String pick_date, int time,
			int adult_num, int teenager_num, int kids_num) {
		super();
		this.user_code = user_code;
		this.res_id = res_id;
		this.memberId = memberId;
		this.res_name = res_name;
		this.pick_date = pick_date;
		this.time = time;
		this.adult_num = adult_num;
		this.teenager_num = teenager_num;
		this.kids_num = kids_num;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getPick_date() {
		return pick_date;
	}
	public void setPick_date(String pick_date) {
		this.pick_date = pick_date;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getAdult_num() {
		return adult_num;
	}
	public void setAdult_num(int adult_num) {
		this.adult_num = adult_num;
	}
	public int getTeenager_num() {
		return teenager_num;
	}
	public void setTeenager_num(int teenager_num) {
		this.teenager_num = teenager_num;
	}
	public int getKids_num() {
		return kids_num;
	}
	public void setKids_num(int kids_num) {
		this.kids_num = kids_num;
	}
	@Override
	public String toString() {
		return "ResReservation [user_code=" + user_code + ", res_id=" + res_id + ", memberId=" + memberId
				+ ", res_name=" + res_name + ", pick_date=" + pick_date + ", time=" + time + ", adult_num=" + adult_num
				+ ", teenager_num=" + teenager_num + ", kids_num=" + kids_num + "]";
	}

	
	
}

