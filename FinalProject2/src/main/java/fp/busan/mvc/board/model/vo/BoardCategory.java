package fp.busan.mvc.board.model.vo;

public class BoardCategory {
	private int b_ccode;
	private int b_cname;

	public BoardCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardCategory(int b_ccode, int b_cname) {
		super();
		this.b_ccode = b_ccode;
		this.b_cname = b_cname;
	}

	public int getB_ccode() {
		return b_ccode;
	}

	public void setB_ccode(int b_ccode) {
		this.b_ccode = b_ccode;
	}

	public int getB_cname() {
		return b_cname;
	}

	public void setB_cname(int b_cname) {
		this.b_cname = b_cname;
	}

	@Override
	public String toString() {
		return "BoardCategory [b_ccode=" + b_ccode + ", b_cname=" + b_cname + "]";
	}

}
