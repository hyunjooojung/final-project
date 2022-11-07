package fp.busan.mvc.member.model.vo;

import java.sql.Date;

public class ACReservation {
	private int ar_code;
	private int user_code;
	private int ac_code;
	private String ar_in;
	private String ar_out;
	private Date ar_rtime;
	private int ar_people;

	public ACReservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ACReservation(int ar_code, int user_code, int ac_code, String ar_in, String ar_out, Date ar_rtime,
			int ar_people) {
		super();
		this.ar_code = ar_code;
		this.user_code = user_code;
		this.ac_code = ac_code;
		this.ar_in = ar_in;
		this.ar_out = ar_out;
		this.ar_rtime = ar_rtime;
		this.ar_people = ar_people;
	}

	public int getAr_code() {
		return ar_code;
	}

	public void setAr_code(int ar_code) {
		this.ar_code = ar_code;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getAc_code() {
		return ac_code;
	}

	public void setAc_code(int ac_code) {
		this.ac_code = ac_code;
	}

	public String getAr_in() {
		return ar_in;
	}

	public void setAr_in(String ar_in) {
		this.ar_in = ar_in;
	}

	public String getAr_out() {
		return ar_out;
	}

	public void setAr_out(String ar_out) {
		this.ar_out = ar_out;
	}

	public Date getAr_rtime() {
		return ar_rtime;
	}

	public void setAr_rtime(Date ar_rtime) {
		this.ar_rtime = ar_rtime;
	}

	public int getAr_people() {
		return ar_people;
	}

	public void setAr_people(int ar_people) {
		this.ar_people = ar_people;
	}

	@Override
	public String toString() {
		return "ACReservation [ar_code=" + ar_code + ", user_code=" + user_code + ", ac_code=" + ac_code + ", ar_in="
				+ ar_in + ", ar_out=" + ar_out + ", ar_rtime=" + ar_rtime + ", ar_people=" + ar_people + "]";
	}

}
