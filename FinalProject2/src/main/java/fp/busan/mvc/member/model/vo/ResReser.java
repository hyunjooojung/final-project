package fp.busan.mvc.member.model.vo;

import java.util.Date;

public class ResReser {
	private int 	gp_code		;	
	private int 	user_code	;	
	private String 	gr_time	;	
	private Date 	gr_rtime	;	
	private int 	going_time	;	
	private int 	adult_num	;	
	private int 	teenager_num; 	
	private int 	kids_num	;
	private String res_name;
	private String addr;
	private String tel;
	private String time		    ;
	private int 	price		    ;
	private int res_id;
	public ResReser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResReser(int gp_code, int user_code, String gr_time, Date gr_rtime, int going_time, int adult_num,
			int teenager_num, int kids_num, String res_name, String addr, String tel, String time, int price,
			int res_id) {
		super();
		this.gp_code = gp_code;
		this.user_code = user_code;
		this.gr_time = gr_time;
		this.gr_rtime = gr_rtime;
		this.going_time = going_time;
		this.adult_num = adult_num;
		this.teenager_num = teenager_num;
		this.kids_num = kids_num;
		this.res_name = res_name;
		this.addr = addr;
		this.tel = tel;
		this.time = time;
		this.price = price;
		this.res_id = res_id;
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
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	@Override
	public String toString() {
		return "ResReser [gp_code=" + gp_code + ", user_code=" + user_code + ", gr_time=" + gr_time + ", gr_rtime="
				+ gr_rtime + ", going_time=" + going_time + ", adult_num=" + adult_num + ", teenager_num="
				+ teenager_num + ", kids_num=" + kids_num + ", res_name=" + res_name + ", addr=" + addr + ", tel=" + tel
				+ ", time=" + time + ", price=" + price + ", res_id=" + res_id + "]";
	}
	
	
	
	
}
