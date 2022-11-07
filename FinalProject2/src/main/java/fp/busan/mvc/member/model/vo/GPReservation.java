package fp.busan.mvc.member.model.vo;

import java.util.Date;

public class GPReservation {
	int gp_code;
	int user_code;
	int res_id;
	String gr_time;
	Date gr_rtime;
	int going_time;
	int adult_num;
	int	teenager;
	int kids_num;
	public GPReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GPReservation(int gp_code, int user_code, int res_id, String gr_time, Date gr_rtime, int going_time,
			int adult_num, int teenager, int kids_num) {
		super();
		this.gp_code = gp_code;
		this.user_code = user_code;
		this.res_id = res_id;
		this.gr_time = gr_time;
		this.gr_rtime = gr_rtime;
		this.going_time = going_time;
		this.adult_num = adult_num;
		this.teenager = teenager;
		this.kids_num = kids_num;
	}
	public int getGp_code() {
		return gp_code;
	}
	public void setGp_code(int gp_code) {
		this.gp_code = gp_code;
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
	public String getGr_time() {
		return gr_time;
	}
	public void setGr_time(String gr_time) {
		this.gr_time = gr_time;
	}
	public Date getGr_rtime() {
		return gr_rtime;
	}
	public void setGr_rtime(Date gr_rtime) {
		this.gr_rtime = gr_rtime;
	}
	public int getGoing_time() {
		return going_time;
	}
	public void setGoing_time(int going_time) {
		this.going_time = going_time;
	}
	public int getAdult_num() {
		return adult_num;
	}
	public void setAdult_num(int adult_num) {
		this.adult_num = adult_num;
	}
	public int getTeenager() {
		return teenager;
	}
	public void setTeenager(int teenager) {
		this.teenager = teenager;
	}
	public int getKids_num() {
		return kids_num;
	}
	public void setKids_num(int kids_num) {
		this.kids_num = kids_num;
	}
	@Override
	public String toString() {
		return "GPReservation [gp_code=" + gp_code + ", user_code=" + user_code + ", res_id=" + res_id + ", gr_time="
				+ gr_time + ", gr_rtime=" + gr_rtime + ", going_time=" + going_time + ", adult_num=" + adult_num
				+ ", teenager=" + teenager + ", kids_num=" + kids_num + "]";
	}
	
	
	
}
