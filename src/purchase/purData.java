package purchase;

import java.sql.Timestamp;

public class purData {
	private String id;
	private String today;
	private String aweek;
	private String fifteen;
	private String amonth;
	private String months;
	private int when;
	
	private String type; //��������
	private int round; //�߸�ȸ��
	private Timestamp reg_date; //�����Ͻ�
	private String productnum; //��ǥ�ǰ�����ȣ
	private int bet; //���űݾ� , ȯ���� �ݾ�
	private String status; //����
	private int price; // ���
	private String typeSelect;
	private int refund; // ȯ�ҿ�û���� 0 , 1
	private int rechange; // ȯ���� ��ü �ܾ�(bet+cash(member))
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getAweek() {
		return aweek;
	}
	public void setAweek(String aweek) {
		this.aweek = aweek;
	}
	public String getFifteen() {
		return fifteen;
	}
	public void setFifteen(String fifteen) {
		this.fifteen = fifteen;
	}
	public String getAmonth() {
		return amonth;
	}
	public void setAmonth(String amonth) {
		this.amonth = amonth;
	}
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public int getWhen() {
		return when;
	}
	public void setWhen(int when) {
		this.when = when;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getProductnum() {
		return productnum;
	}
	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}
	public int getBet() {
		return bet;
	}
	public void setBet(int bet) {
		this.bet = bet;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTypeSelect() {
		return typeSelect;
	}
	public void setTypeSelect(String typeSelect) {
		this.typeSelect = typeSelect;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getRechange() {
		return rechange;
	}
	public void setRechange(int rechange) {
		this.rechange = rechange;
	}
}
