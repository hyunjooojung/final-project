package fp.busan.mvc.destination.model.vo;

public class Destination {
	private int de_id;
	private String name;
	private String gugunnm;
	private String lat;
	private String lng;
	private String place;
	private String title;
	private String subtitle;
	private String addr;
	private String tel;
	private String homepage;
	private String trfcinfo;
	private String usageday;
	private String hldyinfo;
	private String usage_day_week;
	private String amount;
	private String middle_size_rm;
	private String img;
	private String thumb;
	private String detail;
	private int readCount;
	
	public int getDe_id() {
		return de_id;
	}
	public void setDe_id(int de_id) {
		this.de_id = de_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getTrfcinfo() {
		return trfcinfo;
	}
	public void setTrfcinfo(String trfcinfo) {
		this.trfcinfo = trfcinfo;
	}
	public String getUsageday() {
		return usageday;
	}
	public void setUsageday(String usageday) {
		this.usageday = usageday;
	}
	public String getHldyinfo() {
		return hldyinfo;
	}
	public void setHldyinfo(String hldyinfo) {
		this.hldyinfo = hldyinfo;
	}
	public String getUsage_day_week() {
		return usage_day_week;
	}
	public void setUsage_day_week(String usage_day_week) {
		this.usage_day_week = usage_day_week;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getMiddle_size_rm() {
		return middle_size_rm;
	}
	public void setMiddle_size_rm(String middle_size_rm) {
		this.middle_size_rm = middle_size_rm;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Destination(int de_id, String name, String gugunnm, String lat, String lng, String place, String title,
			String subtitle, String addr, String tel, String homepage, String trfcinfo, String usageday,
			String hldyinfo, String usage_day_week, String amount, String middle_size_rm, String img, String thumb,
			String detail, int readCount) {
		super();
		this.de_id = de_id;
		this.name = name;
		this.gugunnm = gugunnm;
		this.lat = lat;
		this.lng = lng;
		this.place = place;
		this.title = title;
		this.subtitle = subtitle;
		this.addr = addr;
		this.tel = tel;
		this.homepage = homepage;
		this.trfcinfo = trfcinfo;
		this.usageday = usageday;
		this.hldyinfo = hldyinfo;
		this.usage_day_week = usage_day_week;
		this.amount = amount;
		this.middle_size_rm = middle_size_rm;
		this.img = img;
		this.thumb = thumb;
		this.detail = detail;
		this.readCount = readCount;
	}
	
	public Destination() {}
	@Override
	public String toString() {
		return "Destination [de_id=" + de_id + ", name=" + name + ", gugunnm=" + gugunnm + ", lat=" + lat + ", lng="
				+ lng + ", place=" + place + ", title=" + title + ", subtitle=" + subtitle + ", addr=" + addr + ", tel="
				+ tel + ", homepage=" + homepage + ", trfcinfo=" + trfcinfo + ", usageday=" + usageday + ", hldyinfo="
				+ hldyinfo + ", usage_day_week=" + usage_day_week + ", amount=" + amount + ", middle_size_rm="
				+ middle_size_rm + ", img=" + img + ", thumb=" + thumb + ", detail=" + detail + ", readCount="
				+ readCount + "]";
	}

	
}
