package fp.busan.mvc.member.model.vo;

public class BookMarkCategory {
	private int bmc_code;
	private String bmc_name;

	public BookMarkCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookMarkCategory(int bmc_code, String bmc_name) {
		super();
		this.bmc_code = bmc_code;
		this.bmc_name = bmc_name;
	}

	public int getBmc_code() {
		return bmc_code;
	}

	public void setBmc_code(int bmc_code) {
		this.bmc_code = bmc_code;
	}

	public String getBmc_name() {
		return bmc_name;
	}

	public void setBmc_name(String bmc_name) {
		this.bmc_name = bmc_name;
	}

	@Override
	public String toString() {
		return "BookMarkCategory [bmc_code=" + bmc_code + ", bmc_name=" + bmc_name + "]";
	}

}
