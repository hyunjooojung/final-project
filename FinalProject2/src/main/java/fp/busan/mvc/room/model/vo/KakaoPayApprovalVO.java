package fp.busan.mvc.room.model.vo;

import java.util.Date;

public class KakaoPayApprovalVO {
	private String aid;
	private String tid;
	private String cid;
	private String sid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private AmountVO amount;
	private CardVO card_info;
	private String item_name;
	private String item_code;
	private String payload;
	private int quantity;
	private int tax_free_amount;
	private int vat_amount;
	private Date created_at;
	private Date approved_at;
	private String user_code;
	private String code;
	private String checkIn;
	private String checkOut;
	private String people;

	public KakaoPayApprovalVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KakaoPayApprovalVO(String aid, String tid, String cid, String sid, String partner_order_id,
			String partner_user_id, String payment_method_type, AmountVO amount, CardVO card_info, String item_name,
			String item_code, String payload, int quantity, int tax_free_amount, int vat_amount, Date created_at,
			Date approved_at, String user_code, String code, String checkIn, String checkOut, String people) {
		super();
		this.aid = aid;
		this.tid = tid;
		this.cid = cid;
		this.sid = sid;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.payment_method_type = payment_method_type;
		this.amount = amount;
		this.card_info = card_info;
		this.item_name = item_name;
		this.item_code = item_code;
		this.payload = payload;
		this.quantity = quantity;
		this.tax_free_amount = tax_free_amount;
		this.vat_amount = vat_amount;
		this.created_at = created_at;
		this.approved_at = approved_at;
		this.user_code = user_code;
		this.code = code;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.people = people;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public AmountVO getAmount() {
		return amount;
	}

	public void setAmount(AmountVO amount) {
		this.amount = amount;
	}

	public CardVO getCard_info() {
		return card_info;
	}

	public void setCard_info(CardVO card_info) {
		this.card_info = card_info;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getPayload() {
		return payload;
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTax_free_amount() {
		return tax_free_amount;
	}

	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}

	public int getVat_amount() {
		return vat_amount;
	}

	public void setVat_amount(int vat_amount) {
		this.vat_amount = vat_amount;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	@Override
	public String toString() {
		return "KakaoPayApprovalVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", amount=" + amount + ", card_info=" + card_info
				+ ", item_name=" + item_name + ", item_code=" + item_code + ", payload=" + payload + ", quantity="
				+ quantity + ", tax_free_amount=" + tax_free_amount + ", vat_amount=" + vat_amount + ", created_at="
				+ created_at + ", approved_at=" + approved_at + ", user_code=" + user_code + ", code=" + code
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", people=" + people + "]";
	}

}
