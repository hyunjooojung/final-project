package fp.busan.mvc.board.model.vo;

import java.sql.Date;
import java.util.List;

public class Board {
	private int b_code;
	private int user_code;
	private String user_id;
	private int b_ccode;
	private String title;
	private String content;
	private Date bDate;
	private int readCount;
	private List<Comment> comments;
	private String status;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int b_code, int user_code, String user_id, int b_ccode, String title, String content, Date bDate, int readCount, List<Comment> comments,
			String status) {
		super();
		this.b_code = b_code;
		this.user_code = user_code;
		this.user_id = user_id;
		this.b_ccode = b_ccode;
		this.title = title;
		this.content = content;
		this.bDate = bDate;
		this.readCount = readCount;
		this.comments = comments;
		this.status = status;
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

	public int getB_ccode() {
		return b_ccode;
	}

	public void setB_ccode(int b_ccode) {
		this.b_ccode = b_ccode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	public List<Comment> getComments() {
		return comments;
	}

	public void setcomments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}		
	
	@Override
	public String toString() {
		return "Board [b_code=" + b_code + ", user_code=" + user_code + ", user_id=" + user_id + ", b_ccode="
				+ b_ccode + ", title=" + title + ", content=" + content + ", bDate=" + bDate + ", readCount="
				+ readCount + ", comments=" + comments + ", status=" + status + "]";
	}
}
