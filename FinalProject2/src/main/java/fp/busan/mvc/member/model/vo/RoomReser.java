package fp.busan.mvc.member.model.vo;

public class RoomReser {
	private String ar_in;
	private String ar_out; 
	private int ar_people;
	private String name;
	private String adress; 
	private int price;
	private String image;
	private String tel;
	private int code;
	private int ar_code;
	public RoomReser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomReser(String ar_in, String ar_out, int ar_people, String name, String adress, int price, String image,
			String tel, int code, int ar_code) {
		super();
		this.ar_in = ar_in;
		this.ar_out = ar_out;
		this.ar_people = ar_people;
		this.name = name;
		this.adress = adress;
		this.price = price;
		this.image = image;
		this.tel = tel;
		this.code = code;
		this.ar_code = ar_code;
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
	public int getAr_people() {
		return ar_people;
	}
	public void setAr_people(int ar_people) {
		this.ar_people = ar_people;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getAr_code() {
		return ar_code;
	}
	public void setAr_code(int ar_code) {
		this.ar_code = ar_code;
	}
	@Override
	public String toString() {
		return "RoomReser [ar_in=" + ar_in + ", ar_out=" + ar_out + ", ar_people=" + ar_people + ", name=" + name
				+ ", adress=" + adress + ", price=" + price + ", image=" + image + ", tel=" + tel + ", code=" + code
				+ ", ar_code=" + ar_code + "]";
	}
	
	
	
	
}
