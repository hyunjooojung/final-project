package fp.busan.mvc.board.model.vo;

import java.sql.Date;

public class Comment {
	private int c_code;
	private int b_code;
	private int user_code;
	private String user_id;
	private String c_content;
	private Date c_date;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int c_code, int b_code, int user_code, String user_id, String c_content, Date c_date) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.user_code = user_code;
		this.user_id = user_id;
		this.c_content = c_content;
		this.c_date = c_date;
	}

	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
	}

	public int getB_code() {
		return b_code;
	}

	public void setB_code(int b_code) {
		this.b_code = b_code;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	
	@Override
	public String toString() {
		return "Comment [c_code=" + c_code + ", b_code=" + b_code + ", user_code=" + user_code + ", user_id=" + user_id
				+ ", c_content=" + c_content + ", c_date=" + c_date + "]";
	}

}
