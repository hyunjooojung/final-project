package fp.busan.mvc.room.model.vo;

public class Room {
	private int    code;
    private String name;
    private String adress;
    private String readcount;
    private String localcode;
    private String tel;
    private String image;
    private String image2;
    private String mapx;
    private String mapy;
    private int price;
    
    
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Room(int code, String name, String adress, String readcount, String localcode, String tel, String image,
			String image2, String mapx, String mapy, int price) {
		super();
		this.code = code;
		this.name = name;
		this.adress = adress;
		this.readcount = readcount;
		this.localcode = localcode;
		this.tel = tel;
		this.image = image;
		this.image2 = image2;
		this.mapx = mapx;
		this.mapy = mapy;
		this.price = price;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
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


	public String getReadcount() {
		return readcount;
	}


	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}


	public String getLocalcode() {
		return localcode;
	}


	public void setLocalcode(String localcode) {
		this.localcode = localcode;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getImage2() {
		return image2;
	}


	public void setImage2(String image2) {
		this.image2 = image2;
	}


	public String getMapx() {
		return mapx;
	}


	public void setMapx(String mapx) {
		this.mapx = mapx;
	}


	public String getMapy() {
		return mapy;
	}


	public void setMapy(String mapy) {
		this.mapy = mapy;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "Room [code=" + code + ", name=" + name + ", adress=" + adress + ", readcount=" + readcount
				+ ", localcode=" + localcode + ", tel=" + tel + ", image=" + image + ", image2=" + image2 + ", mapx="
				+ mapx + ", mapy=" + mapy + ", price=" + price + "]";
	}
	
	
    
}
