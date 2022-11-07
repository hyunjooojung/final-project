package fp.busan.mvc.restaurant.model.vo;

import java.util.Date;

public class Restaurant {
	 	private int		res_id;
	    private String res_name;
	    private String gugunnm;
	    private String lat;
	    private String lng;
	    private String place;
	    private String addr;
	    private String tel;
	    private String homepage;
	    private String time;
	    private String img;
	    private String img_thumb;
	    private String detail;
		private int    price;
		private int readcount;
		private Date registration;
		
		
		public Restaurant() {
			super();
			// TODO Auto-generated constructor stub
		}


		public Restaurant(int res_id, String res_name, String gugunnm, String lat, String lng, String place,
				String addr, String tel, String homepage, String time, String img, String img_thumb, String detail,
				int price, int readcount, Date date) {
			super();
			this.res_id = res_id;
			this.res_name = res_name;
			this.gugunnm = gugunnm;
			this.lat = lat;
			this.lng = lng;
			this.place = place;
			this.addr = addr;
			this.tel = tel;
			this.homepage = homepage;
			this.time = time;
			this.img = img;
			this.img_thumb = img_thumb;
			this.detail = detail;
			this.price = price;
			this.readcount = readcount;
			this.registration = date;
		}


		public Restaurant(int res_id, String res_name, String gugunnm, String lat, String lng, String place,
				String addr, String tel, String homepage, String time, String img, String img_thumb, String detail,
				int price, int readcount) {
			super();
			this.res_id = res_id;
			this.res_name = res_name;
			this.gugunnm = gugunnm;
			this.lat = lat;
			this.lng = lng;
			this.place = place;
			this.addr = addr;
			this.tel = tel;
			this.homepage = homepage;
			this.time = time;
			this.img = img;
			this.img_thumb = img_thumb;
			this.detail = detail;
			this.price = price;
			this.readcount = readcount;
		}


		public int getRes_id() {
			return res_id;
		}


		public void setRes_id(int res_id) {
			this.res_id = res_id;
		}


		public String getRes_name() {
			return res_name;
		}


		public void setRes_name(String res_name) {
			this.res_name = res_name;
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


		public String getHomepage() {
			return homepage;
		}


		public void setHomepage(String homepage) {
			this.homepage = homepage;
		}


		public String getTime() {
			return time;
		}


		public void setTime(String time) {
			this.time = time;
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


		public int getPrice() {
			return price;
		}


		public void setPrice(int price) {
			this.price = price;
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
			return "Restaurant [res_id=" + res_id + ", res_name=" + res_name + ", gugunnm=" + gugunnm + ", lat=" + lat
					+ ", lng=" + lng + ", place=" + place + ", addr=" + addr + ", tel=" + tel + ", homepage=" + homepage
					+ ", time=" + time + ", img=" + img + ", img_thumb=" + img_thumb + ", detail=" + detail + ", price="
					+ price + ", readcount=" + readcount + ", date=" + registration + "]";
		}
		
		
	    
	    
}
