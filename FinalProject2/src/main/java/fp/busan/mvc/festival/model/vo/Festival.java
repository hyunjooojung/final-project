package fp.busan.mvc.festival.model.vo;

import java.sql.Date;

public class Festival {
	private int    fe_id;
    private String fe_title;
    private String gugunnm;
    private String lat;
    private String lng;
    private String place;
    private String title;
    private String subtitle;
    private String main_place;
    private String addr1;
    private String addr2;
    private String tel;
    private String homepage;
    private String trfcinfo;
    private String time;
    private String amount;
    private String img;
    private String img_thumb;
    private String detail;
    private String middle_size_rm1;
    private int readcount;
    private Date registration;
    
 
	public Festival() {
		super();
	}
	
	public Festival(int fe_id, String fe_title, String gugunnm, String lat, String lng, String place, String title,
			String subtitle, String main_place, String addr1, String addr2, String tel, String homepage,
			String trfcinfo, String time, String amount, String img, String img_thumb, String detail,
			String middle_size_rm1, int readcount) {
		super();
		this.fe_id = fe_id;
		this.fe_title = fe_title;
		this.gugunnm = gugunnm;
		this.lat = lat;
		this.lng = lng;
		this.place = place;
		this.title = title;
		this.subtitle = subtitle;
		this.main_place = main_place;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.tel = tel;
		this.homepage = homepage;
		this.trfcinfo = trfcinfo;
		this.time = time;
		this.amount = amount;
		this.img = img;
		this.img_thumb = img_thumb;
		this.detail = detail;
		this.middle_size_rm1 = middle_size_rm1;
		this.readcount = readcount;
	}
	
	
	
	public Festival(int fe_id, String fe_title, String gugunnm, String lat, String lng, String place, String title,
			String subtitle, String main_place, String addr1, String addr2, String tel, String homepage,
			String trfcinfo, String time, String amount, String img, String img_thumb, String detail,
			String middle_size_rm1, int readcount, Date date) {
		super();
		this.fe_id = fe_id;
		this.fe_title = fe_title;
		this.gugunnm = gugunnm;
		this.lat = lat;
		this.lng = lng;
		this.place = place;
		this.title = title;
		this.subtitle = subtitle;
		this.main_place = main_place;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.tel = tel;
		this.homepage = homepage;
		this.trfcinfo = trfcinfo;
		this.time = time;
		this.amount = amount;
		this.img = img;
		this.img_thumb = img_thumb;
		this.detail = detail;
		this.middle_size_rm1 = middle_size_rm1;
		this.readcount = readcount;
		this.registration = date;
	}

	public int getFe_id() {
		return fe_id;
	}
	public void setFe_id(int fe_id) {
		this.fe_id = fe_id;
	}
	public String getFe_title() {
		return fe_title;
	}
	public void setFe_title(String fe_title) {
		this.fe_title = fe_title;
	}
	public String getGugunnm() {
		return gugunnm;
	}
	public void setGugunnm(String gugunnm) {
		this.gugunnm = gugunnm;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getMain_place() {
		return main_place;
	}
	public void setMain_place(String main_place) {
		this.main_place = main_place;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTrfcinfo() {
		return trfcinfo;
	}
	public void setTrfcinfo(String trfcinfo) {
		this.trfcinfo = trfcinfo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImg_thumb() {
		return img_thumb;
	}
	public void setImg_thumb(String img_thumb) {
		this.img_thumb = img_thumb;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getMiddle_size_rm1() {
		return middle_size_rm1;
	}
	public void setMiddle_size_rm1(String middle_size_rm1) {
		this.middle_size_rm1 = middle_size_rm1;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getDate() {
		return registration;
	}
	public void setDate(Date date) {
		this.registration = date;
	}

	@Override
	public String toString() {
		return "Festival [fe_id=" + fe_id + ", fe_title=" + fe_title + ", gugunnm=" + gugunnm + ", lat=" + lat
				+ ", lng=" + lng + ", place=" + place + ", title=" + title + ", subtitle=" + subtitle + ", main_place="
				+ main_place + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel=" + tel + ", homepage=" + homepage
				+ ", trfcinfo=" + trfcinfo + ", time=" + time + ", amount=" + amount + ", img=" + img + ", img_thumb="
				+ img_thumb + ", detail=" + detail + ", middle_size_rm1=" + middle_size_rm1 + ", readcount=" + readcount
				+ ", date=" + registration + "]";
	}
    
	
    
}
