package fp.busan.mvc.kind.model.vo;

public class Kind {
	private int kind_id;
	private String kind_name;
	private String ceoname;
	private String adress;
	private String tel;
	private String cncode;
	private String cn;
	private String localea;
	private String localecode;
	private String kind_content;
	private String parking;
	private String bsntime;
	private String img1;
	private String img2;
	private int cnt;

	public Kind() {
		super();
	}

	public Kind(int kind_id, String kind_name, String ceoname, String adress, String tel, String cncode, String cn,
			String localea, String localecode, String kind_content, String parking, String bsntime, String img1,
			String img2, int cnt) {
		super();
		this.kind_id = kind_id;
		this.kind_name = kind_name;
		this.ceoname = ceoname;
		this.adress = adress;
		this.tel = tel;
		this.cncode = cncode;
		this.cn = cn;
		this.localea = localea;
		this.localecode = localecode;
		this.kind_content = kind_content;
		this.parking = parking;
		this.bsntime = bsntime;
		this.img1 = img1;
		this.img2 = img2;
		this.cnt = cnt;
	}

	public int getKind_id() {
		return kind_id;
	}

	public void setKind_id(int kind_id) {
		this.kind_id = kind_id;
	}

	public String getKind_name() {
		return kind_name;
	}

	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}

	public String getCeoname() {
		return ceoname;
	}

	public void setCeoname(String ceoname) {
		this.ceoname = ceoname;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCncode() {
		return cncode;
	}

	public void setCncode(String cncode) {
		this.cncode = cncode;
	}

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	public String getLocalea() {
		return localea;
	}

	public void setLocalea(String localea) {
		this.localea = localea;
	}

	public String getLocalecode() {
		return localecode;
	}

	public void setLocalecode(String localecode) {
		this.localecode = localecode;
	}

	public String getKind_content() {
		return kind_content;
	}

	public void setKind_content(String kind_content) {
		this.kind_content = kind_content;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getBsntime() {
		return bsntime;
	}

	public void setBsntime(String bsntime) {
		this.bsntime = bsntime;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Kind [kind_id=" + kind_id + ", kind_name=" + kind_name + ", ceoname=" + ceoname + ", adress=" + adress
				+ ", tel=" + tel + ", cncode=" + cncode + ", cn=" + cn + ", localea=" + localea + ", localecode="
				+ localecode + ", kind_content=" + kind_content + ", parking=" + parking + ", bsntime=" + bsntime
				+ ", img1=" + img1 + ", img2=" + img2 + ", cnt=" + cnt + "]";
	}

}
