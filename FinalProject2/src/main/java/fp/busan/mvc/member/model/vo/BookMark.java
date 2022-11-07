package fp.busan.mvc.member.model.vo;

public class BookMark {
	private int bm_Code;
	private int bmc_Code;
	private int user_Code;
	private int code;

	public BookMark() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookMark(int bm_Code, int bmc_Code, int user_Code, int code) {
		super();
		this.bm_Code = bm_Code;
		this.bmc_Code = bmc_Code;
		this.user_Code = user_Code;
		this.code = code;
	}

	public int getBm_Code() {
		return bm_Code;
	}

	public void setBm_Code(int bm_Code) {
		this.bm_Code = bm_Code;
	}

	public int getBmc_Code() {
		return bmc_Code;
	}

	public void setBmc_Code(int bmc_Code) {
		this.bmc_Code = bmc_Code;
	}

	public int getUser_Code() {
		return user_Code;
	}

	public void setUser_Code(int user_Code) {
		this.user_Code = user_Code;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "BookMark [bm_Code=" + bm_Code + ", bmc_Code=" + bmc_Code + ", user_Code=" + user_Code + ", code=" + code
				+ "]";
	}

}
