package fp.busan.mvc.member.model.vo;

public class Member {
	private int User_CODE;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_email;
	private String user_status;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int user_CODE, String user_id, String user_pw, String user_name, String user_phone, String user_email,
			String user_status) {
		super();
		this.User_CODE = user_CODE;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_status = user_status;
	}

	public int getUser_CODE() {
		return User_CODE;
	}

	public void setUser_CODE(int user_CODE) {
		this.User_CODE = user_CODE;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUSER_STATUS() {
		return user_status;
	}

	public void setUSER_STATUS(String user_status) {
		this.user_status = user_status;
	}

	@Override
	public String toString() {
		return "User [User_CODE=" + User_CODE + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", user_email=" + user_email + ", USER_STAUS=" + user_status
				+ "]";
	}

}
